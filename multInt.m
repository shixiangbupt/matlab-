%% 多元微积分及其应用举例
% 山东理工大学理学院
%shixiangbupt@qq.com
%2020年3月29日

%% 常见的空间二次曲面图像
% 球面
 [x,y,z]=sphere(40);%半径为1的球
 x=4*x;y=4*y;z=4*z;
 mesh(x,y,z)%半径为4的球
 title('球半径为4')

%% 也可以用极坐标方式
% 半径为4的球面图像，与上图基本一致  $x^2+y^2+z^2=16$ 
t=0:pi/30:2*pi;r=0:.1:4;
[R,T]=meshgrid(r,t);
x=R.*cos(T);y=R.*sin(T);
u=abs(16-x.^2-y.^2);
z=sqrt(u);
mesh(x,y,z)
hold on
z1=-z;
mesh(x,y,z1)
%%
%用参数方程作图
ezmesh('2*sin(u)*cos(v)','2*sin(u)*sin(v)','2*cos(u)',[0,pi,0,2*pi])


%%   
%上例中将半径 $R$ 改变成 $x^2,y^2,z^2$ 的不同系数即可得到椭球面图形。



%% 旋转曲面
 % 分别作出旋转抛物面 $z=x^2+y^2$ 和锥面 $z^2=x^2+y^2$ 的图形。
   r=0:.1:2;t=0:pi/30:2*pi;
   [R,T]=meshgrid(r,t);
   x=R.*cos(T);y=R.*sin(T);
   z=x.^2+y.^2;
   subplot(1,2,1),mesh(x,y,z)
   z1=sqrt(z);z2=-z1;
   subplot(1,2,2),mesh(x,y,z1) 
   hold on ,mesh(x,y,z2)
   %结果如下图所示。
   
%% 曲面的交线
% 作出曲面 $z=x^2+y^2(0\leq z\leq 2)$ 与平面 $x+y+z=2$ 在空间的交线。
% 程序如下：
r=0:.01:2.4;t=0:pi/100:2*pi;[R,T]=meshgrid(r,t);
x=R.*cos(T);y=R.*sin(T);z=x.^2+y.^2;
subplot(1,2,1),mesh(x,y,z)
pause
x1=-2:.01:2;[X,Y]=meshgrid(x1);Z=2-X-Y;
hold on 
mesh(X,Y,Z),view(120,45)
subplot(1,2,2)
mesh(x,y,z),hold on,mesh(Z,Y,Z),view(120,65)


%% 
% 画出曲面 $(x-1/2)^2+y^2=1/4$ 与 $x^2+y^2+z^2=1$ 的交线
t=[0:0.01:2*pi+0.01]';s=t';
x=2*sin(t)*cos(s);y=2*sin(t)*sin(s);z=2*cos(t)*(0*s+1);
t1=t;s1=[-2:.01:2];
x1=1+cos(t1)*(0*s1+1);y1=sin(t1)*(0*s1+1);
z1=(0*t1+1)*s1;
figure('color',[1,1,1])
h=surf(x,y,z);
hold on
h1=surf(x1,y1,z1);
view(120,9),
light('position',[2,1,2])
lighting phong;
shading interp;axis off
camlight(-220,-170)
axis equal
set(h,'facecolor',[0,0.8,0]);
set(h1,'facecolor',[1,0,1])

%%  偏导数
% $z=\arctan\frac{x}{y}$ ,求 $\frac{\partial z}{\partial x},\frac{\partial z}{\partial y}$
 syms x y zx zy zxy dx dy
 z=atan(x/y);
 zx=diff(z,x);zy=diff(z,y);
 
 zx=simple(zx);zy=simple(zy);
 disp([zx,zy]);
 
% 求 $\frac{\partial^2 z}{\partial x\partial y}$ ,二阶偏导

 zxy=diff(zx,y);
 zxy=simple(zxy);
 disp(zxy)


%% 梯度
%  多元函数在一点的梯度，是由该函数对各个变量的偏导所构成的向量，即若$z=f(x,y)$为二元函数，则在
%任意点的梯度为 $$\nabla z=(f_x(x,y),f_y(x,y))$$
% 做函数$z=x^2+y^2(0\leq z\leq 4)$的图形，并作出在点(0.5,-1)的梯度向量。

