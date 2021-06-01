%% ��Ԫ΢���ּ���Ӧ�þ���
% ɽ������ѧ��ѧԺ
%shixiangbupt@qq.com
%2020��3��29��

%% �����Ŀռ��������ͼ��
% ����
 [x,y,z]=sphere(40);%�뾶Ϊ1����
 x=4*x;y=4*y;z=4*z;
 mesh(x,y,z)%�뾶Ϊ4����
 title('��뾶Ϊ4')

%% Ҳ�����ü����귽ʽ
% �뾶Ϊ4������ͼ������ͼ����һ��  $x^2+y^2+z^2=16$ 
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
%�ò���������ͼ
ezmesh('2*sin(u)*cos(v)','2*sin(u)*sin(v)','2*cos(u)',[0,pi,0,2*pi])


%%   
%�����н��뾶 $R$ �ı�� $x^2,y^2,z^2$ �Ĳ�ͬϵ�����ɵõ�������ͼ�Ρ�



%% ��ת����
 % �ֱ�������ת������ $z=x^2+y^2$ ��׶�� $z^2=x^2+y^2$ ��ͼ�Ρ�
   r=0:.1:2;t=0:pi/30:2*pi;
   [R,T]=meshgrid(r,t);
   x=R.*cos(T);y=R.*sin(T);
   z=x.^2+y.^2;
   subplot(1,2,1),mesh(x,y,z)
   z1=sqrt(z);z2=-z1;
   subplot(1,2,2),mesh(x,y,z1) 
   hold on ,mesh(x,y,z2)
   %�������ͼ��ʾ��
   
%% ����Ľ���
% �������� $z=x^2+y^2(0\leq z\leq 2)$ ��ƽ�� $x+y+z=2$ �ڿռ�Ľ��ߡ�
% �������£�
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
% �������� $(x-1/2)^2+y^2=1/4$ �� $x^2+y^2+z^2=1$ �Ľ���
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

%%  ƫ����
% $z=\arctan\frac{x}{y}$ ,�� $\frac{\partial z}{\partial x},\frac{\partial z}{\partial y}$
 syms x y zx zy zxy dx dy
 z=atan(x/y);
 zx=diff(z,x);zy=diff(z,y);
 
 zx=simple(zx);zy=simple(zy);
 disp([zx,zy]);
 
% �� $\frac{\partial^2 z}{\partial x\partial y}$ ,����ƫ��

 zxy=diff(zx,y);
 zxy=simple(zxy);
 disp(zxy)


%% �ݶ�
%  ��Ԫ������һ����ݶȣ����ɸú����Ը���������ƫ�������ɵ�����������$z=f(x,y)$Ϊ��Ԫ����������
%�������ݶ�Ϊ $$\nabla z=(f_x(x,y),f_y(x,y))$$
% ������$z=x^2+y^2(0\leq z\leq 4)$��ͼ�Σ��������ڵ�(0.5,-1)���ݶ�������

r=0:.1:2;t=0:pi/30:2*pi;
[R,T]=meshgrid(r,t);
x=R.*cos(T);y=R.*sin(T);
z=x.^2+y.^2;
meshc(x,y,z)
x0=0.5;y0=-1;z0=1.25; %������ȡ��
hold on 
plot3(x0,y0,z0,'k*')
text(0.7,-1,1.25,'\leftarrow ���')
t=0:.01:.2;
x1=0.5+t;y1=-1-t;z1=0+0*t;
plot3(x0,y0,0,'k*')%ͶӰ��

plot3(x1,y1,z1,'b') %�ݶȷ���
text(0.75,-1.23,0,'\leftarrow �ݶȷ���','color' ,'r')

%�ڸõ���ݶȷ���ǡ��Ϊ�����ڴ˵�ĵȸ��ߵķ��߷�����ͬ����ָ����ࡣ
%����һ�������һ��С�����������������Ļ�����ô���ݶȷ���������̵ľ���ﵽ����Ķ��ˡ�
%%  �ݶȵļ���
%����$z=x*\exp^{-(x^2+y^2)}$����ֵ�ݶȡ�
u=-2:.2:2;
[x,y]=meshgrid(u);
z=x.*exp(-x.^2-y.^2);
subplot(1,2,1)
mesh(x,y,z),
[Fx,Fy]=gradient(z,0.2,0.2);
subplot(1,2,2),
contour(u,u,z),hold on
quiver(u,u,Fx,Fy)

