function x = Gauss2(A,b,flag  )
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明
if nargin<3
    flag=0;
end
n=length(b);
A=[A,b];
for k=1:n-1 %选主元
    [Ap,p]=max(abs(A(k:n,k)));
    p=p+k-1;
    if p>k
        t=A(k,:);A(k,:)=A(p,:);A(p,:)=t;
    end
    A((k+1):n,(k+1):(n+1))=A((k+1):n,(k+1):(n+1))-A((k+1):n,k)/A(k,k)*A(k,(k+1):(n+1));
    A((k+1):n,k)=zeros(n-k,1);
    if flag==0
        A
    end
end

x=zeros(n,1) %回代
x(n)=A(n,n+1)/A(n,n);
for k=n-1:-1:1
    x(k,:)=(A(k,n+1)-A(k,(k+1):n)*x((k+1):n))/A(k,k);
end


end

