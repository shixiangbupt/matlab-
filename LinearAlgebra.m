%% 线性代数模型
% 山东理工大学理学院
%shixiangbupt@qq.com
%2016年3月27日
 

%% 多项式运算 
% 定义多项式：定义 $p(x)=5x^4+4x^3-2x+3$ .
clear ,clc,clf
p=[5 4 0 -2 3]
 %计算多项式在x=2.3处的值
 y=polyval(p,2.3)
 %若第二个参数为向量
 a=1:3;
 b=polyval(p,a)
 

%% 多项式求根
% 求多项式 $p(x)=x^3-6x^2-72x-27$ 的零点。
clear ,clc,clf
p=[1 -6 -72 -27];

r=roots(p)
%若想返回多项式表达式
f=poly2sym(p)

%若已知多项式的根，可以用ploy函数得到相应的多项式系数
p=poly(r)%注意与原多项式有差别
%% 多项式的运算
%加法
clear ,clc,clf
p1=[6 4 0 -2 4 -3];p2=[3 4 3 -2];%5次和3次多项式
n1=length(p1);n2=length(p2);
n=max(n1,n2);
p1=[zeros(1,n-n1),p1]%增加零元
p2=[zeros(1,n-n2),p2]
p=p1+p2;
f=poly2sym(p);disp(f)

% 乘法
clear ,clc,clf
p1=[1 1 1 ];p2=[1 -2 1];
p=conv(p1,p2);f=poly2sym(p);
disp(f)
%相当于对系数向量作卷积conveolution所得的向量。

%除法
clear ,clc,clf
p=[4 5 -3 8];p1=[1 2 1];
[q,r]=deconv(p,p1)%得商和余式
%% 有理函数的高斯分解
% 不定积分中，对有理函数做积分，需先对被积函数做高斯分解。 $f(x)=\frac{x+3}{x^2-5x+6}$
clear
b=[1,3];
a=[1,-5,6];
[r,p,k]=residue(b,a) %p是由函数的极点构成的向量，r是分解式中分子的各个系数构成的向量，k是商
%q=roots(a)

b=[1 -4 2 9];
[r,p,k]=residue(b,a)

%当极点的重数大于1时表达式要做相应的调整。
clear
a=[1 -7 16 -12];
b=[1 1 1];
[r p k]=residue(b,a)%f(x)=13/(x-3)-12/(x-2)-7/(x-2)^2

%将部分分式合并成一个有理分式
p=[1 2 3];r=[3 2 4];k=[1,-2];
[b,a]=residue(r,p,k)
%% 矩阵
%范数
clear
a=-3:2;
a1=norm(a,1);%元素绝对值之和
a2=norm(a,2);%欧几里得范数
a3=norm(a,inf);%无穷范数，元素绝对值之最大值
disp([a1 a2 a3])

%矩阵范数
clear
A=[1 2 3;-2 3 4;2 2 1]
a1=norm(A,1);%列向量1范数最大者
a2=norm(A,2);%$\sqrt{\lambda_{max}(A^T A)}$
a3=norm(A,inf);%行向量1范数最大者
%% 范数相容性
% 定理： 设A为n阶矩阵，x为任意一个n维列向量，则有 $\|Ax\|_n\leq \|A\|_n \|x\|_n$ 这里 $\|.\|_n$
% 表示矩阵或向量的n-范数。 该性质称为范数的相容性。

%% 条件数 
% 设方程组 $$\begin{matrix} 1 & 1\\1& 1.001 \end{matrix}
% \begin{matrix}x_1\\x_2\end{matrix}=\begin{matrix}2\\2\end{matrix}$$
% ,该方程组的解为 $x=(2,0)^T$ ,若将右端的常数项改为 $  2 2.001 $ ,此时方程的解为 $x=(2,0)^T$
% 右端微小的变化引起了这个方程解很大变化。设方程 $AX=b$ 的解为 $x'$ ，由 $b$ 的微小增量 $\delta b$ 引起 的解改变为 $\delta
% x'$ 即 $A(x'+\delta x')=b+\delta b$ 解的增量大小与数 $\|A^{-1}\|*\|A\|$ 有关。

