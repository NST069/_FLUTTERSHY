function EQUILIBRIUM(rr)
    global alfa e V teta  tayalfa noralfa c k  nap
    splast=0.32;
    a2=splast/8;
    a=sqrt(a2);
    %r=8*a;
    r=rr;
    %r=-8*a;
    r0=1.27;
    g=9.8;
    V=5;
    k=0.4;
    c=.0;
    nap=0.5*splast*r;
    hh=(pi*5)/180;
    nn=0
    alfa =-0.5*pi:hh:0.5*pi;
    s=[1.4 1.38 1.35 1.3 1.25 1.17 1.09 0.99 0.89 0.79 0.71 0.61 0.5 0.4 0.28 0.2 0.11 0.02 0.01 0.02 0.11 0.2 0.28 0.4 0.5 0.61 0.71 0.79 0.89 0.99 1.09 1.17 1.25 1.3 1.35 1.38 1.4];
    p=[0 -0.17 -0.28 -0.4 -0.5 -0.6 -0.65 -0.72 -0.77 -0.81 -0.87 -0.9 -0.87 -0.79 -0.73 -0.75 -0.78 -0.4 0 0.4 0.78 0.75 0.73 0.79 0.87 0.9 0.87 0.81 0.77 0.72 0.65 0.6 0.5 0.4 0.28 0.17 0]; 
    e=[0. 0.01 0.02 0.03 0.04  0.05 0.07 0.08 0.1 0.11 0.12 0.125 0.13 0.14 0.155 0.175 0.23 0.29 0.3 0.29 0.23 0.175 0.155 0.14 0.13 0.125 0.12 0.11 0.10 0.08 0.07 0.05 0.040 0.03 0.02 0.01 0.];
    alfa1=-pi/2:pi/1000:pi/2
    hh=5*pi/180;
    alfa=-pi/2:5*pi/180:pi/2;
    
    tayalfa=p.*sin(alfa)-s.*cos(alfa);
    noralfa=p.*cos(alfa)+s.*sin(alfa);
    ravn=r*(V^2)*nap*tayalfa-V^2*nap*e.*noralfa;
    pramaya=c*pi/2-c*alfa;
    teta=(pi/2)-alfa;
    alfa3=-pi/2:0.01*pi/180:0.5*pi;
    ravn1=spline(alfa,ravn,alfa3);
    pramaya1=spline(alfa,pramaya,alfa3);
    axis ([-pi pi   -10  10])
    subplot(1,2,1)
    hold on
    plot(alfa3,ravn1,'R'),grid on
    plot(alfa3,pramaya1,'R'),grid on
    %y=(v*sin(teta)+cos(teta)).*tan(alfa3)
    %plot(alfa3,y,'R'),grid on
    xlabel('ALFA')
    ylabel('FUN')

    y1=ginput(1)
    x=fsolve(@myfyn23,y1 ,optimset('Display','off'));
    plot(x(:,1),x(:,2),'*'),grid on
    teta=(pi/2)-x(1)
    Igrek=V*spline(alfa,p,x(1))/k
    subplot(1,2,2)
    %axis ([-pi pi   -10  10])
    hold on
    plot(teta,Igrek,'x'),grid on
    %fid = fopen('my_excel.m', 'wb'); 
    %Y=[omega x(:,1)]
    %fprintf(fid, '%f; %f; \r\n', Y)
    %fclose(fid
    %x = ones(2); 
    %save params x; 
    %x = zeros(2);   
    %load params x; 
    %disp(x);
end

