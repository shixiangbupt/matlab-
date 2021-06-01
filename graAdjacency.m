 
function A= graAdjacency(node,cost,dir)
% 将图形数据node,cost,direction数组转换为邻接矩阵
[m,cols]=size(node)
n=length(cost);
k=0; %稀疏矩阵元素个数
for is= 1:n %遍历边的列表
    iv=0; % 初始化连接到该边的节点数
    for ir=1:m %遍历节点数组的节点
        for ic=1:cols  % 遍历节点数组的列，查找连接到该边的节点
            if node(ir,ic) == is
                iv= iv+1;
                if iv>2 %每条边只有两个端点，如果大于2，表示是一个错误的数据集
                    error('错误的交叉矩阵');
                end
                ij(iv) =ir; % 将各个端点保存到局部变量ij中
            end
        end
    end
    if iv~=2 % 当遍历完成时，边的两端必须都有一个节点
        error(sprintf('找不到边 %d 的终端' ,is));
    end
    t=cost(is); %获取边的权重
    
    if dir(is) ~= -1 % 双向边必须在矩阵中出现两次，检查该边是双向还是正向的
        k=k+1;
        ip(k)=ij(1);
       jp(k)=ij(2);
       
       tp(k)=t;
    end
    if dir(is) ~=  1 % 同样，如果边不是正向的，输入反向路径
        k=k+1;
      ip(k)=ij(2);
      jp(k)=ij(1);
       tp(k)=t;
    end
end
A=sparse(ip,jp,tp); % 构造稀疏矩阵
end
% %  % makeGraph.m
%   cost=[2 2 2 2 2 3 3 3 3 1 2 1 3]; %边的权重
%   dir=[2 2 2 2 2 2 2 2 2 2 2 2 2]; %边的方向
%   node=[1 2 3 4 5;1 6 7 0 0;2 7 8 0 0 ;3 8 9 0 0;4 11 13 9 0;5 6 10 0 0;10 11 12 0 0;12 13 0 0 0];
% % %  边的序列为：A-B,A-C,A-D,A-E,A-F,B-F,B-C,C-D,D-E,F-G,E-G,G-H,E-H
% %  %连接node的每一行元素，指分别从A，B，...,H开始的边
%   coord=[5 6 ;3 9;1 6 ;3 1;6 2;6 8;9 7;10 2]; %A，B,...,H的坐标，只在画图时用
%   A=graAdjacency(node,cost,dir) %函数调用
% % 
%  
% 
