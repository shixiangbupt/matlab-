%% https://www.zhihu.com/question/26709273/answer/44954912
%  ɽ������ѧ��ѧѧԺ
% �����߻ῴ�����ȹر��˵��ţ�����һ�ȵĺ�����һ�����������ǽ�Ʒ��
% ѡ�к����г��������žͿ���Ӯ�ø�������Ʒ�������������ź����������һֻɽ��
% ��������ѡ����һ���ţ���δȥ��������ʱ��֪���ź����εĽ�Ŀ�����˻Ὺ��ʣ��
% �����ŵ�����һ�ȣ�¶������һֻɽ�������������ʲ�����Ҫ��Ҫ����һ����Ȼ���ϵ��š�
% �����ǣ�����һ���Ż�����Ӳ�����Ӯ�������Ļ��ʣ���ת��ά���ٿƣ�

%% 
%change or not
N = 3;
change = true;

Total = 10000;
count = 0;
for i = 1:Total
    car = randi(N);
    %rand(randi(10)); %α���������
    first_choose = randi(N);
    %��N-2��û����������
    if (first_choose == car)
        lefted = mod(car + 1,N)+1; %���һ��ʼ�Ͳ¶��ˣ��������һ��
    else
        lefted = car; %���һ��ʼ�´��ˣ�ֻ����������
    end
    if (change)
        last_choose = lefted;
    else
        last_choose = first_choose;
    end
    count = count + (last_choose==car);
end
str = ['��', '��'];
fprintf('������?\t%s:\t��ȷ��:%f\n',str(change+1), count/Total);
