function x=gauss_eq(A,B)
n=length(A);
for k=1:n
        i=k+1:n;
        j=k+1:n; 
        d=A(i,k)/A(k,k);
   if  length(d)>0 
      A(i,j)=A(i,j)-d*A(k,j); B(i,:)=B(i,:)-d*B(k,:); A(i,k)=0;
   end
end
x(n,:)=B(n,:)/A(n,n);
for k=n-1:-1:1
    x(k,:)=(B(k,:)-A(k,k+1:n)*x(k+1:n,:))/A(k,k);
end
end