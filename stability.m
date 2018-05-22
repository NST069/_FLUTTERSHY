function [cc,VV, isStable] = stability(r, mm, JJ, kk)

% ��������� ������������� ��������� ������������� ���������  
format long
% ���� �������� 
global alfa  e V alfa10  s p  nap m   k c  J  nn;
figure('Visible', 'on', 'rend','painters','pos',[500 80 500 350],'Name', 'Set Initial Conditions');

m=mm;
J=JJ;
k=kk;

splast=0.32;
a22=splast/8;
aa=sqrt(a22);
r0=1.27;
g=9.8;
%V=2;
%c=0.4;
b=1;
nap=0.5*splast*r0;
hh=(pi*5)/180;
nn=0
sm=1.4;
%sm=nap*sm;
dp=-1.;
%dp=nap*dp
syms   c V;
alfa =-0.5*pi:hh:0.5*pi
s=[1.4 1.38 1.35 1.3 1.25 1.17 1.09 0.99 0.89 0.79 0.71 0.61 0.5 0.4 0.28 0.2 0.11 0.02 0.01 0.02 0.11 0.2 0.28 0.4 0.5 0.61 0.71 0.79 0.89 0.99 1.09 1.17 1.25 1.3 1.35 1.38 1.4];
p=[0 -0.17 -0.28 -0.4 -0.5 -0.6 -0.65 -0.72 -0.77 -0.81 -0.87 -0.9 -0.87 -0.79 -0.73 -0.75 -0.78 -0.4 0 0.4 0.78 0.75 0.73 0.79 0.87 0.9 0.87 0.81 0.77 0.72 0.65 0.6 0.5 0.4 0.28 0.17 0]; 
e=[0. 0.01 0.02 0.03 0.04  0.05 0.07 0.08 0.1 0.11 0.12 0.125 0.13 0.14 0.155 0.175 0.23 0.29 0.3 0.29 0.23 0.175 0.155 0.14 0.13 0.125 0.12 0.11 0.10 0.08 0.07 0.05 0.040 0.03 0.02 0.01 0.];
e=e/b;
%x1=0:0.1:2;
%x2=0:0.1:2;
%plot(x1,x2,'W'),grid on
%hold on
%xlabel('m')
%ylabel('J')
%params=ginput;
%m=params(:,1);
%J=params(:,2);
m=10
J=10
hold off
a=dp+sm
b=a*r-sm
a0=m*J;
a1=V*(m*r*b+a*J)
a2=m*(V^2)*b+m*c+k*J
a3=(V^3)*b*sm+k*V*b*r+V*c
a4=k*(V^2)*b+k*c
A=[a1 a3 0; a0 a2 a4;0 a1 a3]
z=det(A) 
pretty(z)
%aaa = evalc('pretty(z)')
% aaa=evalc('vpa(z)')
% aaa=aaa(11:end)
% [mtch, rstart, rend]=regexp(aaa, 'V\^\d+', 'match', 'start', 'end');
% for i=length(mtch):-1:1
%     ss=cell2mat(mtch(i));
%     sss=ss(3:end);
%     ii=str2num(sss);
%     ii=ii/2;
%     ssss=sprintf('V^%s', num2str(ii));
%     rs=rstart(i)-1;
%     re=rend(i)+1;
%     aaa=sprintf('%s%s%s',aaa(1:rs),ssss,aaa(re:end));
% end
% aaa=strrep(aaa, '*', '.*');
% aaa=strrep(aaa, '\', '.\');
% aaa=strrep(aaa, '^', '.^');
% z=eval(aaa);
hold on
%axis ([-1  10  -1  10]);
x=0:0.1:100;
y=0:0.1:100;
x1=-6:0.1:3.4;
[c, V] = meshgrid(x,y);
vpa(z)
switch(r)
    case 10
        z=23660.*V.^3 + (78728.*V.^2.*c)./5 - (24128.*V.^2)./5 + 2540.*V.*c.^2 - (7232.*V.*c)./5 + (832.*V)./5;
    case 5
        z=(504.*V.^3)./5 + (1608.*V.^2.*c)./5 - 120.*V.^2 + 240.*V.*c.^2 - (792.*V.*c)./5 + (96.*V)./5;
    case 2
        z=- (2772.*V.^3)./25 + (1416.*V.^2.*c)./5 - (1536.*V.^2)./25 - 180.*V.*c.^2 + (384.*V.*c)./5 - (192.*V)./25;
    case 0
        z=- (1372.*V.^3)./5 + (1288.*V.^2.*c)./5 - (112.*V.^2)./5 - 60.*V.*c.^2 + (48.*V.*c)./5;
    case -1
        z=(9072.*V.^3)./25 - (2232.*V.^2.*c)./5 + (5112.*V.^2)./25 + 120.*V.*c.^2 - (456.*V.*c)./5 + (288.*V)./25;
    case -2
        z=(57596.*V.^3)./25 - (9592.*V.^2.*c)./5 + (16544.*V.^2)./25 + 380.*V.*c.^2 - (1184.*V.*c)./5 + (704.*V)./25;
    case -6
        z=(1101772.*V.^3)./25 - (100472.*V.^2.*c)./5 + (154432.*V.^2)./25 + 2220.*V.*c.^2 - (6336.*V.*c)./5 + (3648.*V)./25;
    otherwise
        z=285.6.*V.^2.*c - 5372.0.*V.*c + 19.2.*V - 120.0.*V.^2 + 100.8.*V.^3;
end
v=[0,0];
%axis ([-10  10  -10  10]);
contour(x, y, z,v),grid on;
%xx=sm/(dp+sm);
%plot(xx,y,'B');grid on
f1=x./(sm-r*a);
f2=(x./sm*(sm-r*a))-k*r/sm;
f3=f1+k*J/m*(sm-r*a);
plot(x,f1,'R'),grid on
plot(x,f2,'B'),grid on
%plot(x,f3,'K'),grid on
%ezplot('.43904000000000000000000000000000e-1.*r.^4.*V.^3-.46099200000000000000000000000000.*r.^3.*V.^3+1.5037120000000000000000000000000.*V.^3.*r.^2-.12544000000000000000000000000000e-1.*V.^2.*r.^3+.87808000000000000000000000000000e-1.*V.^2.*r.^2+.23206400000000000000000000000000.*r.^4.*V-.53468800000000000000000000000000.*V.*r.^3-.31360000000000000000000000000000e-1.*r.^5.*V-1.1140640000000000000000000000000.*V.^3.*r-.78400000000000000000000000000000e-1.*V.^2.*r+.39827200000000000000000000000000.*V.*r.^2-1.3445600000000000000000000000000.*V.^3-.26342400000000000000000000000000.*V.^2-.11916800000000000000000000000000.*V.*r',[-10 10 -10 10]),grid on
xlabel('c');                   
ylabel('V^2');                    
title('������� ������������');   

[cc,VVV]=ginput(1);
VV=sqrt(VVV);
a00=m*J
a11=VV*(m*r*b+a*J)
a21=m*(VVV)*b+m*cc+k*J
a31=(VVV.^3)*b*sm+k*VVV*b*r+VVV*cc
a41=k*((VVV)*b+cc)
A=[a11 a31 0; a00 a21 a41;0 a11 a31]
delta33=det(A) 
if(a11>0 && a21>0 && a31>0 && a41>0 && delta33>0 )
isStable=1;
else
isStable=0;
grid on
end

disp(isStable);

close gcf;