%gradient()������ֵ�ݶȺ��������[Fx,Fy]=gradient(x)������FxΪ��ˮƽ������
%���ݶȣ�FyΪ�䴹ֱ�����ϵ��ݶȣ�Fx�ĵ�һ��Ԫ��Ϊԭ����ڶ������һ��Ԫ��֮�
%Fx�ĵڶ���Ԫ��Ϊԭ������������һ��Ԫ��֮�����2��
%�Դ����ƣ�Fx(i,j)=(F(i,j+1)-F(i,j-1))/2�����һ����Ϊ�������֮�ͬ�����Եõ�Fy��
%  x=[6,9,3,4,0;5,4,1,2,5;6,7,7,8,0;7,8,9,10,0]
%[Fx,Fy]=gradient(x)
%Fx(i,j)=(F(i,j+1)-F(i,j-1))/2
%% ����Ӧ��
% ��������$z=2x^2+y^2$��ͼ�β����������ڵ�(1,1,3)������ƽ���뷨�ߣ�ѡ���ʵ��ĽǶȹۿ���
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
% ����Ϯ��Ŀ���ǰ��;�����������ں�ˮ�о��쵽ѪҺ�Ĵ���ʱ���ͻ�����Ũ���������ķ���ǰ��ȥϮ��Ŀ�꣬�����
% ��ѪԴΪԲ���ں����Ͻ���ֱ������ϵ�����ں����ϵ�P(x,y)����ѪҺŨ��Ϊ$f(x,y)=e^{-(x^2+2y^2)/10^4}$,
%   ���У�x��y��λΪm��f(x,y)��λΪ�����֮һ��
%   ������������ȸ�ͼ���ٻ���׷��ͼ��

clear,clc,clf
x=-1.2:.1:1.2;
[x,y]=meshgrid(x);
z=exp(-(x.^2+2*y.^2)/10^4);
mesh(x,y,z)
contour(x,y,z,20)%contour(X,Y,Z,n)����nָ���˵ȸ��ߵ�������
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
text(0.55,1,'����λ�� \rightarrow','color','b')
%% �����ļ�ֵ
%����$f(x,y)=e^{2x}(x+y^2-2y)$�ļ�ֵ
f=inline('exp(2*x(1))*(x(1)+x(2)^2-2*x(2))');
[x,fval]=fminsearch(f,[0,0]);
disp([x,fval])%��������פ��
%%  ������ֵ
% $$min x^2+y^2-xy-2x-5y$$
% s.t. $$(x-1)^2-y\leq 0$$
% $$-2x+3y\leq 6$$
 %�Ƚ������ļ� function [c,ceq]=conl(x);
 % c=(x(1)-1)^2-x(2);
 %ceq=[];
 fun=('x(1)^2+x(2)^2-x(1)*x(2)-2*x(1)-5*x(2)');
 x0=[0,1];
 A=[-2,3];b=6;Aeq=[];beq=[];lb=[];ub=[];
 [x,fval]=fmincon(fun,x0,A,b,Aeq,beq,lb,ub,'conl');
 disp([x,fval])
 
%% ������$xy-z^2+1=0$�뿪Բ���������ĵ�
% $$min =x^2+y^2+z^2$$
% $$ xy-z^2+1=0$$
clear ,clc
fun=('x(1)^2+x(2)^2+x(3)^2');
x0=[0,0,2];
[x,fval,h]=fmincon(fun,x0,[],[],[],[],[],[],'con2');
disp([x,fval])

%% �ػ���
%�����$\iint_D\frac{x^2}{y^2}d\sigma$

syms x y
a=int(int(x^2/y^2,y,1/x,x),x,1,2)

%% 
%������ػ���$\iint_D e^{-x^2-y^2} d\sigma$ ���У�����D������$y=\frac{2}{x},y^2=2x$
%��ֱ��$x=2.5$Χ�ɡ�
 x=0.01:0.01:3;y1=1./(2*x);y2=sqrt(2*x);
 plot(x,y1,x,y2,2.5,0:0.01:3,'r'),grid on
 axis([0,3,0,3]),hold on %ȷ����ͼ��Χ
 syms x y
 a=solve('1/(2*x)=sqrt(2*x)',x);%��������x������
 y1=1/(2*x);y2=sqrt(2*x);
 f=exp(-x^2-y^2);
 jf1=int(f,y,y1,y2);jf2=int(jf1,a,2.5);
 b=vpa(jf2,5);
 disp(b)

%%
% ���ػ���$\iiint_\Omega xyz dV$,��������$\Omega$��������ƽ����ƽ��$x+y+z=1$Χ�ɡ�
 syms x y z
 a=int(int(int(x*y*z,z,0,1-x-y),y,0,1-x),x,0,1)
 %%
 
 %����ֵ����
 f=inline('x.*y.*z.*(x+y+z<1)');
 I=triplequad(f,0,1,0,1,0,1);
 disp(I)  %1/720Լ����0.0014
 
%% ��ֵ����
%������ػ���$\iint_D e^{-x^2-y^2} d\sigma$ ���У�$D=\{(x,y)|1\leq x^2+y^2\leq 9\}$.
% 
 f=inline('x.*exp(-x.^2)','x','y');
 dblquad(f,1,3,0,2*pi)%��ȷ��Ϊ$\pi(e^{-1}-e^{-9})$
% 
 
%% ��ҵ��
% $I=\int_{-1}^1\int_{-\sqrt{1-y^2}}^{\sqrt{1-y^2}} e^{-x^2/2}\sinh(x^2+y)dxdy$

syms x y,tic;
i1=int(exp(-x^2/2)*sinh(x^2+y),x,-sqrt(1-y^2),sqrt(1-y^2));
I=int(i1,y,-1,1),vpa(I),toc
%%
% ��ֵ�ⷨ
tic,f=@(y,x)exp(-x.^2/2).*sinh(x.^2+y); %�������ִ���
fh=@(y)sqrt(1-y.^2);
fl=@(y)-sqrt(1-y.^2);
I=integral2(f,-1,1,fl,fh,'RelTol',1e-20),toc


