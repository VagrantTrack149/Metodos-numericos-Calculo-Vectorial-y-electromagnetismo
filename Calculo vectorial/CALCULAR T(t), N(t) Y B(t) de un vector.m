syms t
fprintf('PROGRAMA PARA CALCULAR T(t), N(t) Y B(t)”\n')
f=input('INTRODUCE EL VALOR DE F(t):')
g=input('INTRODUCE EL VALOR DE G(t):')
h=input('INTRODUCE EL VALOR DE H(t):')
R=[f;g;h;]
T=simplify([diff(f,t);diff(g,t);diff(h,t)]/sqrt(diff(f,t)^2+diff(g,t)^2+diff(h,t)^2))
c=simplify(diff(f,t)/sqrt(diff(f,t)^2+diff(g,t)^2+diff(h,t)^2));
d=simplify(diff(g,t)/sqrt(diff(f,t)^2+diff(g,t)^2+diff(h,t)^2));
e=simplify(diff(h,t)/sqrt(diff(f,t)^2+diff(g,t)^2+diff(h,t)^2));
N=simplify(diff(T,t)/(sqrt(diff(c)^2+diff(d)^2+diff(e)^2)))
B=simplify(cross(T,N))
fprintf('PARA OBSERVAR LA GRÁFICA DE LA ECUACIÓN”\n')
fprintf('TECLEE LOS LÍMITES DE LA GRÁFICA [a,b]”\n')
fprintf('TECLEE EL PUNTO QUE DESEA EVALUAR”\n')
a=input('ESCRIBA EL VALOR DE a:')
b=input('ESCRIBA EL VALOR DE b:')
ezplot3(f,g,h,[a,b])
grid on
hold on
t=input('PUNTO A EVALUAR:')
fprintf('VALOR DE R(t) PARA EL PUNTO EVALUADO”\n')
eval(R)
fprintf('VALOR DE T(t) PARA EL PUNTO EVALUADO”\n')
eval(T)
fprintf('VALOR DE N(t) PARA EL PUNTO EVALUADO”\n')
eval(N)
fprintf('VALOR DE B(t) PARA EL PUNTO EVALUADO”\n')
eval(B)
for x=1:2
m(x)=(x-1)*eval(T(1))+eval(R(1));
n(x)=(x-1)*eval(T(2))+eval(R(2));
o(x)=(x-1)*eval(T(3))+eval(R(3));
plot3(m,n,o,'r')
grid
p(x)=(x-1)*eval(N(1))+eval(R(1));
q(x)=(x-1)*eval(N(2))+eval(R(2));
r(x)=(x-1)*eval(N(3))+eval(R(3));
plot3(p,q,r,'k')
grid
u(x)=(x-1)*eval(B(1))+eval(R(1));
v(x)=(x-1)*eval(B(2))+eval(R(2));
w(x)=(x-1)*eval(B(3))+eval(R(3));
plot3(u,v,w,'g')
grid on
hold on
title('ROJO-VECTOR T(t). NEGRO-VECTOR N(t). VERDE-VECTOR B(t).')
xlabel('eje x')
ylabel('eje y')
zlabel('eje z')
end
