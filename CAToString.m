function str = CAToString(ca)
    % 将元胞数组转字符串
    str = '';
    for in = 1:length(ca)
        str = [str toString(ca{in}) 13];
    end
end


