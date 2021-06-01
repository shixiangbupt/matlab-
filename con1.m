function [c ceq]=con1(x)
  c=x(1)^2+x(2)^2-1;
  ceq=[];
% x = fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options)

