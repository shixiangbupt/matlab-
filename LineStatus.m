%���������ļ�LineStatus.m������ص�������
function LineStatus(source,~)
h=findobj('Tag','myline');
if source.Parent.Text=="������ɫ"  
    h.Color=source.Tag;
elseif source.Parent.Text=="����"
    h.LineStyle=source.Tag;        
end

