%% ����������Ļ���
% ɽ������ѧ��ѧѧԺ
%shixiangbupt@qq.com
%2020��4��14��

%%
% ���ӻ������ü����ͼ��ѧ��ͼ��������������ת��Ϊͼ�λ�ͼ������Ļ����ʾ������
% �����н�����������ۡ������ͼ�����

x=-5:0.01:5;
y1= 5*x.^2-2*x-2;
plot(x,y1,'LineWidth',1)


%% matlab���ӻ�
% ͼ�δ�����matlab���ݿ��ӻ���ƽ̨��������ں���������໥�����ġ���matlab�����������
% plot��ͼ����ʱ��ϵͳ�ͻ��Զ�����һ��ͼ�δ��ڡ�
% ��ǰ����ͨ�������һ��ʹ�õ�ͼ�δ��ڡ�
%
% figure ����һ��ͼ�δ��ڣ�figure(n) ����һ�����Ϊn�Ĵ��ڡ�
% figure('PropertyName',propertyvalue,...) ,ָ�����ڵĸ�������
% set(n),get(n) ���úͻ�ȡ���ڵĸ�������
%% ɢ��ͼ
t=0:12;   %����ʱ��t������
T=[0 32.5 46.3 78.8 85.5 96.6 107.3 110.4 115.7 118 119.2 119.8 120]; %����ʱ��T ������
plot(t,T,'r*')     %�ú�ɫ�ġ�*��������Ӧ�����ݵ�
grid on         %�������귽��

%% ��ͼ
t1=0:pi/5:4*pi;
t2=0:pi/20:4*pi;
x1=2*(cos(t1)+t1.*sin(t1));
y1=2*(sin(t1)-t1.*cos(t1));
x2=2*(cos(t2)+t2.*sin(t2));
y2=2*(sin(t2)-t2.*cos(t2));
subplot(2,2,1),plot(x1,y1,'r.'),title('ͼ1')
subplot(2,2,2),plot(x2,y2,'r.'),title('ͼ2')
subplot(2,2,3),plot(x1,y1),title('ͼ3')
subplot(2,2,4),plot(x2,y2),title('ͼ4')


%% ƽ������ͼ�εĻ���
%  �������� $y=xsin(x^2)$ ��[0,4*pi]�е�ͼ�Ρ�
 clear,clc,clf
 x=0:pi/100:4*pi;
 y=x.*sin(x.^2);%ע��˷����ݴε����㶼�ǡ��㡱����
 plot(x,y),grid
 
% ͼ�δ����й�������ʹ�ã������ļ��ĸ�ʽ


%% ͬһ�����л��Ʋ�ͬ������
% ���� $y=cos(x),y=-sin(x),x\in [-2\pi,2\pi]$ ��ͼ��
clear ,clc,clf
x=-2*pi:pi/50:2*pi;
y1=sin(x);y2=cos(x);y3=-sin(x);
plot(x,y1,x,y2,'m--',x,y3,'r*'),grid on
% doc plot% r:red g:��ɫ��b����ɫ��m���Ϻ�ɫ��k����ɫ
%%
clear
close all
x=-pi:pi/10:pi;
y1=exp(sin(x));
y2=exp(cos(x));
y3=exp(sin(x)+cos(x));
y4=exp(sin(x)-cos(x));
plot(x,y1,'b:',x,y2,'d-',x,y3,'m>:',x,y4,'rh-')

%% ����
% xlable ����������x ��title��������⣻text�������ı���legend������ͼ����axis�����������᣻box�����ñ߿�
clear ,clc,clf
x=-2*pi:pi/50:2*pi;
y1=sin(x);y2=cos(x);y3=-sin(x);
plot(x,y1,x,y2,'m--',x,y3,'r*'),grid on
legend('sinx','cosx','-sinx',4)
xlabel('-2\pi\leq x\leq 2\pi')
ylabel('Y')
title('������ͼ','Fontsize',16,'color','b')
axis([-2*pi,2*pi,-1,1])
set(gca,'XTick',-2*pi:pi/2:2*pi) %gca��ȡ��ǰ������ľ��
set(gca,'XTickLabel',{'-2pi','-3pi/2','-pi','-pi/2','0','pi/2','pi','3pi/2','2pi'})

