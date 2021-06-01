clear all
disp("不预先分配空间")
tic
for i = 1:100000
    x(i) =sqrt(i);
end
toc

disp("预分配空间")
tic
y= zeros(1,100000);
for i= 1:100000
    y(i) =sqrt(i);
end
toc
