%%   ΢���������MATLAB���
% ɽ������ѧ��ѧѧԺ ������
% 20200320

%% ���޼���
% ��������
sin(pi/4) 
% ������£�
x=[pi/6,pi/4,pi/3];cos(x) %˵����ͬʱ�������Ǻ����ڶ���ֵ

%% һԪ�����ļ���
% limit()����
%
% 
%  
% 
% $\lim_{x\rightarrow 0}\frac{2x-1}{x^2+3}$
clear 
 syms x;
 limit(((2.*x-1)./(x.^2+3)),x,0)
 
 %%
 clear
syms x;
f=sin(x)/x;
limit(f)
 
%% 
clear
syms n
limit((1+1/n)^n,inf)

%% �Ҽ���
syms x
limit(log(1+x)/x,x,0,'right')

%% ���ؼ���
 syms x y
 f=((exp(x)+exp(y))/(cos(x)-sin(y)));
 limit(limit(f,x,0),y,0)
 
 
 %% ������΢��
 clear
syms x
f=2^x+x^(1/2)*log(x);
diff(f)
%%
clear
syms x
f=sin(2*x+3);
diff(f,3) %���׵���
%% ƫ��
clear
syms x y
f=log(exp(2*(x+y^2))+(x^2+y)+sin(1+x^2));
fx=diff(f,x)
fy=diff(f,y)
fxy=diff(fx,y)
fyx=diff(fy,x)
fxx=diff(fx,x)
fyy=diff(fy,y)
fxx=diff(f,x,2) 
fyy=diff(f,y,2)

%% ����
syms x;
v= int(sin(x)/x,0,1) 
vpa(v)
%%
clear
syms x 
v=int(exp(-2*x),0,1) 
vpa(v)

%% 
clear
syms x;
int(1/x,1,inf) %�������
 
v= int(1/(1+x^2),1,inf) 
vpa(v) 
 
%% 
% �ȷ����еķ�������

syms x
f=x^3/(exp(x)-1);
int(f,0,inf)
%%
syms x;
f=1/(x^2+2*x+3); %�����ʽ����
v= int(f,-inf,inf) 
vpa(v) 
%% ��������
syms x y z
f=sin(x*y+z+1); 
int(f)

%%
% ��z�Ĳ�������
clear
syms x y z
int(sin(x*y+z+1),z)
%% �������
syms a b n
s=a^n+b*n;
symsum(s)
%%
syms n x
s=sin(n*x);
symsum(s,n)

%%
% ���� $s=2^{sin(n*x)}$ ��ǰ $n-1$ �������ǰ10��͡�
syms n 
s=2*sin(2*n)+4*cos(4*n)+2^n;
sum_n=symsum(s)
sum10=symsum(s,0,10) 
vpa(sum10) 
%% �����
syms n
s1=1/n;
v1=symsum(s1,1,inf) 
clear
syms n
s2=1/n^3;
v2=symsum(s2,1,inf)  % zeta(3)
vpa(v2)

%% ̩��չ��
syms x
f=exp(-x);
f6=taylor(f)
%%
syms a b x
f=a*sin(x)+b*cos(x);
f1=taylor(f,10) %10��������ֽ���չ��
f2=taylor(f,10,pi/2) 
%% ����Ҷչ��
% function [ a0,an,bn ] =Fourierzpi( f )
% %   �Զ��帵��Ҷ�任
%
% syms x n
%
% a0=int(f,0,2*pi)/pi;
%
% an=int(f*cos(n*x),0,2*pi)/pi;
%
% bn=int(f*sin(n*x),0,2*pi)/pi;
%
% end

clear all
syms x
f=x^2;
[a0,an,bn]=Fourierzpi(f)

%% ����Ҷ���ֱ任

% clear
% syms x
% f = exp(-x^2);
% fourier(f)  matlab2016

%%

% clear
% syms  w
% f = exp(-abs(w));
% fourier(f)
%%  ����Ҷ���任

% clear
% syms a w real
% f=exp(-w^2/(4*a^2));
% F = ifourier(f)
% exp(-a^2*x^2)/(2*pi^(1/2)*(1/(4*a^2))^(1/2)) ��matlab2016

%% ������˹�任
clear
syms s
g=1/sqrt(s);
laplace(g)

%%
% ��任
clear
syms s
f=1/(s^2);
ilaplace(f)

%% ��Ԫ��������

%% ƫ��
clear
syms x y z
f=[x*y*z;y;x+z];
v=[x,y,z];
jacobian(f,v) %�ſ˱Ⱦ���

%%
clear
syms x y z
f=x^2+81*(y+1)^2+sin(z);
v=[x,y,z];
jacobian(f,v) %ƫ��

%% 
% �ݶȴ�С--�ڵ�(0,0,0)��(1,3,4)�����ݶ�
clear
syms x y z
f=x^2+2*y^2+3*z^2+x*y;
v=[x,y,z];
j=jacobian(f,v);
j1=subs(subs(subs(j,x,0),y,0),z,0);
j2= subs(subs(subs(j,x,1),y,3),z,4)

%% 
% ��v=(1 ,2 ,3)�ķ�����
clear
syms x y z
f=x^2+2*y^2+3*z^2+x*y;
v=[x,y,z];
j=jacobian(f,v);
v1=[1,2,3];
j.*v1

%% ��Ԫ�������ݶ�
clear
v = -2:0.2:2;
[x,y] = meshgrid(v);
z = x .* exp(-x.^2 - y.^2);
[px,py] = gradient(z,0.2,0.2); %��ֵ�ݶ�
contour(v,v,z), hold on, quiver(v,v,px,py), hold off

%% ������ػ��� 
% $\int\limits_D xdxdy$,����D����ֱ�� $y=2x,y=0.5x,y=3-x$��Χ�ɵ�ƽ������
% �Ȼ�����������
clear
syms x y
f=x;
f1=2*x;
f2=0.5*x;
f3=3-x;
ezplot(f1);  % ������ͼ
hold on
ezplot(f2);
hold on
ezplot(f3);
hold on
ezplot(f3,[-2,3])
A=fzero('2*x-0.5*x',0) %ȷ��������
B=fzero('3-x-0.5*x',8)
C=fzero('2*x-(3-x)',4)
ff1=int(f,0.5*x,2*x)  % �������
ff11=int(ff1,0,1)
ff2=int(f,0.5*x,3-x)
ff22=int(ff2,1,2)
 ff11+ff22
 
 
 

%% ����������
  x=-2:0.01:2;
  y=((2.*x-1)./(x.^2+3));
  plot(x,y,'-',[0],[-1/3],'o')
  
 