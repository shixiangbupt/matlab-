%% K�����㷨��ʵ��
% ɽ������ѧ ��ѧԺ ������
% �ı����࣬���������Ԥ�������ģʽʶ��ͼ���������
% 
% 
% #    ��ʼ������ֵΪ���ֵ�����������������е�������
% #   ���������������ÿ��ѵ�������ľ���dist��
% #   �õ�Ŀǰk�����ڽ������е�������maxdist��
% #   ���distС��maxdist���򽫸�ѵ��������Ϊk���ڽ�������
% #   �ظ����裨2������3������4����ֱ��δ֪����������ѵ�������ľ��붼���ꣻ
% #   ͳ��k�ڽ�������ÿ�����ų��ֵĴ�����
% #   ѡ�����Ƶ������������Ϊδ֪���������š�

% ������һ������Ӧ��Ϊ����ĳһ��ӰΪ����Ƭ��������Ƭ�����ȣ���Ҫ������֪��ǩ��������ͨ���˹�ͳ�Ƶ�Ӱ
% �д򶷾�ͷ�ͽ��Ǿ�ͷ����������Ӧ�ĵ�Ӱ���б�ǩ��ע��֮�������һ��δ�����ĵ�Ӱ��ͨ����������ķ�ʽ
% �ж���Ϊ����Ƭ���ǰ���Ƭ��

%%

clear all;
close all;
clc;
%%���ø�˹�ֲ������ɶ���Ƭ���ݺͱ�ǩ
aver1=[8 3];  %��ֵ
covar1=[2 0;0 2.5];  %2ά���ݵ�Э����
data1=mvnrnd(aver1,covar1,100);   %������˹�ֲ�����
for i=1:100    %���˹�ֲ����������еĸ���Ϊ0
    for j=1:2   %��Ϊ�򶷾�ͷ���ͽ��Ǿ�ͷ������Ϊ����
        if data1(i,j)<0
            data1(i,j)=0;
        end
    end
end
label1=ones(100,1);  %���������ݵı�ǩ����Ϊ1
plot(data1(:,1),data1(:,2),'+');  %��+���Ƴ�����
axis([-1 12 -1 12]); %�趨�������᷶Χ
xlabel('�򶷾�ͷ��'); %��Ǻ���Ϊ�򶷾�ͷ��
ylabel('���Ǿ�ͷ��'); %�������Ϊ���Ǿ�ͷ��
hold on;
%%���ø�˹�ֲ������ɰ���Ƭ���ݺͱ�ǩ
aver2=[3 8];
covar2=[2 0;0 2.5];
data2=mvnrnd(aver2,covar2,100); %������˹�ֲ�����
for i=1:100    %���˹�ֲ����������еĸ���Ϊ0
    for j=1:2  %��Ϊ�򶷾�ͷ���ͽ��Ǿ�ͷ������Ϊ����
        if data2(i,j)<0
            data2(i,j)=0;
        end
    end
end
plot(data2(:,1),data2(:,2),'ro');  %��o���Ƴ�����
label2=label1+1; %���������ݵı�ǩ����Ϊ2
data=[data1;data2];
label=[label1;label2];
K=11;   %�����࣬һ��Kȡ���������ڲ������������Ǹ���
%�������ݣ�KNN�㷨������������ĸ��࣬�������ݹ���25��
%�򶷾�ͷ������3-7�����Ǿ�ͷ��Ҳ����3-7
for movenum=3:1:7
    for kissnum=3:1:7
        test_data=[movenum kissnum];  %�������ݣ�Ϊ5X5����
        %%���濪ʼKNN�㷨����Ȼ������11NN��
        %��������ݺ�����ÿ�����ݵľ��룬ŷʽ���루�����Ͼ��룩
        distance=zeros(200,1);
        for i=1:200
            distance(i)=sqrt((test_data(1)-data(i,1)).^2+(test_data(2)-data(i,2)).^2);
        end
        %ѡ�����򷨣�ֻ�ҳ���С��ǰK������,�����ݺͱ�Ŷ���������
        for i=1:K
            ma=distance(i);
            for j=i+1:200
                if distance(j)<ma
                    ma=distance(j);
                    label_ma=label(j);
                    tmp=j;
                end
            end
            distance(tmp)=distance(i);  %������
            distance(i)=ma;
            label(tmp)=label(i);        %�ű�ǩ
            label(i)=label_ma;
        end
        cls1=0; %ͳ����1�о��������������ĸ���
        for i=1:K
            if label(i)==1
                cls1=cls1+1;
            end
        end
        cls2=K-cls1;    %��2�о��������������ĸ���
        if cls1>cls2
            plot(movenum,kissnum, 'k.'); %������1������Ƭ�������ݻ�С�ڵ�
        else
            plot(movenum,kissnum, 'g*'); %������2������Ƭ�������ݻ���ɫ*
        end
        label=[label1;label2]; %����label��ǩ����
    end
end

%% Matlab �Դ�KNN�㷨����knnclassifyʵ��
% help knnclassify
% 
%   �﷨��  
% 
% * Class = knnclassify(Sample, Training, Group) 
% * Class = knnclassify(Sample, Training, Group, k) 
% * Class = knnclassify(Sample, Training, Group, k, distance)
% * Class = knnclassify(Sample, Training, Group, k, distance, rule)
% * 'euclidean' �� Euclidean distance (default)
% *  'cityblock' �� Sum of absolute differences
% * 'cosine' �� One minus the cosine of the included angle between points (treated as vectors)
% * 'correlation' �� One minus the sample correlation between points (treated as sequences of values)
% * 'hamming' �� Percentage of bits that differ (suitable only for binary data)
% 

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


%% Matlab �Դ�K��ֵ�㷨����kmeansʵ��
clc;
clear;
close all;
X = [randn(100,2)*0.75+ones(100,2);randn(100,2)*0.5-ones(100,2)]; %���������������
[idx,C] = kmeans(X,2,'Distance','cityblock','Replicates',5);%����K��ֵ�㷨���з���
plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',12) %���Ʒ�����һ�������
hold on
plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',12) %���Ʒ����ڶ��������
plot(C(:,1),C(:,2),'kx','MarkerSize',15,'LineWidth',3) %���Ƶ�һ��͵ڶ������ݵ����ĵ�
legend('Cluster 1','Cluster 2','Centroids','Location','NW') 
title 'Cluster Assignments and Centroids'
hold off

%% �ο�����
%%
% 
% # ����Ȫ�ȣ�������ѧϰ���ŵ�ʵ����MATLABʵ��Ӧ�á����廪��ѧ�����磬2019��3��
% # <https://baike.baidu.com/item/%E9%82%BB%E8%BF%91%E7%AE%97%E6%B3%95/1151153?fromtitle=Knn&fromid=3479559>
% 

