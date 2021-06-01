%%   Matlab优化工具箱
% 山东理工大学数学学院
%shixiangbupt@qq.com
%2020年3月28日

%% 优化参数设置
% optimset函数
optimset%列出一个完整的优化参数列表及其相应的可选项
%创建一个options结构，设置display为iter，Tolfun参数为1e-8
options=optimset('Display','iter','Tolfun',1e-8);

%拷贝options结构，并把TolX进行修改，同时把结果存在optnew中
optnew=optimset(options,'TolX',1e-4);
%创建options结构，其所有值都与fminbnd一致
options=optimset('fminbnd');

%% optimget函数
%用于获取最优选项参数值
val1=optimget(options,'Display');
%% fsolve函数--求解非线性方程组
% $$\left\{ \begin{array}{lcl}
% 2x_1-x_2 & = & e^{-x_1} ,\\
% -x_1+2x_2 & = &e^{-x_2} \sqrt{t}, 
% \end{array} \right. $$
% 
% 初始值  $x_0=[-5 -5]$
 
% function F=fsolveEx1(x)
% F=[2*x(1)-x(2)-exp(-x(1));-x(1)+2*x(2)-exp(-x(2))];
clear all;
x0=[-5;-5];
options=optimset('fsolve' );
options=optimset( 'Display','iter');
% options=optimoptions('fsolve','Display','iter');%显示输出选项
[x,fval,exitflag,output,jacobian]=fsolve(@fsolveEx1,x0,options)
%jacobian为输出解x处的jacobian矩阵

%%
% 解方程组
%
% $\left\{ \begin{array}{l }
% \cos x_1+\sin x_2=1  \\
% e^{x_1+x_2}-e^{2x_1-x_2}=5  
% \end{array} \right. 
% $ 

% function F = example_optim(x )
% %UNTITLED 此处显示有关此函数的摘要
% %   此处显示详细说明
% F(1)=cos(x(1))+sin(x(2))-1;
% F(2)=exp(x(1)+x(2))-exp(2*x(1)-x(2))-5;
% 
% end

 [x fval,exitflag output J]=fsolve(@example_optim,x0)% 
 % exitflag=1表示收敛到解；output表示关于算法的一些信息，J为Jacobian矩阵
opt1=optimset(@fsolve)
opt2=optimset(opt1,'Display','iter')
 [x,fval,exitflag,output,J]=fsolve(@example_optim,x0,opt2)% 设置options
%% fzero函数
%  用于求解非线性方程的根。
clear all;
fun =@(x) exp(-exp(-x))-x;
x0=[0 1];%初始解区间
options=optimset('Display','iter');
[x fval exitflag output]=fzero(fun,x0,options)
%% 最小二乘
%线性最小二乘和非线性最小二乘

%% lsqlin函数
% $$\min_x \frac{1}{2}\|C.x-d\|^2$$ 
%  $$
%     \left\{ \begin{array}{lcl}
% AX & \leq & b  \\
% Aeq.x & = & beq  \\
% lb\leq x\leq ub
% \end{array} \right. 
% $$
% 用于求解线性约束最小二乘最优问题. doc(lsqlin)
C = [
    0.9501    0.7620    0.6153    0.4057
    0.2311    0.4564    0.7919    0.9354
    0.6068    0.0185    0.9218    0.9169
    0.4859    0.8214    0.7382    0.4102
    0.8912    0.4447    0.1762    0.8936];
d = [
    0.0578
    0.3528
    0.8131
    0.0098
    0.1388];
A =[ 
    0.2027    0.2721    0.7467    0.4659
    0.1987    0.1988    0.4450    0.4186
    0.6037    0.0152    0.9318    0.8462];
b =[
    0.5251
    0.2026
    0.6721];
lb = -0.1*ones(4,1);
ub = 2*ones(4,1);
[x,resnorm,residual,exitflag,output,lambda] =lsqlin(C,d,A,b,[ ],[ ],lb,ub)
%% lsqnonneq函数
% 非负最小二乘问题 (一个最小二乘问题的无约束和非负约束的比较)
clear all;
C = [
     0.0372    0.2869
     0.6861    0.7071
     0.6233    0.6245
     0.6344    0.6170];
d = [
     0.8587
     0.1781
     0.0747
     0.8405];
[C\d, lsqnonneg(C,d)]
[norm(C*(C\d)-d), norm(C*lsqnonneg(C,d)-d)]
%% lsqcurvefit函数
% 求解曲线拟合问题的一般过程是，先通过观察曲线形状大致确定函数的形式，然后对函数的参数有个大概的估计作为初值，拟合后画出曲线来看看效果，如果效果不理想，就考虑修改初值或函数的形式再试。有时候需要经过多次尝试才能得到满意的结果。
% 需要特别注意以下两点：
%  
% 1、与拟合函数的形式有关，如果函数形式选择不当，不可能得到理想的结果。
% 例如，对于反比例函数，比较一般的情况应该考虑取1/(c1*x+c2)+c3。
% 
% 2、拟合问题与初值关系很大，不是随便指定什么初值都行的通的。
% 
% 例如，对于本题，初值如果选择[0.5 -0.1 1]，得到的结果就不太理想；但取[1 1 1]得到的结果就比较满意。
% 代码及拟合结果如下：
clear all
x=1:5;
y=[1 0.83 0.75 0.71 0.68];
f=@(c,x)1./(c(1)*x+c(2))+c(3);
c0=[1 1 1];
[c,resnorm]=lsqcurvefit(f,c0,x,y);
plot(x,y,'.-',x,f(c,x),'r:x')
legend('原始数据','拟合数据')
%%
% 例：
clear all
f=@(c,x)1-8/9.8696.*exp(-9.8696.*c(1).*x/(c(2).^2));
 data=[0  0
1	27.33333333
2	37.46666667
3	48.5
4	57.6
5	66.53333333
6	74.43333333
8	85.33333333
10	91.1
12	95.5
14	96.53333333
17	97.3
20	97.93333333
24	98.33333333];
xdata=data(:,1);
ydata=data(:,2)./100;
c0=[1 1];
for i=1:100
c = lsqcurvefit (f, c0, xdata, ydata) ;
c0 = c; %以计算出的 c为初值进行迭代;
end
c
x=0:0.5:25;
y1=1-8/9.8696.*exp(-9.8696.*c(1).*x/(c(2).^2));
plot(xdata, ydata,'o',x,y1,'r'); 
legend ('实验数据 ','拟合曲线');
%% 线性规划和整数规划

%% 线性规划
% 优化理论中最为成熟的部分，当目标函数和约束条件都为线性时，为线性规划

%% linprog函数
% $$\min_x f^Tx$$ 
%  $$
%     \left\{ \begin{array}{lcl}
% AX & \leq & b  \\
% Aeq.x & = & beq  \\
% lb\leq x\leq ub
% \end{array} \right. 
% $$
% 
% 调用格式：x = linprog(f,A,b,Aeq,beq,lb,ub,x0,options)
%
% f(x) = –5x1 – 4x2 –6x3,
%
% subject to
%
% x1 – x2 + x3 ≤ 20
%
% 3x1 + 2x2 + 4x3 ≤ 42
%
% 3x1 + 2x2 ≤ 30
%
% 0 ≤ x1, 0 ≤ x2, 0 ≤ x3.
clear all
f = [-5; -4; -6];
A =  [1 -1  1
      3  2  4
      3  2  0];
b = [20; 42; 30];
lb = zeros(3,1);%Next, call a linear programming routine.
[x,fval,exitflag,output,lambda] = linprog(f,A,b,[],[],lb)
%% bintprog函数，求解整数规划
%  min f(x) = –9x1 – 5x2 – 6x3 – 4x4,
%
% 6x1+3x2+5x3+2x4≤9
%
% x3+x4≤1;
%
% -x1+x3≤0;
%
% x2+x4≤0
%%
% $\left(
%    \begin{array}{cccc}
%      6 & 3 & 5 & 2 \\
%      0 & 0 & 1 & 1 \\
%      -1 & 0 & 1 & 0 \\
%      0 & 1 & 0 & 1 \\
%    \end{array}
%  \right) 
% \left(
% \begin{array}{l}
% x_1\\
% x_2\\
% x_3\\
% x_4\end{array}\right)\leq
% \left(\begin{array}{l}9\\1\\0\\0\end{array}\right)$ 
% 
% 其中 x1, x2, x3, and x4 二进制整数 :
clear all
f = [-9; -5; -6; -4]; 
A = [6 3 5 2; 0 0 1 1; -1 0 1 0; 0 -1 0 1];
b = [9; 1; 0; 0];
x = bintprog(f,A,b) 
%% 非线性规划
% 求解具有非线性约束条件或非线性目标函数的数学模型。
%% fminunc函数
% [x,fval,exitflag,output,grad,hessian]=fminunc(fun,x0,options,p1,p2,...)
%说明：
%fun:使目标函数：
%options:设置优化选项参数：
%fval:返回目标函数在最优解x点的函数值：
%exitflag:返回算法的终止标志：
%output:返回优化算法信息的一个数据结构：
%grad:返回目标函数在最优解x点的梯度：
%hessian:返回目标函数在最优解x点的Hessian矩阵值。
%求函数f(X)=3*x1^2+2*x1*x2+x2^2的最小值。
%首先编写f(x)的.m文件
%function f=myfun(x)
%f=3*x(1)^2+2*x(1)*x(2)+x(2)^2;
%然后调用函数fminunc
clear all;
 
myfun=@(x) 3*x(1)^2+2*x(1)*x(2)+x(2)^2 ; % Cost function
x0=[1,1]; %起始点
[x,fval]=fminunc(myfun,x0)

%为了得到最小值，提供梯度函数,修改myfminunc.m ,把第二个输出参数作为梯度值:
% function [f,g] = myfminunc(x)
% f = 3*x(1)^2 + 2*x(1)*x(2) + x(2)^2;    % Cost function
% if nargout > 1
%    g(1) = 6*x(1)+2*x(2);
%    g(2) = 2*x(1)+2*x(2);
% end
%用 optimset把GradObj 设置为 'on'  
clear all
options = optimset('GradObj','on');
x0 = [1,1];
 %options=optimoptions('fminunc','GradObj','on');%>>which optimoptions %'optimoptions' not found.
[x,fval]=fminunc(@myfminunc,x0,options)

%% fminsearch函数
% 求多变量目标函数的最小值。x = fminsearch(fun,x0,options)
clear all
banana = @(x)100*(x(2)-x(1)^2)^2+(1-x(1))^2;%传递函数指针到fminsearch函数
[x,fval,exitflag] = fminsearch(banana,[-1.2, 1])

%
clear all
a = sqrt(2);
banana = @(x)100*(x(2)-x(1)^2)^2+(a-x(1))^2; 
[x,fval,exitflag,output] = fminsearch(banana, [-1.2, 1], optimset('TolX',1e-8))
 
%% fminbnd函数
% 求解简单的优化问题，可在固定的自变量区间内找到目标函数的最小值。x = fminbnd(fun,x1,x2,options)
clear all
x = fminbnd(@sin,0,2*pi)
 y = sin(x)
 clear all
 myfminbnd= @(x)(x-3)^2 - 1; 
x = fminbnd(myfminbnd,0,5)
 % function f = myfminbnd1(x,a)
% f = (x - a)^2;
%%
a = 1.5; % 先定义参数
myfminbnd1=@(x)(x - a)^2;
 
 x = fminbnd( myfminbnd1 ,0,1)

%% fmincon函数
% 求解约束的非线性优化问题
% x = fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon)
 % 
 % minimize f(x) = –x1x2x3, 起始点 x = [10;10;10], 约束条件:
% 0 ≤ x1 + 2x2 + 2x3 ≤ 72.
% 
% 目标函数:
% 
% function f = myfun(x)
% 
% f = -x(1) * x(2) * x(3);%
% 
% 把约束条件重写为两个式子,
% 
% –x1–2x2–2x3 ≤ 0
% 
% x1 + 2x2 + 2x3≤ 72
% 
% 因为两个约束条件是线性的, 写成矩阵乘积 A·x ≤ b, 其中
clear all
myfmincon=@(x) -x(1) * x(2) * x(3);
A = [-1 -2 -2; 1  2  2];
b = [0;72]; 
x0 = [10;10;10];     
[x,fval] = fmincon(myfmincon,x0,A,b) 
% FMINCON函数虽然是可以解决非线性约束的问题的，但是它要求目标函数和约束函数都必须是连续的，梯度也是连续的，而且该函数是根据你给的初始值来进行梯度步长收敛的，只能收索到局部最优解。
% 如果你给的初始值是个不可行解就很难收敛到最优解，最终出现的情况就是函数根本就不管你的上下限而给出的一个值。
% 解决办法：利用while，利用随机搜索的方法，找到一个可行的初始解。当然这样就有一个问题。即使搜索到解，也是局限于随机搜索到的初值的解。因此当你搜索不到好的解时，建议放弃使用这个函数。
% clear all
% myfmincon=@(x) (x(1)^4 +x(2)^4+x(3)^4+x(1)^3 +x(2)^3+x(3)^3)/(1+x(1))*(1+x(2))*(1+x(3));
% % function [c ceq] = myfmincon_nonlcon(x)
% %  c=[]    % Compute nonlinear inequalities at x.
% % ceq = x(1)*x(2)*x(3)-1   % Compute nonlinear equalities at x.
% lb=[0.1;0.1;0.1];x0=[0.1;0.1;0.1];
% [x,fval] = fmincon(myfmincon,x0,[],[],[],[],lb,[],@myfmincon_nonlcon)
%

%% 二次规划
% 目标函数最高次数为2的优化问题。二次规划为非线性规划的一种，若某非线性规划的目标函数为自变量x 的二次函数，约束条件又全是线性的，就称这种规划为二次规划。 
% 
% x = quadprog(H,f,A,b,Aeq,beq,lb,ub,x0,options)
% H,f是把目标函数化成标准形式后得到的实对称矩阵，和列向量。
% 
% 它的返回值是向量x ,X0 是x 的初始值；A,B,Aeq,Beq 定义了线性约束
% 
% 如果没有线性约束，则A=[],B=[],Aeq=[],Beq=[]；LB 和 UB 是变量 x 的下界和上界，如果上界和下界没有约束，则 LB=[]，UB=[]，OPTIONS定义了优化参数，可以使用 Matlab 缺省的参数设置。 
%  
% fval是目标函数值。lambda是Lagrange乘子，它体现哪一个约束有效。output输出优化信息。
% 编写如下程序：

% min f(x)=1/2 x1^2+x2^2-x1*x2-2 x1-6 x2
% x1 + x2 ≤ 2
% –x1 + 2x2 ≤ 2
% 2x1 + x2 ≤ 3
% 0 ≤ x1, 0 ≤ x2.
clear all
H = [1 -1; -1 2]; 
f = [-2; -6];
A = [1 1; -1 2; 2 1];
b = [2; 2; 3];
lb = zeros(2,1);
opts = optimset('Algorithm','active-set','Display','off');
[x,fval,exitflag,output,lambda] = quadprog(H,f,A,b,[],[],lb,[],[],opts);
x,fval,exitflag
 %% 多目标规划
 % 有多个目标函数的优化问题：如工厂的经营者往往希望所生产的产品能够获得高利润，同时又希望生产的成本小，耗能少，等。fgoalattain
 % x = fgoalattain(fun,x0,goal,weight,A,b,Aeq,beq,lb,ub,nonlcon) 
 % 
% 其中x, weight, goal, b, beq, lb和ub 为向量, A和Aeq为矩阵, c(x), ceq(x)和F(x)为函数，返回向量。F(x), c(x)和ceq(x)可以是非线性函数。
%
% 试图通过变化x来使目标函数fun达到goal指定的目标。初值为x0,weight参数指定权重
%
% 约束条件为线性不等式A*x <= b，还提供线性等式Aeq*x = beq 。当没有不等式存在时，设置A=[]、b=[]。
%
% 将目标达到问题归结为nonlcon参数定义的非线性不等式c(x)或非线性等式ceq(x)
% 
% nonlcon参数：  该函数计算非线性不等式约束c(x) <=0和非线性等式约束ceq(x)=0。nonlcon函数是一个包含函数名的字符串，该函数可以是M文件、内部函数或MEX文件。
% 
% nonlcon函数需要输入向量x，返回两个变量—x处的非线性不等式向量c和x处的非线性等式向量ceq。例如，若nonlcon='mycon'，则M文件的形式如下：   function [c,ceq] = mycon(x)
% 
% nonlcon参数：  该函数计算非线性不等式约束c(x) <=0和非线性等式约束ceq(x)=0。nonlcon函数是一个包含函数名的字符串，该函数可以是M文件、内部函数或MEX文件。
% 
% nonlcon函数需要输入向量x，返回两个变量—x处的非线性不等式向量c和x处的非线性等式向量ceq。例如，若nonlcon='mycon'，则M文件的形式如下：   function [c,ceq] = mycon(x)
% c = ...         
% x处的非线性不等式。  ceq = ...      
% x处的非线性等式。 
% if nargout > 2  
% 被调用的nonlcon函数，有4个输出。 
%
% GC = ...     
% 不等式的梯度。     GCeq = ...  
% 等式的梯度。  end
% 
% 若nonlcon函数返回m元素的向量c和长度为n的x，则c(x)的梯度GC是一个n*m的矩阵，
% 其中GC(i,j)是c(j)对x(i)的偏导数。同样，若ceq是一个p元素的向量，则ceq(x)的梯度Gceq是一个n*p的矩阵，
% 其中Gceq(i,j)是ceq(j)对x(i)的偏导数。
% 
% weight变量  为权重向量，可以控制低于或超过fgoalattain函数指定目标的相对程度。
% 
% 当goal的值都是非零值时，为了保证活动对象超过或低于的比例相当，将权重函数设置为abs(goal) (活动对象为阻止解处目标改善的对象集合)。
% 
% 当加权函数weight为正时，fgoalattain函数试图使对象小于目标值。为了使目标函数大于目标值，将权重weight设置为负。
% 
% 为了使目标函数尽可能地接近目标值，使用GoalsExactAchieve参数，将fun函数返回的第一个元素作为目标。 
% 
% [x,fval,attainfactor] =fgoalattain(fun,x0,goal,weight,A,b,Aeq,beq,lb,ub,nonlcon) 
% x:最优解
%  
% fval:每个目标函数最优值
% attainfactor：超出或未到 目标 的 量
% fun：目标 函数，由于 是多目标函数，所以这是一个 向量
% x0，自变量的 初始值
% goal:目标，是个向量
% weight:各个 目标 的权重
% 下面三个同线性优化一样
% Ax<=b
% Aeq*x=beq
% lb<x<ub
% 
% nonlcon与非线性约束函数fmincon中一样
% 权重是由你给出的，你想两个目标函数分别要求极大和极小，
%
% 那有可能他们无法同时被满足（即当一函数到极小时另一函数无法达到极大）所以需要一权重来控制他们之间的平衡。
% 例如：某工厂因生产需要，欲采购一种原料，市场上这种原料有两个等级，甲级单价2元/kg，乙级单价1元/kg,
% 现要求总费用不超过200元，购得原料总量不少于100kg，其中甲级原料不少于50kg，问如何确定方案。
 
% 列出方程 x1>=50
%
% x1*2+x2*1<=200
% x1+x2<=100
% x1,x2>=0
% min f1=x1*2+x2*1
% min f2=-x1-x2
% min f3=x1
% s.t :
% x1*2+x2*1<=200
% -x1-x2<=-100
% -x1<=-50
% x1,x2>=0
%  matlab程序
clear all
 fun='[2*x(1)+x(2),-x(1)-x(2),-x(1)]';
 a=[2 1;-1 -1;-1 0];
 b=[200,-100 20]';
 goal=[200,-100,-50];
 weight=goal;
 x0=[55 55];
 lb=[0 0]';
 [x, fval,attaifactor,exitflag]=fgoalattain(fun,x0,goal,weight,a,b,[],[],lb,[])
 
% fgoalattain函数是多目标规划早期的算法，目的是把多目标转化为单目标，给每个目标函数一个权重weight，然后去求解。
% 再来一个实例：
% min    (x1-1)^2+(x2-2)^2+(x3-3)^2
 % min    x1^2+2*x2^2+3*x3^2
% s.t.     x1+x2+x3=6
%          x1,x2,x3>=0
% 建立个m文件：
% function y=myfgoalattain1(v,options)
% x1=v(1);
% x2=v(2);
% x3=v(3);
% y(1)=(x1-1)^2+(x2-2)^2+(x3-3)^2;
% y(2)=x1^2+x2^2+x3^2;
%命令窗求解：
clear all
[x,fval]=fgoalattain(@myfgoalattain1,[1 1 1],[1 1],[1 1],[],[],[1 1 1],[6],[0 0 0],[])
% 练习： 某钢铁公司因生产需要欲采购一批钢材，市面上的钢材有两种规格，第1种规格的单价为3500元/t，
% 第2种规格的单价为4000元/t.要求购买钢材的总费用不超过1000万元，够得钢材总量不少于2000t.
% 问如何确定最好的采购方案，使购买钢材的总费用最小且购买的总量最多.  

%%  fminimax函数
% 通常我们遇到的都是目标函数的最大化和最小化问题，但是在某些情况下，则要求最大值的最小化才有意义。
% 例如城市规划中需要确定急救中心、消防中心的位置，可取的目标函数应该是到所有地点最大距离的最小值，
% 而不是到所有目的地的距离和为最小。这是两种完全不同的准则，在控制理论、逼近论、决策论中也使用最大最小化原则。
% x = fminimax(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon) 其中x, b, beq, lb和ub为向量，A和Aeq为矩阵,c(x), ceq(x)和F(x)为函数，返回向量。F(x),c(x)和ceq(x)可以是非线性函数。
%  Matlab优化工具箱中采用序列二次规划法求解最大最小化问题。
% 
% 描述： 
% fminimax：使多目标函数中的最坏情况达到最小化。给定初值估计，该值必须服从一定的约束条件。?
%
% x=fminimax(fun,x0)初值为x0，找到fun函数的最大最小化解x。
%
% x=fminimax(fun,x0,A,b)给定线性不等式A*x<=b，求解最大最小化问题。
%
% x=fminimax(fun,x,A,b,Aeq,beq) 给定线性等式，Aeq*x=beq，求解最大最小化问题。
%
% 如果没有不等式存在，设置A=[]、b=[]。

%%
% 例题 ：求解下列最优化问题，使下面各目标函数中的最大值最小：
% 其中
% 首先编写一个计算x处五个函数的M文件myfminimax1.m。
%function f=myfminimax1(x) 
% f(1)= 2*x(1)^2+x(2)^2-48*x(1)-40*x(2)+304;
%  f(2)= -x(1)^2-3*x(2)^2; 
% f(3)= x(1)+3*x(2)-18;
% f(4)= -x(1)- x(2); 
% f(5)= x(1) + x(2) - 8;
 clear all
% 然后调用优化过程(磁盘中M文件为myfminimax1.m)：
 x0 = [0.1; 0.1];       % 提供解的初值
[x,fval] = fminimax(@myfminimax1,x0)
% 经过7次迭代以后，得到问题的解
%
 % ；例题 2  定位问题：设某城市有某种物品的10个需求点，第i个需求点Pi的坐标为（ai,bi）,%
 % 道路网与坐标轴平行，彼此正交。现打算建一个该物品的供应中心，且由于受到城市某些条件的限制，
 % 该供应中心只能设在x界于[5，8]，y界于[5，8]的范围内。问该中心应建在何处为好？ 
 % Pi点的坐标为：    
 %  ai: 1  4  3  5  9  12  6  20  17  8   
 %            bi: 2  10 8  18 1  4   5  10  8   9  
 % 设供应中心的位置为（x,y），要求它到最远需求点的距离尽可能小，由于此处应采用沿道路行走的距离，
 % 可知用户Pi到该中心的距离为|x-ai|+|y-bi|，从而可得目标函数如下         
 %     约束条件为  首先编写一个计算x处10个目标函数的M文件myfminimax2.m。
 % function f = myfminimax2(x)
 % 输入各个点的坐标值 
 % a=[1  4  3  5  9  12  6  20  17  8];
 % b=[2  10 8  18 1  4   5  10  8   9]; 
 % f(1) = abs(x(1)-a(1))+abs(x(2)-b(1));
 % f(2) = abs(x(1)-a(2))+abs(x(2)-b(2));
 % f(3) = abs(x(1)-a(3))+abs(x(2)-b(3));
 % f(4) = abs(x(1)-a(4))+abs(x(2)-b(4));
 % f(5) = abs(x(1)-a(5))+abs(x(2)-b(5));
 % f(6) = abs(x(1)-a(6))+abs(x(2)-b(6));
 % f(7) = abs(x(1)-a(7))+abs(x(2)-b(7));
 % f(8) = abs(x(1)-a(8))+abs(x(2)-b(8)); 
 % f(9) = abs(x(1)-a(9))+abs(x(2)-b(9));
 % f(10) = abs(x(1)-a(10))+abs(x(2)-b(10));
 %  然后输入初值、约束条件并调用优化过程进行计算(M文件为myfminimax2.m)：
 clear all
   x0 = [6; 6];      
 % 提供解的初值
  AA=[-1 0 ;  1  0  ;  0 -1 ;   0  1]; 
 bb=[-5;8;-5;8];  
 [x,fval] = fminimax(@myfminimax2,x0,AA,bb) 
 % 可见，在限制区域内的东北角设置供应中心可以使该点到各需求点的最大距离最小。最小最大距离为14个距离单位。
 %% 灵敏度分析
 % 许多实际问题中，数学模型中的数据未知，需要根据实际情况进行估计和预测，这一点很难做到准确，因此需要
 % 研究数据的变化对最优解产生的影响，即所谓的灵敏度分析。
 %
 % $max -5x_1+5x_2+13x_3$
 % 
 % $\left\{
%   \begin{array}{l}
%    - x_1+x_2+3x_3\leq20  \\
%     12x_1+4x_2+10x_3\leq90 \\          
%     x_1,x_2,x_3\geq0,i=1,2,3 
%   \end{array}
% \right.$
% 
% # 目标函数中 $x_3$的系数 $c_3$由13变为13.12；
% # $b_1$由20变为21；
% # A的列[-1;12]变为[-1.1;12.5];
% # 增加约束条件 $2x_1+3x_2+5x_3\leq 50$.
c=[5 -5 -13]';
A=[-1 1 3;12 4 10];
b=[20 90]';
lb=zeros(3,1);
disp('原问题的最优解为：'); 
x=linprog(c,A,b,[],[],lb)
%%
% % 第一小题
c1=c;
c1(3)=13.12;
disp('当目标函数中x3的系数由13变为13.12时，相应的最优解为：'); 
x1=linprog(c1,A,b,[],[],lb)
disp('最优解的变化情况为'); % 新解与原解的各个分量差
e1=x1-x
%%
% 第二小题
b1=b;
b1(1)=21;
disp('当b1由20变为21时，相应的最优解为：'); 
x2=linprog(c,A,b1,[],[],lb)
disp('最优解的变化情况为'); 
e2=x2-x
%%
% 第三小题
A1=A;
A1(:,1)=[-1.1 12.5]';
disp('当A的列变化时相应的最优解为：'); 
x3=linprog(c,A1,b,[],[],lb)
disp('最优解的变化情况为'); 
e3=x3-x
%%
% 第四小题
A=[A;2 3 5];
b=[b;50];
disp('当增加一个约束时相应的最优解为：'); 
x4=linprog(c,A,b,[],[],lb)
disp('最优解的变化情况为'); 
e4=x4-x
 %% 练习
 % 设有400万资金，要求4年内使用完，若在一年内使用资金x万元，则可得效益 $\sqrt{x}$万元，效益
 % 不能当年使用，当年不用的资金可存入银行，年利率10%，试制定出资金使用计划，以使4年效益之和
 % 最大。
 % 
 % 设 $x_i$ 表示第i年所使用的资金数。目标是 $max
 % z=\sqrt{x_1}+\sqrt{x_2}+\sqrt{x_3}+\sqrt{x_4}$
 % 
 % $\left\{
%   \begin{array}{l}
%     x_1\leq400  \\
%     1.1x_1+x_2\leq440 \\
%     1.21x_1+1.1x_2+x_3\leq484 \\
%     1.331x_1+1.21x_2+1.1x_3+x_4\leq532.4 \\
%     x_i\geq0,i=1,2,3,4
%   \end{array}
% \right.$
 
% [86.1883,104.2878,126.1882,152.6880],最大效益和为：43.086
%%
% 极小化罗森布洛克Rosenbrock函数 $f(x)=100(x_2-x_1^2)^2+(1-x_1)^2$
%
% 最优解为(1,1)处。
%%
% 用fminunc函数求解下面函数在极小点处的梯度即Hessian矩阵： $f(x)=x_1^2+x_2^2-4x_1+2x_2+7$

%% 求解二次规划问题
% $\min (x_1-1)^2+(x_2-2.5)^2$,使得
% $\left\{
%   \begin{array}{l}
%     x_1-2x_2+2\geq 0  \\
%     -x_1-2x_2+6\geq 0 \\
%     -x_1+2x_2+23\geq0 \\
%     x_1\geq0,x_2\geq0
%   \end{array}
% \right.$

% 参考结果：[1.4,1.7],0.8

 %% 参考文献
 
 % 蔡旭晖等，《MATLAB基础与应用教程》第二版，人民邮电出版社，2019年1月。
  %
  % 黄少罗等，《MATLAB2016数学计算与工程分析从入门到精通》，机械工业出版社，2017年1月。
  