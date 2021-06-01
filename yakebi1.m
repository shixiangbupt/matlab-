function [x,number]=yakebi1(A,b,x0,er)
  % Jacobi迭代法
  % x迭代向量列，x0迭代初值，er误差，number迭代次数
  D=diag(diag(A));
  D=inv(D);
  U=triu(A,1);
  L=tril(A,-1);
  B=-D*(L+U);
  f=D*b;
  number=0;
  x=B*x0+f;
  number=number+1;
  while norm(x-x0)>er
      x0=x;
      x=B*x0+f;
      number=number+1;
  end
