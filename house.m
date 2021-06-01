function [v,beta]=house(x)
% 此函数用来计算满足v(1)=1的v和beta使得P=I-beta*v*v'
% 是正交矩阵且P*x=norm(x)*e1

n=length(x);
if n==1
    error('请正确输入向量!');
else
    sigma=x(2:n)'*x(2:n);
    v=[1;x(2:n)];
    if sigma==0
        beta=0;
    else
        mu=sqrt(x(1)^2+sigma);
        if x(1)<=0
            v(1)=x(1)-mu;
        else
            v(1)=-sigma/(x(1)+mu);
        end
        beta=2*v(1)^2/(sigma+v(1)^2);
        v=v/v(1);
    end
end
