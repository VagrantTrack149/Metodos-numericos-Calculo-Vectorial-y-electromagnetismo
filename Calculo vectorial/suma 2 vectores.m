fprintf('Este programa suma 2 vectores y muestra su representación grafica\n');
fprintf('Introduce el vector A<x,y,z>\n');
syms x y z x1 y1 u v w
x=input('Introduce x\n');
y=input('Introduce y\n');
z=input('Introduce z\n');
quiver3(0,0,0,x,y,z)
hold
fprintf('Introduce el vector B<x,y,z>\n');
xx=input('Introduce x\n');
yy=input('Introduce y\n');
zz=input('Introduce z\n');
quiver3(0,0,0,xx,yy,zz)
figure
quiver3(0,0,0,x,y,z)
hold
quiver3(x,y,z,xx,yy,zz)
u=x+xx;
v=y+yy;
w=z+zz;
quiver3(0,0,0,u,v,w);

