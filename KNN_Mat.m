% %Matlab �Դ�KNN�㷨����knnclassifyʵ��
clc
close all;
clear
%����200����������
training = [mvnrnd([2  2],eye(2), 100); mvnrnd([-2 -2], 2*eye(2), 100)];
%mvnrnd([2  2],eye(2),100)��ʾ������ɶ�Ԫ��̬�ֲ�100X2����ÿһ����2��2Ϊ��ֵ��eye(2)ΪЭ����
%200����������ǰ100���Ϊ��ǩ1����100�����Ϊ��ǩ2
group = [ones(100,1); 2*ones(100,1)];
%���Ƴ���ɢ���������ݵ�
gscatter(training(:,1),training(:,2),group,'rc','*x');
hold on; 
% ���ɴ���������20��
sample = unifrnd(-2, 2, 20, 2); 
%����һ��100X2,��������е�ÿ��Ԫ��Ϊ20 ��30֮���������ȷֲ��������
K=3;%KNN�㷨��K��ȡֵ
cK = knnclassify(sample,training,group,K);
gscatter(sample(:,1),sample(:,2),cK,'rc','os');
