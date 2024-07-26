clc;
clear all;
close all;
% Definir la función a integrar
f = @(x) ((sin(2*pi*x)).^2);
% Definir el intervalo de integración
a = 0;
b = 2;
% Definir el número de trapecios para la aproximación
n = 10000000;
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
while e>=0.001
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

area_rec=0;
x1=a;
e1=100;
tic
c=1;
arrc=0;
eaux1=0;
while e1>=0.001
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
hold on
title('Area trapecio(Roja) y Area de rectangulo(Azul)')
plot(area_tra,'r')
plot(area_rec,'b')
hold off
figure;
hold on
title('Error trapecio(Roja) y Error de rectangulo(Azul)')
plot(eaux,'r')
plot(eaux1,'b')
hold off
figure;
hold on
title('Iteraciones trapecio(Roja) y Iteraciones rectangulo(Azul)')
plot(arrc,'b')
plot(arrg,'r')
hold off