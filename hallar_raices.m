% Hallar raices
% Graficada de -20 a 20
% F(X)=X^2+21X+110.25
clc
clear all
x= linspace(-20,0,2000);
% y= x.*x+21*x+110.25;
y= (x.*x+21*x+110.25).*sin(x.^2);
plot(x,y)
grid on