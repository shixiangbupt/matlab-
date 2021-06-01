%% 数值微积分与常微分方程
% 山东理工大学 数学与统计学院

%% 
% 当一个函数是以数值给出的离散形式，那么它的导数就无法用极限运算求得，更无法用
% 求导方法去计算函数在某点处的导数。当被积函数的原函数无法用初等函数表示或被积函数为仅
% 知道离散处函数值的离散函数时，就难以牛顿莱布尼兹公式求定积分。所以在实际求解问题时，多采用
% 数值方法来求函数的微分和积分。
%% 数值微分
% 实际中，有时需要根据已知的数据点，推算某一点的一阶或高阶导数，就要用到数值微分。
% 定义： $\bigtriangleup f(x)=f(x+h)-f(x)$, 以 $h$ 为步长的前向差分；
% $\bigtriangledown f(x)=f(x)-f(x-h)$ ,后向差分；
% $\delta f(x)=f(x+h/2)-f(x-h/2)$, 中心差分。
% 当步长 $h$充分小时，有：
% $f'(x)\approx \frac{\bigtriangleup f(x)}{h}$, $f'(x)\approx \frac{\bigtriangledown f(x)}{h}$, 
%  $f'(x)\approx\frac{\delta f(x)}{h}$ 
% 
 
%%
% 多项式求导法
% 
% 用多项式或样条函数g(x)对f(x)进行逼近（插值或拟合），然后用逼近函数g(x)在点x处的导数
% 作为f(x)在点x处的导数。曲线拟合给出的多项式原则上可以是任意阶的导数，但随着求导阶数的增加，计算
% 误差会逐渐增大。因此，一般只用在低阶数值微分。
%%  
%  用diff函数计算差分
% 
% 用f(x)在点x处的某种差商作为其导数。在MATLAB中，计算向前差分的函数diff，调用格式如下。
% 	DX = diff(X)：计算向量X的向前差分。
% 
% 	DX = diff(X,n)：计算向量X的n阶向前差分。
% 
% 	DX = diff(X,n,dim)：计算矩阵X的n阶差分，dim = 1时（默认状态），按列计算差分；dim = 2，按行计算差分。
% 例1：设f(x)?=?sinx，用不同的方法求函数f(x)的数值导数，并在同一个坐标系中绘制f?'(x)的三种方法所得导数曲线。

x=0:pi/24:pi;
%用5次多项式p拟合f(x),并对拟合多项式p求导数dp在假设点的函数值
p=polyfit(x,sin(x),5);
dp=polyder(p);
dpx=polyval(dp,x);
%直接对sin(x)求数值导数
dx=diff(sin([x,pi+pi/24]))/(pi/24);
%求函数f的导函数g在假设点的导数
gx=cos(x); 
plot(x,dpx,'b-',x,dx,'ko',x,gx,'r+');
% 结果表明用3种方法求得的数值导数比较接近。
%%
% 例：生成一个5阶魔方矩阵，按列进行差分运算。
M=magic(5)
 
DM=diff(M)               %计算V的一阶差分
% diff函数对矩阵的每一列进行差分运算，因而结果矩阵的列数不变，只有行数减1.

