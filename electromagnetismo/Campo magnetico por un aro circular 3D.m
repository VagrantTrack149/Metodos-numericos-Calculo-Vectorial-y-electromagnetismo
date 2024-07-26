circ=[0;1;0];
r=5;
n=100;
figure;
hold on;
px= -5:5;
py= -5:5;
pz= -5:5;
x=zeros(length(px),length(py),length(pz));
y=zeros(length(px),length(py),length(pz));
z=zeros(length(px),length(py),length(pz));
Hx=zeros(length(px),length(py),length(pz));
Hy=zeros(length(px),length(py),length(pz));
Hz=zeros(length(px),length(py),length(pz));
for theta=0: 2*pi/n:2*pi
   xc=r*cos(theta);
   yc=r*sin(theta);
   zc=0;
   M=[cos(theta),-sin(theta),0;...
       sin(theta), cos(theta),0; ...
       0,0,1];
   dl=M*circ*2*pi*r/n;
   quiver3(xc,yc,zc,dl(1),dl(2),dl(3));
   for xi=1: length(px)
       for yi=1:length(py)
           for zi=1:length(pz)
               R=[px(xi)-xc,py(yi)-yc,pz(zi)-zc];
               if(norm(R)>1)
               dH=cross(dl,R)/(4*pi*norm(R)^3);
               Hx(xi,yi,zi)=Hx(xi,yi,zi)+dH(1);
               Hy(xi,yi,zi)=Hy(xi,yi,zi)+dH(2);
               Hz(xi,yi,zi)=Hz(xi,yi,zi)+dH(3);
               x(xi,yi,zi)=px(xi);
               y(xi,yi,zi)=py(yi);
               z(xi,yi,zi)=pz(zi);
               end
           end
       end
   end
end
%Vista en 3d
quiver3(x,y,z,Hx,Hy,Hz)
%c=8;
% Seccion tranversal
%quiver3(x(:,c,:),y(:,c,:),z(:,c,:),Hx(:,c,:),Hy(:,c,:),Hz(:,c,:))