%% 
% gtext ���������ͼ�ε�����λ�ý��б�ע
x=0:pi/50:2*pi;
plot(x,sin(x))
title('��gtext')
xlabel('x Value'),ylabel('sin(x)')
text(3*pi/4,sin(3*pi/4),'<---sin(3pi/4)')
text(5*pi/4,sin(5*pi/4),'sin(5pi/4)\rightarrow','HorizontalAlignment','right')
gtext('y=sin(x)')
%%
close all
x=linspace(0,2*pi,100);
y1=sin(x);
y2=x/2;
y3=cos(x);
plot(x,y1,'-r',x,y2,'+b',x,y3,'*g')
title('һЩͼ������')
xlabel('xValue'),ylabel('yValue')
axis([0,7,-2,3])
legend('sin(x)','x/2','cos(x)')
%%
clear
close all
x=linspace(0,2*pi,100);
y1=sin(x);
y2=cos(x);
h=plot(x,y1,'-r',x,y2,'.k');
title('���߿���')
legend(h,'sin(x)','cos(x)')
grid on


%% ΢���ֿ��е�һ�����޽�����������
% ���� $y=\frac{1}{x}\sin\frac{1}{x}$ �ڵ� $x=0$ ���κ��������޽磬�����������
clear ,clc,clf
x1=[-0.1:0.001:-0.01];
x2=0.01:0.001:0.1;
y1=1./x1.*sin(1./x1);
y2=1./x2.*sin(1./x2);
plot(x1,y1),
grid on,hold on % hold onʹ��ǰ�ἰͼ�α��ֲ���
plot(x2,y2),
y3=1./x1;
plot(x1,y3,'r--',x1,-y3,'r--')
y4=1./x2;
plot(x2,y4,'r--',x2,-y4,'r--')
title('���ߺ��������','FontSize',16,'color','b')
text(0.03,40,'\leftarrow ������','color','r','FontSize',14)
%% fplot����ƽ������
% ʵ���У���ʱ�򲢲���������ľ�����������������ѡȡ�����ݵ�����ͼ����ܻ������ʵ������ĳЩ��Ҫ
% �������ڲ�������Ӧ�㷨��������ͼ�����plot���������ĸ��⻬��
clear,clc,clf
fplot('atan(x)',[-10,10]),grid
%%
close all
% f_compare=@(x) sin(1./x);
x=linspace(0.01,0.02,50);
y=f_compare(x);
subplot(2,1,1),plot(x,y)
subplot(2,1,2),fplot('f_compare',[0.01,0.02])

[X,Y]=fplot('f_compare',[0.01,0.02] );
[n,m]=size(X)
% plot����ͼ������Ҳ������΢��һ�㡣
% 
% hh = fplot(ff);
% hh.LineWidth = 2; %����Ҫע����ĸ��Сд��
% hh.LineStyle = '--';
%%
clear
close all
% f1=@(x) sin(x)/(x^2-x+0.5)+cos(x)/(x^2+2*x-0.5);
% f2=@(x) log(sin(x)^2+2*sin(x)+8);
% f3=@(x,a,b) exp(a*sin(x)-b*cos(x));
subplot(2,2,1),fplot('f1',[0,1])% ��[0,1]��Χ
subplot(2,2,2),fplot('f2',[-2*pi,2*pi],1e-6) %������e=1*10^-6
  subplot(2,2,3),fplot('f3',[-4*pi,4*pi],[],[],[],4,2) %Ĭ�ϵ�ֵ�ÿվ���
  subplot(2,2,4),fplot('[sin(x),x,tan(x)]',[0,pi/2,0,2]) %x��y�ķ�Χ
  

%% polar������������ͼ��
clear,clc,clf
theta=0:.01:2*pi;
rho1=sin(2*theta)/2;%��Ҷõ���߷���
subplot(1,2,1);
polar(theta,rho1,'r')
rho2=5*cos(3*theta);
subplot(1,2,2);
polar(theta,rho2,'r')
%%
close all
t=linspace(0,24*pi,1000);
r=exp(cos(t))-2*cos(4.*t)+(sin(t./12)).^5;
polar(t,r)
%%
[x,y]=pol2cart(t,r); %ֱ������ϵ��ͼ��
figure
plot(x,y)

