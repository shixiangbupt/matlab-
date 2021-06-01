%%  几种机器学习算法
% 山东理工大学 数学院 周世祥
%% CART决策树算法Matlab实现
% 自带的统计三种鸢尾花样本数据fisheriris,其属性分别为花萼长度，花萼宽度，花瓣长度，花瓣宽度，标签
%分别为 'setosa','versicolor','virginica'
clear all;
close all;
clc;
load fisheriris  %载入样本数据
t = fitctree(meas,species,'PredictorNames',{'SL' 'SW' 'PL' 'PW'})%定义四种属性花萼长度，花萼宽度，花瓣长度，花瓣宽度
% 显示名称
view(t) %在命令行窗口中用文本显示决策树结构
view(t,'Mode','graph') %图形显示决策树结构

%% 剪枝
%  t1=prune(t,'level',levelvalue) %按层剪枝，levelvalue表示剪掉的层数
%
% t2=prune(t1,'nodes',nodes) % 按结点显示
%
% view(t2,'Mode','graph')  % 图形显示

t2=prune(t,'level',2);%裁剪第二层之后的决策树结点
view(t2,'Mode','graph')


%% 预测
predict(t2,[1 0.2 0.4 2]); % [1 0.2 0.4 2]为测试样本数据



%% Matlab线性回归算法Matlab实现
clear all;
close all;
clc;
load carsmall  %载入汽车数据
tbl = table(Weight,Acceleration,MPG,'VariableNames'...
,{'Weight','Acceleration','MPG'});
lm = fitlm(tbl,'MPG~Weight+Acceleration') %以Weight和Acceleration为自变量，MPG为因变量的线性回归
plot3(Weight,Acceleration,MPG,'*') %绘制数据点图
hold on
axis([min(Weight)+2 max(Weight)+2 min(Acceleration)+1 max(Acceleration)+1 min(MPG)+1 max(MPG)+1]) 
title('二元回归')  %编辑图形名称
xlabel('Weight')  %编辑x坐标轴名称
ylabel('Acceleration')  %编辑y坐标轴名称
zlabel('MPG')  %编辑y坐标轴名称
X=min(Weight):20:max(Weight)+2 ;  %生成用于绘制二元拟合面的X轴数据
Y=min(Acceleration):max(Acceleration)+1;%生成用于绘制二元拟合面的Y轴数据
[XX,YY]=meshgrid(X,Y); %生成XY轴的网格数据
Estimate = table2array(lm.Coefficients); %将计算得到的table格式的拟合参数转换为矩阵形式
Z=Estimate(1,1)+Estimate(2,1)*XX+Estimate(3,1)*YY;%计算拟合面的Z轴数据       
mesh(XX,YY,Z) %绘制网格形式的二元拟合面
hold off


%% 神经网络Matlab实践
clc
clear
close
x = [0 1 2 3 4 5 6 7 8];  % 样本属性值
t = [0 0.84 0.91 0.14 -0.77 -0.96 -0.28 0.66 0.99]; %样本的目标标签值
net = feedforwardnet(10);  %定义前馈神经网络一层隐含层，且神经元数量为10个
net = configure(net,x,t); %利用构建的网络，对网络各参数进行初始化赋值，形成初始网络
y1 = net(x);  %初始网络对输入进行计算后的输出
net = train(net,x,t); %对国建的神经网络进行训练，输出训练完成的网络
y2 = net(x); %训练完成后的网络对输入进行计算后的输出
plot(x,t,'o',x,y1,'^',x,y2,'*') %对三者数据进行绘图
legend('原始数据值','初始网络预测值','训练后网络预测值')

%% 神经网络拟合数据
% 已知样本点x,y(向量)
x=0:.5:10;
y=0.12*exp(-0.213*x)+0.54*exp(-0.17*x).*sin(1.23*x);
net=fitnet(5);
net.trainParam.epochs=1000;
[net,b]=train(net,x,y);
plotperform(b)
x0=[0:0.1:10];
y0=0.12*exp(-0.213*x0)+0.54*exp(-0.17*x0).*sin(1.23*x0);
y1=net(x0);
plot(x,y,'o',x0,y0,x0,y1,':');
%%
doc fitnet


%% 参考文献
%%
% 
% # 冷雨泉等，《机器学习入门到实践：MATLAB实践应用》，清华大学出版社，2019年3月
% # <https://zhuanlan.zhihu.com/p/30059442>
% # <https://www.cnblogs.com/yonghao/p/5061873.html>
