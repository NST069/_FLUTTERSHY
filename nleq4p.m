function nleq4p(ismanual, jobj) %non-linear equation for pendulum

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
matr=zeros(4,4);
cx = 0;
cy=0;

for vv=0.5:0.5:2
    cx=cx+1;
 for oomega=0.5:0.5:2  
    global alfa e teta v omega L
    omega=oomega;
    v=vv;
    cy=cy+1;

    if(ismanual~=1)
        jobj.start();
    end

    alfa3=-pi/2+pi/100:0.01*pi/180:0.5*pi-pi/100
    e3=spline(alfa,e,alfa3)
    e4=omega.*e3+cos(teta)-v*sin(teta)
    subplot(2,1,1)
    p1 = plot(alfa3,e4,'B'),grid on
    hold on
    axis ([-pi/2  pi/2  -10  10])
    y = (omega+sin(teta)+v*cos(teta)).*tan(alfa3)
    p2 = plot(alfa3,y,'R'),grid on
    xlabel('ALFA')
    ylabel('FUN')
    subplot(2,1,1)
    if(ismanual==1)
        y1 = ginput(1)
    else
        ii=find((p1.YData-p2.YData)<=0.1, 1);
        i=-pi/2+pi/100;
        for j=1:1:ii+1 
            i=i+(0.01*pi/180);
        end
        y1=[i,0];
        hold on
        plot(y1(1),y1(2),'X');
    end
    x=fsolve(@myfyn18,y1 ,optimset('Display','off'))

    hold off
    %subplot(2,1,1)
    %plot(x(1),x(2),'X'),grid on
    subplot(2,1,2)
    hold on
    plot3(omega,v,x(1),'*'),grid on
    matr(cx,cy)=x(1);

    if(ismanual~=1)
        jobj.stop();
    end

    pause(.1);
 end
 cy=0;
end

if(ismanual~=1)
    jobj.setBusyText('Done');
end
subplot(2,1,1)
xlabel('ALFA')
ylabel('FUN')
subplot(2,1,2)
x=1:1:4;
y=1:1:4;
s=sprintf('Dependency Of Attack Angle\nFrom Phasal Variables');
title(s)
xlabel('OMEGA')
ylabel('V')
zlabel('ALFA')
% [X,Y]=meshgrid([1:1:4],[1:1:4]);
% Z=matr(X,Y);
% surf(X,Y,Z);
surf(x/2,y/2,matr(x,y))
view([-45 45]);

end






 

