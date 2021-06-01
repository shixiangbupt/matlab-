%% BFGS�㷨
% ɽ������ѧ ��ѧѧԺ

%% ��ţ�ٷ�BFGS
% <https://blog.csdn.net/u012507032/article/details/77923960>
%
%  BGFS��һ��׼ţ���㷨, ��ν��"׼"��ָţ���㷨��ʹ��Hessian�����������Ż�, ����ֱ�Ӽ���Hessian����Ƚ��鷳, ���Ժܶ��㷨��ʹ�ý��Ƶ�Hessian, ��Щ�㷨�ͳ���׼ţ���㷨(Quasi Newton Algorithm).
%
%   ţ���㷨(Newton Algorithm)
%   ţ���㷨�����˺����Ķ��׵���, ��һ�ֶ����Ż�����, �������������������Ż������ı���. ��Ϊ�Ա�, �ݶ��½�(Gradient Descent)ֻ�����˺�����һ�׵���, ��һ���Ż�����. BFGS�㷨����Ϊ����ֵЧ����õ���ţ�ٷ������Ҿ���ȫ�������Ժ�
% �����������ٶȡ�
% 
% ţ�ٷ����ص��ǣ������ٶȿ죬���������٣����ǵ�Hessian
% ����ܳ���ʱ��ÿ�ε����ļ������ܴ��������ݹ�ģ��������ôHessian�����Խ��
% ��Ҫ�Ĵ洢�ռ�����࣬������Ҳ��������ʱ��󵽲��ɼ��㣬������Ժ������ݵļ��㣬ţ�ٷ��������á�
% ��ţ�ٷ�����ţ�ٷ��Ļ�����������Hessian����Ľ��ƾ��󣬱���ÿ�ε���������Hessian������棬��
% �������ٶȽ����ݶ��½�����ţ�ٷ�֮�䡣��ţ�ٷ���ţ�ٷ�һ����Ҳ�ǲ��ܴ���̫���ģ�����ݣ���Ϊ����
% ���ʹ洢�ռ�Ὺ���ܶࡣ��ţ�ٷ���Ȼÿ�ε�������ţ�ٷ�������֤�����Ż��ķ��򣬵��ǽ��ƾ���ʼ����
% �����ģ�����㷨ʼ���ǳ������Ż��ķ�����������
%
% ��ţ�ٷ��Ļ���˼������ţ�ٷ�����Hessian�����ĳ�����ƾ��������������ڸ����У�ѧ��̩�չ�ʽ������
%  
% $f(x)=\frac{f(x_0)}{0!}+\frac{f'(x_0)}{1!}(x-x_0)+\frac{f''(x_0)}{2!}(x-x_0)^2+\cdots+R_n(x)$
% 
%  ����̩��չ���ĸ������ݣ����Բο����̩�չ�ʽ���ܣ�̩�չ�ʽӦ�á�̩�չ�ʽ����һ�����ƵĶ���ʽ
%  ������ԭ�����ӵĺ������ʽ��������ţ�ٷ���˵���������ģ�͡�����
%
% $f(X)=f(X_{i+1})+(X-X_{i+1})^T\bigtriangledown  f(X_{i+1})+\frac{1}{2}(X-X_{i+1})^T H_{i+1}(X-X_{i+1})+o(X-X_{i+1})$
% 
% ���Ը߽�����С���֣������󵼵õ� $\bigtriangledown  f(X)\doteq  \bigtriangledown
% f(X_{i+1})+H_{i+1}(X-X_{i+1})$,�� $X=X_i$ ,�õ� $H_{i+1}^{-1}
% (\bigtriangledown f(X_{i+1}-\bigtriangledown  f(X_i))\doteq
% (X_{i+1}-X_i)$ ,����H����ά�ȳ����������ǳ����ѣ����㸴�Ӷȷǳ��ߡ�BFGS�㷨
% �㷨���ʣ�һ��ͨ�������ƽ�����ţ���㷨��
%
% BFGS�㷨������Broyden��Fletcher, Goldfarb��Shanno��λţ�˷������������ڵ�40����ʱ�������Ȼ����Ϊ����õ���ţ���㷨
%% LogisticԤ��ģ��
% ĳũ��ƷĶ����(kg/Ķ)����ʷ������֪����Ԥ��1985�꣬1990�꣬1995�꣬2000���Ķ������
% Logistic����ģ�� $y=\frac{k}{1+me^{-at}}$,���У� $a,m$�Ǵ���ϵ���� $k$�Ǳ���ֵ�������ȸ�����
% ����1985-1982������Ϊ1,2,...,25��������ʷ���ݵ�ɢ��ͼ�����ֳ�S�͡�
%
% ������� $a,m$ ���㣺
%
% $\min_{a,m}\sum_{i=1}^{25}(\hat{y}-\frac{k}{1+me^{-at}})^2$
%
% ��������С�������⡣
% 
% �Ƚ���Ŀ�꺯���ļ�examLogistic.m

% function y=examLogistic(x)
% yhat=1e-3*[185 350 263 335 560 570 263 214 276 435 476 452 442 404 458 427 409 430 421 444 539 632 749 690 679]';
% for i=1:25
%     z(i)=(yhat(i)-1/(1+x(2)*exp(-i*x(1))))^2;
% end
% y=sum(z);

%%

% function [ xstar,fxstar,iter ] = BFGS( f_name,x0,flag,varepsilon )
% %UNTITLED3 �˴���ʾ�йش˺�����ժҪ
% %   �˴���ʾ��ϸ˵��
% tic
% k=0;
% n=length(x0);B=eye(n,n);xk=x0;a0=1;h0=1;t=2;e=1e-3;
% if flag==0
%     g=MyGradient(f_name,xk); %�����ݶ�
% elseif flag==1
%     [f,g]=feval(f_name,xk);%�����ݶȹ�ʽֱ�Ӽ���Ŀ�꺯�����ݶ�ֵ
% end
% while norm(g)>varepsilon
%     dk=Gauss2(B,-g,1);
%     lambda=p618(f_name,xk,dk,a0,h0,t,e);
%     xkplus1=xk+lambda*dk;
%     if flag==0
%         gkplus1=MyGradient(f_name,xkplus1);
%     elseif flag==1
%         [f,gkplus1]=feval(f_name,xkplus1);
%     end
%     yk=gkplus1-g;sk=xkplus1-xk;
%     B=B+(yk*yk')/(yk'*sk)-(B*sk*sk'*B)/(sk'*B*sk);
%     xk=xkplus1;g=gkplus1;
%     k=k+1;
% end
% xstar =xk;fxstar=feval(f_name,xk);iter=k;
% toc;
% end

%%

% unction x = Gauss2(A,b,flag  )
% %UNTITLED4 �˴���ʾ�йش˺�����ժҪ
% %   �˴���ʾ��ϸ˵��
% if nargin<3
%     flag=0;
% end
% n=length(b);
% A=[A,b];
% for k=1:n-1 %ѡ��Ԫ
%     [Ap,p]=max(abs(A(k:n,k)));
%     p=p+k-1;
%     if p>k
%         t=A(k,:);A(k,:)=A(p,:);A(p,:)=t;
%     end
%     A((k+1):n,(k+1):(n+1))=A((k+1):n,(k+1):(n+1))-A((k+1):n,k)/A(k,k)*A(k,(k+1):(n+1));
%     A((k+1):n,k)=zeros(n-k,1);
%     if flag==0
%         A
%     end
% end
% 
% x=zeros(n,1) %�ش�
% x(n)=A(n,n+1)/A(n,n);
% for k=n-1:-1:1
%     x(k,:)=(A(k,n+1)-A(k,(k+1):n)*x((k+1):n))/A(k,k);
% end
% 
% 
% end

%%

% function [xstar,fxstar,iter] = p618( f_name,xk,dk,a0,h0,t,e )
% % ��һԪ������ֵ
% %   �˴���ʾ��ϸ˵��
% tic;
% [a,b]=Trial(f_name,xk,dk,a0,h0,t,e);
% if a<0
%     a=0;
% else
%  a=a;
% end
% k=1;
% a(k)=a;b(k)=b;
% lambda(k)=a(k)+0.382*(b(k)-a(k));mu(k)=a(k)+0.618*(b(k)-a(k));
% m(k)=feval(f_name,xk+lambda(k)*dk);n(k)=feval(f_name,xk+mu(k)*dk);
% flag=0;
% while flag==0
%     if m(k)>n(k)
%         if (b(k)-lambda(k))<e
%             xstar=mu(k);fxstar=feval(f_name,xk+xstar*dk);
%             iter=k-1;flag=1;
%         else 
%             a(k+1)=lambda(k);b(k+1)=b(k);
%             lambda(k+1)=mu(k);
%             m(k+1)=n(k);
%             mu(k+1)=a(k+1)+0.618*(b(k+1)-a(k+1));
%             n(k+1)=feval(f_name,xk+mu(k+1)*dk);
%             k=k+1;flag=0;
%         end
%     else
%         if (mu(k)-a(k))<e
%             xstar=lambda(k);fxstar=feval(f_name,xk+xstar*dk);iter=k-1;
%             flag=1;
%         else
%             a(k+1)=a(k);b(k+1)=mu(k);mu(k+1)=lambda(k);n(k+1)=m(k);
%             lambda(k+1)=a(k+1)+0.382*(b(k+1)-a(k+1));
%             m(k+1)=feval(f_name,xk+lambda(k+1)*dk);
%             k=k+1;flag=0;
%         end
%     end
% end
% iter=k-1;
% toc;  
% end

%%

% function g= MyGradient( f_name,x )
% % ���õ��в帴ֵ���󵼹�ʽ������ĳ���ϵ�����
% % �����󵼹�ʽ���������ò�ֵ�Ľ����ϳ��Ľ����һ����3�㹫ʽ������5�㹫ʽ��
% %    
% n=length(x);h0=1e-3;E=eye(n);g=zeros(n,1);y0=feval(f_name,x);
% for j=1:n
%     h=h0.*E(:,j);
%     for i=1:4
%         y(i)=feval(f_name,x+i*h); z(i)=feval(f_name,x-i*h);
%     end
%    d(1)=(-25*y0+48*y(1)-36*y(2)+16*y(3)-3*y(4))/(12*h0); 
%    d(2)=(-3*z(1)-10*y0+18*y(1)-6*y(2)+y(3))/(12*h0);
%    d(3)=(z(2)-8*z(1)+8*y(1)-y(2))/(12*h0);
%    d(4)=(3*y(1)+10*y0-18*z(1)+6*z(2)-z(3))/(12*h0);
%    d(5)=(25*y0-48*z(1)+36*z(2)-16*z(3)+3*z(4))/(12*h0);
%    g(j)=mean(d);
% end
% end

%%
 
% function [a,b,c ] = Trial( f_name,xk,dk,a0,h0,t,e )
% %UNTITLED2 �˴���ʾ�йش˺�����ժҪ
% %   �˴���ʾ��ϸ˵��
% MaxIterations=500;
% Iterations=0;
% f0=feval(f_name,xk+a0*dk);%��ʼ�㺯��ֵ
% a1=a0+h0;f1=feval(f_name,xk+a1*dk);
% while abs(f1-f0)<e
%     a1=a1+t*h0;f1=feval(f_name,xk+a1*dk);
% end
% if f1>f0
%     a2=a0-h0;
%     f2=feval(f_name,xk+a2*dk);
%     while f2<=f0
%         a2=a2-t*h0;
%         f2=feval(f_name,xk+a2*dk);
%         Iterations=Iterations+1;
%     if Iterations>MaxIterations
%         break
%     end
%     end
%     
%  
% a=a2;b=a1;c=a0;
% elseif f1<f0
%     a2=a1+t*h0;
%     f2=feval(f_name,xk+a2*dk);
%     while f2<=f1
%         a2=a2+t*h0;
%         f2=feval(f_name,xk+a2*dk);
%     Iterations=Iterations+1;    
%     if Iterations>MaxIterations
%         break
%     end
% end
% a=a0;b=a2;c=a1;
% end
% fa=feval(f_name,xk+a*dk);fb=feval(f_name,xk+b*dk);fc=feval(f_name,xk+c*dk);
% if (fa<fc)&(fc<fb)
%     fprintf('�������������������ǵ�����������û�а�����С��ĵ�����')
% elseif(fa>fc) &(fc>fb)
%      fprintf('�������������������ǵ�����������û�а�����С��ĵ�����')
% end

%% 
% ѡȡ��ֵ(1,1)^T,������BFGS.m���㣺


[xstar,fxstar,iter]=BFGS(@examLogistic,[1,1]',0,1e-3)

% xstar =
% 
%     0.0596
%     2.7571
% fxstar =
% 
%     0.2548

%% ��ϰ
% ��ĳ����ҵ��Ʒ�������У��䵥λ��Ʒ���뺬��0.5%����Ч��������֪��Ʒ�е�����
% ��ʱ�����Ӷ����٣��ڲ�Ʒ�����û�֮ǰ�����8���ڣ���������˥����0.49%������
% �ǲ�Ʒ����һ��ʱ���۲쵽�����ɲ�Ʒ����Ч�����ĺ�����
% �ٶ�8�ܺ������ģ�� $y=a+(0.49-a)e^{-b(x-8)}$���Խ��Ͳ�Ʒ����8�ܺ�x>8����Ч��������y�Ĺ�ϵ��������С���˷���
% ����a,b. ��ʼ������ѡ[1,1]
%
% <html>
% <table>
% <tr><td>��Ʒ�������ʱ��/�� </td><td>8 </td><td>8</td><td>10</td><td>10</td><td>10</td><td>10</td><td>12</td><td>12</td><td>12</td><td>12</td><td>14</td><td></td></tr>
% <tr><td>��Ч����İٷֱ�/% </td><td>0.49</td><td>0.49</td><td>0.48</td><td>0.47</td><td>0.48</td><td>0.47</td><td>0.46</td><td>0.46</td><td>0.45</td><td>0.45</td><td>0.43</td></tr>
% <tr><td></td></tr>
% <tr><td></td></tr>
% </table>
% <table>
% <tr><td>��Ʒ�������ʱ��/�� </td><td>14 </td><td>14</td><td>16</td><td>16</td><td>16</td><td>18</td><td>18</td><td>20</td><td>20</td><td>20</td><td>22</td></tr>
% <tr><td>��Ч����İٷֱ�/% </td><td>0.43</td><td>0.43</td><td>0.44</td><td>0.43</td><td>0.43</td><td>0.46</td><td>0.45</td><td>0.42</td><td>0.42</td><td>0.43</td><td>0.41</td></tr>
% <tr><td></td></tr>
% <tr><td></td></tr>
% </table>
% <table>
% <tr><td>��Ʒ�������ʱ��/�� </td><td>22 </td><td>22</td><td>24</td><td>24</td><td>24</td><td>26</td><td>26</td><td>26</td><td>28</td><td>28</td><td>30</td></tr>
% <tr><td>��Ч����İٷֱ�/% </td><td>0.41</td><td>0.40</td><td>0.42</td><td>0.40</td><td>0.40</td><td>0.41</td><td>0.41</td><td>0.41</td><td>0.41</td><td>0.40</td><td>0.40</td></tr>
% <tr><td></td></tr>
% <tr><td></td></tr>
% </table>
% <table>
% <tr><td>��Ʒ�������ʱ��/�� </td><td>30 </td><td>30</td><td>32</td><td>32</td><td>34</td><td>36</td><td>36</td><td>38</td><td>38</td><td>40</td><td>42</td></tr>
% <tr><td>��Ч����İٷֱ�/% </td><td>0.40</td><td>0.38</td><td>0.41</td><td>0.40</td><td>0.40</td><td>0.38</td><td>0.38</td><td>0.40</td><td>0.40</td><td>0.39</td><td>0.39</td></tr>
% <tr><td></td></tr>
% <tr><td></td></tr>
% </table>
% </html>
%
% �ο��⣺[0.3868,0.0953] 

%% �����½���

% function   [ xstar,fxstar,iter ] =SteepDescent( f_name,x0,flag,varepsilon )
%   �����½����������Լ���Ż����⣬
%     �ŵ��Ǽ�����С���洢��С���Գ�ʼ����Ҫ��ȱ������������ֲ����ţ���������
% tic;
% k=0;xk=x0;e=1e-3;a0=1;h0=1;t=2;
% if flag==0
%     g=MyGradient(f_name,xk);
% elseif flag==1
%     [f,g]=feval(f_name,xk);
% end
% while norm(g)>varepsilon
%     dk=-g;
%     lambda=p618(f_name,xk,dk,a0,h0,t,e);
%     xk=xk+lambda*dk;
%     if flag==0
%         g= MyGradient(f_name,xk);
%    elseif flag==1
%     [f,g]=feval(f_name,xk);
%     end
%     k=k+1;
% end
% xstar =xk;fxstar=feval(f_name,xk);iter=k;
% toc;
% end

% MATLAB�Դ��ĺ���fminunc.m����ʵ�������½��������Լ����С�����⡣�����½���
% ֻ�Ǹú���ʹ�õ��㷨֮һ��
%% ����
% (Sylverter����) ��ƽ������6���㣬���ҳ����������������СԲ�̡�����Ϊ
% (-1,5),(4,1),(7,-4),(10,9),(3,4),(8,2).
%
% Sylvester���⣺ $n$���㣬�ҳ������� $n$�������СԲ�̡�������Ϊ $p_i=(a_i,b_i),i=1,2,\cdots,n$
% ƽ��������� $p(x_1,x_2)$ �� $p_i$����Ϊ��
%
% $d_i=\sqrt{(x_1-a_i)^2+(x_2-b_i)^2},i=1,2,\cdots,n$
%
% ���ǣ��� $p$�㵽����������������С��Ϊ������СԲ�̣���p���������㣺
%
% $\min_{x_1,x_2}\max_{1\leq i\leq n} d_i=\min_{x_1,x_2}\max_{1\leq i\leq n}\sqrt{(x_1-a_i)^2+(x_2-b_i)^2}$
%
% ��Ϊ��Լ���ļ�С��������⣬ʵ���ϣ������������� $d_i,d_j$�е����ֵ���Ա�ʾΪ��
%
% $\max\{d_i,d_j\}=\frac{(d_i+d_j)+|d_i-d_j|}{2}$
%
% ��дĿ�꺯����

%function y = Sylvester(x) 
%UNTITLED4 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
% A=[-1 -5;4 1;7 -4;10 9;3 4;8 2];[m,n]=size(A);
% for i=1:m
%     d(i)=sqrt((x(1)-A(i,1))^2+(x(2)-A(i,2))^2);
% end
% y=d(1);
% for i=2:m
%     y=((y+d(i))+abs(y-d(i)))/2;
% end
%%
   [ xstar,fxstar,iter ] =SteepDescent(@Sylvester,[1,1]',0,1e-3 )
   
% �ο���� xstar = 4.4974    2.0020


%% �ο�����

% �ũ�����˳�ѧ��������MATLABӦ�á����廪��ѧ�����磬2016��10�¡