%% 数值积分的原理
% 本思想是将整个积分区间[a,b]分成n个子区间
% $[x_i,x_{i+1}],i=1,2,\cdots,n$
% 其中 $x_1=a, x_{n+1}=b$。这样求定积分问题就分解为下面的求和问题：
% 
% $S=\int_a^b f(x)dx=\sum_{i=1}^n\int_{x_i}^{x_{i+1}}f(x)dx$
% 
% 每一个小的子区间上的定积分的值可以近似求得，即采用分段线性近似。矩形法是用矩形面积近似曲边
% 梯形面积，梯形法使用斜边梯形面积近似曲边梯形面积，而辛普生法是用抛物线近似曲线。
% 
% 1、梯形法
%
% $\int_a^bf(x)dx\approx \frac{(b-a)}{2n}(f(a)+2\sum_{i=1}^{n-1}f(x_i)+f(b))$
% 
% 将区间分成n等分，在每个子区间上用梯形代替曲边梯形，得到近似公式。
% 当区间分点向量 $X=(x_0,x_1,\cdots,x_n)$ 和 相应的被积函数值向量$Y=(y_0,y_1,\cdots,y_n)$已知时，可以求得曲线在积分区间
% 上所构成的曲边梯形面积的近似值。
%%
% 辛普生法
% 当被积函数为凹时，用梯形法求得的结果比实际小，当被积函数为凸时，又比实际情况大，若改用
% 每段与它凸性相接近的抛物线来近似，则可减少上述缺点。
% 
% $\int_a^bf(x)dx\approx \frac{(b-a)}{6n}[y_0+y_{2n}+4(y_1+y_3+\cdots+y_{2n-1})+2(y_2+y_4+\cdots+y_{2n-2})]$
% 
% 有人采用改进的自适应率的辛普生法。
% Matlab采用自适应积分算法
% 
% 基于全局自适应积分算法的integral函数来求定积分。函数的调用格式为：
% 
% q = integral(@fun,xmin,xmax) 
% 
% q = integral(@fun,xmin,xmax,Name,Value)
%
% fun是被积函数，xmin和xmax分别是定积分的下限和上限。选项用于设置积分器的属性
%
%%
% 例题：
q=integral(@(x)( x.*sin(x)./(1+abs(cos(x)))),0,pi)
%被积函数的参数通常都为向量，定义的表达式使用数组运算符(即点运算符)

%%
 % 人造地球卫星轨迹为椭圆，近地球表面439km，远地点距地球表面2384km，地球半径6371km，求卫星的轨迹长度。
  a=8755; %加上了半径的半长轴
  b=6810;
  format long
  funLength=@(x)sqrt(a^2.*sin(x).^2+ b^2.*cos(x).^2);
  L=4*integral(funLength, 0, pi/2)
  %%
%   高斯-克朗罗德法
%  quadgk函数求振荡函数的定积分。该函数的调用格式为
% 	q = quadgk(fun, xmin,xmax)
% [q,errbnd] = quadgk(fun, xmin,xmax,Name,Value)
% errbnd返回近似误差范围。积分上下限可以是?Inf或Inf，如果积分上下限是复数，
% 则quadgk在复平面上求积分。
  format long;
  I=quadgk(@(x)exp(x).*log(x),0,1)
  %%
 % 梯形积分法
% 函数trapz对的离散数据用梯形法求定积分，调用格式如下。
%
% (1) T=trapz(Y)
% 
% 用于求均匀间距的积分。通常，Y是向量，采用单位间距（即间距为1），计算Y的近似积分。
% 若Y是矩阵，则输出参数T是一个行向量，T的每个元素分别存储Y的每一列的积分结果。
% 
% (2) T=trapz(X, Y)
% 
% 用于求非均匀间距的积分。X、Y满足函数关系Y?=?f(X)， 按X指定的数据点间距，对Y求积分。
% 
% 例：从地面发射一枚火箭，若记录了0~80秒火箭的加速度。试求火箭在第80秒时的速度
t=0:10:80;
 a=[30.00,31.63,33.44,35.47,37.75,40.33,43.29,46.69,50.67]; %0秒到80秒，每隔10秒的加速度
 v=trapz(t,a)
 
 %% 多重定积分的数值求解实现
 % integral2、quad2d函数用于求二重积分的数值解，integral3函数用于求三重积分的数值解。函数的调用格式为：
% 
% q = integral2(fun,xmin,xmax,ymin,ymax,Name,Value)
% 
% q = quad2d(fun, xmin,xmax,ymin,ymax,)
%
% [q,errbnd] = quad2d(fun, xmin,xmax,ymin,ymax, Name,Value)
%
% 	q = integral3(fun,xmin,xmax,ymin,ymax,zmin,zmax)
%
% q = integral3(fun,xmin,xmax,ymin,ymax,zmin,zmax,Name,Value)
%
% fun为被积函数，[xmin, xmax]为x的积分区域，[ymin, ymax]为y的积分区域，[zmin, zmax]为z的积分区域，选项Name的用法及可取值与函数integral相同。输出参数q返回积分结果，errbnd用于返回计算误差。

