clear all
disp("��Ԥ�ȷ���ռ�")
tic
for i = 1:100000
    x(i) =sqrt(i);
end
toc

disp("Ԥ����ռ�")
tic
y= zeros(1,100000);
for i= 1:100000
    y(i) =sqrt(i);
end
toc
