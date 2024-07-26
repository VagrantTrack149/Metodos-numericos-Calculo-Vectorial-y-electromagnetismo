clear; clc; close all;
clear; syms x;
xai=input('Ingrese limite inferior: ');
xbi=input('Ingrese limite superior: ');
tol=input('Ingrese el porcentaje de Error: ');
f=(x.*x+21*x+110);
f1=eval(subs(f,xai));
f2=eval(subs(f,xbi));
i=1;
ea(1)=100;
fplot(f,[-100,100],'LineWidth',2)
xlabel('x'); ylabel('y')
if f1*f2 < 0
    xa(1)=xai;f1=subs(f,xa(1));
    xb(1)=xbi;f2=subs(f,xb(1));
    xr(1)=xa(1)-f1*(xb(1)-xa(1))/(f2-f1); f3=subs(f,xr(1));
    fprintf('It.       Xa           Xr        Xb            Error aprox \n');
    fprintf('%2d \t %11.7f \t %11.7f \t %11.7f \n',i,xa(i),xr(i),xb(i));
    while abs(ea(i))>=tol,
      if f1*f3 < 0
         xa(i+1)=xa(i);f1=subs(f,xa(i+1));
         xb(i+1)=xr(i);f2=subs(f,xb(i+1));
      end
      if f1*f3> 0
         xa(1)=xr(i);
         xb(1)=xb(i);
      end
      xr(i+1)=xa(i+1)-f1*(xb(i+1)-xa(i+1))/(f2-f1);
      ea(i+1)=abs((xr(i+1)-xr(i))/(xr(i+1)))*100;
      fprintf('%2d \t %11.7f \t %11.7f \t %11.7f \t %7.3f \n',...
              i+1,xa(i+1),xr(i+1),xb(i+1),ea(i+1));
      i=i+1;
      
   end
else
   fprintf('No existe una raíz en ese intervalo');
end
plot(ea)
hold on
plot(ea,'*')