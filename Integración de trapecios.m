clc;
clear all;
close all;
% Definir la función a integrar
f = @(x) ((sin(2*pi*x)).^2);
% Definir el intervalo de integración
a = 0;
b = 1;
% Definir el número de trapecios para la aproximación
n = 256;
% Calcular el ancho de cada trapecio
dx = (b-a)/n;
% Area total
area_tra=0;
% Graficar la función y los rectángulos utilizados para la aproximación
x = linspace(a, b, 100);
y = f(x);
figure;
plot(x, y);
hold on;
x1=a;
e=100;
tic
g=1;
arrg=0;
eaux=0;
while e<0.1
    arrg(g)=g;
    area_tra(g+1)=area_tra(g)+((f(x1)+f(x1+1))/2)*dx;
    x1=x1+dx;
    e=abs((0.5-area_tra(g+1))/(0.5));
    eaux(g)=e;
    g=g+1;
end
toc
trapecio_area=area_tra(g);
hold off;
% Mostrar el área aproximada y el número de trapecios utilizados
fprintf('El área aproximada es %f utilizando %d trapecios.\n', trapecio_area, g);

x1=a;
e1=100;
tic
c=1;
area_rec(c)=0;
arrc=0;
eaux1=0;
while e1<0.1
    arrc(c)=c;
    area_rec(c+1)=area_rec(c)+((x1).^2)*dx;
    x1=x1+dx;
    e1=abs((0.5-area_rec(c+1))/(0.5));
    eaux1(c)=e1;
    c=c+1;
end
toc
rectangulo_area=area_rec(c);
% Mostrar el área aproximada y el número de rectángulos utilizados
fprintf('El área aproximada es %f utilizando %d rectángulos.\n', rectangulo_area, c);

%Regla de simpson 1/3

% Calcular los puntos x en los que se evalúa la función
x = a:dx:b;
% Calcular los valores de la función en los puntos x
y = f(x);
% Calcular la integral por la Regla de Simpson
I = dx/3 * (y(1) + 4*sum(y(2:2:end-1)) + 2*sum(y(3:2:end-2)) + y(end));

% Mostrar el resultado
fprintf('El area aproximada por la regla de simpson 1/3 : %f\n', I);

% Regla de simpson 3/8
% Calcular los puntos x en los que se evalúa la función
x = a:dx:b;

% Calcular los valores de la función en los puntos x
y = f(x);

% Verificar si el número de puntos es válido para la regla de Simpson 3/8
if mod(length(x)-1, 3) == 0
    error('El número de puntos debe ser de la forma 3n+1 para la regla de Simpson 3/8.');
end

% Calcular la integral por la Regla de Simpson 3/8
I = (3 * dx / 8) * (y(1) + 3*sum(y(2:3:end-2)) + 3*sum(y(3:3:end-1)) + 2*sum(y(4:3:end-3)) + y(end));
% Mostrar el resultado
fprintf('El área aproximada por la regla de Simpson 3/8: %f\n', I);

%Mostrar resultados
hold on
title('Area trapecio(Roja), Area de rectangulo(Azul)')
plot(area_tra,'r')
plot(area_rec,'b')
hold off
figure;
hold on
title('Error trapecio(Roja), Error de rectangulo(Azul)')
plot(eaux,'r')
plot(eaux1,'b')
hold off
figure;
hold on
title('Iteraciones trapecio(Roja), Iteraciones rectangulo(Azul)')
plot(arrc,'b')
plot(arrg,'r')
hold off