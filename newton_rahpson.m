%Limpiamos la pantalla y mostramos el nombre del método
clear
clc
disp('Método de Newton Raphson')
%Damos de alta la variable simbólica X
syms x
%Introducimos la función,el punto de inicio,así como
%porcentaje de error
f=input('Introduzca la función f(x):');
pi=input('Introduzca el punto de inicio:');
err=input('Porcentaje de error:');
%Graficamos la función
ezplot(f)
grid on
%Calculamos la derivada de la función
d=diff(f);
d=inline(d);
f=inline(f);
ea=100;
j=0;
E_a=0;
xr=0;
fprintf('It.       Xr        Error aprox \n');
while ea>err
    %Aproximamos la raiz con la fórmula correpondiente
    xi=pi-(f(pi)/d(pi));
    %Calculamos el porcentaje de error
    ea=abs(((xi-pi)/xi)*100);
    pi=xi;
    E_a(j+1)=ea;
    xr(j+1)=xi;
    fprintf('%2d \t %3.5f \t %3.5f \t \n',j+1,xr(j+1),E_a(j+1));
    j=j+1;
end
%Mostramos los resultados en pantalla (con 3 decimales)
fprintf('\nRaiz= %10.3f en %d Iteraciones',pi,j)