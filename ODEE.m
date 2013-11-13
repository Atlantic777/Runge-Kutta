function [x,y] = ODEE(F,x_limits,y0,h,h_limits,abserr,relerr)

c1=1/4;
c2=3/8;
c3=3/8;
a2=2/3;
a3=2/3;

%F=@(t,x)3.*exp(-t)-0.4*x;
i=1;
x(1) = x_limits(1);
y(1,:) = y0;

while x(i) < x_limits(2)
    
    k1=F(x(i),y(i,:))*h;
    k2=F(x(i)+a2*h,y(i,:)+a2*k1)*h;
    k3=F(x(i)+a3*h,y(i,:)+a3*k2)*h;
    
    fleg=1;
    
    y(i+1,:) = y(i,:)+c1*k1+c2*k2+c3*k3;
    x(i+1) = x(i) + h;
    
    if abs(k3) > (abserr+relerr*abs(y(i+1,:)))
        h = h * 0.5;
        if h < h_limits(1)
            h = h_limits(1);
        end
        fleg=0;
    end
    if abs(k3)<((1/4)*(abserr+relerr*abs(y(i+1,:))))
            h = h*2;
            if h > h_limits(2)
                h = h_limits(2);
            end
           %fleg = 0;
     end

    if fleg == 1
       i = i+1;
    end
end