%% ����ʽ������ʽ����
% ������ 20200424


%% ����ʽ�Ĵ���
% Description of first code block
syms r;
r=poly2sym([1 3 2])

syms r;
r=poly2sym([1 2 3 4 5],'y')

%
% poly2str

% y = 5*x^3 + 2*x + 3

p = [5 0 2 3];

ps = poly2str(p,'x')
%% ����ʽ���ӷֽ�
% Description of second code block
syms x y
y=x^4-4;
y=factor(y)

syms x  y  a  b  
y=3*a*x+4*b*y+4*a*y+3*b*x;
y=factor(y)

%% �˻�չ���ɶ���ʽ

syms x
expand((x+2)^5)

%% ������㣩���
% 
% 
% �ڶ���ʽ����ʱ������Ҫ��������ʹ��rootsָ�

% roots

% y = 5*x^4 + 4*x^2 + 2*x + 4

p = [5 0 4 2 4];

r = roots(p)

clear all
p=[1 -1 -1];
r=roots(p)
% ���ݸ��ؽ�����ʽ
p=poly(r)
y=poly2sym(p)

%% ����ʽ���

% ��ʱ����Ҫ���ж���ʽ֮����������� p = p1 / p2 ������p1,p2Ϊ��������ʽ�����Խ�����deconv����ʵ�֡�

% roots

% y1 = 3*x^4 + 4*x^2 + 2*x + 6

% y2 = 5*x^2 + x + 3

p1 = [3 0 4 2 6];

p2 = [5 1 3];

[p,r] = deconv(p1,p2)

% ���У�p���������̣���rΪ������

%% ����ʽ����

C1=[1 0 1];C2=[1 -1];
C=conv(C1,C2)

C=[1 -3 1 ];D=[2 0 4 -5 6];
[q,r]=deconv(D,C)


%% ����ʽ�滻
a=1;b=2;
y='a*x+b';  
subs(y)          %�滻ϵ��
subs(y,'x','v')  %�滻���ű��ʽ�еı���

% 
syms x s
f=x^3+2*x^2+108*x+280

f=subs(f,x,(s+1)/(s-1))

%% ���ż�
syms x s
simplify(sin(x)^2+cos(x)^2)

simplify(cos(x/2)^2-sin(x/2)^2)

%% ͨ��

syms x y
[n,d]=numden(x/y+y/x)

%% ������
syms x;
f1=2*x+1;
finverse(f1)

syms x a 
f=3*x^(1/3)+a;
finverse(f)

%% ���ű��ʽ�ķ�������
syms x y z;
f=1/(1+x^2);g=cos(y);
a=compose(f,g,z)

%
clear all
syms x y t 
f=1/(x^2+1);g=sin(y);h=x^t;
a=compose(f,g)
b=compose(f,g,t)
pretty(b)

%% ����ֵ���ʽת��Ϊ���ű��ʽ

p=sym('(2+sqrt(5))')
pretty(p)
c=[1. -12 44 -48 0]
y=ploy2sym(c)

%%  ��ʵϵ������

syms x
solve('a*x^2+b*x+c=0')

solve('7*x^2-300*x+800=0')

solve('(x/(x+1))^2-5*(x/(x+1))+6=0')

solve(' x^2- x-1=0')




%% ���η���
syms x
solve('x^3-6*x+4=0')

solve('x^3-3*x+2=0')

solve('x^3-4*x^2+6*x-4=0')

% $40x^3-2482x^2+613x+309=0$ 
%
%%  �Ĵη���
syms x
p=solve('x^4+2*x^3-12*x^2-10*x-3=0')

% ��ֵ��
eval(p)

% ��ϰ���� $x^4-18x^3+357x^2-196x+240=0$ 

%% �о��Կ���--����ʽ���̵����
% ����ʽA(S),B(S)���ʣ�d=gcd(A,B)����������϶���ʽ����
syms s
A=2*s^4+16*s^3+36*s^2+32*s+10;
B=s^5+12*s^4+55*s^3+120*s^2+124*s+48;
d=gcd(A,B)
expand(simplify(A/d))
expand(simplify(B/d))
% Լȥ������d=s+1��
% $A1(s)=2s^3+14s^2+22s+10$ , $B1(s)=s^4+11s^3+44s^2+76s+48$
% Diophantine����ʽ���̣��������̣�
% $A(s)X(s)+B(s)Y(s)=C(s)$
% $A(s)=a_1s^n+a_2s^{n-1}+\cdots+a_n s+a_{n+1}$
% $B(s)=b_1s^m+b_2s^{m-1}+\cdots+b_m s+b_{m+1}$
% $C(s)=c_1s^k+c_2s^{k-1}+\cdots+c_k s+c_{k+1}$
% ��δ֪����ʽ$X(s),Y(s)$�״�Ϊ$m-1,n-1$
% �� $X(s)=x_1s^{m-1}+x_2s^{m-2}+\cdots+x_{m-1} s+x_{m}$
%  $Y(s)=y_1s^{n-1}+y_2s^{n-2}+\cdots+y_{n-1} s+y_{n}$
% ��A(s),B(s)���ʣ��򷽳̿���д�ɾ�����ʽ��
% ϵ��������Sylvester�����ת��
% [a_1,0,...,0,b_1,0,...,0; a_2,a_1,...,0,b_2,b_1,...,0;
% a_3,a_2,...,0,b_3,b_2,...,0;...,...,...,a_1,...,...,...,b_1;
% a_{n+1},a_n,...,a_2,...,...,...,b_2;0,a_{n+1},...,a_3,...,...,...,b_3;...,...,...,...;0,0,...,a_{n+1},0,0,...,b_{m+1}]
% [x_1,x_2,...,x_m,y_1,y_2,...,y_n]'=[0,0,...,0,c_1,c_2,...,c_{k+1}]
% 
% function S=sylv_mat(A,B)
% n=length(B)-1; m=length(A)-1; S=[];
% A1=[A(:); zeros(n-1,1)]; B1=[B(:); zeros(m-1,1)];
% for i=1:n, S=[S A1]; A1=[0; A1(1:end-1)]; end
% for i=1:m, S=[S B1]; B1=[0; B1(1:end-1)]; end; S=S.';

