function [x,f0,flag]=transport_linprog(C,s,d,intkey)
[m,n]=size(C); A=[]; B=[];
for i=1:n, Aeq(i,(i-1)*m+1:i*m)=1; end
for i=1:m, Aeq(n+i,i:m:n*m)=1; end
xm=zeros(1,n*m); f=C(:); Beq=[s(:); d(:)];
if nargin==3 %һ�����Թ滮�����
   [x,f0,flag]=linprog(f,A,B,Aeq,Beq,xm);
else         %�������Թ滮�����
   [x,f0,flag]=intlinprog(f,1:n*m,A,B,Aeq,Beq,xm); x=round(x);
end
x=reshape(x,m,n); %�������͵Ľ⻹ԭ�ɾ����������ʽ
