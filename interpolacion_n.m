function interpolacion_n(x, y, n)
% Consultar si el grado es válido
if (n < 1 || n > length(x) - 1)
    error('Dato incorrecto.')
end

% Crear la matriz de Vandermonde
V = diag(ones(1, n)) - diag(x(1:n), -1) - diag(x(n:-1:1), 1);

% Resolver el sistema lineal para los coeficientes
a = V\y;

% Crea la ecuación
ecu = a(1) * x^n + a(2) * x^(n - 1) + ... + a(n);

% Graficar
scatter(x, y, 'o');
hold on;
plot(x, ecu);

title(['Interpolación de grado: ' num2str(n)]);
end
