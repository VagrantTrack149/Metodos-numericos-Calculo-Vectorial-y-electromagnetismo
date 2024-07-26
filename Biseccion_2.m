clear; close all; clc
syms x
fx=(x.*x+21*x+110);

a=input('Intervalo inferior: ');
b=input('Intervalo superior: ');
fi=subs(fx,a);
fs=subs(fx,b);
while sign(fi)==sign(fs)
    a=a-1; 
    b=b+1;
    fi=subs(fx,a);
    fs=subs(fx,b);
end
%variables auxiliares
E=1; e=0.0001; A=zeros(2,4);
i=1;
V=0;
E_Ap=0;
Error=0;
r=-11;
iter=1;
cont=1;
while E>e
    A(i,1:2)=[a b];
    xm=0.5*(a+b);
    fp=subs(fx,xm);
    if fi*fp<0
        b=xm;
    elseif(fi*fp>0)
        a=xm;
    end
    E=abs(xm-0.5*(a+b));
    A(i,3)=0.5*(a+b);   %Nuevo valor de xm
    A(i,4)=cont;
    cont=cont+1;
    i=i+1;
    V(i)=xm;
    e1=100*abs((r-xm)/r);
    Error1(i)=e1;
    Error(i)=E*100;
    if(i>1)
        E_Ap(i)=100*abs((V(i)-V(i-1))/V(i));
%         A(i,5)=E_Ap(i);
    end
end
x=['La raiz es xm= ' num2str(A(end,3))];
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
while iter<=i
    fprintf('%11.7f \n',E_Ap(iter));
    iter=iter+1;
end
T=array2table(A,'VariableNames',{'a','b','xm','i'})