clc;
clear all;
A=[3 2 1
   2 1 1
   -1 -2 3];
R=[4
   -2 
   2];
[FILA,COLA]=size(A);
B=[A];
C=[A];
D=[A];
tic
for i=1: COLA
    B(i,:)=B(i,:)/B(i,i);
    for j=i+1:COLA
        aux=B(j,i)*B(i,:);
        B(j,:)=B(j,:)-aux;
    end
    for n=1: COLA
        if n~=i
        B(n,:)=-B(n,i).*B(i,:)+B(n,:);
        end
    end
    disp(B)
end
toc
tic
R=rref(C)
toc
%tic
%linsolve(D,R)
%toc