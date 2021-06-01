function [x,f0,flag]=transport_linprog(C,s,d,intkey)
[m,n]=size(C); A=[]; B=[];
for i=1:n, Aeq(i,(i-1)*m+1:i*m)=1; end
for i=1:m, Aeq(n+i,i:m:n*m)=1; end
xm=zeros(1,n*m); f=C(:); Beq=[s(:); d(:)];
if nargin==3 %一般线性规划的求解
   [x,f0,flag]=linprog(f,A,B,Aeq,Beq,xm);
else         %整数线性规划的求解
   [x,f0,flag]=intlinprog(f,1:n*m,A,B,Aeq,Beq,xm); x=round(x);
end
x=reshape(x,m,n); %将向量型的解还原成矩阵所需的形式
