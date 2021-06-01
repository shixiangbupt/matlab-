%%   微积分问题的MATLAB求解
% 山东理工大学数学学院 周世祥
% 20200320

%% 极限计算
% 函数计算
sin(pi/4) 
% 结果如下：
x=[pi/6,pi/4,pi/3];cos(x) %说明可同时计算三角函数在多点的值

%% 一元函数的极限
% limit()函数
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

%% 右极限
syms x
limit(log(1+x)/x,x,0,'right')

%% 多重极限
 syms x y
 f=((exp(x)+exp(y))/(cos(x)-sin(y)));
 limit(limit(f,x,0),y,0)
 
 
 %% 导数和微分
 clear
syms x
f=2^x+x^(1/2)*log(x);
diff(f)
%%
clear
syms x
f=sin(2*x+3);
diff(f,3) %三阶导数
%% 偏导
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

%% 积分
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
int(1/x,1,inf) %广义积分
 
v= int(1/(1+x^2),1,inf) 
vpa(v) 
 
%% 
% 热辐射中的反常积分

syms x
f=x^3/(exp(x)-1);
int(f,0,inf)
%%
syms x;
f=1/(x^2+2*x+3); %有理分式积分
v= int(f,-inf,inf) 
vpa(v) 
%% 不定积分
syms x y z
f=sin(x*y+z+1); 
int(f)

%%
% 对z的不定积分
clear
syms x y z
int(sin(x*y+z+1),z)
%% 级数求和
syms a b n
s=a^n+b*n;
symsum(s)
%%
syms n x
s=sin(n*x);
symsum(s,n)

%%
% 求级数 $s=2^{sin(n*x)}$ 的前 $n-1$ 项，并求它前10项和。
syms n 
s=2*sin(2*n)+4*cos(4*n)+2^n;
sum_n=symsum(s)
sum10=symsum(s,0,10) 
vpa(sum10) 
%% 无穷级数
syms n
s1=1/n;
v1=symsum(s1,1,inf) 
clear
syms n
s2=1/n^3;
v2=symsum(s2,1,inf)  % zeta(3)
vpa(v2)

%% 泰勒展开
syms x
f=exp(-x);
f6=taylor(f)
%%
syms a b x
f=a*sin(x)+b*cos(x);
f1=taylor(f,10) %10阶麦克劳林近似展开
f2=taylor(f,10,pi/2) 
%% 傅里叶展开
% function [ a0,an,bn ] =Fourierzpi( f )
% %   自定义傅里叶变换
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

%% 傅里叶积分变换

% clear
% syms x
% f = exp(-x^2);
% fourier(f)  matlab2016

%%

% clear
% syms  w
% f = exp(-abs(w));
% fourier(f)
%%  傅里叶反变换

% clear
% syms a w real
% f=exp(-w^2/(4*a^2));
% F = ifourier(f)
% exp(-a^2*x^2)/(2*pi^(1/2)*(1/(4*a^2))^(1/2)) 用matlab2016

%% 拉普拉斯变换
clear
syms s
g=1/sqrt(s);
laplace(g)

%%
% 逆变换
clear
syms s
f=1/(s^2);
ilaplace(f)

%% 多元函数分析

%% 偏导
clear
syms x y z
f=[x*y*z;y;x+z];
v=[x,y,z];
jacobian(f,v) %雅克比矩阵

%%
clear
syms x y z
f=x^2+81*(y+1)^2+sin(z);
v=[x,y,z];
jacobian(f,v) %偏导

%% 
% 梯度大小--在点(0,0,0)和(1,3,4)处的梯度
clear
syms x y z
f=x^2+2*y^2+3*z^2+x*y;
v=[x,y,z];
j=jacobian(f,v);
j1=subs(subs(subs(j,x,0),y,0),z,0);
j2= subs(subs(subs(j,x,1),y,3),z,4)

%% 
% 沿v=(1 ,2 ,3)的方向导数
clear
syms x y z
f=x^2+2*y^2+3*z^2+x*y;
v=[x,y,z];
j=jacobian(f,v);
v1=[1,2,3];
j.*v1

%% 多元函数的梯度
clear
v = -2:0.2:2;
[x,y] = meshgrid(v);
z = x .* exp(-x.^2 - y.^2);
[px,py] = gradient(z,0.2,0.2); %数值梯度
contour(v,v,z), hold on, quiver(v,v,px,py), hold off

%% 计算二重积分 
% $\int\limits_D xdxdy$,其中D是由直线 $y=2x,y=0.5x,y=3-x$所围成的平面区域。
% 先划定积分区域
clear
syms x y
f=x;
f1=2*x;
f2=0.5*x;
f3=3-x;
ezplot(f1);  % 画函数图
hold on
ezplot(f2);
hold on
ezplot(f3);
hold on
ezplot(f3,[-2,3])
A=fzero('2*x-0.5*x',0) %确定积分限
B=fzero('3-x-0.5*x',8)
C=fzero('2*x-(3-x)',4)
ff1=int(f,0.5*x,2*x)  % 计算积分
ff11=int(ff1,0,1)
ff2=int(f,0.5*x,3-x)
ff22=int(ff2,1,2)
 ff11+ff22
 
 
 

%% 画函数曲线
  x=-2:0.01:2;
  y=((2.*x-1)./(x.^2+3));
  plot(x,y,'-',[0],[-1/3],'o')
  
 