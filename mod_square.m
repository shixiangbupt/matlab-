%�������ģָ������b^m mod n�Ľ��
%���´�����������matlab���Լ��ɽ����޸Ĳ�������ȷ��
%ƽ�����㷨��
%  (1)����m�Ķ�����,m=m(0)+m(1)*2+m(2)*2^2+...+m(k)*2^k(�����Ƴ�Ϊk��mi=0��1),
%  (2)�� i=k b(k)=1,a(k)=b^m(k) mod n; 
%  (3) ��i=i-1,b(i)=a(i+1)^2 mod n,
%      a(i)=b(i)*b^m(i) mod n;
%  (4)��i>0,�򷵻أ�3����
%  (5)�������a(k)��ֵ������b^m mod n=a(k). 
m=input('������ָ����');
b=input('�����������');
n=input('������mod�������');
k=1;x=0;a=1;
%��2�����ָ����
while k<m
    k=2*k;
    x=x+1;c=x;
end
%�洢2������ָ��
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
