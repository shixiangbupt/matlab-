function y=multi_file(zeta)
% 多文件函数：主函数和子函数。 二阶系统的阶跃响应
% zeta 阻尼系数
% y 阶跃响应:例如y=multi_file(3)
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
% 阻尼系数在[0,1]的二阶系统阶跃响应
y=1-1/sqrt(1-z^2)*exp(-z*x).*sin(sqrt(1-z^2)*x+acos(z));

function y=p2(z,x)
% 阻尼系数＝1的二阶系统阶跃响应
y=1-exp(-x).*(1+x);

function y=p3(z,x)
% 阻尼系数>1的二阶系统阶跃响应
sz=sqrt(z^2-1);
y=1-1/(2*sz)*(exp(-((z-sz)*x))./(z-sz)-exp(-((z+sz)*x))./(z+sz));

