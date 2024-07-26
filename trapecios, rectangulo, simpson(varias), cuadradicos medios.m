clear all;
close all;

% Definimos la función i y el espacio donde va a existir
t = 0:0.001:1;
i = @(x) (sin(2*pi*x).^2);

% Numero de segmentos
n = input('Numero de segmentos: ');

% Trapeziode xd
tic
h = t(2) - t(1);
I_trap = trapz();
toc
fprintf('Trapecio: %0.30f\n', I_trap);
% Rectangulo
tic
dx=(t(2)-t(1))/n;
I_rect = sum(i(t)*dx);
toc
fprintf('Rectangulo: %0.30f\n', I_rect);
% Simpson 3/8 
tic
h = t(2) - t(1);
I_simpson_3_8 = (3*h/8) * (i(t(1)) + 3*sum(i(t(2:3:n-2))) + 3*sum(i(t(3:3:n-1))) + 2*sum(i(t(4:3:n-3))) + i(t(n)));
toc
fprintf('Simpson 3/8 ⅜: %0.30f\n', I_simpson_3_8);
% Simpson 1/3 
tic
h = t(2) - t(1);
I_simpson_1_3 = (h/3) * (i(t(1)) + 4*sum(i(t(2:2:n-1))) + 2*sum(i(t(3:2:n-2))) + i(t(n)));
toc
fprintf('Simpson 1/3: %0.30f\n', I_simpson_1_3);
% Valor real de la integral
I_actual = integral(i, 0, 1);

% Errores cuadraticos medios xd
MSE_trap = mean((I_trap - I_actual).^2);
MSE_rect = mean((I_rect - I_actual).^2);
MSE_simpson_3_8 = mean((I_simpson_3_8 - I_actual).^2);
MSE_simpson_1_3 = mean((I_simpson_1_3 - I_actual).^2);

% Resultados xd
fprintf('Integral real: %0.30f\n', I_actual);
fprintf('Error de trapecio: %f\n', MSE_trap);
fprintf('Error de rectangulo: %f\n', MSE_rect);
fprintf('Error de Simpson 3/8: %f\n', MSE_simpson_3_8);
fprintf('Error de Simpson 1/3: %f\n', MSE_simpson_1_3);

RMC_rectangulo= sqrt(I_rect*I_rect)
RMC_trapecio= sqrt(I_trap*I_trap)
RMC_simpson_ter= sqrt(I_simpson_1_3*I_simpson_1_3)
RMC_simpson_ter_ocho= sqrt(I_simpson_3_8*I_simpson_3_8)

figure
% plot([1 2 3 4], [MSE_trap MSE_rect MSE_simpson_3_8 MSE_simpson_1_3], '-o')
hold on;
plot([1], [MSE_trap], 'O')
plot([2], [MSE_rect], 'X')
plot([3], [MSE_simpson_3_8], 'O')
plot([4], [MSE_simpson_1_3], 'X')
hold off;
xlabel('Numero de metodo')
ylabel('Error cuadratico medio')
legend('1.-Trapecio', '2.-Rectangulo','3.-Simpson 3/8','4.-Simpson 1/3');
