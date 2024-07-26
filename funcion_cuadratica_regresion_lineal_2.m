% Introducir manualmente los puntos de la función
x = [-2, -1, 0, 1, 2];
y = [4, 1, 0, 1, 4];

% Realizar regresión lineal para encontrar la recta que mejor se ajusta
p = polyfit(x, y, 2); % Polinomio de grado 2

% Graficar los datos y la recta de regresión lineal
plot(x, y, 'o', x, p(1)*x.^2 + p(2)*x + p(3), '-');
xlabel('x');
ylabel('y');
legend('Datos', 'Recta de regresión lineal');