r=0:.1:2;t=0:pi/30:2*pi;
[R,T]=meshgrid(r,t);
x=R.*cos(T);y=R.*sin(T);
z=x.^2+y.^2;
meshc(x,y,z)
x0=0.5;y0=-1;z0=1.25; %曲面上取点
hold on 
plot3(x0,y0,z0,'k*')
text(0.7,-1,1.25,'\leftarrow 起点')
t=0:.01:.2;
x1=0.5+t;y1=-1-t;z1=0+0*t;
plot3(x0,y0,0,'k*')%投影点

plot3(x1,y1,z1,'b') %梯度方向
text(0.75,-1.23,0,'\leftarrow 梯度方向','color' ,'r')

%在该点的梯度方向恰好为曲面在此点的等高线的法线方向相同，且指向外侧。
%想象一下如果有一个小虫沿着曲面向上爬的话，那么眼梯度方向，能以最短的距离达到曲面的顶端。
%%  梯度的计算
%求函数$z=x*\exp^{-(x^2+y^2)}$的数值梯度。
u=-2:.2:2;
[x,y]=meshgrid(u);
z=x.*exp(-x.^2-y.^2);
subplot(1,2,1)
mesh(x,y,z),
[Fx,Fy]=gradient(z,0.2,0.2);
subplot(1,2,2),
contour(u,u,z),hold on
quiver(u,u,Fx,Fy)

%gradient()是求数值梯度函数的命令。[Fx,Fy]=gradient(x)，其中Fx为其水平方向上
%的梯度，Fy为其垂直方向上的梯度，Fx的第一列元素为原矩阵第二列与第一列元素之差，
%Fx的第二列元素为原矩阵第三列与第一列元素之差除以2，
%以此类推：Fx(i,j)=(F(i,j+1)-F(i,j-1))/2。最后一列则为最后两列之差。同理，可以得到Fy。
%  x=[6,9,3,4,0;5,4,1,2,5;6,7,7,8,0;7,8,9,10,0]
%[Fx,Fy]=gradient(x)
%Fx(i,j)=(F(i,j+1)-F(i,j-1))/2
%% 几何应用
% 作出曲面$z=2x^2+y^2$的图形并作出曲面在点(1,1,3)处的切平面与法线，选择适当的角度观看。
r=0:.1:2;t=0:pi/30:2*pi;
[R,T]=meshgrid(r,t);
x=R.*cos(T);y=R.*sin(T);
z=2*x.^2+y.^2;
mesh(x,y,z)
pause
t=-1:0.1:0.2;
x2=1+4*t;y2=1+2*t;z2=4-t;
hold on 
plot3(x2,y2,z2)
%view(90,30),
pause
[x3,y3]=meshgrid(0:0.2:2,-2:0.2:3);
z3=4*x3+2*y3-3;
mesh(x3,y3,z3)
view(120,40)


%%
% 鲨鱼袭击目标的前进途径，当鲨鱼在海水中觉察到血液的存在时，就会沿着浓度增加最快的方向前行去袭击目标，如果以
% 流血源为圆点在海面上建立直角坐标系，则在海面上点P(x,y)处的血液浓度为$f(x,y)=e^{-(x^2+2y^2)/10^4}$,
%   其中，x，y单位为m，f(x,y)单位为百万分之一。
%   首先做出曲面等高图，再画出追踪图。

clear,clc,clf
x=-1.2:.1:1.2;
[x,y]=meshgrid(x);
z=exp(-(x.^2+2*y.^2)/10^4);
mesh(x,y,z)
contour(x,y,z,20)%contour(X,Y,Z,n)这里n指定了等高线的条数。
pause
hold on 
%circle(0.02)
f=inline('exp(-(x.^2+2*y.^2)/10^4)');
fx=inline('exp(-(x.^2+2*y.^2)/10^4)*(-2*x/10^4)');
fy=inline('exp(-(x.^2+2*y.^2)/10^4)*(-4*y/10^4)');
a=1;b=1;lambda=0.01;c=a;d=b;
u=fx(a,b);v=fy(a,b);s=sqrt(u^2+v^2);
hold on
for i=1:500
    a1=c+lambda*u/s;b1=d+lambda*v/s;
    a=[a,a1];b=[b,b1];
    c=a1;d=b1;
    u=fx(a1,b1);v=fy(a1,b1);
    s=sqrt(u^2+v^2);
    plot(a,b,'r')
    pause(0.05)
