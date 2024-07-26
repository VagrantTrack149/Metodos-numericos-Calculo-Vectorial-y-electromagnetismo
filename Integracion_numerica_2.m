% Resolver la integral definida de 0 a 2 de x*x
n=1;  %Numero de rectagulos
a=0;  %limite inferior
b=2;   %Limite superior
h=(b-a)/n;  %Tamaño de paso
Area=0;
for i=1: n
    Area=Area + ((a)^2)*h;
end
Area