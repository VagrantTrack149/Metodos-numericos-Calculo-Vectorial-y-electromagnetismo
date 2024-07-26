clear all;
x= -5:0.5:0;
y=x.^2;
plot(x,y)
hold on
xi=1;
esp1=1;
esp2=3.4;
E1=[-0.5,2];
for xi=1:length(x)
    Fx(xi)=2*x(xi);
    Fy(xi)=-1;
%     quiver(x(xi),y(xi),Fx(xi),Fy(xi))
end

for xi=1:length(x)
    M=norm([Fx(xi),Fy(xi)]);
    Fx(xi)=Fx(xi)/M;
    Fy(xi)=Fy(xi)/M;
    En1=[Fx(xi),Fy(xi)]*dot(E1,[Fx(xi),Fy(xi)]);
    Et1=E1-En1;
    Et2=Et1;
    En2=En1*esp1/esp2;
    E2=En2+Et2;
    quiver(x(xi)-norm(E1),y(xi),E1(1),E1(2));
    quiver(x(xi),y(xi),E2(1),E2(2));
end