% 计算二重定积分
  fxy = @(x,y) exp(-x.^2/2).*sin(x.^2+y);
  I= integral2(fxy,-2,2,-1,1)
%%
% 计算三重定积分
%　　　命令如下：
 fxyz = @(x,y,z)4*x.*z.*exp(-z.*z.*y-x.*x);
  I3 = integral3(fxyz,0,pi,0,pi,0,1)
 
 %% 常微分方程数值解法
 %  牛顿运动定律，股票价格涨跌，等很多问题。
 % 
 % $y'=f(t,y),t_0\leq t\leq T,y(t_0)=y_0$
 %
 % 数值解法就是求它的解 $y(t)$在节点 $t_0<t_1<\cdots<t_m$处的近似值 $y_0,y_1,\cdots,y_m$
 % 的方法。所求得的称为常微分方程初值问题的数值解。 一般取等距节点 $t_n=t_0+nh,n=0,1,\cdots,m$
 % 关键是建立求解数值解的递推公式。一类是计算 $y_{i+1}$时只用到 $x_{i+1},x_i,y_i$,即前一步的值，
 % 此类方法称为单步法，典型是龙格-库塔法。
 %%
 % 对于一阶常微分方程的初值问题，在求解未知函数y时，y在 $t_0$ 点的值是已知的 $y(t_0)=y_0$,
 % 根据高等数学中的中值定理，应有 $y(t_0+h)=y_1\approx y_0+hf(t_0,y_0)$,其中 $h>0$为步长。
 % 一般地，在任意点 $t_i=t_0+ih$,有
 % 
 % $y(t_0+ih)=y_i\approx y_{i-1}+hf(t_{i-1},y_{i-1}),i=1,2,\cdots,n$
 %
 % 当 $(t_0,y_0)$ 确定后，根据上述递推公式能计算出未知函数 $y(t)$在点 $t_i=t_0+ih$的一列数值解，
 % 即 $y_0,y_1,\cdots,y_n$.
 % 为了改进递推过程中的误差累积，著名的4阶龙格-库塔公式为：
 % $$\left\{
%   \begin{array}{ll}
%     k_1=f(x_i,y_i)  \\
%     k_2=f(x_{i+1/2},y_i+\frac{h}{2}k_1)   \\
%     k_3=f(x_{i+1/2},y_i+\frac{h}{2}k_2)   \\
%     k_4=f(x_{i+1},y_i+hk_3)   \\
%     y_{i+1}=y_i+\frac{h}{6}(k_1+2k_2+2k_3+k_4) 
%   \end{array}
% \right.$
% 
%%
% 求解常微分方程数值解的函数用法相同，其基本调用格式为
%
% [T,Y] = solver(odefun,tspan,y0,options)
%
% [T,Y,TE,YE,IE] = solver(odefun,tspan,y0,options)
%
% 其中，solver是根据待求解问题的性质选用的求解函数
%
% 输出参数
%
% T为列向量，返回时间点；Y为矩阵，Y的每一行向量返回T中各时间点相应的状态。
% TE为事件发生的时刻，YE为对应时刻的解，IE为触发事件的索引。
%
%  输入参数
%
% odefun为函数文件名或匿名函数，函数文件头通常采用f(t，y)的形式，即形参t为时间参量，
% 形参y为待求解问题的自变量。
%
% tspan指定求解区间，用二元向量[t0  tf?]表示。
% y0是初始状态列向量。
% options用于设置积分求解过程和结果的属性。
%
% 常用的有ode45:4-5阶runge-Kutta算法；ode23:2-3阶runge-Kutta算法ode3铜板：刚性微分方程。
%
%%
%   设有初值问题 $y'=y\tan x+\sec x,0\leq x\leq1,y|_{x=0}=\frac{\pi}{2}$,
% 试求其数值解，并与精确解相比较，精确解为 $y(x)=(x+\pi/2)/\cos x$.
% 
% 建立函数文件 funst.m
% function yp=funst(x,y)
% yp= y.*tan(x) + sec(x);
% 
% 求解微分方程。
  y0=pi/2;
  [x,y]=ode23(@funst,[0,1],y0);		%求数值解
  y1=(x+pi/2)./cos(x);            	%求精确解
  [x,y,y1]
% y为数值解，与为精确解，显然两者非常接近。

%%
% 如果在求解时用图形显示计算结果，可以采用以下命令：
  opts=odeset('OutputFcn',@odeplot);
  [x,y]=ode23(@funst,[0,1],y0,opts);
  
  %%
  % 求描述振荡器的Van der Pol方程(心跳建模)： $y''-\mu(1-y^2)y'+y=0$, $y(0)=1,y'(0)=0,\mu=2$,
%  函数ode23,ode45是对一阶常微分方程组设计的，因此对高阶方程，需先转化为一阶，
% 即状态方程，令 $x_1=y,x_2=y'$，则可写出Van der Pol方程的状态方程：
%
% $x_1'=x_2,x_2'=\mu(1-x_1^2)x_2-x_1$
%
% 建立函数文件verderpol.m。
% function xprime=verderpol(t,x)
% global mu;
% xprime=[x(2); mu*(1-x(1)^2)*x(2)-x(1)];
% 求解微分方程。
 global mu;
  mu=2;
  y0=[1;0];
  [t,x]=ode45(@verderpol,[0,20],y0);
  subplot(1,2,1);plot(t,x);      		%绘制系统时间响应曲线
  subplot(1,2,2);plot(x(:,1),x(:,2)) 	%绘制系统相平面曲线
%%
%　如果直接在求解时用相平面曲线显示计算结果，可以采用以下命令：
  opts=odeset('OutputFcn',@odephas2);
  [t,x]=ode45(@verderpol,[0,20],y0,opts);
  
 %% 常微分方程仿真
 % dee是simulink中的一个模块，在命令窗口中运行“dee”，界面正中出现Differential Equation Editor
 % 界面中，单击“file-->new-->Blank Model"进入模型编辑界面，将Differential Equation Editor拖入模型。
 %
 % 选择菜单栏，view->Library Browser，命令，选择“sinks-> XY Graph”，拖入模型编辑窗口。
  
 % 编辑模型(洛伦茨Lorenz模型的状态方程)，进行方程定义，初始值设置，输出设置。
 % -8*x(1)/3+x(2)*x(3)
%  -10*x(2)+10*x(3)
%  -x(1)*x(2)+28*x(2)-x(3)
%  
%  x0初始值填：0;0;0.01 %按列放，没有分号
%  输出：x(1),x(2)

%连接两个模块
% 编辑XY Graph模块，设置x-min:-10,x_max=50,y-min=-20,y-max=30,sample time=0.025
% 设置模型参数(Model settings工具栏)：solve：(仿真时间，方程求解算法)，Data Import/Export(输入，输出数据等)
 
  
%% 练习
% 某厂房容积为45m*15m*6m。经测定，空气中含0.2%的二氧化碳，开动通风设备，以360m^3/s的
% 速度输入含有0.05%的二氧化碳的新鲜空气，同时又排除同等数量的室内空气。问30 min后室内含
% 二氧化碳的百分比。
%
% 设在时刻 $t$车间内二氧化碳的百分比为 $x(t)$%,时间经过 $dt$后，室内二氧化碳浓度改变量为45*15
% *6*dx%=360*0.05%*dt-360*x%*dt，得到
%
% $\left\{
%   \begin{array}{l}
%     dx=\frac{4}{45}(0.05-x)dt  \\
%     x(0)=0.2
%   \end{array}
% \right.$
%
% 首先建立函数
% function co2=co2(t,x)
% co2=4*(0.05-x)/45;
[t,x]=ode45('co2',[0,1800],0.2);
plot(t,x)
  %%  参考文献
  %
  % 蔡旭晖等，《MATLAB基础与应用教程》第二版，人民邮电出版社，2019年1月。
  %
  % 黄少罗等，《MATLAB2016数学计算与工程分析从入门到精通》，机械工业出版社，2017年1月。
  