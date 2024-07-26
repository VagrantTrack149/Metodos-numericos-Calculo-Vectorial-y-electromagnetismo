clc;
clear all;
close all;
% Definir la función a integrar
f = @(x) exp(cos(x)).*cosh(log(x.^3));
% Definir el intervalo de integración
a = 0.1;
b = 40;
% Definir el número de trapecios para la aproximación
n = 100000000;
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
    e=abs((426212-area_tra(g+1))/(426212));
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
    e1=abs((426212-area_rec(c+1))/(426212));
    eaux1(c)=e1;
    c=c+1;
end
toc
rectangulo_area=area_rec(c);
% Mostrar el área aproximada y el número de rectángulos utilizados
fprintf('El área aproximada es %f utilizando %d rectángulos.\n', rectangulo_area, c);

%Regla de simpson
% Inicializar variables
n1 = 2; % número inicial de subintervalos
I_anterior = 0; % valor de la integral anterior
I_actual = simpson(f, a, b, n1); % valor de la integral actual
I_exacta=426212;
error_porcentual = 100; % error porcentual actual
error_max=0.001;
A_simp=0;
error_simp=0;
iter_simp=0;
iter=0;
tic
% Ciclo para aumentar el número de subintervalos hasta alcanzar el error porcentual deseado
while error_porcentual > error_max
    % Actualizar el número de subintervalos
    n1 = n1 + 2;
    iter_simp(iter+1)=n1;
    % Actualizar el valor de la integral anterior y el valor actual
    I_anterior = I_actual;
    I_actual = simpson(f, a, b, n1);
    Area_simp(iter+1)=I_actual;
    % Calcular el error porcentual
    error_porcentual = abs(I_actual - I_anterior) / I_exacta;
    error_simp(iter+1)=error_porcentual;
    iter=iter+1;
    
end
fprintf('El área aproximada es %f utilizando %d tercios.\n',  I_actual, n1);
toc
%Mostrar resultados
hold on
title('Area trapecio(Roja), Area de rectangulo(Azul) y Area de Simpson(Verde)')
plot(area_tra,'r')
plot(area_rec,'b')
plot(Area_simp,'g')
hold off
figure;
hold on
title('Error trapecio(Roja), Error de rectangulo(Azul) y Error de tercios(Verde)')
plot(eaux,'r')
plot(eaux1,'b')
plot(error_simp,'g')
hold off
figure;
hold on
title('Iteraciones trapecio(Roja), Iteraciones rectangulo(Azul) e Iteraciones tercios(Verde)')
plot(arrc,'b')
plot(arrg,'r')
plot(iter_simp,'g')
hold off