%% 矩阵条件数
% 设A为m阶可逆方阵，称数 $\|A\|_n*\|A^{-1}\|_n$ 为矩阵的条件数，记为cond(A),即 $cond(A)=\|A\|_n*\|A^{-1}\|_n$ .一个具有大条件数的矩阵称为是病态的。
clear
A=magic(3);c=cond(A);
l1=max(eig(A'*A));
l2=min(eig(A'*A));
l2=sqrt(l1)/sqrt(l2);
disp([c,l2])
%在2范数的情况下，矩阵的条件数即为最大奇异值与最小奇异值之比。

%% 矩阵的秩
%
clear
A=[2 1 8 3 7;2 -3 0 7 -5;3 -2 5 8 0 ;1 0 3 2 0];
r=rank(A);
B=rref(A);%行阶梯型矩阵
%%  方程组的基础解系
% null求齐次线性方程组的基础解系(正交),null(A,'r')以有理形式表示齐次线性方程组的基础解系
clear ,clc
A=[1 -8 10 2;2 4 5 -1;3 8 6 -2];
r=rank(A);
B=null(A)
C=null(A,'r') %类似于常规做法
% 验证正交性
a=sum(B.*B)
b=sum(B(:,1).*B(:,2))
% 即矩阵B中的列向量为两两正交的单位向量。

%% 求解非齐次线性方程组
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
  disp('这个方程无解！')
end
%% 消元法求解方程组
% 顺序消元法
%function y=gaussxxyf1(A,b)
% a=size(A);n=length(b);x=zeros(1,n);
% if a(1)~=a(2)
%     fprintf('线性方程组的增广矩阵\n')
% elseif a(1)~=n
%     fprint('常数列个数不匹配\n')
% else 
%     A=[A,b];
%     for i=1:n-1
%         if A(i,i)==0
%             fprint('对角线元素不能为零\n')
%             break
%         else
%             for j=i+1:n
%                 A(j,:)=A(j,:)-A(j,i)*A(i,:)/A(i,i); %消元
%                 %b(j)=b(j)-A(j,i)*b(i)/A(i,i);
%             end
%         end
%     end
%     if A(n,n)==0
%         fprint('对角线元素不能为零\n')
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
 
 
%% 高斯主消元法
% 当主对角线元素为零时，顺序消元法不再求解
% 在每列对角线元素上选取该元素下方的元素，使下方元素的绝对值比它的绝对值更大，然后做整行的交换。
%function y=gszyxxf(A,b)
%  n=length(b);x=zeros(1,n);
%  A=[A,b];
%  for i=1:n
%      p=i;c=abs(A(i,i)) ;
%      for j=i+1:n
%          if abs(A(j,i))>c
%              p=j;%选取列主元最大者
%          end
%      end
%      if p>i
%          s=A(i,:);A(i,:)=A(p,:);A(p,:)=s;%交换
%      else
%          if A(i,i)==0
%              break
%          end
%      end
%  end
%  disp(A),disp('换元结束')
%  pause
%  for i=1:n
%      for j=i+1:n
%          A(j,:)=A(j,:)-A(j,i)*A(i,:)/A(i,i);%消元
%          disp([A,b])
%          pause
%      end
%  end
%  disp(A),disp('消元结束')
%  pause
%  b=A(:,n+1);A(:,n+1)=[];
%  disp([A,b])
%  for i=n:-1:1
%      x(i)=(b(i)-sum(A(i,:).*x))/A(i,i);%回代
%      disp([A,b])
%  end
%  disp(x)
 clear ,clc
 A=[1 3 3;5 4 10;3  -0.1 1];
 b=[1 0 2]';
 gszyxxf(A,b) %与A\b 结果相同
 
 A1=[3 1 -1 2;-5 1 3 -4;2 0 1 -1;1 -5 3 -3];
 b1=[1 1 1 1]';
 gszyxxf(A1,b1)%A1\b1
%% 向量的夹角，内积，正交向量组，正定矩阵
%function y=innpro(a,b)
%  m=length(a);n=length(b);
%  if m~=n
%      fprintf('矢量必须长度相同！\n')
%  else
%      s=sum(a.*b);
%      disp(s)
%  end
 clear ,clc
 a=[1 2 3]; 
 b=[2 4 6];
 innpro(a,b)%a=[1 2 3],b=[2 4 6 8],innpro(a,b)
 %% 向量的夹角
 % $\cos<\alpha,\beta>=\frac{<\alpha,\beta>}{\|\alpha\|\|\beta\|}$
 a=[2 1 4 2];
 b=[1 -3 2 -4];
 theta=acos(sum(a.*b)/norm(a)/norm(b))%单位为弧度
 
 %% 施密特正交化
%function y=schimidt(A)
%  %A为n*m矩阵，其中A的列向量是线性无关的
%  %程序对A的列向量求对应的正交向量组
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
 %matlab提供了内置的orth()函数，得到标准正交向量组，不仅正交，而且为单位向量。
 B=orth(A)
 B'*B
 %% 判断矩阵的正定性
 % 设A为n阶实对称矩阵，若对任意的非零列向量x，总有 $f(x)=x^TAx>0$ ，则称A是正定矩阵。
%  %function y=dist(A)
%  clc,a=size(A);p=[];pl=[];
%  if a(1)==a(2);
%      if A==A'
%          for k=1:a(1)
%              B=A(1:k,1:k);d=det(B);
%              p=[p,d];pl=[pl,(-1)^k*d];
%          end
%          if p>0
%              disp('A是正定阵')
%          elseif pl>0
%              disp('A是负定阵')
%           elseif p >=0
%              disp('A是半正定阵') 
%           elseif pl>=0
%              disp('A是半负定阵')
%          else
%              disp('A是不定阵')
%          end
%      else
%          disp('A不是对称阵')
%      end
%  else
%       disp('A不是方阵')
%  end
         
 clc ,clear
 A=[1 1 1 1;1 1 -1 -1;1 -1 1 -1;1 -1 -1 1];
 dist(A);
 A1=[2 2 -2;2 5 -4;-2 -4 5];
 dist(A1)
 %% 矩阵正交分解
 clear
 A=[2 2 -2;2 5 -4;-2 -4 5];
 format short
 [V D]=eig(A) %V为正交阵，D为对角阵，V^{-1}AV=D
 %%
 
 
 
 
 
     






 
