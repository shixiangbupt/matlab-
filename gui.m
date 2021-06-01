%% APP设计
% 山东理工大学数学院  周世祥

%% 学习目标
% 掌握图形用户界面设计的方法。
% 熟悉控件的常用属性。
% 掌握GUIDE的使用。
% 掌握GUI回调函数的定义方法。
% 掌握App设计工具的使用。

%% 用户界面对象概述
% 控件（Controls）
% （1）按钮。一个按钮代表一种操作，也称为命令按钮。
% （2）滑动条。用户可以通过移动滑块来改变滑动条对象的值。
% （3）单选按钮。当被选中时，圆圈的中心有一个实心的黑点，否则圆圈为空白。在一组单选按钮中，只能有一个被选中。
% （4）复选框。被选中的项其小方框中有√。复选框一次可以选择多项。
% （5）可编辑文本。供用户输入数据用。编辑框内输入的是字符，参与算术运算前需要转换为对应的数。
% （6）静态文本。一般用作其他控件的标签、提示。

%%
% 菜单（Menus）
% 通过使用菜单，可以把对程序的各种操作命令非常规范有效地呈现给用户，单击菜单项程序将执行相应的功能。
% 菜单对象是图形窗口的子对象。
% 快捷菜单（ContextMenu）是用鼠标右键单击某对象时在屏幕上弹出的菜单。也称为上下文菜单。

%%
% 3．工具栏（Toolbars）
% 工具栏以图标方式提供了常用命令的快速访问按钮。

%% 控件的公共属性
% 1．外观控制属性
% （1）Style属性。用于定义控件对象的类型。
% （2）Tag属性。用于定义控件标识。
% （3）String属性。用于定义控件对象的说明文字。
% （4）Enable属性。用于控制控件对象是否可用，取值是’on’（默认值）或’off’。
% （5）HorizontalAlignment属性。用于设置说明文字的水平对齐方式，可取值为'center'（默认值）、'left'或'right'。
% （6）BackgroundColor用于定义控件对象区域的背景色，默认值为[.94 .94 .94]（浅灰色）；
% % ForegroundColor属性用于定义控件对象说明文字的颜色，默认为黑色。
% 
% （7）Position属性。用于定义控件对象在用户界面中的位置和大小，属性值是一个4元向量 [n1，n2，n3，n4]。n1和n2分别为控件对象左下角相对于父对象的x、y坐标，n3和n4分别为控件对象的宽度和高度。
% （8）Max、Min属性。用于指定控件对象的最大值和最小值，默认值分别是1和0。
% 	（9）Value属性。用于获取和设置控件对象的当前值。 
% （10）UserData属性。用于存储与控件对象关联的数据，默认为空数组。

%%
% 2．事件响应属性
% （1）Callback属性。属性值是描述命令的字符串或函数句柄，当单击控件时，系统将自动执行字符串描述的命令或调用句柄所代表的函数，实施相关操作。
% （2）ButtonDownFcn属性：用于定义在控件对象上单击鼠标左键时执行的命令。
% （3）KeyPressFcn属性。用于定义在控件对象上按下键盘键时执行的命令。
% （4）KeyReleaseFcn属性。用于指定在控件对象上按下键盘键后释放时执行的命令。
% （5）CreateFcn属性：用于指定在建立控件对象时执行的命令。
% （6）DeleteFcn属性：用于指定删除控件对象时执行的命令。
%% 回调函数
% 1．事件驱动机制
% 面向对象的程序设计是以对象感知事件的过程为编程单位，当事件发生时，相应的程序段才会运行。
% 事件是由用户或操作系统引发的动作。
% gcbo命令用于获取正在执行回调的对象句柄。
%%
% 2．回调函数
% 回调函数定义对象怎样处理信息并响应某事件，该函数不会主动运行，是由主控程序调用的。
% 回调函数的基本结构：
% function 回调函数名(source, eventdata)
% ……
% end
% 参数source是发生事件的源对象句柄，eventdata存储事件数据

%%
%【例 1】绘制[0,2π]的正弦曲线，当在曲线上单击鼠标左键时，将曲线线条颜色改为红色。 

