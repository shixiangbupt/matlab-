%% 解方程方法汇总
% solve函数
 clear
syms x;
syms y;

E1='x*y=1';     
E2='x^y=4';
J=solve(E1,E2,x,y);%J是结构体
x=J.x;
y=J.y;
 % 结果的lambertw是一个特殊的函数

 x=sym('x');%符号变量定义
f=sym('a*x^2+b*x+c=0');
x=solve(f)
pretty(x)%结果转为手写形式
xL=latex(x)%转为latex指令，复制到ctex软件中
 %% fzero函数
 clear
syms x a b;
fx=x.^2-a*sin(x)+b;
fx=subs(fx,{a,b},{1,-2});%对a，b赋值
fx=char(fx);%fx转字符串
fx=strrep(fx,'^','.^');%把乘方运算转换为点运算
fx=inline(fx);%定义内联函数
x1=fzero(fx,0);%求函数的第一个零点
x2=fzero(fx,2);
xt=-6:.02:6;%产生[-6,6]区间内等距采样点
plot(xt,fx(xt));
hold on;
plot(xlim,[0,0],'k:')%绘制0刻度线
% 调用fzero每次只能返回一个零点
 clear
x01=fzero('sin(x^2)',0);%初值为0
x02=fzero('sin(x^2)',0.1);%初值为0.1
x03=fzero('sin(x^2)',-0.1);%初值为-0.1
set(gca,'Fontsize',12,'Fontname','Times new roman');
ezplot('sin(x^2)',[-2,2]);
hold on;
plot(xlim,[0,0],'k:');
% 返回的结果并非最靠近初值

%% 



%% 手工找零点
% ginput函数
 clear
ezplot('y^2*sin(2*y)+x^2*cos(2*x)-1',[-2,2]);
h=get(gca,'Children');%获取句柄信息
set(h,'Color','r','LineStyle',':');
hold on;
ezplot('x^3+y^3-6*cos(2*x*y)+1',[-2,2]);
str=get(get(gca,'Title'),'String');%获取当前title中的字符串
title(['x^2cos(2x)+y^2sin(2y)-1=0,',str]);%更换字符串
axis equal;%设置单位长度一致

x0=ginput(8);%鼠标取点
Eq1='x(1)^2*cos(2*x(1))+x(2)^2*sin(2*x(2))-1';%x对应于x(1)，y对应于x(2)

Eq2='x(1)^3+x(2)^3-6*cos(2*x(1)*x(2))+1';
fun=['[',Eq1,',',Eq2,']'];
for k=1:size(x0,1);
    x=fsolve(fun,x0(k,:));
    xr(k,:)=x;
end

xr;
plot(xr(:,1),xr(:,2),'k*','markersize',10);


%% 求解三个多项式方程
 clear
C3=[4,3,2,1];%定义多项式的系数向量
C5=[1,0 ,0,2,1,10];%x^5+2X^2+x+10
C7=[1,zeros(1,6),4];%x^7+4
R3=roots(C3);%求多项式根
R5=roots(C5);
R7=roots(C7);

%推广到求sqrt[n]{x_0}=roots([1,zeros(1,n-1),x_0])
roots([1,zeros(1,7-1),4]);%x^7+4的根

%与roots相反的函数是poly，根据多项式根确定多项式
cr5=poly(R5);

%% 用fminbnd函数找零点
% fminbnd将解方程问题转换为求极小值问题，f(x)在[x1,x2]存在零点，那么函数|f(x)|最小值一定是零，对应的位置一定是方程的根。
 clear
fun=inline('abs([x^2-4*sin(5*x)]/[x^2+cos(x)])');
x01=fminbnd(fun,1,1.5);%计算在区间[1,1.5]内的最小值
x02=fminbnd(fun,1.5,2);
plot(x01,0,'r*','markersize',14);%把解画到图上
plot(x02,0,'r*','markersize',14);

%%
% 再来一个例子
clc;clear;close all;
xx = linspace(1,4,200);
yy = [xx.^2-4*sin(5*xx)]./[xx.^2+cos(xx)];
plot(xx,yy,'k');
fun = inline('abs([x^2-4*sin(5*x)]/[x^2+cos(x)])');
                                     % % 转化为函数f(x)的绝对值
x01 = fminbnd(fun,1,1.5) % 计算最小值
x02 = fminbnd(fun,1.5,2) % 计算最小值
x03 = fminbnd(fun,1,4)%运用fminbnd函数时候要求函数曲线在定义域范围内的极小值必须小于0，否则会引起错解
[x03, fval] = fminbnd(fun,1,4) % 计算最小值

hold on
plot(xx,abs(yy),'k:');
L=legend('{\itf}({\itx})','|{\itf}({\itx})|',0);
set(L,'Fontsize',18);
plot(x01,0,'r*','markersize',14); % 把解画到图上
plot(x02,0,'r*','markersize',14); % 把解画到图上
plot(x03,fval,'ro','markersize',14); % 把解画到图上
plot(x03,0,'ro','markersize',14);
set(gca,'Fontsize',18);
set(gcf,'Color','w');

%% 其他方法
% 数值方法：求超越方程的根，二分法，抛物线法，牛顿法，正割法，steffenson法等
% function y=fund1(x);
% Ix=quad('sqrt(t).*sin(t).*exp(-t)',0,sin(6*x));%quad离散积分
% y=x-2+Ix^2;
% function y=fund2(x);
% [t,y]=ode45(@vdp1,[0 ,x],[2,0]);%matlab自带的函数vdp1
% y=y(end,1);
% [x01,f1]=dichotomy('fund1',1,4);%dichotomy二分法
% [x02,f2]=dichotomy('fund2',1,4)

%% 用steffenson法解方程
% function xr = steffenson(fun,x1,D);
% % 用steffenson法解方程
% if nargin == 2;
%     D = 1e-6; % 设置默认精度
% end
% f1 = feval(fun,x1); % 计算x1处的函数值
% dx = f1^2/[feval(fun,x1+f1)-f1]; % 计算迭代公式中的差项
% x2 = x1;
% while abs(dx)>D;
%     x2 = x1-dx; % 迭代计算下一个值
%     x1 = x2; % 更新x1数值
%     f1 = feval(fun,x1); % 计算x1处的函数值
%     dx = f1^2/[feval(fun,x1+f1)-f1]; % 更新迭代公式中的差项
% end
% xr = x1; % 返回根
 
%%  用正割法解方程

% function xr = secant(fun,x0,x1,D);
% % 用正割法解方程
% if nargin == 3;
%     D = 1e-6; % 设置默认精度
% end
% f0 = feval(fun,x0); % 计算x0处的函数值
% f1 = feval(fun,x1); % 计算x1处的函数值
% while abs(x0-x1)>D;
%     x2 = x1- f1*[x0-x1]/[f0-f1]; % 正割法迭代公式
%     f0 = f1; % 更新f0数值
%     x0 = x1; % 更新x0数值
%     x1 = x2; % 更新x1数值
%     f1 = feval(fun,x1); % 计算x1处的函数值
% end
% xr = x2; % 返回根
% 
