% Definir la función a integrar
f = @(x) x.^2;
% Definir el intervalo de integración
a = 0;
b = 2;
% Definir el número de rectángulos para la aproximación
n = 10;
% Calcular el ancho de cada rectángulo
dx = (b-a)/n;
% Calcular las coordenadas x de los puntos medios de cada rectángulo
x_midpoints = linspace(a+dx/2, b-dx/2, n);
% Calcular las alturas de los rectángulos en los puntos medios
heights = f(x_midpoints);
% Graficar la función y los rectángulos utilizados para la aproximación
x = linspace(a, b, 100);
y = f(x);
figure;
plot(x, y);
hold on;
%
q = quadgk(f, a, b)
q1 = quad(f, a, b)
for i = 1:n
    rectangle('Position', [x_midpoints(i)-dx/2, 0, dx, heights(i)]);
end
hold off;