% 首先定义回调函数setlinecolor。
% function setlinecolor(source,~)
%     source.Color='r';
% end

% 将上述函数保存为函数文件setlinecolor.m。然后在命令窗口执行以下命令。
    x=linspace(0,2*pi,50);
    h=plot(x,sin(x));
    h.ButtonDownFcn=@setlinecolor;
    % matlab2016中执行
%% GUI函数
% 建立控件对象
% 函数uicontrol用于建立控件对象的，调用格式为
% h = uicontrol(parent,属性1,属性值1,属性2,属性值2, …)
% 参数parent用于指定控件对象的容器（即父对象），属性及其取值决定了控件对象的特征。
% 例如，在图形窗口上放置一个滑动条：

fh=figure('position',[100,200,320,160]);
sh = uicontrol(fh,'Style','slider', ...
                'Max',100,'Min',0,'Value',25, ...
                'SliderStep',[0.05 0.2], ...
                'Position',[60 100 150 30]);
%%
% uibuttongroup函数、uipanel函数、uitoolbar函数，分别用于建立按钮组、面板、工具栏，调用格式为
% h = uibuttongroup(parent,属性1,属性值1,属性2,属性值2, …)
% h = uipanel(parent,属性1,属性值1,属性2,属性值2, …)
% h = uitoolbar(parent,属性1,属性值1,属性2,属性值2, …)

fh=figure;
  bg = uibuttongroup(fh,'Position',[0.1,0.1,0.5,0.1]);
  r1 = uicontrol(bg,'Style','radiobutton',...
                  'String','选项A',...
                  'Position',[10 10 100 30]);
  r2 = uicontrol(bg,'Style','radiobutton',...
                  'String','选项B',...
                  'Position',[110 10 100 30],...
                  'Value',1);
  %% 建立用户菜单
%   1．创建菜单
% MATLAB提供了uimenu函数来创建、设置、修改菜单。函数调用格式为
% m = uimenu(parent,属性1,属性值1,属性2,属性值2, …)
% 建立菜单时，parent为图形窗口的句柄，默认在当前图形窗口中建立这个菜单。
hm=uimenu(gcf,'Label','文件');
  hm1=uimenu(hm,'Label','打开');
  hm2=uimenu(hm,'Label','新建');
  hm3=uimenu(hm,'Label','保存');
  hm21=uimenu(hm2,'Label','图形窗口');
  hm22=uimenu(hm2,'Label','坐标轴');
% MATLAB图形窗口带有默认菜单，若不需要图形窗口的默认菜单为了建立用户自己的菜单系统，
% 可以先将图形窗口的MenuBar属性设置为none。

%%
% 2．菜单属性
% 菜单对象除具有Children、Parent、Tag等公共属性外，还有一些特殊属性。
% Label属性：用于定义菜单项上显示的文字。
% Accelerator属性：用于定义菜单项的快捷键。
% Checked属性：指示菜单项是否已选中。 
% Enable属性：控制菜单项的可选择性。
% Separator属性：在菜单项上方添加一条分隔线。

%% 建立快捷菜单
% （1）uicontextmenu函数用于建立快捷菜单，函数调用格式为
% m = uicontextmenu(parent,属性1,属性值1,属性2,属性值2, …)
% （2）利用uimenu函数为快捷菜单建立下一级菜单项。
% （3）通过图形对象的UIContextMenu属性将快捷菜单与图形对象关联。

%% 实例 绘制曲线 x=sin t+sin 2t,y=cos t- cos 2t, 并建立一个快捷菜单，控制曲线的线型和颜色。

syms t;
x=sin(t)+sin(2*t);
y=cos(t)-cos(2*t);
hf=figure('Name','快捷菜单演示');
hl=fplot(x,y,'Tag','myline');
hc=uicontextmenu;              %建立快捷菜单
%建立一级菜单项
hcs=uimenu(hc,'Text','线型'); 
hcc=uimenu(hc,'Text','线条颜色');
%建立二级菜单项
uimenu(hcs,'Text','虚线','Tag',':','CallBack',@LineStatus)
uimenu(hcs,'Text','实线','Tag','-','CallBack',@LineStatus);
uimenu(hcc,'Text','红','Tag','r','CallBack',@LineStatus);
uimenu(hcc,'Text','黑','Tag','k','CallBack',@LineStatus);
%将该快捷菜单和曲线对象关联
hl.UIContextMenu=hc; 

