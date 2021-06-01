%本题计算模指数运算b^m mod n的结果
%以下代码有误，请用matlab调试技巧进行修改并测试正确性
%平方乘算法：
%  (1)计算m的二进制,m=m(0)+m(1)*2+m(2)*2^2+...+m(k)*2^k(二进制长为k，mi=0或1),
%  (2)令 i=k b(k)=1,a(k)=b^m(k) mod n; 
%  (3) 令i=i-1,b(i)=a(i+1)^2 mod n,
%      a(i)=b(i)*b^m(i) mod n;
%  (4)若i>0,则返回（3）。
%  (5)否则输出a(k)的值，则有b^m mod n=a(k). 
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
while x>=0
    p(1:(x+1))=floor(m/k);
    m=m-k;
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
