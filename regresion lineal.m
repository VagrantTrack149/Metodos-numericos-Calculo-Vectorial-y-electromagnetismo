% Datos de entrada
x = [1 2 3 4 5 6 7 8 9];
y = [1 1.5 2 3 4 5 8 10 13];
% Ajuste de regresión polinomial por mínimos cuadrados
p = polyfit(x, y, 2);
yfit = polyval(p, x);

% Cálculo del error estándar de la estimación
yresid = y - yfit;
SSE = sum(yresid.^2);
MSE = SSE / (length(y) - 3);
SE = sqrt(MSE);
disp(['Error estándar de la estimación: ' num2str(SE)]);

% Cálculo de los coeficientes de la regresión lineal
m = (sum_xy - sum_x*sum_y) / (sum_x2 - sum_x^2);
b = (sum_y - m*sum_x) / n;

% Cálculo de la recta de regresión lineal
x_reg = linspace(min(x), max(x), 100);
y_reg = m*x_reg + b;

% Cálculo del coeficiente de correlación
R = corrcoef(x, y);
r = R(1,2);
disp(['Coeficiente de correlación: ' num2str(r)]);

% Gráfica de los datos y la parábola
plot(x, y, 'o');
hold on;
plot(x, yfit, '-');
xlabel('x');
ylabel('y');
legend('Datos', 'Parábola');
