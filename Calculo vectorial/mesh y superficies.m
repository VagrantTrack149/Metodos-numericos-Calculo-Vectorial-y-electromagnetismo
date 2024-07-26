clear all
[X,Y] = meshgrid(-6:.2:6,-6:.2:6);
Z=2*X.^3 -3*Y.^2 -50;
subplot(1,2,1),mesh(Z)
[U,V,W] = surfnorm(X,Y,Z);
subplot(1,2,2),quiver3(X,Y,Z,U,V,W,1);