clear all 
syms x y z l m
f=x*x*x+y*y-z*z
g=x+y*y-z
F=f-l*g
Fx=diff(F,x)
Fy=diff(F,y)
Fz=diff(F,z)
Fl=diff(F,l)
[x,y,z,l]=solve(Fx,Fy,Fz,Fl)
