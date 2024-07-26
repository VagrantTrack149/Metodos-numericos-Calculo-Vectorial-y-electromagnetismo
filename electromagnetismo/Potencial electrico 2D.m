Q=[1,-1,2,3];
qx=[1.5,-1.5,0,0];
qy=[1.5,1.5,0,-2];
[X,Y]=meshgrid(-6:0.5:6);
ep0=(8.85e-12);
s=size(X);
V=zeros(s);
for qi=1:length(Q)
for yi=1:s(1)
    for xi=1:s(2)
        V(yi,xi)=((Q(qi))/(4*pi*ep0)*1/sqrt((X(yi,xi)-qx(qi)).^2+(Y(yi,xi)-qy(qi)).^2));
    end
end
end

Q=[1,-1,2,3];
qx=[1.5,-1.5,0,0];
qy=[1.5,1.5,0,-2];
for qi=1:length(Q)
for yi=1:s(1)
    for xi=1:s(2)
        V(yi,xi)=V(yi,xi)+((Q(qi))/(4*pi*ep0)*1/sqrt((X(yi,xi)-qx(qi)).^2+(Y(yi,xi)-qy(qi)).^2));
    end
end
end
levels=[8.4959e+10];
for i=1:80
    levels=[(100-5*i)/100*8.4959e+10,levels];
end
contourf(X,Y,V,'LevelList',levels)
figure
surf(V)