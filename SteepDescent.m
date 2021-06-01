function   [ xstar,fxstar,iter ] =SteepDescent( f_name,x0,flag,varepsilon )
% 最速下降法，求解无约束优化问题，
%   优点是计算量小，存储量小，对初始点无要求，缺点是容易限入局部最优，收敛较慢
tic;
k=0;xk=x0;e=1e-3;a0=1;h0=1;t=2;
if flag==0
    g=MyGradient(f_name,xk);
elseif flag==1
    [f,g]=feval(f_name,xk);
end
while norm(g)>varepsilon
    dk=-g;
    lambda=p618(f_name,xk,dk,a0,h0,t,e);
    xk=xk+lambda*dk;
    if flag==0
        g= MyGradient(f_name,xk);
   elseif flag==1
    [f,g]=feval(f_name,xk);
    end
    k=k+1;
end
xstar =xk;fxstar=feval(f_name,xk);iter=k;
toc;
end

