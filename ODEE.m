function [t,y] = ODEE(t0,tk,y0,h, abserr,relerr)

c1=1/4;
c2=3/8;
c3=3/8;
a2=2/3;
a3=2/3;
b3=0;

F=@(t,x)3.*exp(-t)-0.4*x;
i=1;
t(1) = t0;
y(1) = y0;

while t(i) < tk
    
    k1=F(t(i),y(i))*h;
    k2=F(t(i)+a2*h,y(i)+a2*k1)*h;
    k3=F(t(i)+a3*h,y(i)+a3*k2)*h;
    
    e=k3;
    fleg=1;
    
    y(i+1)=y(i)+c1*k1+c2*k2+c3*k3;
    t(i+1) = t(i) + h;
    
    if abs(e) > (abserr+relerr*abs(y(i+1)))
        h=max(0.001, h/2.0);
        disp(h);
        %fleg=0;
    end
    if abs(e)<((1/4)*(abserr+relerr*abs(y(i+1))))
           h=min(0.01, 2.0*h);
           fleg = 0;
     end

    if fleg == 1
       i = i+1;
    end
end