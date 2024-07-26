clc;
clear all;
close all;
% Definir la función a integrar y el espacio donde va a existir
t = 0:0.001:1;
i = @(x) ((sin(2*pi*x)).^2);
% Definir el intervalo de integración
a = 0;
b = 1;
% Definir el número de trapecios para la aproximación
n = 4;
% Calcular el ancho de cada trapecio
dx = (b-a)/n;
% Area total
area_tra=0;
% Graficar la función y los rectángulos utilizados para la aproximación
x = linspace(a, b, 100);
y = i(x);
figure;
plot(x, y);
hold on;
% Trapeziode xd
tic
h = t(2) - t(1);
I_trap = (h/2) * (i(t(1)) + 2*sum(i(t(2:n-1))) + i(t(n)));
toc
fprintf('El área aproximada es %f\n', I_trap);

% Rectangulo
tic
dx=(t(2)-t(1))/n;
I_rect = sum(i(t)*dx);
toc
% Mostrar el área aproximada y el número de rectángulos utilizados
fprintf('El área aproximada es %f \n', I_rect);

%Regla de simpson 1/3

% Calcular los puntos x en los que se evalúa la función
x = a:dx:b;
% Calcular los valores de la función en los puntos x
y = i(x);
% Calcular la integral por la Regla de Simpson
I = dx/3 * (y(1) + 4*sum(y(2:2:end-1)) + 2*sum(y(3:2:end-2)) + y(end));

% Mostrar el resultado
fprintf('El area aproximada por la regla de simpson 1/3 : %f\n', I);

% Regla de simpson 3/8
% Calcular los puntos x en los que se evalúa la función
x = a:dx:b;

% Calcular los valores de la función en los puntos x
y = i(x);

% Verificar si el número de puntos es válido para la regla de Simpson 3/8
if mod(length(x)-1, 3) == 0
    error('El número de puntos debe ser de la forma 3n+1 para la regla de Simpson 3/8.');
end

% Calcular la integral por la Regla de Simpson 3/8
I = (3 * dx / 8) * (y(1) + 3*sum(y(2:3:end-2)) + 3*sum(y(3:3:end-1)) + 2*sum(y(4:3:end-3)) + y(end));
% Mostrar el resultado
fprintf('El área aproximada por la regla de Simpson 3/8: %f\n', I);
