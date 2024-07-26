t = 0:0.001:1; %Espacio donde existe
f = @(x) (sin(2*pi*x)).*(sin(2*pi*x)); %Funcion
% Graficar la función f en el intervalo t
plot(t, f(t));
xlabel('t');
ylabel('f(t)');
title('Gráfico de f(t) = (sin(2*pi*t))^2');
a=0; %Limite inferior
b=1; %Limite superior
n=32; %Segmentos, (Si meti todos y cada uno de los segmentos que dice la tabla uno por uno xd)
h = (b - a) / n; 
%Rectangulo
tic
integral_rect= Rectangulos_met(f, a, b, n)
toc
errorCuadratico_rect = (0.5 - integral_rect)^2
RMC_rect=sqrt(integral_rect)

%Trapecio
tic
integral_trap=trapecio_met(f, a, b, n)
toc
errorCuadratico_trap = (0.5 - integral_trap)^2
RMC_rect=sqrt(integral_trap)
%Simpson 1/3
tic
integral_1_3=simpson_met_3(f, a, b, n)
toc
errorCuadratico_1_3 = (0.5 - integral_1_3)^2
RMC_rect=sqrt(integral_1_3)
%Simpson 3/8
tic
integral_3_8=simpson_met_8(f, a, b, n)
toc
errorCuadratico_3_8 = (0.5 - integral_3_8)^2
RMC_rect=sqrt(integral_3_8)