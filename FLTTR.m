function flttr=FLTTR(mm,JJ,cc,VV,Y3,Y1,L, tspan)

%Program Integrating Plate Autooscillation Equations
format long
% ���� �������� 
global alfa  e V alfa10 m J s p  nap   k c r nn;

m=mm;
J=JJ;
c=cc;
V=VV;

splast=0.32;
a2=splast/8;
a=sqrt(a2);
r=8*a;
r0=1.27;
g=9.8;
V=2;
k=0.4;
c=0.4;
b=1;
nap=0.5*splast*r0;
hh=(pi*5)/180;
nn=0;
alfa =-0.5*pi:hh:0.5*pi;
switch(L)
    case 5
        s=[1.4 1.38 1.35 1.3 1.25 1.17 1.09 0.99 0.89 0.79 0.71 0.61 0.5 0.4 0.28 0.2 0.11 0.02 0.01 0.02 0.11 0.2 0.28 0.4 0.5 0.61 0.71 0.79 0.89 0.99 1.09 1.17 1.25 1.3 1.35 1.38 1.4];
        p=[0 -0.17 -0.28 -0.4 -0.5 -0.6 -0.65 -0.72 -0.77 -0.81 -0.87 -0.9 -0.87 -0.79 -0.73 -0.75 -0.78 -0.4 0 0.4 0.78 0.75 0.73 0.79 0.87 0.9 0.87 0.81 0.77 0.72 0.65 0.6 0.5 0.4 0.28 0.17 0];
    case 8
        s=[1.4 1.38 1.35 1.3 1.25 1.17 1.09 0.99 0.89 0.79 0.71 0.61 0.5 0.4 0.28 0.2 0.11 0.02 0.01 0.02 0.11 0.2 0.28 0.4 0.5 0.61 0.71 0.79 0.89 0.99 1.09 1.17 1.25 1.3 1.35 1.38 1.4];
        p=[0 -0.17 -0.28 -0.4 -0.5 -0.6 -0.65 -0.72 -0.77 -0.81 -0.87 -0.9 -0.87 -0.79 -0.73 -0.75 -0.78 -0.4 0 0.4 0.78 0.75 0.73 0.79 0.87 0.9 0.87 0.81 0.77 0.72 0.65 0.6 0.5 0.4 0.28 0.17 0]; 
    case 10.5
        s=[ 1.4  1.39  1.38  1.31 1.25 1.18 1.07 1.03 0.91 0.8  0.76  0.7 0.61 0.47 0.33 0.23  0.14 0.05  0.01 0.05  0.14 0.23 0.33  0.47 0.61 0.7  0.76 0.8 0.91  1.03 1.07 1.18 1.25  1.31 1.38 1.39 1.4];
        p=[0  -0.2 -0.3 -0.41 -0.51 -0.61 -0.68 -0.74 -0.79 -0.84 -0.9 -0.91 -0.89 -0.79 -0.73 -0.7 -0.69 -0.41 0 0.41 0.69 0.7 0.73 0.79 0.89 0.91 0.9 0.84 0.79 0.74 0.68 0.61 0.51 0.41 0.3 0.2  0];
    case 12
        s=[1.41 1.39 1.37 1.3 1.27 1.18 1.1 1.04 1.0 0.92 0.84 0.7 0.59 0.41 0.28 0.2 0.13 0.04 0.02 0.04 0.13 0.2 0.28 0.41 0.59 0.7 0.84 0.92 1.0 1.04 1.1 1.18 1.27 1.3 1.37 1.39  1.41];
        p=[ 0 -0.12 -0.21 -0.32 -0.45 -0.53 -0.6 -0.7  -0.8 -0.91 -1.09 -1.15 -1.05  -0.9  -0.8  -0.75 -0.7 -0.45 0  0.45 0.7 0.75 0.8 0.9 1.05 1.15 1.09 0.91 0.8 0.7 0.6 0.53 0.45 0.32 0.21 0.12 0];
    otherwise error('no constants for this plate length');
end
e=[0. 0.01 0.02 0.03 0.04  0.05 0.07 0.08 0.1 0.11 0.12 0.125 0.13 0.14 0.155 0.175 0.23 0.29 0.3 0.29 0.23 0.175 0.155 0.14 0.13 0.125 0.12 0.11 0.10 0.08 0.07 0.05 0.040 0.03 0.02 0.01 0.];
e=e/b;
% x1=0:0.1:2;
% x2=0:0.1:2;
% plot(x1,x2,'W'),grid on
% hold on
% xlabel('m')
% ylabel('J')
% params=ginput;
% m=params(:,1);
% J=params(:,2);
% �������� ����������
hh=(pi*5)/180;
alfa=-0.5*pi:(pi*5)/180:0.5*pi;
s0=nap*s(19);
p1=nap*(p(19)-p(18))/hh;
L0=nap*e(19);
%m=0.1:0.1:1.5
%J=0.1:0.1:1.5  
% x1=-2:0.1:2;
% x2=-2:0.1:2;
% plot(x1,x2,'W'),grid on
% hold on
% xlabel('TETA')
% ylabel('Y')
% params=ginput;
% Y3=params(:,1);
% Y1=params(:,2);
Y=[Y1  0  Y3  0];
% �������������� ������� ���������������� ���������
%Tspan=0:0.05:10;%���������� ��� ��������������
Tspan=[0 tspan];%�������������� ����� ����
[T,Y]=ode45(@FLATTER21,Tspan,Y);%, odeset('OutputFcn',@stat));
%����� ������� ������������ � ����������
% plot(Y(:,3),Y(:,1),'.-')
% grid on
% xlabel('teta')
% ylabel('Y')
% title('������� ������ � ���������� ���������')

flttr=Y;
end

% function status = stat(t,y,flag)
%     global tt yy
%     if nargin < 3 || isempty(flag)
%         tt = [tt t];
%         yy = [yy y];
%     else
%         switch(flag)
%         case 'init'
%             fprintf('start\n');
%             tt = t(1);
%             yy = y;
%         case 'done'
%             fprintf('done\n');
%         
%         end
%     end
%     disp(yy);
%     status = 0;
% end