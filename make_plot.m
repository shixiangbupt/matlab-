%% 曲线与曲面的绘制
% 山东理工大学理学院
%shixiangbupt@qq.com
%2017年3月24日

%% 平面图形的绘制
%  画出函数 $y=xsin(x^2)$ 在[0,4*pi]中的图形。
 clear,clc,clf
 x=0:pi/100:4*pi;
 y=x.*sin(x.^2);%注意乘法和幂次的运算都是“点”运算
 plot(x,y),grid
 

%% 同一窗口中绘制不同的曲线
% 画出 $y=cos(x),y=-sin(x),x\in [-2\pi,2\pi]$ 的图形
clear ,clc,clf
x=-2*pi:pi/50:2*pi;
y1=sin(x);y2=cos(x);y3=-sin(x);
plot(x,y1,x,y2,'m--',x,y3,'r*'),grid on
% doc plot% r:red g:绿色，b：蓝色，m：紫红色，k：黑色

%% 修饰
% xlable 设置坐标轴x ；title：定义标题；text：增加文本；legend：设置图例；axis：设置坐标轴；box：设置边框
clear ,clc,clf
x=-2*pi:pi/50:2*pi;
y1=sin(x);y2=cos(x);y3=-sin(x);
plot(x,y1,x,y2,'m--',x,y3,'r*'),grid on
legend('sinx','cosx','-sinx',4)
xlabel('-2\pi\leq x\leq 2\pi')
ylabel('Y')
title('函数草图','Fontsize',16,'color','b')
axis([-2*pi,2*pi,-1,1])
set(gca,'XTick',-2*pi:pi/2:2*pi)
set(gca,'XTickLabel',{'-2pi','-3pi/2','-pi','-pi/2','0','pi/2','pi','3pi/2','2pi'})
%% 微积分课中的一个对无界和无穷大的理解
% 函数 $y=\frac{1}{x}\sin\frac{1}{x}$ 在点 $x=0$ 的任何领域中无界，但不是无穷大。
clear ,clc,clf
x1=[-0.1:0.001:-0.01];
x2=0.01:0.001:0.1;
y1=1./x1.*sin(1./x1);
y2=1./x2.*sin(1./x2);
plot(x1,y1),
grid on,hold on 
plot(x2,y2),
y3=1./x1;
plot(x1,y3,'r--',x1,-y3,'r--')
y4=1./x2;
plot(x2,y4,'r--',x2,-y4,'r--')
title('曲线和其包络线','FontSize',16,'color','b')
text(0.03,40,'\leftarrow 包络线','color','r','FontSize',14)
%% fplot绘制平面曲线
clear,clc,clf
fplot('atan(x)',[-10,10]),grid

%% polar作极坐标曲线图形
clear,clc,clf
theta=0:.01:2*pi;
rho1=sin(2*theta)/2;%四叶玫瑰线方程
subplot(1,2,1);
polar(theta,rho1,'r')
rho2=5*cos(3*theta);
subplot(1,2,2);
polar(theta,rho2,'r')