% function [X,Y]=diophantine(A,B,C,x)
% d=gcd(A,B); A=simplify(A/d); B=simplify(B/d); C=simplify(C/d);
% A1=polycoef(A,x); B1=polycoef(B,x); C1=polycoef(C,x);
% n=length(B1)-1; m=length(A1)-1; S=sylv_mat(A1,B1);
% C2=zeros(n+m,1); C2(end-length(C1)+1:end)=C1(:); x0=inv(S.')*C2;
% X=poly2sym(x0(1:n),x); Y=poly2sym(x0(n+1:end),x);

% function c=polycoef(p,x)
% c=[]; n=0; p1=p; n1=1; nn=1; if nargin==1, x=symvar(p); end
% while (1)
%    c=[c subs(p1,x,0)]; p1=diff(p1,x); n=n+1; n1=n1*n; nn=[nn,n1];
%    if p1==0, c=c./nn(1:end-1); c=c(end:-1:1); break;
% end, end
%%
syms s; 
A=s^4-27*s^3/10+11*s^2/4-1249*s/1000+53/250;
B=3*s^2-6*s/5+51/25;
C=2*s^2+3*s/5-9/25;
[X,Y]=diophantine(A,B,C,s) % �ⷽ��
% sym2poly(A)
%
simplify(A*X+B*Y-C) %��֤

%% 
% bezout���ʽ��һ������Ķ���ͼ���̣�����C(s)=1
syms x;
A=x^3+4*x^2+5*x+2;
B=x^4+13*x^3+63*x^2+135*x+108;
[X,Y]=diophantine(A,B,1,x)
simplify(A*X-B*Y-1)
% 2016������



%% ��һԪN�η���
% ��λ���ߴδ�������û��һ��Ĵ����ⷨ��

% ֻ�в��ַ����н�����

syms x
p=solve('3*x^5+x^4-7*x^3+7*x^2-2*x+1=0')

eval('p')

p=solve('x^5+15*x+12=0')

eval('p')


% $x^6-5x^5+3x^4+x^3-7x^2+7x-20=0$

%%
  syms p y
  p=solve('2^(1/2)*sin(x)-1=0');
  eval(p)
  
   %% 
  clear all
  syms x p
  p=solve('x=sin(x)-5');
  
  p=eval('p')
   
  %% 
  % ������
  syms  x1 x2
  [x1,x2]=solve(x1+x2==35,2*x1+4*x2==94) %����ͬ������
  % 23,12 ��matlab�߰汾���Լ���
  %% 
  syms x1 x2
  [x0,y0]=solve(x1+x2-35,2*x1+4*x2-94)
  
  %% 
%   syms x
%   solve(x^3+5004*x^2+(1169953+sym(1/3))*x==(41107188+sym(1/3)))
  % �ʹη��̵Ľ�����
  % �ø߱��棬��������
  %%
  % ������
  syms x y a b c 
  f1=x*a+c*y-2;
  f2=b*x^2+c*x+a*y^2-4*x*y+3;
  [x0,y0]=solve(f1,f2)
  
  %%  
  syms s
  f=s^4+(5+3i)*s^3+(6+12i)*s^2-(2-14i)*s-(4-4i);
  s0=solve(f)
  % ��ϵ�����η��̽�����
  %% 
   syms s
  f=7*s^4+119*s^3+756*s^2+2128*s+2240;
  x=solve(f)
  %%
  f=f+1;
  x=solve(f)  %�ø߰汾�����ֽ�����ⲻ����
   %  x1=vpa(x),norm( subs(f,s,x1) )
  %% 
%   syms  s
%   f=7*s^4+119*s^3+756*s^2+2128*s+2241;
%    x=solve(f,'MaxDegree',4),x(1)
   % �ø߰汾������һ��ѡ��
  % norm(vpa(subs(f,s,x),100))
  
  %% 
  % �߰汾�в��д˺���������ƽ�
%   syms x y
%   [x0,y0]=vpasolve(x^2+y^2==5,x+4*y^3+3*y^2==2)
  %%
  % ����
%   f1=x^2+y^2-5;
%   f2=x+4*y^3+3*y^2-2;
%    [x0,y0]=vpasolve(f1,f2)
%    norm([subs(f1,{x,y},{x0,y0}), norm([subs(f2,{x,y},{x0,y0})
       
  
  %% ר���о�������ʽ���̵����
% $x^n+a_1x^{n-1}+a_2x^{n-2}+\cdots+a_{n-1}x+a_n=0$
% ����ϵ���Ĺ�ϵ�������µ�Viete����
  % ����˼·��pdf�μ���
  
  %% ר���о����������������ʵ��
 
 %% ��������
 % ������ $f(x)=0$ ת��Ϊ�ȼ۵ķ��� $x=\phi(x)$ ���� $x_{n+1}=\phi(x_n)$����
 % ��ʼ $x_0$��ʼ���� $\lim_{x\rightarrow \inf}x_n=x^*$ ,�� $x^*$
 % ����$x=\phi(x)$�Ĳ����㣬������ $f(x)=0$ �ĸ���
 
 %% ���� $x^3+x-1=0$ ��[0,1]�ڵĽ���ֵ(���С�� $10^{-5}$ ),�ö��ַ����
%  function y = exam2_1(m,n,er)
%  % [m,n]��ʼ�������䣬er��ʾ���
%  % yΪ������������ʾ�ڵ��������еĸ���������е�
%   syms x xk
%   a=m;b=n;k=0;
%   ff=x^3+x-1;
%   while b-a >er
%       xk=(a+b)/2;
%       fx=subs(ff,x,xk);
%       fa=subs(ff,x,a);
%       k=k+1;
%       if fx==0
%           y(k)=xk;
%           break;
%       elseif fa*fx<0
%           b=xk;
%       else
%           a=xk;
%       end
%       y(k)=xk;
%   end
%   plot(y,'.-');
%   grid on
  
  % ����������ִ��
   ab=exam2_1(0,1,1e-5);
   vpa(ab,8)
   
   
   %% �򵥵��������  $x^2=2$������
   % ����һ $x=\frac{2}{x}$,���õ�����ʽ $x_{n+1}=\frac{2}{x_n}$ ;
   %
   % ������ $x=1/2 (x+\frac{2}{x})$,���õ�����ʽ $x_{n+1}=\frac{1}{2}(x_n+\frac{2}{x_n})$ ;
   %
   % ������ $x^3=2x$, $x^3=2x-x^2+2$, �� $x=\sqrt[3]{2x-x^2+2}$,���õ�����ʽ $x_{n+1}=\sqrt[3]{2x_n-x_n^2+2}$ ;
   %
   % ������ $x=(\frac{2+x}{1+x})$ , ���õ�����ʽ $x_{n+1}=1+\frac{1}{1+x_n}$ ;
  
%   function [y1,y2,y3,y4]=exam2_2(n) %nΪ��������
%   y1=ones(1,n);y2=ones(1,n);y3=ones(1,n);y4=ones(1,n);
%    for i=1:n
%         y1(i+1)=2/y1(i);
%         y2(i+1)=0.5*(y2(i)+2/y2(i));
%         y3(i+1)=(2*y3(i)-y3(i)^2+2)^(1/3);
%         y4(i+1)=1+1/(1+y4(i));
%    end
%    
   clear
   [y1,y2,y3,y4]=exam2_2(10)
   
   
   
%% �����ٶȸ����ţ�ٷ������ҽط�(������)������������(�ɳڷ�)�����ؽ𷨣��Լ�ȥ������
   
   
   
  %% �ο�����
  % 1�������޵ȣ���Matlab2016��ѧ�����빤�̷��������ŵ���ͨ������е��ҵ�����磬2017��1�¡�
  % 
  % 2��Ѧ������ڴ���(���),��MATLAB΢�������㣬�廪��ѧ�����磬2019��7�¡�
  %
  % 3��Ѧ������ڴ���(���),��MATLAB���Դ������㣬�廪��ѧ�����磬2019��7�¡�
  %
  % 4������Եȣ���MATLAB������Ӧ�á��ڶ��棬�����ʵ�����磬2019��1��
  %
  % 5������������MATLAB���ճ������е�Ӧ�á����廪��ѧ�����磬2018��9��
  %
  % 6�������ȣ���MATLAB2016����ʵ���̡̳��������ʵ�����磬2019��1��
  

  %% �Ǹ���С���˽�
  clear all
  A=[1 2 -1 0;0 4 -3 2 ;1 0 -1 1;2 8 1 7];
  b=[1 1 1 1]';
  x=lsqnonneg(A,b)
  
  A*x % ��֤
  