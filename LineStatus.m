%建立函数文件LineStatus.m，定义回调函数。
function LineStatus(source,~)
h=findobj('Tag','myline');
if source.Parent.Text=="线条颜色"  
    h.Color=source.Tag;
elseif source.Parent.Text=="线型"
    h.LineStyle=source.Tag;        
end

