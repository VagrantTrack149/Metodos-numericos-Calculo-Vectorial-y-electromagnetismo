% Datos
x = [-2, -1, 0, 1, 2];
y = [4, 1, 0, 1, 4];

% Cálculo de las sumatorias
n = length(x);
sum_x = sum(x);
sum_y = sum(y);
sum_x2 = sum(x.^2);
sum_xy = sum(x.*y);
sum_x3 = sum(x.^3);
sum_x4 = sum(x.^4);
sum_x2y = sum(x.^2.*y);

% Cálculo de los coeficientes de la regresión cuadrática
A = [n, sum_x, sum_x2; sum_x, sum_x2, sum_x3; sum_x2, sum_x3, sum_x4];
B = [sum_y; sum_xy; sum_x2y];
coef = A\B;

% Cálculo de la recta de regresión cuadrática
x_reg = linspace(min(x), max(x), 100);
y_reg = coef(1) + coef(2).*x_reg + coef(3).*x_reg.^2;

% Gráfica de los puntos y la recta de regresión cuadrática
plot(x, y, 'o', x_reg, y_reg);
legend('Puntos', 'Regresión cuadrática');
