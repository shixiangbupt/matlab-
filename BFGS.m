function [ xstar,fxstar,iter ] = BFGS( f_name,x0,flag,varepsilon )
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
tic
k=0;
n=length(x0);B=eye(n,n);xk=x0;a0=1;h0=1;t=2;e=1e-3;
if flag==0
    g=MyGradient(f_name,xk); %�����ݶ�
elseif flag==1
    [f,g]=feval(f_name,xk);%�����ݶȹ�ʽֱ�Ӽ���Ŀ�꺯�����ݶ�ֵ
end
while norm(g)>varepsilon
    dk=Gauss2(B,-g,1);
    lambda=p618(f_name,xk,dk,a0,h0,t,e);
    xkplus1=xk+lambda*dk;
    if flag==0
        gkplus1=MyGradient(f_name,xkplus1);
    elseif flag==1
        [f,gkplus1]=feval(f_name,xkplus1);
    end
    yk=gkplus1-g;sk=xkplus1-xk;
    B=B+(yk*yk')/(yk'*sk)-(B*sk*sk'*B)/(sk'*B*sk);
    xk=xkplus1;g=gkplus1;
    k=k+1;
end
xstar =xk;fxstar=feval(f_name,xk);iter=k;
toc;


end

