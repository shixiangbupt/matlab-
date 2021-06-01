%% https://www.zhihu.com/question/26709273/answer/44954912
%  山东理工大学数学学院
% 参赛者会看见三扇关闭了的门，其中一扇的后面有一辆汽车或者是奖品，
% 选中后面有车的那扇门就可以赢得该汽车或奖品，而另外两扇门后面则各藏有一只山羊。
% 当参赛者选定了一扇门，但未去开启它的时候，知道门后情形的节目主持人会开启剩下
% 两扇门的其中一扇，露出其中一只山羊。主持人其后会问参赛者要不要换另一扇仍然关上的门。
% 问题是：换另一扇门会否增加参赛者赢得汽车的机率？（转自维基百科）

%% 
%change or not
N = 3;
change = true;

Total = 10000;
count = 0;
for i = 1:Total
    car = randi(N);
    %rand(randi(10)); %伪随机数问题
    first_choose = randi(N);
    %打开N-2个没有汽车的门
    if (first_choose == car)
        lefted = mod(car + 1,N)+1; %如果一开始就猜对了，则随便留一个
    else
        lefted = car; %如果一开始猜错了，只能留汽车了
    end
    if (change)
        last_choose = lefted;
    else
        last_choose = first_choose;
    end
    count = count + (last_choose==car);
end
str = ['不', '换'];
fprintf('换不换?\t%s:\t正确率:%f\n',str(change+1), count/Total);
