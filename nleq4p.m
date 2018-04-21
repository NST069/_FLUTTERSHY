function num = nleq4p() %non-linear equation for pendulum

splast=1
a2=splast/8
b=sqrt(a2)
r=0.2
r0=1.27;
alfa1=-pi/2:pi/1000:pi/2
hh=5*pi/180;
alfa=-pi/2:5*pi/180:pi/2
e=[0. 0.01 0.02 0.03 0.04  0.05 0.07 0.08 0.1 0.11 0.12 0.125 0.13 0.14 0.155 0.175 0.23 0.29 0.3 0.29 0.23 0.175 0.155 0.14 0.13 0.125 0.12 0.11 0.10 0.08 0.07 0.05 0.040 0.03 0.02 0.01 0.]
e=e/r
e=0.5*r0*splast*e
teta=pi/4
%-sin(teta)
%subplot(2,1,1)
%handles=guidata(FLUTTERSHY);
%linkdata(handles.afun2d)
for v=0.5:0.5:2
 for omega=0.5:0.5:2
global alfa e teta v omega L
alfa3=-pi/2+pi/100:0.01*pi/180:0.5*pi-pi/100
e3=spline(alfa,e,alfa3)
e4=omega.*e3+cos(teta)-v*sin(teta)
subplot(2,1,1)
%linkdata(handles.afun2d)
plot(alfa3,e4,'B'),grid on
hold on
axis ([-pi/2  pi/2  -10  10])
y = (omega+sin(teta)+v*cos(teta)).*tan(alfa3)
plot(alfa3,y,'R'),grid on
xlabel('ALFA')
ylabel('FUN')
subplot(2,1,1)
%linkdata(handles.afun2d)
y1 =ginput(1)
x=fsolve(@myfyn18,y1 ,optimset('Display','off'))
hold off
subplot(2,1,1)
%linkdata(handles.afun2d)
plot(x(1),x(2),'X'),grid on
subplot(2,1,2)
%linkdata(handles.omegavalpha3d)
hold on
plot3(omega,v,x(1),'*'),grid on
 end
end
subplot(2,1,1)
%linkdata(handles.afun2d)
xlabel('ALFA')
ylabel('FUN')
subplot(2,1,2)
%linkdata(handles.omegavalpha3d)
%title('����������� ���� ����� �� ������� ����������')
s=sprintf('Dependency Of Attack Angle\nFrom Phasal Variables');
title(s)
xlabel('OMEGA')
ylabel('V')
zlabel('ALFA')

num=0;

end






 
