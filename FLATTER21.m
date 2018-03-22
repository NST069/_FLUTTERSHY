function dydt =FLATTER21(T,Y,alfa10)
global   s p alfa   nap m   V k c  r  J nn;
% функци€, вычисл€юща€ правые части уравнений 
dydt=zeros(4,1); % a column vector;
%tgalfa10=(cos(Y(3)))/(r*Y(4)+V*sin(Y(3)));
%alfa10=atan(tgalfa10)
%kk=2*alfa10/pi
%nn1=nn
%if alfa10<0;
%    nn1=nn1+1 
%else
 %   nn1=nn1
%end
%alfa11=alfa10+nn1*pi
VA2=(V*cos(Y(3))-Y(4)*sin(Y(3)))^2+(r*Y(4)+Y(4)*cos(Y(3))+V*sin(Y(3)))^2;
VA=sqrt(VA2);
tgalfa10=(V*cos(Y(3))-Y(4)*sin(Y(3)))/(r*Y(4)+Y(4)*cos(Y(3))+V*sin(Y(3)));
alfa10=atan(tgalfa10);
sa=spline(alfa,s,alfa10);
pa=spline(alfa,p,alfa10);
dydt(1)=Y(2);
dydt(2)=(nap*(-sa*VA*r*cos(Y(3))-pa*VA*(r*Y(4)*sin(Y(3))+V))-k*Y(1))/m;
dydt(3)=Y(4);
dydt(4)=(nap*(VA2*(-sa*cos(alfa10)+pa*sin(alfa10)))-c*Y(3))/J;
%plot(T,alfa10,'.')



















































