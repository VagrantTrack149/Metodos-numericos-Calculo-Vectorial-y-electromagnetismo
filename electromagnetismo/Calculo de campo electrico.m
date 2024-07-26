Q=[1, -1, 0.5 , -2];
Qx=[-2.5, 2.5,-2.5,2.5];
Qy=[-2.5,-2.5,2.5,2.5];
Qz=[0.5,0.5,0.5,0.5];
[X,Y,Z]=meshgrid(-5:5);
ep0=(8.85e-12);
% E=zeros(1,3);
s=size(X);
Ex=zeros(s);
Ey=zeros(s);
Ez=zeros(s);
for xi=1:s(1)
    for yi=1:s(2)
        for zi=1:s(3)
            E=zeros(1,3);
            for qi=1: length(Q)
            R=([X(xi,yi,zi), Y(xi,yi,zi), Z(xi,yi,zi)]-[Qx(qi),Qy(qi),Qz(qi)])
            E=E+Q(qi)/(4*pi*ep0)*(R/norm(R)^3);
            end
        Ex(xi,yi,zi)=E(1);
        Ey(xi,yi,zi)=E(2);
        Ez(xi,yi,zi)=E(3);
        end
    end
end
quiver3(X,Y,Z,Ex,Ey,Ez)
% X2d=X(:,:,6);
% Y2d=Y(:,:,6);
% Z2d=Z(:,:,6);
% Ex2d=Ex(:,:,6);
% Ey2d=Ey(:,:,6);
% Ez2d=Ez(:,:,6);
% quiver(X2d,Y2d,Ex2d,Ey2d)