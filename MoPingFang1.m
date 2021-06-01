m=input('请输入指数：');
b=input('请输入底数：');
n=input('请输入mod后的数：');
k=1;x=0;a=1;
%求2的最高指数幂
while k<m
    k=2*k;
    x=x+1;c=x;
end
k=k/2;
%存储2的所有指数
while x>=0
    p(1:(x+1))=floor(m/k);
    m=m-p(x+1)*k;
    k=k/2;
    x=x-1;
end
 
for i=c+1:-1:2
  
  a=mod(a^2,n);
    if p(i)==1  
     a=mod((a*b),n);
    end
   
end
disp(a);
