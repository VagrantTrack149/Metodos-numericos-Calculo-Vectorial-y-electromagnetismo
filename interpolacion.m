%Interpolación o codigo fuente
Temp = [ 250 300 350 400 450 500 550 600 650 700 750 800 900 1000];
P_C = [ 1.003 1.005 1.008 1.013 1.020 1.029 1.040 1.051 1.063 1.075 1.087 1.099 1.121 1.142];
%Regresion cuadratica
n = length(Temp);
sum_x = sum(Temp);
sum_y = sum(P_C);
sum_x2 = sum(Temp.^2);
sum_xy = sum(Temp.*P_C);
sum_x3 = sum(Temp.^3);
sum_x4 = sum(Temp.^4);
sum_x2y = sum(Temp.^2.*P_C);

A = [n, sum_x, sum_x2; sum_x, sum_x2, sum_x3; sum_x2, sum_x3, sum_x4];
B = [sum_y; sum_xy; sum_x2y];
coef = A\B;

x_reg = linspace(min(Temp), max(Temp), 100);
y_reg = coef(1) + coef(2).*x_reg + coef(3).*x_reg.^2;

plot(Temp, P_C, 'o', x_reg, y_reg);
legend('Puntos', 'Regresión cuadrática');
figure;

% Regresion lineal
n = length(Temp);
sum_x = sum(Temp);
sum_y = sum(P_C);
sum_x2 = sum(Temp.^2);
sum_xy = sum(Temp.*P_C);
m = (n*sum_xy - sum_x*sum_y) / (n*sum_x2 - sum_x^2);
b = (sum_y - m*sum_x) / n;
x_reg_1 = linspace(min(Temp), max(Temp), 100);
y_reg_1 = m*x_reg_1 + b;

plot(Temp, P_C, 'o', x_reg_1, y_reg_1);
legend('Puntos', 'Regresión Lineal');

figure;
title("Interpolación lineal");
% Interpolación lineal
i=1;
j=1;
for i = 1:length(Temp) - 1
    linea(Temp(i),P_C(j),Temp(i+1),P_C(j+1));
    i=i+1;
    j=j+1;
