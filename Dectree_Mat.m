%%  ���ֻ���ѧϰ�㷨
% ɽ������ѧ ��ѧԺ ������
%% CART�������㷨Matlabʵ��
% �Դ���ͳ�������β����������fisheriris,�����Էֱ�Ϊ���೤�ȣ������ȣ����곤�ȣ������ȣ���ǩ
%�ֱ�Ϊ 'setosa','versicolor','virginica'
clear all;
close all;
clc;
load fisheriris  %������������
t = fitctree(meas,species,'PredictorNames',{'SL' 'SW' 'PL' 'PW'})%�����������Ի��೤�ȣ������ȣ����곤�ȣ�������
% ��ʾ����
view(t) %�������д��������ı���ʾ�������ṹ
view(t,'Mode','graph') %ͼ����ʾ�������ṹ

%% ��֦
%  t1=prune(t,'level',levelvalue) %�����֦��levelvalue��ʾ�����Ĳ���
%
% t2=prune(t1,'nodes',nodes) % �������ʾ
%
% view(t2,'Mode','graph')  % ͼ����ʾ

t2=prune(t,'level',2);%�ü��ڶ���֮��ľ��������
view(t2,'Mode','graph')


%% Ԥ��
predict(t2,[1 0.2 0.4 2]); % [1 0.2 0.4 2]Ϊ������������



%% Matlab���Իع��㷨Matlabʵ��
clear all;
close all;
clc;
load carsmall  %������������
tbl = table(Weight,Acceleration,MPG,'VariableNames'...
,{'Weight','Acceleration','MPG'});
lm = fitlm(tbl,'MPG~Weight+Acceleration') %��Weight��AccelerationΪ�Ա�����MPGΪ����������Իع�
plot3(Weight,Acceleration,MPG,'*') %�������ݵ�ͼ
hold on
axis([min(Weight)+2 max(Weight)+2 min(Acceleration)+1 max(Acceleration)+1 min(MPG)+1 max(MPG)+1]) 
title('��Ԫ�ع�')  %�༭ͼ������
xlabel('Weight')  %�༭x����������
ylabel('Acceleration')  %�༭y����������
zlabel('MPG')  %�༭y����������
X=min(Weight):20:max(Weight)+2 ;  %�������ڻ��ƶ�Ԫ������X������
Y=min(Acceleration):max(Acceleration)+1;%�������ڻ��ƶ�Ԫ������Y������
[XX,YY]=meshgrid(X,Y); %����XY�����������
Estimate = table2array(lm.Coefficients); %������õ���table��ʽ����ϲ���ת��Ϊ������ʽ
Z=Estimate(1,1)+Estimate(2,1)*XX+Estimate(3,1)*YY;%����������Z������       
mesh(XX,YY,Z) %����������ʽ�Ķ�Ԫ�����
hold off


%% ������Matlabʵ��
clc
clear
close
x = [0 1 2 3 4 5 6 7 8];  % ��������ֵ
t = [0 0.84 0.91 0.14 -0.77 -0.96 -0.28 0.66 0.99]; %������Ŀ���ǩֵ
net = feedforwardnet(10);  %����ǰ��������һ�������㣬����Ԫ����Ϊ10��
net = configure(net,x,t); %���ù��������磬��������������г�ʼ����ֵ���γɳ�ʼ����
y1 = net(x);  %��ʼ�����������м��������
net = train(net,x,t); %�Թ��������������ѵ�������ѵ����ɵ�����
y2 = net(x); %ѵ����ɺ�������������м��������
plot(x,t,'o',x,y1,'^',x,y2,'*') %���������ݽ��л�ͼ
legend('ԭʼ����ֵ','��ʼ����Ԥ��ֵ','ѵ��������Ԥ��ֵ')

%% �������������
% ��֪������x,y(����)
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


%% �ο�����
%%
% 
% # ����Ȫ�ȣ�������ѧϰ���ŵ�ʵ����MATLABʵ��Ӧ�á����廪��ѧ�����磬2019��3��
% # <https://zhuanlan.zhihu.com/p/30059442>
% # <https://www.cnblogs.com/yonghao/p/5061873.html>
