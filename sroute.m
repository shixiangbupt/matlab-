% 求最短路程序sroute. m

function route=sroute(G,opt)

%求图的最短路的Djkstra算法程序，规定起点为1.顶点连续编号

%G是给定图的邻接距阵或弧表矩阵，程序能够自动识别

%当opt=0(或缺省)时求无向图的最短路，当opt= 1时求有向圈的最短路
% d-标记最短距离

%route是一个矩阵，第一行标记顶点，第2行标记1到该点的最矩距离
%第3行标记最短路上该点的先驱顶点

while 1 %此循环自动识别或由弧表矩阵生成邻接矩阵

if G(1,1)==0

A=G;

n= size(A,1); A1=A;A1(A1==inf)=0;

M=sum(sum(A1));A1(A1==0)=M;A=A1-M*eye(n);
 break

else

e=G;
n=max([e(:,1);e(:,2)]);%顶点数
m=size(e,1) ;%边数

M= sum(e(:,3));%代表无穷大

A= M * ones(n,n);

for k=1:m

   A(e(k,1),e(k,2))=e(k,3);
   if opt==0
       A(e(k,2),e(k,1))=e(k,3); %形成无向图的邻接矩阵
   end
end
A=A-M*eye(n); %形成图的邻接矩阵
end
break
end
pb(1:length(A))=0;pb(1)=1;%永久标号点
index1=1; % 标记确定为永久标记的次序
index2=ones(1,length(A)); %标记最短路上各点的先驱顶点

d(1:length(A))=M;d(1)=0;%标记距离
temp=1;
while sum(pb)<length(A)
    tb=find(pb==0);% 临时标号点
    d(tb)=min(d(tb),d(temp)+A(temp,tb)); %更新距离
    tmpb=find(d(tb)==min(d(tb)));%确定新最小距离点
    temp=tb(tmpb(1)); %记录新永久标号点
    pb(temp)=1; %增加新永久标号点
    index1=[index1,temp]; %记录新永久标号点
    index=index1(find(d(index1)==d(temp)-A(temp,index1))); %确定前驱顶点
    if length(index)>=2   %前驱顶点多于1个时取第一个
        index=index(1);
    end
    index2(temp)=index; %记录前驱顶点
end 
route=[1:n;d;index2];

% e=[1 2 2;1 3 8 ;1 4 1;2 3 6;2 5 1;3 4 7;3 5 5;3 6 1;3 7 2;4 7 9;5 6 3;5 8  9 ;6 7 4;6 8 6;7 8 5];
% sroute(e,0)
% 矩阵的第一行表示顶点，第二行表示u1到各顶点的最短距离，第三行表示最短路上各点的前驱顶点。


