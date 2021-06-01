function y=multi_file(zeta)
% ���ļ����������������Ӻ����� ����ϵͳ�Ľ�Ծ��Ӧ
% zeta ����ϵ��
% y ��Ծ��Ӧ:����y=multi_file(3)
t=0:0.1:20;
if (zeta>=0)&(zeta<1)
    y=p1(zeta,t);
elseif zeta==1
    y=p2(zeta,t);
else
    y=p3(zeta,t);
end
plot(t,y)
title(['zeta=' num2str(zeta)])

function y=p1(z,x)
% ����ϵ����[0,1]�Ķ���ϵͳ��Ծ��Ӧ
y=1-1/sqrt(1-z^2)*exp(-z*x).*sin(sqrt(1-z^2)*x+acos(z));

function y=p2(z,x)
% ����ϵ����1�Ķ���ϵͳ��Ծ��Ӧ
y=1-exp(-x).*(1+x);

function y=p3(z,x)
% ����ϵ��>1�Ķ���ϵͳ��Ծ��Ӧ
sz=sqrt(z^2-1);
y=1-1/(2*sz)*(exp(-((z-sz)*x))./(z-sz)-exp(-((z+sz)*x))./(z+sz));