end
hold off;
figure;
% title("Interpolación Cuadratica");
% % Interpolación lineal
% i=1;
% j=1;
% for i = 1:length(Temp) - 2
%     cuadratic(Temp(i),P_C(j),Temp(i+1),P_C(j+1),Temp(i+2),P_C(j+2));
%     i=i+1;
%     j=j+1;
% end
% hold off;
% figure;
% title("Interpolación Cubica");
% % Interpolación cubica
% i=1;
% j=1;
% for i=1: length(Temp) -3
%     cubica(Temp(i),P_C(j),Temp(i+1),P_C(j+1),Temp(i+2),P_C(j+2),Temp(i+3),P_C(j+3));
%     i=i+1;
%     j=j+1;
% end
% hold off;
% figure;
% title("Interpolación 4ta");
% % Interpolación 4ta
% i=1;
% j=1;
% for i=1: length(Temp) -4
%     cuarta(Temp(i),P_C(j),Temp(i+1),P_C(j+1),Temp(i+2),P_C(j+2),Temp(i+3),P_C(j+3),Temp(i+4),P_C(j+4));
%     i=i+1;
%     j=j+1;
% end
% hold off;   
% figure;
% title("Interpolación 5ta");
% % Interpolación 5ta
% i=1;
% j=1;
% for i=1: length(Temp) -5
%     quinta(Temp(i),P_C(j),Temp(i+1),P_C(j+1),Temp(i+2),P_C(j+2),Temp(i+3),P_C(j+3),Temp(i+4),P_C(j+4),Temp(i+5),P_C(j+5));
%     i=i+1;
%     j=j+1;
% end
% hold off;
% figure;
% title("Interpolación 6ta");
% % Interpolación 6ta
% i=1;
% j=1;
% for i=1: length(Temp) -6
%     sexta(Temp(i),P_C(j),Temp(i+1),P_C(j+1),Temp(i+2),P_C(j+2),Temp(i+3),P_C(j+3),Temp(i+4),P_C(j+4),Temp(i+5),P_C(j+5),Temp(i+6),P_C(j+6));
%     i=i+1;
%     j=j+1;
% end
% 
% hold off;
% figure;
% title("Interpolación 7ta");
% % Interpolación 7ta
% i=1;
% j=1;
% for i=1: length(Temp) -7
%     septima(Temp(i),P_C(j),Temp(i+1),P_C(j+1),Temp(i+2),P_C(j+2),Temp(i+3),P_C(j+3),Temp(i+4),P_C(j+4),Temp(i+5),P_C(j+5),Temp(i+6),P_C(j+6),Temp(i+7),P_C(j+7));
%     i=i+1;
%     j=j+1;
% end
% 
% hold off;
% figure;
% title("Interpolación 8va");
% % Interpolación 8va
% i=1;
% j=1;
% for i=1: length(Temp) -8
%     octava(Temp(i),P_C(j),Temp(i+1),P_C(j+1),Temp(i+2),P_C(j+2),Temp(i+3),P_C(j+3),Temp(i+4),P_C(j+4),Temp(i+5),P_C(j+5),Temp(i+6),P_C(j+6),Temp(i+7),P_C(j+7),Temp(i+8),P_C(j+8));
%     i=i+1;
%     j=j+1;
% end
% hold off;
% figure;
% title("Interpolación 9na");
% % Interpolación 9na
% i=1;
% j=1;
% for i=1: length(Temp) -9
%     novena(Temp(i),P_C(j),Temp(i+1),P_C(j+1),Temp(i+2),P_C(j+2),Temp(i+3),P_C(j+3),Temp(i+4),P_C(j+4),Temp(i+5),P_C(j+5),Temp(i+6),P_C(j+6),Temp(i+7),P_C(j+7),Temp(i+8),P_C(j+8),Temp(i+9),P_C(j+9));
%     i=i+1;
%     j=j+1;
% end
% 
% hold off;
% figure;
% title("Interpolación 10ma");
% % Interpolación 10ma
% i=1;
% j=1;
% for i=1: length(Temp) -10
%     decima(Temp(i),P_C(j),Temp(i+1),P_C(j+1),Temp(i+2),P_C(j+2),Temp(i+3),P_C(j+3),Temp(i+4),P_C(j+4),Temp(i+5),P_C(j+5),Temp(i+6),P_C(j+6),Temp(i+7),P_C(j+7),Temp(i+8),P_C(j+8),Temp(i+9),P_C(j+9),Temp(i+10),P_C(j+10));
%     i=i+1;
%     j=j+1;
% end
% 
% hold off;
% figure;
% title("Interpolación 11va");
% % Interpolación 11va
% i=1;
% j=1;
% for i=1: length(Temp) -11
%     onceava(Temp(i),P_C(j),Temp(i+1),P_C(j+1),Temp(i+2),P_C(j+2),Temp(i+3),P_C(j+3),Temp(i+4),P_C(j+4),Temp(i+5),P_C(j+5),Temp(i+6),P_C(j+6),Temp(i+7),P_C(j+7),Temp(i+8),P_C(j+8),Temp(i+9),P_C(j+9),Temp(i+10),P_C(j+10),Temp(i+11),P_C(j+11));
%     i=i+1;
%     j=j+1;
% end
% 
% hold off;
% figure;
% title("Interpolación 12va");
% % Interpolación 12va
% i=1;
% j=1;
% for i=1: length(Temp) -12
%     doceava(Temp(i),P_C(j),Temp(i+1),P_C(j+1),Temp(i+2),P_C(j+2),Temp(i+3),P_C(j+3),Temp(i+4),P_C(j+4),Temp(i+5),P_C(j+5),Temp(i+6),P_C(j+6),Temp(i+7),P_C(j+7),Temp(i+8),P_C(j+8),Temp(i+9),P_C(j+9),Temp(i+10),P_C(j+10),Temp(i+11),P_C(j+11),Temp(i+12),P_C(j+12));
%     i=i+1;
%     j=j+1;
% end
% hold off;
figure;
title("Interpolación 13va");
% Interpolación 13va
i=1;
j=1;
for i=1: length(Temp) -13
    treceava(Temp(i),P_C(j),Temp(i+1),P_C(j+1),Temp(i+2),P_C(j+2),Temp(i+3),P_C(j+3),Temp(i+4),P_C(j+4),Temp(i+5),P_C(j+5),Temp(i+6),P_C(j+6),Temp(i+7),P_C(j+7),Temp(i+8),P_C(j+8),Temp(i+9),P_C(j+9),Temp(i+10),P_C(j+10),Temp(i+11),P_C(j+11),Temp(i+12),P_C(j+12),Temp(i+13),P_C(j+13));
    i=i+1;
    j=j+1;
end
hold off;
n=6;
figure;
% interpolacion_n(Temp, P_C, n)
automatica(Temp,P_C,n);