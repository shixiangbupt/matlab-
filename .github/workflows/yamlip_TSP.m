% 利用yamlip求解TSP问题
%   yalmip是由Lofberg开发的一种免费的优化求解工具，
% 其最大特色在于集成许多外部的最优化求解器，形成一种统一的% 
% 建模求解语言，提供了Matlab的调用API，减少学习者学习成本。
% 
%   yalmip安装方式
% 这里以MATLAB的安装方式为例，在官网上下载最新包，将其解压至matlab的toolbox文件夹下（当然也放置在其他文件夹），打开matlab软件添加Path路径即可。最后键入which sdpvar命令，显示sdpvar路径则安装成功。
% 
%  
% 链接：https://www.jianshu.com/p/e1c45b3d8d8a
 
clear;clc;close all;
d = load('tsp_dist_matrix.txt')';
n = size(d,1);
% 决策变量
x = binvar(n,n,'full');
u = sdpvar(1,n);
% 目标
z = sum(sum(d.*x));
% 约束添加
C = [];
for j = 1:n
    s = sum(x(:,j))-x(j,j);
    C = [C,   s  == 1];
end
for i = 1:n
    s = sum(x(i,:)) - x(i,i);
    C = [C, s  == 1];
end
for i = 2:n
    for j = 2:n
        if i~=j
            C = [C,u(i)-u(j) + n*x(i,j)<=n-1];
        end
    end
end
% 参数设置
ops = sdpsettings('verbose',0);
% 求解
result  = optimize(C,z);
if result.problem== 0
    value(x)
    value(z)
else
    disp('求解过程中出错');
end