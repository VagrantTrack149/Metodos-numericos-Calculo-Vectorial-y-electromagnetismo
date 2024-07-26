clear; close all; clc
syms x
fx=(x.*x+21*x+110).*sin(x.^2);
a=input('Intervalo inferior: ');
b=input('Intervalo superior: ');
del=a+0.1;
fi=subs(fx,a);
fs=subs(fx,b);
fdel=subs(fx,del);
while sign(fi)==sign(fdel)
    a=a-1; 
    del=del+1;
    fi=subs(fx,a);
    fdel=subs(fx,del);
end
%variables auxiliares
E=1; e=0.0001;
i=1;
V=0;
E_Ap=0;
Error=0;
r=2.5;
aux=1;
Re=0;
while E>e
        xm=0.5*(a+b);
        fp=subs(fx,xm);
        if fp*fi>0
            b=xm;
        elseif(fp*fi<0)
            a=xm;
        end
        E=abs(xm-0.5*(a+b));
        xm=0.5*(a+b);   %Nuevo valor de xm
        i=i+1;
        V(i)=xm;
        e1=100*abs((r-xm)/r);
        Error1(i)=e1;
        Error(i)=E*100;
        if(i>1)
        E_Ap(i)=100*abs((V(i)-V(i-1))/V(i));
        end
    end
for aux=1: aux>3
    
Re(aux)=xm;
aux=aux+1;
Re(aux)
E=1;
end
x=['La raiz es xm= ' num2str(xm)];
disp(x)
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