% Hallar raices
% Graficada de -20 a 20
% F(X)=X^2+21*X+110.25
% Metodo grafico
E=1*10^-5; %Error que puedo aceptar
e=100; %Error aproximado 
r=-11; %Valor exacto de mi raiz
x= linspace(-20,20,200);
y= (x.^2+21*x+110);
% .*(sin(x^2));
% plot(x,y)
% grid on
% Metodo de la bisección
% -13 Y -1
xl=-13;
xu=-10.3;
c=0;
Error=e;
V=0;
E_Ap=0;
tic
while(E<e)
xr=(xl+xu)/(2);
fxl=xl*xl+21*xl+110;
fxu=xu*xu+21*xu+110;
fxr=xr*xr+21*xr+110;
if (fxl*fxr<0)
    xu=xr;
elseif(fxl*fxr>0)
    xl=xr;
%  elseif(fxl*fxr==0)
end
c=c+1
e=100*abs((r-xr)/r);
Error(c)=e;
V(c)=xr;
    if(c>1)
    E_Ap(c)=100*abs((V(c)-V(c-1))/V(c));
    end
end
toc
plot(Error)
hold on;
plot(Error,'*')
plot(E_Ap)
hold on
plot(E_Ap,'*')
xr
e
tic
roots([1 21 110]) %Ax^2 +bx +c
toc