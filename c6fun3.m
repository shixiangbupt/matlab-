function [y,Gy]=c6fun3(x)
y=100*(x(2)-x(1)^2)^2+(1-x(1))^2;
Gy=[-400*(x(2)-x(1)^2)*x(1)-2+2*x(1);    200*x(2)-200*x(1)^2];% ?ݶ?
 
end

