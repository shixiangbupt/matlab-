%eoption.m����
function choice = eoption
% eoption ��ʾ�˵�ѡ��ʹ�����  
%  ֱ���û�����һ����ť
% ���ø�ʽ: eoption or eoption()
 
choice = menu('Choose an e option', 'Explanation', ...
    'Limit', 'Exponential function', 'Exit Program');
% ����û�û�а�4����ť��ʾ���� 
%  �� choice=0
while choice == 0
    disp('���� - ��ѡ����ȷ��ѡ��.')
    choice = menu('��ѡ��һ��ѡ��', 'Explanation', ...
        'Limit', 'Exponential function', 'Exit Program');
end
end
