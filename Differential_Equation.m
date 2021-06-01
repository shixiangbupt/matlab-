%% 微分方程  differential equation
% 山东理工大学 数学学院

%% Dsolve求解
% 例1 1) $xy'ln x+y=ax(ln x+1)$
% 
% 3) $(y^4-3x^2)dy+xydx=0$ 

y1=dsolve('x*Dy*log(x)+y=a*x*(log(x)+1)','x')

y2=dsolve('D2y+2*Dy+5*y=sin(2*x)','x') % 二阶微分方程

y3=dsolve('x*y*Dy+x^4-3*y^2=0','x') %将x,y对换

y4=dsolve('D3y+D2y-2*Dy=x*(exp(x)+4)','x') %三阶方程

%%  
s=dsolve('Dx=y','Dy=-x');
y=s.y,x=s.x

%% 有初始条件的常微分方程
% 例2 $y''=cos 2x-y,y(0)=1,y'(0)=0$
 y=dsolve('D2y=cos(2*x)-y','y(0)=1','Dy(0)=0','x');
 simplify(y)
 
 %% 数值解
 % 例3 $y'=y-2x/y,y(0)=1,0<x<4$
  dsolve('Dy=y-2*x/y','y(0)=1','x')  %解析解
  
  %% 
  clear
  x=0:0.1:4;
  y=sqrt(1+2*x);
  odefun=inline('s-2*t/s','t','s');
  [t,s]=ode45(odefun,[0,4],1);
  plot(x,y,'o--',t,s,'*--')
  
 % 命令行中输入[t,s]可以看到t=4时，s=3.006，和真实值3有一点区别
 
 %% 
 % 求解微分方程 $\frac{d^2x}{dt^2}-1000(1-x^2)\frac{dx}{dt}+x=0,x(0)=0,x'(0)=1$
 %
 % 令 $y_1=x,y_2=y_1'$ 则原方程变为方程组：
  
 % $y_1'=y2$; $y_2'=1000(1-y_1^2)y_2-y_1$; $y_1(0)=0,y_2(0)=1$
%  function dy=weifen1(t,y)
%  dy=zeros(2,1);
%  dy(1)=y(2);
%  dy(2)=1000*(1-y(1)^2)*y(2)-y(1);
 
[T,Y]=ode15s('weifen1',[0 3000],[0 1]);
plot(T,Y(:,1),'--')
 % ode15s 对于病态方程速度要比ode45快
 
 %% laplace变换
  syms x w;
  f=x^2*exp(-2*x)*sin(x+pi);
  F=laplace(f,x,w)
  g=simplify(ilaplace(F)) % 反变换
  
  %% laplace变换的微分性质
  % $L(d f(t)/dt]=sF(s)-f(0^{+})$, $L(d^n f(t)/dt^n]=s^nF(s)-s^{n-1}f(0^+)-s^{n-2}f'(0^+)-\cdots-f^{n-1}(0^+)$
  %
  % $u(t)=e^{-5t}cos(2t+1)+5$, 且 $y(0)=3,y'(0)=2,y''(0)=y'''(0)=0$,
  % 试求下列微分方程的解析解：
  % $y^{(4)}+10y'''(t)+35y''(t)+50y'(t)+24y(t)=5u''(t)+4u'(t)+2u(t)$
  
  syms t s;
  u=exp(-5*t)*cos(2*t+1)+5; % 输入信号描述
  R=simplify(laplace(diff(u,2)+4*diff(u)+2*u)) %等式右端表达式
  %%
  % 等号左边第一项 $s^4Y(s)-y(0)s^3-y'(0)s^2-y''(0)s-y'''(0)=s^4Y(s)-3s^3-2s^2$
  %
  % 其他项： $10s^3Y(s)-30s^2-20s,35s^2Y(s)-105s-70,50sY(s)-150,24Y(s)$
  %
  % 解出输出信号的laplace变换Y(s)为：
  % $Y(s)=\frac{R(s)+3s^3+32s^2+125s+220}{s^4+10s^3+35s^2+50s+24}$
  % 对结果进行laplace反变换则可以得出微分方程解析解
  Y=(R+3*s^3+32*s^2+125*s+220)/(s^4+10*s^3+35*s^2+50*s+24);
  y=ilaplace(Y) 
  % fplot(y,[0,10]) 
 %%
 % 反变换
 syms x t;
 G=(-17*x^5-7*x^4+2*x^3+x^2-x+1)/(x^6+11*x^5+48*x^4+106*x^3+125*x^2+75*x+17);
 f=ilaplace(G,x,t); %对指定的变量t做反变换
 vpa(f) 
 
 
 
 
%% 参考文献

% 1) 韩明等，《数学实验(Matlab)》，第四版，同济大学出版社，2018年1月
%  
% 2）薛定宇，《MATLAB微积分运算》，清华大学出版社，2019年7月

 
