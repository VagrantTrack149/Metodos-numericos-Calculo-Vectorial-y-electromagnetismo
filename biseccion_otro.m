clear; close all; clc
syms x
fx=(x.*x+21*x+110);
a=input('Intervalo inferior: ');
b=input('Intervalo superior: ');
fi=subs(fx,a);
fs=subs(fx,b);
d=a+0.01;
fdel=subs(fx,d);
%variables auxiliares
E=0.01; e=100;
i=1;
c=0;
V=0;
E_Ap=0;
% r=-11;
Error=0;
root=0;
xr=(a+d)/2;
tic
while d<=b
    fi=subs(fx,a);
    fs=subs(fx,b);
    d=a+0.1;
    fdel=subs(fx,d);
    if fdel*fi>0
            d=a+0.01;
        elseif(fdel*fi<0)
              while(E<e)
                xr=(a+d)/(2);
                fi=subs(fx,a);     
                fdel=subs(fx,d);
                if (fi*fdel>0)
                a=xr;
                end
                c=c+1
                e=abs(xr-0.5*(a+b));
                Error(c)=e;
                V(c)=xr;
                if(c>1)
                E_Ap(c)=100*abs((V(c)-V(c-1))/V(c));
                V(c)
                end
              end
            end
RT=['La raiz es xr= ' num2str(xr)];
disp(RT)
root(i)=xr;
e=100;
E=0.01;
i=i+1;
end
toc
fplot(fx,[-100,100],'LineWidth',2)
xlabel('x'); ylabel('y')
title('Metodo de Biseccion');
grid on
figure
plot(Error1)
hold on;
plot(Error1,'*')
plot(Error)
hold on;
plot(Error,'*')
plot(E_Ap)
hold on
plot(E_Ap,'*')
grid on