%然后 建立函数文件LineStatus.m回调函数
 
% function LineStatus(source,~)
% h=findobj('Tag','myline');
% if source.Parent.Text=="线条颜色"  
%     h.Color=source.Tag;
% elseif source.Parent.Text=="线型"
%     h.LineStyle=source.Tag;        
% end

%% GUIDE简介
% 1．打开GUIDE
% 打开GUIDE有两种方法：
% （1）在MATLAB桌面， 选择“主页”选项卡，单击工具栏的“新建”命令按钮，，从弹出的命令列表中选“App”下的命令项 “GUIDE”。
% （2）在MATLAB命令行窗口输入guide命令。

% 3．回调属性
% 用于定义对象怎样处理信息并响应事件。
% 在GUIDE中，按钮类控件和菜单项的单击事件的默认回调属性是Callback ；其他图形对象的回调属性还有ButtonDownFcn、KeyPressFcn、SelectionChangeFcn等。
% 在GUIDE中，控件的回调属性值默认为“%automatic”，即自动使用默认的回调方法。
% GUIDE自动生成的回调函数头格式为：

% function pushbutton1_Callback(hObject,eventdata,handles)
% hObject存储事件触发的源控件
% eventdata存储事件数据
% handles存储用户界面中所有对象的句柄。

% 例如，用户界面中有一个按钮对象pushbutton1和1个静态文本对象text1，若运行时单击按钮pushbutton1，
% 使text1上显示“Hello, World”，则在回调函数pushbutton1_Callback的函数体中加入以下语句：

% handles.text1.String='Hello, World';

% guiex1

% 例如，在回调函数pushbutton1_Callback的函数体中加入以下语句：
% handles.mydata="This is an example.";
% guidata(hObject, handles);
% 在pushbutton2_Callback的函数体中加入以下语句，在对象text1上显示上述字符串：
% handles.text1.String=handles.mydata;

%% 界面设计工具
% 1．属性检查器（Property Inspector）
% 用于查看、设置用户界面中各个对象的属性。
% 双击某个对象，或选中对象后，单击编辑器工具栏的 “属性检查器”按钮（或从“视图”菜单中选菜单项“属性检查器”），打开属性检查器。
% 在MATLAB命令行窗口输入命令“inspect”，打开属性检查器。

%%
% 2．菜单编辑器（Menu Editor）
% 用于创建、设置、修改下拉式菜单和快捷菜单。
% （1）创建菜单
 
% 菜单/菜单项的主要属性。
% 	Label（标签）属性。用于定义菜单项的上显示的文字。若在字符串中加入“&”字符，则跟随在“&”后的字符有一条下划线。对于这种带有下划线字符的菜单/菜单项，可以用Alt+该字符键来激活。
% 	Tag（标记）属性。作为菜单项的标识。
% 		Callback（回调）属性。该属性的取值是函数句柄，或用字符串描述的MATLAB命令。用户界面运行时，若单击某菜单项，MATLAB将自动调用该菜单项回调属性中定义的函数或命令。
%%
% 3．工具栏编辑器（Toolbar Editor）
% 创建、设置、修改工具栏。
%% 
% 对象浏览器（Object Browser）
% 对象浏览器用于查看界面所包含的图形对象和展示界面的组织架构。

%%
% Tab键顺序编辑器（Tab Order Editor）
% 利用Tab键顺序编辑器，可以设置用户按键盘上的Tab键时，用户界面上的对象被激活的先后顺序。

%% GUIDE的设计示例

