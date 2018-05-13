function f=myfyn23(x)
    global alfa e p V nap tayalfa noralfa k c r;
    f(1)=c*(pi/2)-c*x(1)-x(2);
    f(2)=nap*r*(V^2).*spline(alfa,tayalfa,x(1))-nap*(V^2).*spline(alfa,noralfa,x(1)).*spline(alfa,e,x(1))-x(2);
end







