clc ;
clear all;
x = -100:5:100;
y = x.^2+21*x+110;
subplot(1,2,1);
plot (x,y)
grid on
xr=-100;
xl=100;
tol=0.001;
real=-11;
f_r= xr^2-4;
f_l= xl.^2-4;
paro_aux=1e3;
contador=1;
contador2=1;
temp=0;
error_real=0;
error_real1=0;
error_aprox=0;
if (f_r*f_l) < 0
  xc = (xr+xl)/2;    %calculo para el primer metodo biseccion
  e_p=100*abs((real-xc)/2);
  while (e_p > tol) && (contador <paro_aux )
    temp=e_p;
    error_aprox(contador2)=(error_real-temp)/error_real;
    f_c= xc^2-4;
    if (f_c*f_l)<0
      xr=xc;
    elseif (f_c*f_r)<0
      xl=xc;
      f_l= f_c;
    end
    error_real(contador)=e_p;
    contador = contador + 1;
    contador2= contador2 +1;
  xc = (xr+xl)/2;    %calculo para el primer metodo biseccion
  e_p=100*abs((real-xc)/2);
    end
error_aprox
error_real
 xc
 e_p
end
xr=-1;
xl=-3.5;
f_r= xr^2-4;
f_l= xl.^2-4;
contador=1;
contador2=1;
temp=0;

if (f_r*f_l) < 0
  xc = xr-((f_r * (xl - xr))/(f_l - f_r))  %falsa posicion
  e_p=100*abs((real-xc)/2);
  while (e_p > tol) && (contador <paro_aux )
    temp=e_p;
    error_aprox(contador2)=(error_real1-temp)/error_real1;
    f_c= xc^2-4;
    if (f_c*f_l)<0
      xr=xc;
    elseif (f_c*f_r)<0
      xl=xc;
      f_l= f_c;
    end
    error_real1(contador)=e_p;
    contador = contador + 1;
    contador2= contador2 +1;
  xc = xr-((f_r * (xl - xr))/(f_l - f_r))   % falsa posicion
  e_p=100*abs((real-xc)/2);
 end
error_aprox
error_real1
 xc
 e_p
    end
hold on
plot(xc,f_c,'*')
subplot(1,2,2)
plot(error_real,'*')
grid on
hold on
plot(error_real);
% hold on
% plot(error_aprox,'*')
% plot(error_aprox)
hold on
plot (error_real1,'*')
plot(error_real1)