% 例 利用GUIDE设计工具设计如图 所示的用户界面。该界面可以显示表面图、网格图和等高线图。
% 绘制图形的功能通过3个命令按钮来实现，绘制图形所需要的数据通过一个列表来选取。
 % 方位角和仰角在视点面板中设置，图形使用的色图通过下拉列表进行选择，着色方式通过单选按钮组进行选择。
 % 切换按钮用于隐藏或显示坐标轴网格。
 [x,y]=meshgrid(-8:0.3:8);
r=sqrt(x.^2+y.^2);
% sinc=sin(r)./(r+eps);
mesh(x,y,r)
 
 %%
%  1．打开GUIDE，添加有关图形对象。
% 新建一个Blank GUI，在界面编辑器添加1个坐标轴、3个按钮、1个双位按钮、1个列表框、1个面板（视点）、
% 1个弹出式菜单（色图）、1个按钮组（着色方式），并在面板中放置两个可编辑文本，在按钮组中放置3个单选按钮。
% 利用对齐对象工具，按图调整好各个控件对象的大小和位置。
% 完成用户界面布局后保存界面。
% 将设计的用户界面保存为.fig文件。这时系统还将自动生成一个同名的.m文件，
% 用于保存用户界面初始化方法以及图形窗口和控件的回调函数。

%%
% 编写代码，实现控件功能。
% （1）图形窗口的回调函数

%% 
% 在图形窗口的OpeningFcn函数体中输入以下代码：
% %生成图形数据
% handles.peaks=peaks(34); 
% handles.membrane=membrane;
% [x,y]=meshgrid(-8:0.3:8);
% r=sqrt(x.^2+y.^2);
% sinc=sin(r)./(r+eps);
% handles.sinc=sinc;
% %将默认绘图数据存储到handles的current_data成员中
% handles.current_data=handles.sinc;
% %在后续绘图操作时，使用spring色图绘制图形
% colormap(spring);
%%

% 2）控件对象的回调函数
%  3个绘图按钮用于绘制表面图、网格图和等高线图。

% 在Mesh_Callback函数体中输入以下代码。
% mesh(handles.current_data)
% 在Surf_Callback函数体中输入以下代码。
% surf(handles.current_data);
% 在Contour3_Callback函数体中输入以下代码。
% contour3(handles.current_data)
% 切换按钮GridSwitch用于显示/隐藏网格
% 在GridSwitch_Callback函数体中输入以下代码。

% if hObject.Value==1
%     grid on
%     hObject.String='隐藏网格';
% else 
%     grid off
%     hObject.String='显示网格';
% end
% 列表框ChooseFun用于选择绘图数据源。
% 在ChooseFun_Callback函数体中输入以下代码。

% str=hObject.String; %获取列表框中的列表项
% val=hObject.Value; %获取选中项的序号
% %根据选中项的文本确定采用哪一个数据源作为绘图数据
% switch strtrim(str{val})
% case 'Peaks' 
%    handles.current_data=handles.peaks;
% case 'Membrane' 
%    handles.current_data=handles.membrane;
% case 'Sinc'
%    handles.current_data=handles.sinc;
% end
% %更新handles
% guidata(hObject,handles)
% 

%%
% 弹出式菜单ChooseCMap用于设置绘图所采用的色图。
% 在ChooseCMap_Callback函数体中输入以下代码。

% str=hObject.String; %获取列表框中的列表项
% cm=hObject.Value; %获取选中项的序号
% colormap(eval(str{cm}));

% 视点面板用于设置视点，包括方位角和仰角，单击其中的按钮ConfigView，调用view函数设置视点。
% 在ConfigView_Callback函数体中输入以下代码。
% el=eval(handles.edit_el.String);
% az=eval(handles.edit_az.String);
% view(az,el)
% 按钮组ChooseShading中的选项发生改变时，会触发SelectionChanged事件。
% 在ChooseShading_SelectionChangedFcn函数体中输入以下代码。
% %根据所选项的Tag属性确定着色方式
% switch eventdata.NewValue.Tag
%     case 'rb_flat'
%         shading flat;
%     case 'rb_interp'
%         shading interp;
%     case 'rb_faceted'
%         shading faceted;
% end 
% 
% 
