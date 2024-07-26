circ=[0;1;0];
r=5;
n=100;
figure;
hold on;
px= -10:10;
py= -10:10;
pz= -10:10;
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
circ1=[1;0;0];
r1=3;
x1=zeros(length(px),length(py),length(pz));
y1=zeros(length(px),length(py),length(pz));
z1=zeros(length(px),length(py),length(pz));
Hx1=zeros(length(px),length(py),length(pz));
Hy1=zeros(length(px),length(py),length(pz));
Hz1=zeros(length(px),length(py),length(pz));
for theta=0: 2*pi/n:2*pi
   xc1=r1*sin(theta);
   yc1=5;
   zc1=r1*cos(theta);
   M1=[cos(theta),0,sin(theta);...
       0,1 ,0; ...
       -sin(theta),0,cos(theta)];
   dl1=M1*circ1*2*pi*r1/n;
   quiver3(xc1,yc1,zc1,dl1(1),dl1(2),dl1(3));
   for xi=1: length(px)
       for yi=1:length(py)
           for zi=1:length(pz)
               R1=[px(xi)-xc1,py(yi)-yc1,pz(zi)-zc1];
               if(norm(R1)>1)
               dH1=cross(dl1,R1)/(4*pi*norm(R1)^3);
               Hx1(xi,yi,zi)=Hx1(xi,yi,zi)+dH1(1);
               Hy1(xi,yi,zi)=Hy1(xi,yi,zi)+dH1(2);
               Hz1(xi,yi,zi)=Hz1(xi,yi,zi)+dH1(3);
               x1(xi,yi,zi)=px(xi);
               y1(xi,yi,zi)=py(yi);
               z1(xi,yi,zi)=pz(zi);
               end
           end
       end
   end
end
%Vista en 3d
hold on;
quiver3(x,y,z,Hx,Hy,Hz)
quiver3(x1,y1,z1,Hx1,Hy1,Hz1)
% c=8;
% Seccion tranversal
% quiver3(x(:,c,:),y(:,c,:),z(:,c,:),Hx(:,c,:),Hy(:,c,:),Hz(:,c,:))
% quiver3(x1(:,c,:),y1(:,c,:),z1(:,c,:),Hx1(:,c,:),Hy1(:,c,:),Hz1(:,c,:))
