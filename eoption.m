%eoption.m函数
function choice = eoption
% eoption 显示菜单选项和错误检查  
%  直到用户按了一个按钮
% 调用格式: eoption or eoption()
 
choice = menu('Choose an e option', 'Explanation', ...
    'Limit', 'Exponential function', 'Exit Program');
% 如果用户没有按4个按钮显示出错 
%  即 choice=0
while choice == 0
    disp('错误 - 请选择正确的选项.')
    choice = menu('请选择一个选项', 'Explanation', ...
        'Limit', 'Exponential function', 'Exit Program');
end
end
