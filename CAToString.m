function str = CAToString(ca)
    % ��Ԫ������ת�ַ���
    str = '';
    for in = 1:length(ca)
        str = [str toString(ca{in}) 13];
    end
end


