% Datos de ejemplo
Temp = [20 25 30];
P_C = [100 150 200];

% Valor a interpolar
Temp_interpol = 28;

% Encontrar los puntos más cercanos
[~, index] = min(abs(Temp - Temp_interpol));

% Calcular la pendiente y la intersección
x1 = Temp(index-1);
x2 = Temp(index);
y1 = P_C(index-1);
y2 = P_C(index);
m = (y2 - y1) / (x2 - x1);
b = y1 - m*x1;

% Calcular el valor interpolado
P_C_interpol = m * Temp_interpol + b;

% Imprimir el resultado
fprintf('Para Temp = %.1f, P_C_interpol = %.1f\n', Temp_interpol, P_C_interpol);
