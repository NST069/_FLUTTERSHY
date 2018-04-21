function f=myfyn18(x)
global alfa e v teta omega L
f(1)=(omega+sin(teta)+v*cos(teta))*tan(x(1))-x(2);
f(2)=omega*spline(alfa,e,x(1))+cos(teta)-v*sin(teta)-x(2);