%% ezplot������ͼ
% ��ezplot���� $y=x^2$ ,�����ߣ������� $e^x+sin(xy)=0$ �������� $x^3+y^3-3xy=0$��ͼ�Ρ�
% ��һ�����ź���ͼ�λ�
clear,clc,clf
subplot(2,2,1),
ezplot('x^2',[-1,3]),grid
subplot(2,2,2),
ezplot('sin(t)^3','cos(t)^3',[0,2*pi]),grid
subplot(2,2,3),
ezplot('exp(x)+sin(x*y)',[-2,0.5,0,2.3]),grid
subplot(2,2,4),
ezplot('x^3+y^3-sin(x*y)',[-3,3]),grid

%%
clear
syms x y t
f1=exp(2*x)*sin(2*x); %���ź���
f2=x^2-y^4; %������
f3=log(abs(sin(x)+cos(y))); %������
X=exp(t)*cos(t);Y=exp(t)*sin(t); %��������
subplot(2,2,1),ezplot(f1,[-pi,pi])
subplot(2,2,2),ezplot(f2)
subplot(2,2,3),ezplot(f3,[-pi,pi,0,2*pi])
subplot(2,2,4),ezplot(X,Y,[-4*pi,4*pi])

%% ˫y������
% �Ƚ���������ͼ��
close all
x=linspace(-2*pi,2*pi,200);
y1=exp(-x).*cos(4*pi*x);
y2=2*exp(-0.5*x).*cos(2*pi*x);
plotyy(x,y1,x,y2,'plot')

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
%��ѪԴΪԲ���ں����Ͻ���ֱ������ϵ�����ں����ϵ�P(x,y)����ѪҺŨ��Ϊ$f(x,y)=e^{-(x^2+2y^2)/10^4}$,
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

