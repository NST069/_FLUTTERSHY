function [y3,y1] = setInitCond()
%SETINITCOND Summary of this function goes here
%   setting initial conditions

figure('Visible', 'on', 'rend','painters','pos',[500 80 500 350],'Name', 'Set Initial Conditions');
plot(-2:0.1:2,-2:0.1:2,'W'),grid on
hold on
xlabel('TETA')
ylabel('Y')
[y3,y1]=ginput(1);
close gcf;
%msgbox(sprintf('%d , %d', ic(1), ic(2)));
end