end
text(0.55,1,'鲨鱼位置 \rightarrow','color','b')
%% 求函数的极值
%求函数$f(x,y)=e^{2x}(x+y^2-2y)$的极值
f=inline('exp(2*x(1))*(x(1)+x(2)^2-2*x(2))');
[x,fval]=fminsearch(f,[0,0]);
disp([x,fval])%手算先求驻点
%%  条件极值
% $$min x^2+y^2-xy-2x-5y$$
% s.t. $$(x-1)^2-y\leq 0$$
% $$-2x+3y\leq 6$$
 %先建函数文件 function [c,ceq]=conl(x);
 % c=(x(1)-1)^2-x(2);
 %ceq=[];
 fun=('x(1)^2+x(2)^2-x(1)*x(2)-2*x(1)-5*x(2)');
 x0=[0,1];
 A=[-2,3];b=6;Aeq=[];beq=[];lb=[];ub=[];
 [x,fval]=fmincon(fun,x0,A,b,Aeq,beq,lb,ub,'conl');
 disp([x,fval])
 
%% 求曲面$xy-z^2+1=0$离开圆点距离最近的点
% $$min =x^2+y^2+z^2$$
% $$ xy-z^2+1=0$$
clear ,clc
fun=('x(1)^2+x(2)^2+x(3)^2');
x0=[0,0,2];
[x,fval,h]=fmincon(fun,x0,[],[],[],[],[],[],'con2');
disp([x,fval])

%% 重积分
%求积分$\iint_D\frac{x^2}{y^2}d\sigma$

syms x y
a=int(int(x^2/y^2,y,1/x,x),x,1,2)

%% 
%计算二重积分$\iint_D e^{-x^2-y^2} d\sigma$ 其中，区域D由曲线$y=\frac{2}{x},y^2=2x$
%及直线$x=2.5$围成。
 x=0.01:0.01:3;y1=1./(2*x);y2=sqrt(2*x);
 plot(x,y1,x,y2,2.5,0:0.01:3,'r'),grid on
 axis([0,3,0,3]),hold on %确定作图范围
 syms x y
 a=solve('1/(2*x)=sqrt(2*x)',x);%求出交点的x轴坐标
 y1=1/(2*x);y2=sqrt(2*x);
 f=exp(-x^2-y^2);
 jf1=int(f,y,y1,y2);jf2=int(jf1,a,2.5);
 b=vpa(jf2,5);
 disp(b)

%%
% 三重积分$\iiint_\Omega xyz dV$,其中区域$\Omega$由三坐标平面与平面$x+y+z=1$围成。
 syms x y z
 a=int(int(int(x*y*z,z,0,1-x-y),y,0,1-x),x,0,1)
 %%
 
 %用数值方法
 f=inline('x.*y.*z.*(x+y+z<1)');
 I=triplequad(f,0,1,0,1,0,1);
 disp(I)  %1/720约等于0.0014
 
%% 数值积分
%计算二重积分$\iint_D e^{-x^2-y^2} d\sigma$ 其中，$D=\{(x,y)|1\leq x^2+y^2\leq 9\}$.
% 
 f=inline('x.*exp(-x.^2)','x','y');
 dblquad(f,1,3,0,2*pi)%精确解为$\pi(e^{-1}-e^{-9})$
% 
 
%% 作业题
% $I=\int_{-1}^1\int_{-\sqrt{1-y^2}}^{\sqrt{1-y^2}} e^{-x^2/2}\sinh(x^2+y)dxdy$

syms x y,tic;
i1=int(exp(-x^2/2)*sinh(x^2+y),x,-sqrt(1-y^2),sqrt(1-y^2));
I=int(i1,y,-1,1),vpa(I),toc
%%
% 数值解法
tic,f=@(y,x)exp(-x.^2/2).*sinh(x.^2+y); %交换积分次序
fh=@(y)sqrt(1-y.^2);
fl=@(y)-sqrt(1-y.^2);
I=integral2(f,-1,1,fl,fh,'RelTol',1e-20),toc


