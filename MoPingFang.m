m=input('请输入指数：');
b=input('请输入底数：');
n=input('请输入mod后的数：');
k=1;x=0;a=1;
%求2的最高指数幂
while k<m
    k=2*k;
    x=x+1;c=x;
     
end
%存储2的所有指数
k=k/2;
while x>0
     
     p(1,x+1)=floor(m/k);
     
    m=m-p(1,x)*k;
    k=k/2;
    x=x-1;
end
for i=c:-1:1
  if p(i)==1
   a=mod((a*b),n);
  end
  b=mod(b^2,n);
end
disp(a);
