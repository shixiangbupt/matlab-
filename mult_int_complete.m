%% ���ػ��ֲ���
% ɽ������ѧ��ѧѧԺ ������

%% ������Ϊ����
%  
syms x y
s=vpa(int(int(x^y,x,0,1),y,1,2))
%%
zz=inline('x.^y','x','y');
s=dblquad(zz,0,1,1,2)
%% 
 % $J=\int_{-1}^1\int_{-2}^2 e^{-x^2/2}sin(x^2+y)dxdy$
 f=@(x,y)exp(-x.^2/2).*sin(x.^2+y);
 J=integral2(f,-2,2,-1,1,'RelTol',1e-20) %ע����ִ�����y��x
 % �����������ػ�����ֵ��
 
 %% 
 syms x y
 clear f; % ����f��ǰ��f�Ѿ����������������
 % f(x,y)=exp(-x^2/2)*sin(x^2+y); %matlab�߰汾����
  f =exp(-x^2/2)*sin(x^2+y);
 I=int(int(f,y,-1,1),x,-2,2),vpa(I) %������

%% �ڻ�����Ϊ����
% ������� $\int_D e^{-x^2-y^2} dxdy$,���� $D:2xy=1,y=\sqrt{2x},x=2.5$��Χ��

x=0.0001:0.001:3;y1=1./(2*x);
y2=sqrt(2*x);
plot(x,y1,x,y2,2.5,-0.5:0.01:3);
axis([-0.5 3 -0.5 3])

%%
 syms x y
 y1='2*x*y=1'
 y2='y-sqrt(2*x)=0';
 [x,y]=solve(y1,y2)
 % �õ����� x=1/2,y=1
 %%
  %
  syms x y
  f=exp(-x^2-y^2);
  y1=1/(2*x);y2=sqrt(2*x);
  jfy=int(f,y,y1,y2);
  jfx=int(jfy,x,0.5,2.5);
  jf2=vpa(jfx)
  
  
  %% 
  % $J=\int_{-1/2}^1\int_{-\sqrt{1-x^2/2}}^{\sqrt{1-x^2/2}}e^{-x^2/2}sin(x^2+y)dydx$
  fh=@(x)sqrt(1-x.^2/2);
  fl=@(x) -sqrt(1-x.^2/2);%�ڻ��ֵ�������
  f=@(x,y)exp(-x.^2/2).*sin(x.^2+y);
  I=integral2(f,-1/2,1,fl,fh) % ��ֵ����
  %%
   syms x y
   i1=int(exp(-x^2/2)*sin(x^2+y),y,-sqrt(1-x^2/2),sqrt(1-x^2/2));
   int(i1,x,-1/2,1),I1=vpa(ans) %�������  
   
  %% ���ػ���
  % ��3.1 $s=\int_2^3dz\int_1^2dy\int_0^1 xyzdx$
  syms x y z
  s=vpa(int(int(int(x*y*z,x,0,1),y,1,2),z,2,3))
  
  %%
   w=inline('x*y*z','x','y','z');
   s=triplequad(w,0,1,1,2,2,3)
   
   %%
   % ��3.2 $\int_V (x+e^y+sin z)dx dydz$ ������ $V:z=8-x^2-y^2,x^2+y^2=4,z=0$ 
   % ��Χ�ɵı�����
   [t,r]=meshgrid(0:0.05:2*pi,0:0.05:2);
   x=r.*cos(t);
   y=r.*sin(t);
   z=8-x.^2-y.^2;
   mesh(x,y,z),hold on
   [x1,y1,z1]=cylinder(2,30); %��ת����
   z2=4*z1;
   mesh(x1,y1,z2)
   %%
   % �õ�����
   syms x y z
   f1=('z=8-x^2-y^2');
   f2=('x^2+y^2=4');
   [x ,y,z]=solve(f1,f2,'x','y','z')
   %%
   %
    clear
    syms x y z
    f=x+exp(y)+sin(z);
    z1=0;
    z2=8-x^2-y^2;
    x1=-sqrt(4-y^2);
    x2=sqrt(4-y^2);
    jfz=int(f,z,z1,z2);
    jfx=int(jfz,x,x1,x2);
    jfy=int(jfx,y,-2,2);
    vpa(jfy)
    %% 
    % integral3() ����
    % 
    % $I=\int_0^1\int_0^{\sqrt{1-x^2}}\int_{\sqrt{x^2+y^2}}^{\sqrt{2-x^2-y^2}} z^2e^{-(x+y^2)}dzdydx$
    
    tic,f=@(x,y,z)z.^2.*exp(-(x+y.^2));
    yM=@(x)sqrt(1-x.^2);
    zm=@(x,y)sqrt(x.^2+y.^2); %��������߽�
    zM=@(x,y)sqrt(2-x.^2-y.^2);
    I=integral3(f,0,1,0,yM,zm,zM,'RelTol',1e-20);
    disp(I)
    toc
  %% 
  syms x y z,zm=sqrt(x^2+y^2);
  zM=sqrt(2-x^2-y^2); 
  tic
  I=int(int(int(z^2*exp(-(x+y^2)),z,zm,zM),y,0,sqrt(1-x^2)),x,0,1);
  vpa(I)
  toc  %����������ʱ��ܳ�
  
   %% �����ػ���
   % ��ǰ��matlab�汾�����������ֵ�⣬����ѧ�߿�����NIT�����䣬���Խ����λ������߽�Ķ���������
   % ʹ��quadndg()������
   % 
   % $I=\int_0^5\int_0^4\int_0^1\int_0^2\int_0^3 \sqrt[3]{v}\sqrt{w}x^2y^3zdzdydxdwdv$
   % $I=120\sqrt[3]{5}$
%    syms x y z w v;
%    F=v^(1/3)*sqrt(w)*x^2*y^3*z;
%    tic
%    I=int(int(int(int(int(F,z,0,3),y,0,2),x,0,1),w,0,4),v,0,5)
%    toc
   % ������߱���matlab���Լ���1.71��
   
   %%
   path(path,'J:\��ѧ���2020\html\NIT������MATLAB')
    f=@(x)(x(1))^(1/3)*sqrt(x(2))*x(3)^2*x(4)^3*x(5); %��������
    tic,I=quadndg(f,[0 0 0 0 0],[5 4 1 2 3]),toc
    
    %% 
    % ��ֵ�������ʱ����������Ӷ�û�й�ϵ��
    
    
 %% ����
 y=-1:0.1:1;
 x=2.*cos(asin(y)); %��ת�����ĸ��
 [X,Y,Z]=cylinder(x,20);
 surfnorm(X(:,11:21),Y(:,11:21),Z(:,11:21)); %������
 view([120,18]) %���ƹ۲�Ƕ�
   
  