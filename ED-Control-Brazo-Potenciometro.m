t= 1:100;
V=0;
error=0;
r=60; %referencia
kp=0.1;
gama=0.1;
eri=0;
ki=0.01;
kd=0.1;
errd=0;
for i=2:length(t)
    error(i)=r-V(i-1);
    eri=eri+error(i);
    u=kp*error(i-1)+ki*eri+kd*errd; %control
    V(i)=V(i-1)+u-gama*V(i-1);
    errn=r-V(i);
    errd=errn-error(i-1);
end
subplot(2,1,1)
title("Velocidad")
plot(t,V)
subplot(2,1,2)
title("Error")
plot(t,error)