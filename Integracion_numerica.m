% Resolver la integral definida de 0 a 2 de x*x
n=10;  %Numero de rectagulos
a=0;  %limite inferior
b=2;   %Limite superior
h=(b-a)/n;  %Tamaño de paso
Area=0;
x1=a;
for i=1: n
    Area=Area + ((x1)^2)*h;
    x1=x1+h;
end
Area
x=linspace(0,2,10);
y=x.^2;
plot(x,y);
figure;
