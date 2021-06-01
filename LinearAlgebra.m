%% ���Դ���ģ��
% ɽ������ѧ��ѧԺ
%shixiangbupt@qq.com
%2016��3��27��
 

%% ����ʽ���� 
% �������ʽ������ $p(x)=5x^4+4x^3-2x+3$ .
clear ,clc,clf
p=[5 4 0 -2 3]
 %�������ʽ��x=2.3����ֵ
 y=polyval(p,2.3)
 %���ڶ�������Ϊ����
 a=1:3;
 b=polyval(p,a)
 

%% ����ʽ���
% �����ʽ $p(x)=x^3-6x^2-72x-27$ ����㡣
clear ,clc,clf
p=[1 -6 -72 -27];

r=roots(p)
%���뷵�ض���ʽ���ʽ
f=poly2sym(p)

%����֪����ʽ�ĸ���������ploy�����õ���Ӧ�Ķ���ʽϵ��
p=poly(r)%ע����ԭ����ʽ�в��
%% ����ʽ������
%�ӷ�
clear ,clc,clf
p1=[6 4 0 -2 4 -3];p2=[3 4 3 -2];%5�κ�3�ζ���ʽ
n1=length(p1);n2=length(p2);
n=max(n1,n2);
p1=[zeros(1,n-n1),p1]%������Ԫ
p2=[zeros(1,n-n2),p2]
p=p1+p2;
f=poly2sym(p);disp(f)

% �˷�
clear ,clc,clf
p1=[1 1 1 ];p2=[1 -2 1];
p=conv(p1,p2);f=poly2sym(p);
disp(f)
%�൱�ڶ�ϵ�����������conveolution���õ�������

%����
clear ,clc,clf
p=[4 5 -3 8];p1=[1 2 1];
[q,r]=deconv(p,p1)%���̺���ʽ
%% �������ĸ�˹�ֽ�
% ���������У��������������֣����ȶԱ�����������˹�ֽ⡣ $f(x)=\frac{x+3}{x^2-5x+6}$
clear
b=[1,3];
a=[1,-5,6];
[r,p,k]=residue(b,a) %p���ɺ����ļ��㹹�ɵ�������r�Ƿֽ�ʽ�з��ӵĸ���ϵ�����ɵ�������k����
%q=roots(a)

b=[1 -4 2 9];
[r,p,k]=residue(b,a)

%���������������1ʱ���ʽҪ����Ӧ�ĵ�����
clear
a=[1 -7 16 -12];
b=[1 1 1];
[r p k]=residue(b,a)%f(x)=13/(x-3)-12/(x-2)-7/(x-2)^2

%�����ַ�ʽ�ϲ���һ�������ʽ
p=[1 2 3];r=[3 2 4];k=[1,-2];
[b,a]=residue(r,p,k)
%% ����
%����
clear
a=-3:2;
a1=norm(a,1);%Ԫ�ؾ���ֵ֮��
a2=norm(a,2);%ŷ����÷���
a3=norm(a,inf);%�������Ԫ�ؾ���ֵ֮���ֵ
disp([a1 a2 a3])

%������
clear
A=[1 2 3;-2 3 4;2 2 1]
a1=norm(A,1);%������1���������
a2=norm(A,2);%$\sqrt{\lambda_{max}(A^T A)}$
a3=norm(A,inf);%������1���������
%% ����������
% ���� ��AΪn�׾���xΪ����һ��nά������������ $\|Ax\|_n\leq \|A\|_n \|x\|_n$ ���� $\|.\|_n$
% ��ʾ�����������n-������ �����ʳ�Ϊ�����������ԡ�

%% ������ 
% �跽���� $$\begin{matrix} 1 & 1\\1& 1.001 \end{matrix}
% \begin{matrix}x_1\\x_2\end{matrix}=\begin{matrix}2\\2\end{matrix}$$
% ,�÷�����Ľ�Ϊ $x=(2,0)^T$ ,�����Ҷ˵ĳ������Ϊ $  2 2.001 $ ,��ʱ���̵Ľ�Ϊ $x=(2,0)^T$
% �Ҷ�΢С�ı仯������������̽�ܴ�仯���跽�� $AX=b$ �Ľ�Ϊ $x'$ ���� $b$ ��΢С���� $\delta b$ ���� �Ľ�ı�Ϊ $\delta
% x'$ �� $A(x'+\delta x')=b+\delta b$ ���������С���� $\|A^{-1}\|*\|A\|$ �йء�

