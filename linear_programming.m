%% ���Թ滮������Թ滮ģ��
% ɽ������ѧ��ѧѧԺ
%shixiangbupt@qq.com
%2020��3��19��

%% Matlab���Թ滮�ı�׼��ʽ
% $min z=cx;\quad s.t. \quad Ax\leq v,\quad A_1x=b_1,\quad lb\leq x\leq ub$

% [x,fval]=linprog(c,A,b,A1,b1,lb,ub)
% lb,ub�ֱ��ʾ����x��ȡֵ�Ͻ���½�
 c=[-8,-10];A=[2 1;1 2];b=[11 10]';lb=[0 0]';
 [x fval]=linprog(c,A,b,[],[],lb);
 disp([x',-fval])%�����ֵ��תΪ������Сֵ
%  Find x that minimizes 
% % f(x) = �C5x1 �C 4x2 �C6x3,
% % subject to
% % x1 �C x2 + x3 �� 20
% 3x1 + 2x2 + 4x3 �� 42
% 3x1 + 2x2 �� 30
% 0 �� x1, 0 �� x2, 0 �� x3.
clc,clear
f = [-5; -4; -6];
A =  [1 -1  1
      3  2  4
      3  2  0];
b = [20; 42; 30];
lb = zeros(3,1);
[x,fval ] = linprog(f,A,b,[],[],lb);

%% ���Թ滮��һ������
% $\min \quad f=-2x_1-x_2+x_3,\quad s.t. \quad x_1+x_2+2x_3=6,\quad
% x_1+4x_2-x_3 \leq 4,\quad 2x_1-2x_2+x_3\leq 12,\quad x_1\geq 0,x_2\geq
% 0,x_3\leq 5$
c=[-2 -1 1]';
A=[1 4 -1;2 -2 1];
b=[4,12]';
A1=[1 1 1];b1=6;
lb=[0 0 -inf]';ub=[inf,inf,5];
[x,fval]=linprog(c,A,b,A1,b1,lb,ub);
disp([x',fval])
%% 0-1�滮
% �����Թ滮ģ���У�������x��ȡֵΪ0��1��ʵ�������У��漰���벻�������⣬�����0-1�滮�йء�
% [x,fval]=bintprog(c,A,b,A1,b1)
clear,clc
c=[-3 2 -5];
A=[1 2 -1;1 4 1;1 1 0;0 4 1];
b=[2 4 63 6];
[x,fval]=bintprog(c,A,b);
disp([x',-fval])
%% �γ�ѡ�η���
% ĳѧУ�涨���˳�ѧרҵ��ѧ����ҵʱ����ѧϰ��������ѧ�Σ������˳�ѧ�Σ������ż�����Σ���Щ�γ̵ı�ţ����ơ�ѧ�ֺ��������
% ���±����������Щ���������£�һ��ѧ���ڱ�ҵʱ������Ҫѧϰ��Щ�γ�����Щ�γ̣��֣����ĳ��ѧ����ϣ��ѡ�޿γ������٣������ܻ�ýϸߵ�ѧ�֣���Ӧ�����ȷ����Ӧ��ѡ�μƻ���
% ��ģ ��xi=1��ʾ��ѧ��ѡ�γ̺�Ϊi�Ŀγ̣�����ʾδѡ���ſγ̣��������Ŀ�꺯��Ϊ $z=\sum_{i=1}^9x_i$
% ���Ա�ҵʱѡ�ε�Ҫ��Ϊ�� $x_1+x_2+x_3+x_4+x_5\geq2,\quad x_3+x_5+x_6+x_8+x_9\geq
% 3,\quad x_4+x_6+x_7+x_9\geq2$ �����޿γ̵�Ҫ��ת��Ϊ��ϵ�� $2x_3-x_1-x_2\leq 0,\quad
% x_4-x_7\leq0,\quad 2x_5-x_1-x_2\leq0,\quad 2x_9-x_1-x_2\leq 0,\quad
% x_6-x_7\leq 0,\quad x_8-x_5\leq 0.$
%
% <html>
% <table border=1><tr><td>���</td><td>�γ���</td><td>ѧ��</td><td>���</td><td>���޿�</td></tr>
% <tr><td>1</td><td>΢����</td><td>5</td><td>��ѧ</td><td> </td></tr>
% <tr><td>2</td><td>���Դ���</td><td>3</td><td>��ѧ</td><td> </td></tr>
% <tr><td>3</td><td>���Ż�����</td><td>3</td><td>��ѧ���˳�ѧ</td><td>1,2 </td></tr>
% <tr><td>4</td><td>���ݽṹ</td><td>3</td><td>��ѧ�������</td><td>7 </td></tr>
% <tr><td>5</td><td>Ӧ��ͳ��</td><td>3</td><td>��ѧ���˳�ѧ</td><td>1,2 </td></tr>
% <tr><td>6</td><td>�������</td><td>3</td><td>��������˳�ѧ</td><td>7</td></tr>
% <tr><td>7</td><td>�������</td><td>4</td><td>�����</td><td> </td></tr>
% <tr><td>8</td><td>�Զ�������</td><td>2</td><td>�˳�ѧ</td><td>5 </td></tr>
% <tr><td>9</td><td>��ѧʵ��</td><td>2</td><td>��������˳�ѧ</td><td> 1,2</td></tr></table>
% </html>
%

clear,clc
c=[1 1 1 1 1 1 1 1 1 ];
A=[-1 -1 -1 -1 -1 0 0 0 0 ;0 0 -1 0 -1 -1 0 -1 -1 ;0 0 0  -1 0 -1 -1 0 -1;-1 -1 2 0 0 0 0 0 0;0 0 0 1 0 0 -1 0 0 ;-1 -1 0 0 2 0 0 0 0;-1 -1 0 0 0 0 0 0 2;0 0 0 0 0 1 -1 0 0;0 0 0 0 -1 0 0 1 0];
b=[-2 -3 -2 0 0 0 0 0 0 ]';

[x,fval]=bintprog(c,A,b);
disp([x',fval])
%��ʱѡ�޿�Ϊ΢���֣����Դ�����Ӧ��ͳ�ƣ�������ԣ�����������Զ������ƣ���ѧ��Ϊ20��

%% ���ι滮
% ��Ŀ�꺯���������Ժ���������һ�����κ������� $f(x)=\sum a_{ij}^n x_ix_j+\sum_{i=1}^n c_i x_i+a$
% ����Ӧ��ģ�ͳ�Ϊ���ι滮���������
% ��Ŀ�꺯���ľ�����ʽΪ $f=1/2 x^THx+cx+a$ ,���� $x=(x_1,x_2,\cdots,x_n)^T$ ,��
% $a_{ij}=a_{ji}(i,j=1,2,\cdots,n)$ .
% ����ι滮 ��Ŀ�꺯��Ϊ��
% $f(x_1,x_2,x_3,x_4)=2x_1^2+3x_2^2+5x_3^2-3x_4^2+3x_1x_2-4x_1x_3+5x_1x_4+2x_2x_3+7x_2x_4-6x_3x_4+4x_1-x_2+3x_3+5x_4$
%H=[4 3 4 5 ;3 6 2 7;4 2 10 -6;5 7 -6 -6];c=[4 -1 3 5];
H=[1 -1 ;-1 2];c=[-2 -6];
A=[1 1;-1 2 ;2 1];b=[2 2 3];
lb=[0 0];ub=[inf 5];
[x,fval]=quadprog(H,c,A,b,[],[],lb,ub);
disp([x',fval])
%% ��������Լ���滮
% �﷨��[x fval]=fminsearch(f,x0,options)�� ������ $f(x,y)=e^{2x}(x+y^2+2y)$ �ļ�Сֵ��
clear,clc
f=@(x)exp(2*x(1))*(x(1)+x(2)^2+2*x(2));
x0=[0,0];
[x,fval]=fminsearch(f,x0);
disp([x,fval])

%% ��������Լ���滮
% $\min z=(x_1-1.5)^2+x_2^2,\quad x_1^2+x_2^2\leq 1,\quad 2x_1+x_2\geq
% 1,\quad x_1,x_2\geq 0$
%function [c ceq]=con1(x)
% c=x(1)^2+x(2)^2-1;
% ceq=[];
%x = fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options)
clear,clc
fun='(x(1)-1.5)^2+x(2)^2';%
x0=[0.5 0.5];
A=[-2 -1];b=-1;Aeq=[];beq=[];lb=[0, 0];ub=[];
[x,fval,h]=fmincon(fun,x0,A,b,Aeq,beq,lb,ub,'con1');
disp([x,fval,h])
%% HTML Markup Example
% This is a table:
%
% <html>
% <table border=1><tr><td>one</td><td>two</td></tr>
% <tr><td>three</td><td>four</td></tr></table>
% </html>
%
%%



 
