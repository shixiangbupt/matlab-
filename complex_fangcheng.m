%% �ⷽ�̷�������
% solve����
 clear
syms x;
syms y;

E1='x*y=1';     
E2='x^y=4';
J=solve(E1,E2,x,y);%J�ǽṹ��
x=J.x;
y=J.y;
 % �����lambertw��һ������ĺ���

 x=sym('x');%���ű�������
f=sym('a*x^2+b*x+c=0');
x=solve(f)
pretty(x)%���תΪ��д��ʽ
xL=latex(x)%תΪlatexָ����Ƶ�ctex�����
 %% fzero����
 clear
syms x a b;
fx=x.^2-a*sin(x)+b;
fx=subs(fx,{a,b},{1,-2});%��a��b��ֵ
fx=char(fx);%fxת�ַ���
fx=strrep(fx,'^','.^');%�ѳ˷�����ת��Ϊ������
fx=inline(fx);%������������
x1=fzero(fx,0);%�����ĵ�һ�����
x2=fzero(fx,2);
xt=-6:.02:6;%����[-6,6]�����ڵȾ������
plot(xt,fx(xt));
hold on;
plot(xlim,[0,0],'k:')%����0�̶���
% ����fzeroÿ��ֻ�ܷ���һ�����
 clear
x01=fzero('sin(x^2)',0);%��ֵΪ0
x02=fzero('sin(x^2)',0.1);%��ֵΪ0.1
x03=fzero('sin(x^2)',-0.1);%��ֵΪ-0.1
set(gca,'Fontsize',12,'Fontname','Times new roman');
ezplot('sin(x^2)',[-2,2]);
hold on;
plot(xlim,[0,0],'k:');
% ���صĽ�����������ֵ

%% 



%% �ֹ������
% ginput����
 clear
ezplot('y^2*sin(2*y)+x^2*cos(2*x)-1',[-2,2]);
h=get(gca,'Children');%��ȡ�����Ϣ
set(h,'Color','r','LineStyle',':');
hold on;
ezplot('x^3+y^3-6*cos(2*x*y)+1',[-2,2]);
str=get(get(gca,'Title'),'String');%��ȡ��ǰtitle�е��ַ���
title(['x^2cos(2x)+y^2sin(2y)-1=0,',str]);%�����ַ���
axis equal;%���õ�λ����һ��

x0=ginput(8);%���ȡ��
Eq1='x(1)^2*cos(2*x(1))+x(2)^2*sin(2*x(2))-1';%x��Ӧ��x(1)��y��Ӧ��x(2)

Eq2='x(1)^3+x(2)^3-6*cos(2*x(1)*x(2))+1';
fun=['[',Eq1,',',Eq2,']'];
for k=1:size(x0,1);
    x=fsolve(fun,x0(k,:));
    xr(k,:)=x;
end

xr;
plot(xr(:,1),xr(:,2),'k*','markersize',10);


%% �����������ʽ����
 clear
C3=[4,3,2,1];%�������ʽ��ϵ������
C5=[1,0 ,0,2,1,10];%x^5+2X^2+x+10
C7=[1,zeros(1,6),4];%x^7+4
R3=roots(C3);%�����ʽ��
R5=roots(C5);
R7=roots(C7);

%�ƹ㵽��sqrt[n]{x_0}=roots([1,zeros(1,n-1),x_0])
roots([1,zeros(1,7-1),4]);%x^7+4�ĸ�

%��roots�෴�ĺ�����poly�����ݶ���ʽ��ȷ������ʽ
cr5=poly(R5);

%% ��fminbnd���������
% fminbnd���ⷽ������ת��Ϊ��Сֵ���⣬f(x)��[x1,x2]������㣬��ô����|f(x)|��Сֵһ�����㣬��Ӧ��λ��һ���Ƿ��̵ĸ���
 clear
fun=inline('abs([x^2-4*sin(5*x)]/[x^2+cos(x)])');
x01=fminbnd(fun,1,1.5);%����������[1,1.5]�ڵ���Сֵ
x02=fminbnd(fun,1.5,2);
plot(x01,0,'r*','markersize',14);%�ѽ⻭��ͼ��
plot(x02,0,'r*','markersize',14);

%%
% ����һ������
clc;clear;close all;
xx = linspace(1,4,200);
yy = [xx.^2-4*sin(5*xx)]./[xx.^2+cos(xx)];
plot(xx,yy,'k');
fun = inline('abs([x^2-4*sin(5*x)]/[x^2+cos(x)])');
                                     % % ת��Ϊ����f(x)�ľ���ֵ
x01 = fminbnd(fun,1,1.5) % ������Сֵ
x02 = fminbnd(fun,1.5,2) % ������Сֵ
x03 = fminbnd(fun,1,4)%����fminbnd����ʱ��Ҫ���������ڶ�����Χ�ڵļ�Сֵ����С��0�������������
[x03, fval] = fminbnd(fun,1,4) % ������Сֵ

hold on
plot(xx,abs(yy),'k:');
L=legend('{\itf}({\itx})','|{\itf}({\itx})|',0);
set(L,'Fontsize',18);
plot(x01,0,'r*','markersize',14); % �ѽ⻭��ͼ��
plot(x02,0,'r*','markersize',14); % �ѽ⻭��ͼ��
plot(x03,fval,'ro','markersize',14); % �ѽ⻭��ͼ��
plot(x03,0,'ro','markersize',14);
set(gca,'Fontsize',18);
set(gcf,'Color','w');

%% ��������
% ��ֵ��������Խ���̵ĸ������ַ��������߷���ţ�ٷ��������steffenson����
% function y=fund1(x);
% Ix=quad('sqrt(t).*sin(t).*exp(-t)',0,sin(6*x));%quad��ɢ����
% y=x-2+Ix^2;
% function y=fund2(x);
% [t,y]=ode45(@vdp1,[0 ,x],[2,0]);%matlab�Դ��ĺ���vdp1
% y=y(end,1);
% [x01,f1]=dichotomy('fund1',1,4);%dichotomy���ַ�
% [x02,f2]=dichotomy('fund2',1,4)

%% ��steffenson���ⷽ��
% function xr = steffenson(fun,x1,D);
% % ��steffenson���ⷽ��
% if nargin == 2;
%     D = 1e-6; % ����Ĭ�Ͼ���
% end
% f1 = feval(fun,x1); % ����x1���ĺ���ֵ
% dx = f1^2/[feval(fun,x1+f1)-f1]; % ���������ʽ�еĲ���
% x2 = x1;
% while abs(dx)>D;
%     x2 = x1-dx; % ����������һ��ֵ
%     x1 = x2; % ����x1��ֵ
%     f1 = feval(fun,x1); % ����x1���ĺ���ֵ
%     dx = f1^2/[feval(fun,x1+f1)-f1]; % ���µ�����ʽ�еĲ���
% end
% xr = x1; % ���ظ�
 
%%  ������ⷽ��

% function xr = secant(fun,x0,x1,D);
% % ������ⷽ��
% if nargin == 3;
%     D = 1e-6; % ����Ĭ�Ͼ���
% end
% f0 = feval(fun,x0); % ����x0���ĺ���ֵ
% f1 = feval(fun,x1); % ����x1���ĺ���ֵ
% while abs(x0-x1)>D;
%     x2 = x1- f1*[x0-x1]/[f0-f1]; % ���������ʽ
%     f0 = f1; % ����f0��ֵ
%     x0 = x1; % ����x0��ֵ
%     x1 = x2; % ����x1��ֵ
%     f1 = feval(fun,x1); % ����x1���ĺ���ֵ
% end
% xr = x2; % ���ظ�
% 
