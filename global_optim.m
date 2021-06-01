%% 全局最优解与局部最优
% 山东理工大学数学院

%% 著名的无约束测试基准函数 Rastrigin函数
% $f(x_1,x_2)=20+x_1^2+x_2^2-10(\cos\pi x_1+\cos\pi x_2)$

ezsurf('20+x1^2+x2^2-10*(cos(pi*x1)+cos(pi*x2))')
%%
ezsurf('20+x1^2+x2^2-10*(cos(pi*x1)+cos(pi*x2))')
 view(0,90),shading flat %俯视图;

%% fminunc函数求解最小值
%  
 f=@(x)20+x(1)^2+x(2)^2-10*(cos(pi*x(1))+cos(pi*x(2)));
 x1=fminunc(f,[2,3]);f(x1)
 x2=fminunc(f,[-1,2]);f(x2)
 x3=fminunc(f,[8,2]);f(x3)
 x4=fminunc(f,[-4,6]);f(x4)
% 观察最优解的情况。多数情况下并不是全局最小点。
% 为避免局部最小，可以采用并行算法，如遗传算法，粒子群，蚁群算法

%% 
% 用随机的方式在(a,b)区域内选择初值，搜索出最优解。

% function [x,f0]=fminunc_global(f,a,b,n,N,varargin)
% k0=0;f0=Inf;
% if strcmp(class(f),'struct')
%     k0=1;
% end
% for i=1:N
%     x0=a+(b-a)*rand(n,1):
%     if k0==1
%         f.x0=x0;
%         [x1 f1 key]=fminunc(f);
%     else
%         [x1 f1 key]=fminunc(f,x0,vararin{:});
%     end
%     if key>0 & f1<f0
%         x=x1;
%         f0=f1;
%     end
% end
% f=@(x)20+x(1)^2+x(2)^2-10*(cos(pi*x(1))+cos(pi*x(2)));
% [x,f0]=fminunc_global(f,-2*pi,2*pi,2,50); %获取全局最优解

%%
% F=[]; tic, for i=1:100, [x,f0]=fminunc_global(f,-100,100,2,50); F=[F,f0]; end, toc

%% 利用梯度信息求解最优化问题
%  Rosenbrock函数 $f(x_1,x_2)=100(x_2-x_1^2)^2+(1-x_1)^2$无约束最优化问题。

[x,y]=meshgrid(0.5:0.01:1.5); 
z=100*(y.^2-x).^2+(1-x).^2;
contour3(x,y,z,100), zlim([0,310])
%最小值在图中一个很窄的白色区域内，目标函数又称为香蕉函数。
%%

f=@(x)100*(x(2)-x(1)^2)^2+(1-x(1))^2;
ff=optimset; ff.TolX=1e-10;
ff.TolFun=1e-20; 
x=fminunc(f,[0;0],ff)
% 真实最小值点为[1,1]
%% 利用梯度信息计算

% function [y,Gy]=c6fun3(x)
% y=100*(x(2)-x(1)^2)^2+(1-x(1))^2;
% Gy=[-400*(x(2)-x(1)^2)*x(1)-2+2*x(1);    200*x(2)-200*x(1)^2];% 梯度
% end
syms x1 x2; 
f=100*(x2-x1^2)^2+(1-x1)^2;
J=jacobian(f,[x1,x2])
  ff.GradObj='on'; 
  x=fminunc(@c6fun3,[0;0],ff)
  
  % 可见使用梯度信息能得出比较准确的解。
  
  %% 有边界约束的最优化问题
  
  f=@(x)[100*(x(2)-x(1)^2)^2+(1-x(1))^2] ; 
  xm=[2,3]; %如果x1属于(2,4),x2属于(3,6)范围
  xM=[4,6];% 
  
  x=fminsearchbnd(f,[0,0],xm,xM);
  % <https://www.mathworks.com/matlabcentral/fileexchange/8277-fminsearchbnd-fminsearchcon>
  
  
  %% 其他开源优化工具箱
  % LOQO来自普林斯顿大学的一个解决平滑约束优化问题的系统。问题可以是线性或非线性的，
  % 凸的或非凸的，约束的或非约束的。如果问题是凸的，LOQO能够求出一个全局最优解。
  %%
  % SNOPT是加州大学圣地亚哥分校用于解决大规模优化问题的软件包。对于函数和梯度评估
  % 代价非常昂贵的非线性问题特别有效。
  %%
  % GLPK用于解决各种线性规划问题。是GNU项目的一部分. www.gnu.org/software/glpk.
  % 也可以解部分整数规划或0,1规划问题。
  %% 
  % CVX基于MATLAB的凸优化建模系统。
  %%
  % SeDuMi用于优化二阶锥的MATLAB软件，由Lehigh大学负责开发。可以处理二次
  % 约束。
  %%
  % YALMIP免费的MATLAB软件，为其他优化工具提供了一个易于使用的界面。
  
  %% 参考文献
  
  %薛定宇，《高等应用数学问题的MATLAB求解》，第四版，清华大学出版社，2018年6月。
  