%% ����������
% ��AΪm�׿��淽�󣬳��� $\|A\|_n*\|A^{-1}\|_n$ Ϊ���������������Ϊcond(A),�� $cond(A)=\|A\|_n*\|A^{-1}\|_n$ .һ�����д��������ľ����Ϊ�ǲ�̬�ġ�
clear
A=magic(3);c=cond(A);
l1=max(eig(A'*A));
l2=min(eig(A'*A));
l2=sqrt(l1)/sqrt(l2);
disp([c,l2])
%��2����������£��������������Ϊ�������ֵ����С����ֵ֮�ȡ�

%% �������
%
clear
A=[2 1 8 3 7;2 -3 0 7 -5;3 -2 5 8 0 ;1 0 3 2 0];
r=rank(A);
B=rref(A);%�н����;���
%%  ������Ļ�����ϵ
% null��������Է�����Ļ�����ϵ(����),null(A,'r')��������ʽ��ʾ������Է�����Ļ�����ϵ
clear ,clc
A=[1 -8 10 2;2 4 5 -1;3 8 6 -2];
r=rank(A);
B=null(A)
C=null(A,'r') %�����ڳ�������
% ��֤������
a=sum(B.*B)
b=sum(B(:,1).*B(:,2))
% ������B�е�������Ϊ���������ĵ�λ������

%% ����������Է�����
% $$\left\{ x_1+2x_2+3x_3=2\\ 2x_1-x_2-x_3=1 \\ x_1-2x_2-2x_3=-1 \\ x_1-x_2-x_3=0 \right.$$
clear ,clc
A=[1 2 3 ;2 -1 -1 ;1 -2 -2 ;1 -1 -1];
 b=[2 1 -1 0]';%b=[2 1 -1 -1]'
B=[A,b];
r1=rank(A);r2=rank(B);disp([r1,r2])
a=size(A);
if r1==r2
    if r1==a(2)
        x=A\b;disp(x)
    else
        x0=x\b;
        x=null(A);
        disp([x,x0])
    end
else
  disp('��������޽⣡')
end
%% ��Ԫ����ⷽ����
% ˳����Ԫ��
%function y=gaussxxyf1(A,b)
% a=size(A);n=length(b);x=zeros(1,n);
% if a(1)~=a(2)
%     fprintf('���Է�������������\n')
% elseif a(1)~=n
%     fprint('�����и�����ƥ��\n')
% else 
%     A=[A,b];
%     for i=1:n-1
%         if A(i,i)==0
%             fprint('�Խ���Ԫ�ز���Ϊ��\n')
%             break
%         else
%             for j=i+1:n
%                 A(j,:)=A(j,:)-A(j,i)*A(i,:)/A(i,i); %��Ԫ
%                 %b(j)=b(j)-A(j,i)*b(i)/A(i,i);
%             end
%         end
%     end
%     if A(n,n)==0
%         fprint('�Խ���Ԫ�ز���Ϊ��\n')
%     else 
%         b=A(:,n+1);A(:,n+1)=[];
%         for i=n:-1:1
%            x(i)=(b(i)-sum(A(i,:).*x))/A(i,i);
%         end
%     end
% end
% disp(x)
clear ,clc
 A=[1 1 1 1 ;1 2 -1 4;2 -3 -1 -5;3 1 2 11 ];
 b=[5 -2 -2 0]';
 gaussxxyf1(A,b)
 
 
%% ��˹����Ԫ��
% �����Խ���Ԫ��Ϊ��ʱ��˳����Ԫ���������
% ��ÿ�жԽ���Ԫ����ѡȡ��Ԫ���·���Ԫ�أ�ʹ�·�Ԫ�صľ���ֵ�����ľ���ֵ����Ȼ�������еĽ�����
%function y=gszyxxf(A,b)
%  n=length(b);x=zeros(1,n);
%  A=[A,b];
%  for i=1:n
%      p=i;c=abs(A(i,i)) ;
%      for j=i+1:n
%          if abs(A(j,i))>c
%              p=j;%ѡȡ����Ԫ�����
%          end
%      end
%      if p>i
%          s=A(i,:);A(i,:)=A(p,:);A(p,:)=s;%����
%      else
%          if A(i,i)==0
%              break
%          end
%      end
%  end
%  disp(A),disp('��Ԫ����')
%  pause
%  for i=1:n
%      for j=i+1:n
%          A(j,:)=A(j,:)-A(j,i)*A(i,:)/A(i,i);%��Ԫ
%          disp([A,b])
%          pause
%      end
%  end
%  disp(A),disp('��Ԫ����')
%  pause
%  b=A(:,n+1);A(:,n+1)=[];
%  disp([A,b])
%  for i=n:-1:1
%      x(i)=(b(i)-sum(A(i,:).*x))/A(i,i);%�ش�
%      disp([A,b])
%  end
%  disp(x)
 clear ,clc
 A=[1 3 3;5 4 10;3  -0.1 1];
 b=[1 0 2]';
 gszyxxf(A,b) %��A\b �����ͬ
 
 A1=[3 1 -1 2;-5 1 3 -4;2 0 1 -1;1 -5 3 -3];
 b1=[1 1 1 1]';
 gszyxxf(A1,b1)%A1\b1
%% �����ļнǣ��ڻ������������飬��������
%function y=innpro(a,b)
%  m=length(a);n=length(b);
%  if m~=n
%      fprintf('ʸ�����볤����ͬ��\n')
%  else
%      s=sum(a.*b);
%      disp(s)
%  end
 clear ,clc
 a=[1 2 3]; 
 b=[2 4 6];
 innpro(a,b)%a=[1 2 3],b=[2 4 6 8],innpro(a,b)
 %% �����ļн�
 % $\cos<\alpha,\beta>=\frac{<\alpha,\beta>}{\|\alpha\|\|\beta\|}$
 a=[2 1 4 2];
 b=[1 -3 2 -4];
 theta=acos(sum(a.*b)/norm(a)/norm(b))%��λΪ����
 
 %% ʩ����������
%function y=schimidt(A)
%  %AΪn*m��������A���������������޹ص�
%  %�����A�����������Ӧ������������
%  %a=size(A);
%  B=A(:,1);
%  for i=2:a(2);
%      c=A(:,i);e=c;
%      for k=1:i-1
%          d=A(:,k);l=sum(c.*d)/sum(d.*d);
%          e=e-l*d;
%      end
%      B=[B,e];
%  end
%  disp(B)
clear ,clc
 A=[1 1 -1;0 -1 1;-1 0 1; 1 1 0];
 format rat
 schimidt(A)
 %matlab�ṩ�����õ�orth()�������õ���׼���������飬��������������Ϊ��λ������
 B=orth(A)
 B'*B
 %% �жϾ����������
 % ��AΪn��ʵ�Գƾ�����������ķ���������x������ $f(x)=x^TAx>0$ �����A����������
%  %function y=dist(A)
%  clc,a=size(A);p=[];pl=[];
%  if a(1)==a(2);
%      if A==A'
%          for k=1:a(1)
%              B=A(1:k,1:k);d=det(B);
%              p=[p,d];pl=[pl,(-1)^k*d];
%          end
%          if p>0
%              disp('A��������')
%          elseif pl>0
%              disp('A�Ǹ�����')
%           elseif p >=0
%              disp('A�ǰ�������') 
%           elseif pl>=0
%              disp('A�ǰ븺����')
%          else
%              disp('A�ǲ�����')
%          end
%      else
%          disp('A���ǶԳ���')
%      end
%  else
%       disp('A���Ƿ���')
%  end
         
 clc ,clear
 A=[1 1 1 1;1 1 -1 -1;1 -1 1 -1;1 -1 -1 1];
 dist(A);
 A1=[2 2 -2;2 5 -4;-2 -4 5];
 dist(A1)
 %% ���������ֽ�
 clear
 A=[2 2 -2;2 5 -4;-2 -4 5];
 format short
 [V D]=eig(A) %VΪ������DΪ�Խ���V^{-1}AV=D
 %%
 
 
 
 
 
     






 
