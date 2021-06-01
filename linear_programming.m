%% 线性规划与非线性规划模型
% 山东理工大学数学学院
%shixiangbupt@qq.com
%2020年3月19日

%% Matlab线性规划的标准形式
% $min z=cx;\quad s.t. \quad Ax\leq v,\quad A_1x=b_1,\quad lb\leq x\leq ub$

% [x,fval]=linprog(c,A,b,A1,b1,lb,ub)
% lb,ub分别表示变量x的取值上界和下界
 c=[-8,-10];A=[2 1;1 2];b=[11 10]';lb=[0 0]';
 [x fval]=linprog(c,A,b,[],[],lb);
 disp([x',-fval])%求最大值先转为先求最小值
%  Find x that minimizes 
% % f(x) = –5x1 – 4x2 –6x3,
% % subject to
% % x1 – x2 + x3 ≤ 20
% 3x1 + 2x2 + 4x3 ≤ 42
% 3x1 + 2x2 ≤ 30
% 0 ≤ x1, 0 ≤ x2, 0 ≤ x3.
clc,clear
f = [-5; -4; -6];
A =  [1 -1  1
      3  2  4
      3  2  0];
b = [20; 42; 30];
lb = zeros(3,1);
[x,fval ] = linprog(f,A,b,[],[],lb);

%% 线性规划的一个例题
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
%% 0-1规划
% 在线性规划模型中，若变量x的取值为0或1，实际问题中，涉及做与不做的问题，大多与0-1规划有关。
% [x,fval]=bintprog(c,A,b,A1,b1)
clear,clc
c=[-3 2 -5];
A=[1 2 -1;1 4 1;1 1 0;0 4 1];
b=[2 4 63 6];
[x,fval]=bintprog(c,A,b);
disp([x',-fval])
%% 课程选课方案
% 某学校规定：运筹学专业的学生毕业时至少学习过两门数学课，三门运筹学课，和两门计算机课，这些课程的编号，名称。学分和所属类别
% 由下表给出。在这些限制条件下，一个学生在毕业时最少需要学习这些课程中哪些课程？又，如果某个学生既希望选修课程数量少，而又能获得较高的学分，他应该如何确定相应的选课计划。
% 建模 以xi=1表示该学生选课程号为i的课程，而表示未选该门课程，则问题的目标函数为 $z=\sum_{i=1}^9x_i$
% 。对毕业时选课的要求为： $x_1+x_2+x_3+x_4+x_5\geq2,\quad x_3+x_5+x_6+x_8+x_9\geq
% 3,\quad x_4+x_6+x_7+x_9\geq2$ 而先修课程的要求转化为关系： $2x_3-x_1-x_2\leq 0,\quad
% x_4-x_7\leq0,\quad 2x_5-x_1-x_2\leq0,\quad 2x_9-x_1-x_2\leq 0,\quad
% x_6-x_7\leq 0,\quad x_8-x_5\leq 0.$
%
% <html>
% <table border=1><tr><td>编号</td><td>课程名</td><td>学分</td><td>类别</td><td>先修课</td></tr>
% <tr><td>1</td><td>微积分</td><td>5</td><td>数学</td><td> </td></tr>
% <tr><td>2</td><td>线性代数</td><td>3</td><td>数学</td><td> </td></tr>
% <tr><td>3</td><td>最优化方法</td><td>3</td><td>数学，运筹学</td><td>1,2 </td></tr>
% <tr><td>4</td><td>数据结构</td><td>3</td><td>数学，计算机</td><td>7 </td></tr>
% <tr><td>5</td><td>应用统计</td><td>3</td><td>数学，运筹学</td><td>1,2 </td></tr>
% <tr><td>6</td><td>汇编语言</td><td>3</td><td>计算机，运筹学</td><td>7</td></tr>
% <tr><td>7</td><td>程序设计</td><td>4</td><td>计算机</td><td> </td></tr>
% <tr><td>8</td><td>自动化控制</td><td>2</td><td>运筹学</td><td>5 </td></tr>
% <tr><td>9</td><td>数学实验</td><td>2</td><td>计算机，运筹学</td><td> 1,2</td></tr></table>
% </html>
%

clear,clc
c=[1 1 1 1 1 1 1 1 1 ];
A=[-1 -1 -1 -1 -1 0 0 0 0 ;0 0 -1 0 -1 -1 0 -1 -1 ;0 0 0  -1 0 -1 -1 0 -1;-1 -1 2 0 0 0 0 0 0;0 0 0 1 0 0 -1 0 0 ;-1 -1 0 0 2 0 0 0 0;-1 -1 0 0 0 0 0 0 2;0 0 0 0 0 1 -1 0 0;0 0 0 0 -1 0 0 1 0];
b=[-2 -3 -2 0 0 0 0 0 0 ]';

[x,fval]=bintprog(c,A,b);
disp([x',fval])
%此时选修课为微积分，线性代数，应用统计，汇编语言，程序设计与自动化控制，总学分为20。

%% 二次规划
% 若目标函数不是线性函数，而是一个二次函数，即 $f(x)=\sum a_{ij}^n x_ix_j+\sum_{i=1}^n c_i x_i+a$
% 则相应的模型称为二次规划，引入矩阵
% 则目标函数的矩阵形式为 $f=1/2 x^THx+cx+a$ ,这里 $x=(x_1,x_2,\cdots,x_n)^T$ ,而
% $a_{ij}=a_{ji}(i,j=1,2,\cdots,n)$ .
% 设二次规划 的目标函数为：
% $f(x_1,x_2,x_3,x_4)=2x_1^2+3x_2^2+5x_3^2-3x_4^2+3x_1x_2-4x_1x_3+5x_1x_4+2x_2x_3+7x_2x_4-6x_3x_4+4x_1-x_2+3x_3+5x_4$
%H=[4 3 4 5 ;3 6 2 7;4 2 10 -6;5 7 -6 -6];c=[4 -1 3 5];
H=[1 -1 ;-1 2];c=[-2 -6];
A=[1 1;-1 2 ;2 1];b=[2 2 3];
lb=[0 0];ub=[inf 5];
[x,fval]=quadprog(H,c,A,b,[],[],lb,ub);
disp([x',fval])
%% 非线性无约束规划
% 语法：[x fval]=fminsearch(f,x0,options)。 案例： $f(x,y)=e^{2x}(x+y^2+2y)$ 的极小值。
clear,clc
f=@(x)exp(2*x(1))*(x(1)+x(2)^2+2*x(2));
x0=[0,0];
[x,fval]=fminsearch(f,x0);
disp([x,fval])

%% 非线性有约束规划
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



 
