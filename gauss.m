clc;
clear all;
A=[3 2 1
   2 1 1
   -1 -2 3];
[FILA,COLA]=size(A);
B=A;
for i=1:COLA
    B(i,:)=B(i,:)/B(i,i)
    for j=i+1:COLA
        aux=B(j,i)*B(i,:);
        B(j,:)=B(j,:)-aux;
    end
end