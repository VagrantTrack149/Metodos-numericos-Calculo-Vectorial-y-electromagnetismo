% Datos de ejemplo
Temp = [250 300 350 400 450 500 550 600 650 700 750 800 900 1000];
P_C = [1.003 1.005 1.008 1.013 1.020 1.029 1.040 1.051 1.063 1.075 1.087 1.099 1.121 1.142];

% Valor a extrapolar
Temp_extrap = 1200;

% Encontrar los puntos más cercanos
[~, index] = min(abs(Temp - Temp_extrap));

% Calcular la pendiente y la intersección
x1 = Temp(index-1);
x2 = Temp(index);
y1 = P_C(index-1);
y2 = P_C(index);
m = (y2 - y1) / (x2 - x1);
b = y1 - m*x1;

% Calcular el valor extrapolado
P_C_extrap = m * Temp_extrap + b;

% Graficar los puntos y las rectas
x_reg = [min(Temp), max(Temp_extrap)];
y_reg = m * x_reg + b;

figure;
hold on;
plot(Temp, P_C, 'o', 'MarkerFaceColor', 'b'); % Puntos en azul
plot(x_reg, y_reg, 'r', 'LineWidth', 2); % Rectas en rojo
plot(Temp_extrap, P_C_extrap, 'ro', 'MarkerFaceColor', 'r'); % Punto extrapolado en rojo
hold off;

xlabel('Temp');
ylabel('P_C');
legend('Puntos', 'Rectas de extrapolación', 'Extrapolación');
title('Extrapolación de primer grado');
