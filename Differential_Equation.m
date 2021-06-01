%% ΢�ַ���  differential equation
% ɽ������ѧ ��ѧѧԺ

%% Dsolve���
% ��1 1) $xy'ln x+y=ax(ln x+1)$
% 
% 3) $(y^4-3x^2)dy+xydx=0$ 

y1=dsolve('x*Dy*log(x)+y=a*x*(log(x)+1)','x')

y2=dsolve('D2y+2*Dy+5*y=sin(2*x)','x') % ����΢�ַ���

y3=dsolve('x*y*Dy+x^4-3*y^2=0','x') %��x,y�Ի�

y4=dsolve('D3y+D2y-2*Dy=x*(exp(x)+4)','x') %���׷���

%%  
s=dsolve('Dx=y','Dy=-x');
y=s.y,x=s.x

%% �г�ʼ�����ĳ�΢�ַ���
% ��2 $y''=cos 2x-y,y(0)=1,y'(0)=0$
 y=dsolve('D2y=cos(2*x)-y','y(0)=1','Dy(0)=0','x');
 simplify(y)
 
 %% ��ֵ��
 % ��3 $y'=y-2x/y,y(0)=1,0<x<4$
  dsolve('Dy=y-2*x/y','y(0)=1','x')  %������
  
  %% 
  clear
  x=0:0.1:4;
  y=sqrt(1+2*x);
  odefun=inline('s-2*t/s','t','s');
  [t,s]=ode45(odefun,[0,4],1);
  plot(x,y,'o--',t,s,'*--')
  
 % ������������[t,s]���Կ���t=4ʱ��s=3.006������ʵֵ3��һ������
 
 %% 
 % ���΢�ַ��� $\frac{d^2x}{dt^2}-1000(1-x^2)\frac{dx}{dt}+x=0,x(0)=0,x'(0)=1$
 %
 % �� $y_1=x,y_2=y_1'$ ��ԭ���̱�Ϊ�����飺
  
 % $y_1'=y2$; $y_2'=1000(1-y_1^2)y_2-y_1$; $y_1(0)=0,y_2(0)=1$
%  function dy=weifen1(t,y)
%  dy=zeros(2,1);
%  dy(1)=y(2);
%  dy(2)=1000*(1-y(1)^2)*y(2)-y(1);
 
[T,Y]=ode15s('weifen1',[0 3000],[0 1]);
plot(T,Y(:,1),'--')
 % ode15s ���ڲ�̬�����ٶ�Ҫ��ode45��
 
 %% laplace�任
  syms x w;
  f=x^2*exp(-2*x)*sin(x+pi);
  F=laplace(f,x,w)
  g=simplify(ilaplace(F)) % ���任
  
  %% laplace�任��΢������
  % $L(d f(t)/dt]=sF(s)-f(0^{+})$, $L(d^n f(t)/dt^n]=s^nF(s)-s^{n-1}f(0^+)-s^{n-2}f'(0^+)-\cdots-f^{n-1}(0^+)$
  %
  % $u(t)=e^{-5t}cos(2t+1)+5$, �� $y(0)=3,y'(0)=2,y''(0)=y'''(0)=0$,
  % ��������΢�ַ��̵Ľ����⣺
  % $y^{(4)}+10y'''(t)+35y''(t)+50y'(t)+24y(t)=5u''(t)+4u'(t)+2u(t)$
  
  syms t s;
  u=exp(-5*t)*cos(2*t+1)+5; % �����ź�����
  R=simplify(laplace(diff(u,2)+4*diff(u)+2*u)) %��ʽ�Ҷ˱��ʽ
  %%
  % �Ⱥ���ߵ�һ�� $s^4Y(s)-y(0)s^3-y'(0)s^2-y''(0)s-y'''(0)=s^4Y(s)-3s^3-2s^2$
  %
  % ����� $10s^3Y(s)-30s^2-20s,35s^2Y(s)-105s-70,50sY(s)-150,24Y(s)$
  %
  % �������źŵ�laplace�任Y(s)Ϊ��
  % $Y(s)=\frac{R(s)+3s^3+32s^2+125s+220}{s^4+10s^3+35s^2+50s+24}$
  % �Խ������laplace���任����Եó�΢�ַ��̽�����
  Y=(R+3*s^3+32*s^2+125*s+220)/(s^4+10*s^3+35*s^2+50*s+24);
  y=ilaplace(Y) 
  % fplot(y,[0,10]) 
 %%
 % ���任
 syms x t;
 G=(-17*x^5-7*x^4+2*x^3+x^2-x+1)/(x^6+11*x^5+48*x^4+106*x^3+125*x^2+75*x+17);
 f=ilaplace(G,x,t); %��ָ���ı���t�����任
 vpa(f) 
 
 
 
 
%% �ο�����

% 1) �����ȣ�����ѧʵ��(Matlab)�������İ棬ͬ�ô�ѧ�����磬2018��1��
%  
% 2��Ѧ�����MATLAB΢�������㡷���廪��ѧ�����磬2019��7��

 
