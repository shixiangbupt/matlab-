% �����·����sroute. m

function route=sroute(G,opt)

%��ͼ�����·��Djkstra�㷨���򣬹涨���Ϊ1.�����������

%G�Ǹ���ͼ���ڽӾ���򻡱���󣬳����ܹ��Զ�ʶ��

%��opt=0(��ȱʡ)ʱ������ͼ�����·����opt= 1ʱ������Ȧ�����·
% d-�����̾���

%route��һ�����󣬵�һ�б�Ƕ��㣬��2�б��1���õ����ؾ���
%��3�б�����·�ϸõ����������

while 1 %��ѭ���Զ�ʶ����ɻ�����������ڽӾ���

if G(1,1)==0

A=G;

n= size(A,1); A1=A;A1(A1==inf)=0;

M=sum(sum(A1));A1(A1==0)=M;A=A1-M*eye(n);
 break

else

e=G;
n=max([e(:,1);e(:,2)]);%������
m=size(e,1) ;%����

M= sum(e(:,3));%���������

A= M * ones(n,n);

for k=1:m

   A(e(k,1),e(k,2))=e(k,3);
   if opt==0
       A(e(k,2),e(k,1))=e(k,3); %�γ�����ͼ���ڽӾ���
   end
end
A=A-M*eye(n); %�γ�ͼ���ڽӾ���
end
break
end
pb(1:length(A))=0;pb(1)=1;%���ñ�ŵ�
index1=1; % ���ȷ��Ϊ���ñ�ǵĴ���
index2=ones(1,length(A)); %������·�ϸ������������

d(1:length(A))=M;d(1)=0;%��Ǿ���
temp=1;
while sum(pb)<length(A)
    tb=find(pb==0);% ��ʱ��ŵ�
    d(tb)=min(d(tb),d(temp)+A(temp,tb)); %���¾���
    tmpb=find(d(tb)==min(d(tb)));%ȷ������С�����
    temp=tb(tmpb(1)); %��¼�����ñ�ŵ�
    pb(temp)=1; %���������ñ�ŵ�
    index1=[index1,temp]; %��¼�����ñ�ŵ�
    index=index1(find(d(index1)==d(temp)-A(temp,index1))); %ȷ��ǰ������
    if length(index)>=2   %ǰ���������1��ʱȡ��һ��
        index=index(1);
    end
    index2(temp)=index; %��¼ǰ������
end 
route=[1:n;d;index2];

% e=[1 2 2;1 3 8 ;1 4 1;2 3 6;2 5 1;3 4 7;3 5 5;3 6 1;3 7 2;4 7 9;5 6 3;5 8  9 ;6 7 4;6 8 6;7 8 5];
% sroute(e,0)
% ����ĵ�һ�б�ʾ���㣬�ڶ��б�ʾu1�����������̾��룬�����б�ʾ���·�ϸ����ǰ�����㡣