%% �ռ�ͼ�ε����
%
%% ��plot3���ռ�ͼ��
% ��ʽplot3(x,y,z,options)
% �����ɲ�������
%% ���ʽ
% $$
%     \left\{ \begin{array}{lll}
% x & = & e^{-0.2t}\cos\frac{\pi t}{2},\\
% z & = & \sqrt{t},\\
% y & = & e^{-0.2t}\sin\frac{\pi t}{2} \end{array} \right. 
% $$
%   $$0\leq t\leq 20$$ 
% ��ȷ���ĺ�����Ӧ������ͼ�Ρ�
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

%%
close all
clear all
t=linspace( 0.2*pi,800);
x=t.*cos(t);
y=t.*sin(t);
z=t;
plot3(x,y,z,'r')
title('Բ׶����')
xlabel('tcos(t)'),ylabel('tsin(t)'),zlabel('t')

%% ezplot3����
clear all
syms t
x=t*cos(t);
y=t*sin(t);
z=t;
ezplot3(x,y,z,[0,20*pi]) % ������ͼ�����⣬������ϸ

ezplot3('t*cos(t)','t*sin(t)','t',[0,20*pi]) % Ӧ��������һ����ͼ

%%
ezplot3('sin(t)','cos(t)','t',[0,6*pi])

%%


 %% ��mesh����--��ά��������
 % mesh(x,y,z,options) 
 % $$z=\frac{1}{2\sqrt{2\pi}}e^{\frac{-x^2-y^2}{8}}$$
 % ������[-4,4],[-5,5]�ϵ�ͼ��
  clear ,clc
  x=1:4;y=5:10;
  [X,Y]=meshgrid(x,y);%���������
  disp(X),disp(Y)%������γ�ƽ������
  clear ,clc,clf
  x=-4:.2:4;
  y=-5:.2:5;
  [X,Y]=meshgrid(x,y);
  Z=exp(-(X.^2+Y.^2)/8)/(2*sqrt(2*pi)); %��ά��̬�ֲ����ܶȺ���ͼ��
  mesh(X,Y,Z)
  figure(2)
  surf(X,Y,Z)
  % surf �������ߺͲ�Ƭ���ɫ����ͼ
  % meshc ������ͼ��ʽ�����ȸ���
  % surfc �������ߺͲ�Ƭ���ɫ����ͼ�����ȸ���
  
  %%
  close all
x=-4:0.25:4;
y=x;
[X,Y]=meshgrid(x,y);
Z=-X.^4+Y.^4-X.^2-Y.^2-2*X*Y;
mesh(Z)
title('����')
xlabel('x'),ylabel('y'),zlabel('z')

%% 
% �Ƚ�
close all
x=-5:0.1:5;
[X,Y]=meshgrid(x);
Z=sin(sqrt(X.^2+Y.^2))./sqrt(X.^2+Y.^2);
subplot(2,2,1)
plot3(X,Y,Z)
title('plot3��ͼ')
subplot(2,2,2)
mesh(X,Y,Z)
title('mesh��ͼ')
subplot(2,2,3)
meshc(X,Y,Z)
title('meshc��ͼ')
subplot(2,2,4)
meshz(X,Y,Z)
title('meshz��ͼ')

%% �������ߵ���ά����ͼ
close all
syms x y
f=sin(x)*exp(y)+cos(y)*exp(x);
ezmesh(f,[-pi,pi],30)
title('�������ߵ���ά����ͼ')


 %% ������ķ�ʽЧ������
 % ���� $z=\frac{\sin\sqrt{x^2+y^2}}{\sqrt{x^2+y^2}}$ ������[-9,9]*[-9,9]�ϵ�ͼ�Ρ�
 clear,clc,clf
 x=-9:.3:9;
 [x,y]=meshgrid(x);
 r=sqrt(x.^2+y.^2)+eps;%�����ĸΪ��
 z=sin(r)./r;
 subplot(1,2,1),mesh(x,y,z)
 subplot(1,2,2),surf(x,y,z)
 %% 
 %Ч�����ã���Ϊ����Ϊѡ�����棬�ɿ����ü����귽ʽ��
 clear,clc
 theta=0:pi/30:2*pi;
 rho=0:.1:9;
 [T,R]=meshgrid(theta,rho);
 x=R.*cos(T);y=R.*sin(T);
 r=sqrt(x.^2+y.^2)+eps;
 z=sin(r)./r;
 subplot(1,2,1),mesh(x,y,z)
 subplot(1,2,2),surf(x,y,z)
  
 %% ��ά����
 close all
[X,Y,Z]=peaks(30);
surf(X,Y,Z)
title('ɽ�����')
xlabel('x-axis'),ylabel('y-axis '),zlabel('z-axis')
grid
%%
% ���ն�����ά����
close all
[X,Y,Z]=peaks(30); 
x=X(1,:);
y=Y(:,1); 
i=find(y>0.8 & y<1.2);
j=find(x>-.6 & x<.5); 
Z(i,j)=nan*Z(i,j);
surf(X,Y,Z);
title('�����׵�ɽ�����');
xlabel('x-axis'),ylabel('y-axis '),zlabel('z-axis')

%% ���ź����ı���ͼ
close all
syms s t
x=sin(s+t);
y=cos(s+t);
z=sin(s)+cos(t);
ezsurf(x,y,z,[-pi,pi],30)
title('���ź�������ͼ')
%% ����
close all
[X1,Y1,Z1]=sphere(8);
[X2,Y2,Z2]=sphere(20);
subplot(1,2,1)
surf(X1,Y1,Z1)
title('64������ɵ�����')
subplot(1,2,2)
surf(X2,Y2,Z2)
title('400������ɵ�����')
%% ����
% close all
% t=0:pi/10:2*pi;
% [X,Y,Z]=cylinder(2+cos(t),30);
% surf(X,Y,Z)
% axis square
% xlabel('x-axis'),ylabel('y-axis '),zlabel('z-axis')
% ��Ҫmatlab
%% ��ֵ��
close all
[x,y,z]=peaks(30);
contour3(x,y,z);
title('ɽ�庯����ֵ��ͼ');
xlabel('x-axis'),ylabel('y-axis '),zlabel('z-axis')
%%
close all
x=linspace(-2*pi,2*pi,100);
y=x;
[X,Y]=meshgrid(x,y);
Z=X.*exp(-cos(X)-sin(Y));
subplot(1,2,1);
surf(X,Y,Z);
title('����ͼ��');
subplot(1,2,2);
contour(X,Y,Z);
title('��ά��ֵ��ͼ')
%%
close all
Z=peaks;
[C,h]=contourf(Z,10);
colormap gray;
title('��ά��ֵ��ͼ����ɫ���')

%% ͼ��Ľ�һ������
% ���ù۲�㣬view(alpha��beta),alphaΪ��λ�ǣ�����ӵ���y�Ḻ��ļнǣ�beta����ӵ�������ԭ���������xoyƽ��ļнǣ�Ĭ��alpha=-37.5��beta=30
% ��Դ���ã�light('position',[n1,n2,n3])
% ��ɫ����colormap('����')
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
%%
close all
[X,Y]=meshgrid(-5:0.25:5);
Z=sin(sqrt(X.^2+Y.^2))./sqrt(X.^2+Y.^2);
subplot(2,2,1)
surf(X,Y,Z),title('��ά��ͼ')
subplot(2,2,2)
surf(X,Y,Z),view(90,0)
title('����ͼ')
subplot(2,2,3)
surf(X,Y,Z),view(0,0)
title('����ͼ')
subplot(2,2,4)
surf(X,Y,Z),view(0,90)
title('����ͼ')
%%
h1=figure;
surf(peaks); 
title('��ǰɫͼ')
h2=figure;
surf(peaks),brighten(-0.85)
title('����ɫͼ')
h3=figure;
surf(peaks),brighten(0.85)
title('��ǿɫͼ')

%% Ī����˹��
% ���淽�� $x=r(t,v)\cos t,y=(r,t)\sin(t),z=bv\sin \frac{t}{2}$ ,����
% $r(t,v)=a+bv\cos\frac{t}{2}$ ��a��bΪ������ $t\in [0,2\pi],v\in [-1,1]$ .
clear ,clc
ezsurf('(0.5+0.2*v*cos(t/2))*cos(t)','(0.5+0.2*v*cos(t/2))*sin(t)','0.2*v*sin(t/2)',[0,2*pi,-1,1])
light('position',[2,1,2])
lighting phong;%��������
shading interp;axis off%����ʾ������
camlight(-220,-170)% ���ù���λ��
axis equal
view(60,25)

 
 %% ר���о�
 % ͼ�ⷨ�ⷽ��
  % ���������� $y^2cos(x+y^2)+x^2 e^{x+y}=0$�� $(-2\pi,2\pi)$��ͼ��
   syms x y; 
   p=2*pi;
   f=y^2*cos(x+y^2)+x^2*exp(x+y);
   fimplicit(f,[-p,p])
   
   % ��Ҫ��matlab�߰汾�²��ԣ�����ΪĬ�������ܶ�С�����߲��⻬��
   fimplicit(f,[-p,p],'Meshdensity',500) %���⻬
   
   %%
   syms  x
   f=sqrt(2*x^2+3)+sqrt(x^2+3*x+2)-sqrt(2*x^2-3*x+5)-sqrt(x^2-5*x+2);
  % f=matlabFunction(f); 
   f= str2func(['@(x)',vectorize(f)])  %�����ű��ʽת��Ϊ��������ķ��� 
  fplot(f,[-5,5] ),line([-5 5],[0 0]) 
  % fplot(f ),line([-5 5],[0 0]) %�������ߣ����������ֻ��һ������
   % x=0.13809878
   
   %% 
   % ���η�����һ��ʵ��
   ezplot('x^3-4*x^2+6*x-4',[-1,5,-2,10]);
   hold on;
   plot([-1,5],[0.0,0.0],'r');
   x=0;
   y=-2:0.01:10;
   plot(x,y,'r');
   title('y=x^3-4x^2+6x-4');
   ylabel('y');
   grid on
   
   %% 
   % ��Խ�����޽�����
   f=@(x) exp(-0.2*x).*sin(3*x+2)-cos(x);
   fplot(f,[0,20]),line([0,20],[0,0])
   % x=10.9601
   
   %%
   % ��Ԫ����
   syms x y
   f1=x^2*exp(-x*y^2/2)+exp(-x/2)*sin(x*y);
   f2=y^2*cos(x+y^2)+x^2*exp(x+y);
   fimplicit([f1 f2],[-2*pi,2*pi])
   %��Ҫ�߱���
   % �ֲ��Ŵ󣬲�������(x,y)̫�࣬һ��һ��ȥ����
   
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
