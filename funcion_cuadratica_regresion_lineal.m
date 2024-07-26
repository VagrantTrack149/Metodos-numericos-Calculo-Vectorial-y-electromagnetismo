% Introducir manualmente los puntos de la función
x = [1, 2, 3, 4, 5];
y = [3, 5, 7, 9, 11];

% Realizar regresión lineal para encontrar la recta que mejor se ajusta
p = polyfit(x, y, 1); % Polinomio de grado 1 (recta)

% Graficar los datos y la recta de regresión lineal
plot(x, y, 'o', x, p(1)*x + p(2), '-');
xlabel('x');
ylabel('y');
legend('Datos', 'Recta de regresión lineal');
