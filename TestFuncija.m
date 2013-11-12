function dtdy=TestFuncija(t,z)
    x = z(1);
    y = z(2);
    xprim = y;
    yprim = 0.2*(1-x^2)*y - x;
    dtdy = [xprim yprim];
end