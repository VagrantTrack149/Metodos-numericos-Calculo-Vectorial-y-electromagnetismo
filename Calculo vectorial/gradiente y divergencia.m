syms x y z;
%Función
Fu=(x.^2*(y^2))/(z^2)
G=gradient(Fu)
%Campo Vectorial
CVx=(z^3 +x)
CVy=(x+y)
CVz=(y+z^2)
CV=[(z^3 +x),(x+y),(y+z^2)]
%Rotación
Rotx=diff(CVz,y)-diff(CVy,z)
Roty=diff(CVz,x)-diff(CVx,z)
Rotz=diff(CVy,x)-diff(CVx,y)
%Divergencia
Div=divergence(CV,[x, y, z])
%Curl
curl=curl(CV,[x y z])