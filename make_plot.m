%% ����������Ļ���
% ɽ������ѧ��ѧԺ
%shixiangbupt@qq.com
%2017��3��24��

%% ƽ��ͼ�εĻ���
%  �������� $y=xsin(x^2)$ ��[0,4*pi]�е�ͼ�Ρ�
 clear,clc,clf
 x=0:pi/100:4*pi;
 y=x.*sin(x.^2);%ע��˷����ݴε����㶼�ǡ��㡱����
 plot(x,y),grid
 

%% ͬһ�����л��Ʋ�ͬ������
% ���� $y=cos(x),y=-sin(x),x\in [-2\pi,2\pi]$ ��ͼ��
clear ,clc,clf
x=-2*pi:pi/50:2*pi;
y1=sin(x);y2=cos(x);y3=-sin(x);
plot(x,y1,x,y2,'m--',x,y3,'r*'),grid on
% doc plot% r:red g:��ɫ��b����ɫ��m���Ϻ�ɫ��k����ɫ

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
set(gca,'XTick',-2*pi:pi/2:2*pi)
set(gca,'XTickLabel',{'-2pi','-3pi/2','-pi','-pi/2','0','pi/2','pi','3pi/2','2pi'})
%% ΢���ֿ��е�һ�����޽�����������
% ���� $y=\frac{1}{x}\sin\frac{1}{x}$ �ڵ� $x=0$ ���κ��������޽磬�����������
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
title('���ߺ��������','FontSize',16,'color','b')
text(0.03,40,'\leftarrow ������','color','r','FontSize',14)
%% fplot����ƽ������
clear,clc,clf
fplot('atan(x)',[-10,10]),grid

%% polar������������ͼ��
clear,clc,clf
theta=0:.01:2*pi;
rho1=sin(2*theta)/2;%��Ҷõ���߷���
subplot(1,2,1);
polar(theta,rho1,'r')
rho2=5*cos(3*theta);
subplot(1,2,2);
polar(theta,rho2,'r')

%% ezplot������ͼ
% ��ezplot���� $y=x^2$ ,�����ߣ������� $e^x+sin(xy)=0$ �������� $x^3+y^3-3xy=0$ ��ͼ�Ρ�
clear,clc,clf
subplot(2,2,1),
ezplot('x^2',[-1,3]),grid
subplot(2,2,2),
ezplot('sin(t)^3','cos(t)^3',[0,2*pi]),grid
subplot(2,2,3),
ezplot('exp(x)+sin(x*y)',[-2,0.5,0,2.3]),grid
subplot(2,2,4),
ezplot('x^3+y^3-sin(x*y)',[-3,3]),grid
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
 %% ��mesh����
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
  Z=exp(-(X.^2+Y.^2)/8)/(2*sqrt(2*pi));
  mesh(X,Y,Z)
  figure(2)
  surf(X,Y,Z)
  % surf �������ߺͲ�Ƭ���ɫ����ͼ
  % meshc ������ͼ��ʽ�����ȸ���
  % surfc �������ߺͲ�Ƭ���ɫ����ͼ�����ȸ���
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