%% ezplot函数作图
% 用ezplot作出 $y=x^2$ ,心形线，隐函数 $e^x+sin(xy)=0$ 和隐函数 $x^3+y^3-3xy=0$ 的图形。
clear,clc,clf
subplot(2,2,1),
ezplot('x^2',[-1,3]),grid
subplot(2,2,2),
ezplot('sin(t)^3','cos(t)^3',[0,2*pi]),grid
subplot(2,2,3),
ezplot('exp(x)+sin(x*y)',[-2,0.5,0,2.3]),grid
subplot(2,2,4),
ezplot('x^3+y^3-sin(x*y)',[-3,3]),grid
%% 空间图形的描绘
%
%% 用plot3描绘空间图形
% 格式plot3(x,y,z,options)
% 作出由参数方程
%% 表达式
% $$
%     \left\{ \begin{array}{lll}
% x & = & e^{-0.2t}\cos\frac{\pi t}{2},\\
% z & = & \sqrt{t},\\
% y & = & e^{-0.2t}\sin\frac{\pi t}{2} \end{array} \right. 
% $$
%   $$0\leq t\leq 20$$ 
% 所确定的函数对应的曲线图形。
clear,clc,clf
t=0:.1:20;r=exp(-0.2*t);th=0.5*pi*t;
x=r.*cos(th);y=r.*sin(th);z=sqrt(t);
plot3(x,y,z)
title('helix');text(x(end),y(end),z(end),'end')
xlabel('\it x=e^{\rm-02\it t}\rm cos(\pi\it t\rm/2)')
ylabel('Y');
zlabel('Z');
axis([-1,1,-1,1,0,4])
grid on
 %% 用mesh函数
 % mesh(x,y,z,options) 
 % $$z=\frac{1}{2\sqrt{2\pi}}e^{\frac{-x^2-y^2}{8}}$$
 % 在区间[-4,4],[-5,5]上的图形
  clear ,clc
  x=1:4;y=5:10;
  [X,Y]=meshgrid(x,y);%产生网格点
  disp(X),disp(Y)%交叉点形成平面坐标
  clear ,clc,clf
  x=-4:.2:4;
  y=-5:.2:5;
  [X,Y]=meshgrid(x,y);
  Z=exp(-(X.^2+Y.^2)/8)/(2*sqrt(2*pi));
  mesh(X,Y,Z)
  figure(2)
  surf(X,Y,Z)
  % surf 以网格线和补片填充色彩作图
  % meshc 网格作图方式，带等高线
  % surfc 以网格线和补片填充色彩作图，带等高线
 %% 极坐标的方式效果更好
 % 曲面 $z=\frac{\sin\sqrt{x^2+y^2}}{\sqrt{x^2+y^2}}$ 在区域[-9,9]*[-9,9]上的图形。
 clear,clc,clf
 x=-9:.3:9;
 [x,y]=meshgrid(x);
 r=sqrt(x.^2+y.^2)+eps;%避免分母为零
 z=sin(r)./r;
 subplot(1,2,1),mesh(x,y,z)
 subplot(1,2,2),surf(x,y,z)
 %% 
 %效果不好，因为曲面为选择曲面，可考虑用极坐标方式。
 clear,clc
 theta=0:pi/30:2*pi;
 rho=0:.1:9;
 [T,R]=meshgrid(theta,rho);
 x=R.*cos(T);y=R.*sin(T);
 r=sqrt(x.^2+y.^2)+eps;
 z=sin(r)./r;
 subplot(1,2,1),mesh(x,y,z)
 subplot(1,2,2),surf(x,y,z)
  
%% 图像的进一步处理
% 设置观察点，view(alpha，beta),alpha为方位角，表达视点与y轴负向的夹角，beta变大视点与坐标原点的连线与xoy平面的夹角，默认alpha=-37.5，beta=30
% 光源设置：light('position',[n1,n2,n3])
% 着色处理：colormap('设置')
clear,clc,clf
h=surf(peaks);
set(h,'FaceLighting','phong','FaceColor','interp','AmbientStrength',0.5)
light('Position',[1 0 0],'Style','infinite');
lighting phong
axis off
set(h,'facecolor',[1,0.8,1])
colormap('cool')
shading interp
camlight(100,150)
%% 莫比乌斯带
% 曲面方程 $x=r(t,v)\cos t,y=(r,t)\sin(t),z=bv\sin \frac{t}{2}$ ,其中
% $r(t,v)=a+bv\cos\frac{t}{2}$ ，a，b为常数， $t\in [0,2\pi],v\in [-1,1]$ .
clear ,clc
ezsurf('(0.5+0.2*v*cos(t/2))*cos(t)','(0.5+0.2*v*cos(t/2))*sin(t)','0.2*v*sin(t/2)',[0,2*pi,-1,1])
light('position',[2,1,2])
lighting phong;%照明设置
shading interp;axis off%不显示坐标轴
camlight(-220,-170)% 设置光照位置
axis equal
view(60,25)

 
 
  
%%
% <http://cn.mathworks.com/help/matlab/matlab_prog/marking-up-matlab-comments-for-publishing.html>

%% LaTeX Markup Example
% This is a table:
%
% <latex>
% \begin{tabular}{|c|c|} \hline
% $n$ & $n!$ \\ \hline
% 1 & 1 \\
% 2 & 2 \\
% 3 & 6 \\ \hline
% \end{tabular}
% </latex>
