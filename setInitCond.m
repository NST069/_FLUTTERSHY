function [y3,y1] = setInitCond()
%SETINITCOND Summary of this function goes here
%   Detailed explanation goes here

figure;
plot(-2:0.1:2,-2:0.1:2,'W'),grid on
hold on
xlabel('TETA')
ylabel('Y')
[y3,y1]=ginput;
close gcf;
%msgbox(sprintf('%d , %d', ic(1), ic(2)));
end

