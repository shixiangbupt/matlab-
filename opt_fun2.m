function [y,Gy]=opt_fun2(x)
  y=1000-x(1)*x(1)-2*x(2)*x(2)-x(3)*x(3)-x(1)*x(2)-x(1)*x(3);
  Gy=[-2*x(1)-x(2)-x(3);-4*x(2)-x(1);-2*x(3)-x(1)];%�ݶȺ���