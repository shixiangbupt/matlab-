function [xstar,fxstar,iter] = p618( f_name,xk,dk,a0,h0,t,e )
% 求一元函数极值
%   此处显示详细说明
tic;
[a,b]=Trial(f_name,xk,dk,a0,h0,t,e);
if a<0
    a=0;
else
 a=a;
end
k=1;
a(k)=a;b(k)=b;
lambda(k)=a(k)+0.382*(b(k)-a(k));mu(k)=a(k)+0.618*(b(k)-a(k));
m(k)=feval(f_name,xk+lambda(k)*dk);n(k)=feval(f_name,xk+mu(k)*dk);
flag=0;
while flag==0
    if m(k)>n(k)
        if (b(k)-lambda(k))<e
            xstar=mu(k);fxstar=feval(f_name,xk+xstar*dk);
            iter=k-1;flag=1;
        else 
            a(k+1)=lambda(k);b(k+1)=b(k);
            lambda(k+1)=mu(k);
            m(k+1)=n(k);
            mu(k+1)=a(k+1)+0.618*(b(k+1)-a(k+1));
            n(k+1)=feval(f_name,xk+mu(k+1)*dk);
            k=k+1;flag=0;
        end
    else
        if (mu(k)-a(k))<e
            xstar=lambda(k);fxstar=feval(f_name,xk+xstar*dk);iter=k-1;
            flag=1;
        else
            a(k+1)=a(k);b(k+1)=mu(k);mu(k+1)=lambda(k);n(k+1)=m(k);
            lambda(k+1)=a(k+1)+0.382*(b(k+1)-a(k+1));
            m(k+1)=feval(f_name,xk+lambda(k+1)*dk);
            k=k+1;flag=0;
        end
    end
end
iter=k-1;
toc;
    
end

