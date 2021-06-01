%% figure object：图形对象
% 山东理工大学数学与统计学院

%% 
% 在MATLAB中，每一个具体的图形都是由若干个不同的图形对象组成的。
% 一个项目可以包含一个或多个图形窗口，一个图形窗口可包含一组或多组坐标轴，
% 每一组坐标轴上又可绘制多种图形，如曲线、曲面、文本等。
% 在MATLAB系统中建立一个对象，系统就会建立一个映射该对象的句柄，
% 用于存储相应对象的属性。MATLAB中通过句柄对图形对象进行操作。
%
% 图形对象是有层次的。系统将各种图形对象按树形结构组织起来。
%% 图形对象句柄  
% 以前的MATLAB 版本中，图形句柄（Handle）是一个实数，
% 从R2014b起，图形句柄成为了对象句柄。一个句柄对应着一个图形对象，可以用对象句柄设置和
% 查询对象属性。
%% 
% 特定图形对象的识别
%
% gcf()	获取当前图形窗口的句柄
%
% gca()	获取当前图形窗口中坐标轴的句柄
%
% gco()	获取当前图形窗口中当前对象的句柄
%
% gcbf()	获取正在执行的回调程序对应的对象所在窗口的句柄
%
% gcbo()	获取正在执行的回调程序对应的图像句柄
%
% findobj()	对象的查找
%
% ancestor()	查找对象的父对象
%
% 图形对象的Parent属性获取包容此图形对象的容器，Children属性获取此对象所容纳的图形对象。
% 绘制曲线并查看有关对象的属性。
% 　　命令如下：
x=linspace(-pi, pi,30);
plot(x,5*sin(x),'rx',x,x.^2,x,1./x);
h1=gca;   %获取当前坐标轴的句柄                            
% h1.Children	%查询当前坐标轴的子对象
% matlab2019运行结果：
% 3×1 Line 数组:
% 
%   Line
%
%   Line
%
%   Line
%
% h1.Children(1)
 
% 绘制曲线并查看有关对象的属性。
% 查看第1个对象的属性：
% ans = 
% 
%   Line - 属性:
% 
%               Color: [0.9290 0.6940 0.1250]
%           LineStyle: '-'
%           LineWidth: 0.5000
%              Marker: 'none'
%          MarkerSize: 6
%     MarkerFaceColor: 'none'
%               XData: [1×30 double]
%               YData: [1×30 double]
%               ZData: [1×0 double]
 


%% 图形对象属性
% MATLAB正是通过对属性的操作来控制和改变图形对象的外观和行为。
%
%  属性名与属性值
% 
% 同一类对象有着相同的属性，属性的取值决定了对象的表现。
% 例如，LineStyle是曲线对象的一个属性，它的值决定着线型，取值可以是'-' 、':'、'-.'、'--'或'none'。
% 在属性名的写法中，不区分字母的大小写，而且在不引起歧义的前提下，属性名可以只写前一部分。例如，
% lines就代表LineStyle。
%%
% 属性的操作
% MATLAB 2014b及以后的版本，一般使用点运算符来访问对象属性，一般形式是：对象句柄.属性名
%  
% 设置图形对象属性：
% H.属性名 = 属性值
% 其中，H是图形对象的句柄。

% 绘制正弦曲线，然后将曲线线型修改为虚线，线条颜色为红色：

% 低版本2014a有警告信息
% h1=fplot(@(x)sin(x),[0,2*pi]);
%  h1.Color=[1 0 0];
%   h1.LineStyle=':';

%%
% 属性的操作：
%
% 若同时设置一组图形对象的属性，可以采用set函数，调用格式为
%
% set(H,Name,Value)
%
% set(H,NameArray,ValueArray)
%
% 其中，H用于指明要操作的图形对象，如果H是一个由多个图形对象句柄构成的向量，
% 则操作施加于H的所有对象。
 
 
% 绘制3条曲线，然后将曲线线型全部修改为虚线，线条颜色为蓝色，可以使用以下命令：
%   hlines=fplot(@(x)[sin(x),sin(2*x),sin(3*x)],[0,2*pi]);
%   set(hlines,'Color',[0 0 1],'LineStyle',':');
%%
% 若3条曲线分别采用不同颜色、不同线型，则可以使用以下命令：
%   hlines =fplot(@(x)[sin(x),sin(2*x),sin(3*x)],[0,2*pi]);
%   NArray = {'LineStyle','Color'};
%   VArray = {'--',[1 0 0]; ':',[0 1 0]; '-.',[0 0 1]};
%   set(hlines,NArray,VArray)
 % 需要高本版中运行
 
 %% 
% 属性的操作
% 
%  获取图形对象属性：
% V = H.Name
% 其中，H是图形对象的句柄，Name是属性名。
% 例如，获得前述曲线h1的颜色属性值

hcolor=h1.Color     %或hcolor=get(h1,'Color')
%%
% 若需要获取一组图形对象的属性，可以采用get函数。get函数的调用格式为
% V=get(H, Name)
% 其中，H是图形对象句柄，选项Name指定要访问的属性，V存储返回的属性值。

% hlines_p=get(hlines,{'Color','LineStyle'}) %图形hlines不能关闭

%%
% 属性的操作
%
%  属性检查器
%
% inspect函数打开属性检查器，查询和修改图形对象的属性。调用格式如下：
%
% inspect(H)
%
% inspect([h1,h2,...])
%
% 其中，参数H、h1、h2……是图形对象句柄
x=linspace(0, 2*pi,100);
  h1=plot(x,log(x).*sin(x),'r:');
  inspect(h1);
  h2=text(1,0,'example');  
  inspect([h1,h2])
%%
% 对象的公共属性
% 
% # Children属性。 
% #  Parent属性。
% # Color属性。
% # Position属性。属性值是一个由4个元素构成的行向量，其形式为[x, y, w, h]。这个向量定义了图形对象在上层对象上的位置和大小，其中x和y分别为对象左下角的横、纵坐标，w和h分别为图形对象的宽度和高度。
% # Units属性。定义图形对象所使用的长度单位。
% # Tag属性。对象的标识名。
% # Type属性。
% # Visible属性。
% # CreateFcn属性和 DeleteFcn属性。用于指定创建图形对象和删除图形对象时调用的函数或执行的命令。
% # KeyPressFcn属性。用于指定键盘按键事件发生时调用的函数或执行的命令。
% # WindowButtonDownFcn或ButtonDownFcn属性。用于指定鼠标按键事件发生时调用的函数或执行的命令。
% # WindowButtonMotionFcn属性。用于指定鼠标移动事件发生时调用的函数或执行的命令。

%%
% 分别在并排的两个坐标轴中绘制一条曲线和一个曲面。然后设置左坐标轴的背景色为黄色，
% 曲线线条颜色为红色，设置有坐标轴的背景色为青色。
subplot(1,2,1)
h1=fplot(@(t)t.*sin(t),@(t)t.*cos(t),[0,6*pi] );
axis equal
subplot(1,2,2)
[x,y,z]=peaks(20);
h2=mesh(x,y,z);
h10=h1.Parent;
h10.Color='y';
h1.Color='r';
h2.Parent.Color='cyan';
% 高版本中可以

%% 图形窗口对象
% 图形窗口的基本操作
% figure函数来创建窗口对象，调用格式如下。
%
% 句柄变量=figure(属性名1,属性值1,属性名2,属性值2,…)
%
% 属性用于设置图形窗口的呈现方式。如果调用时不带参数，则按图形窗口的默认属性值建立图形窗口。
% 设定句柄对应的窗口为当前窗口：
%
% figure(窗口句柄)
%
% 关闭图形窗口：
%
% close(窗口句柄)
%
% 清除图形窗口的内容，但不关闭窗口，则使用clf函数：
% clf(窗口句柄)
% 

%%
% 图形窗口的属性

% （1）Name属性。属性值是一个字符串，用于指定图形窗口的标题。
% （2）Number属性。图形窗口的序号。
% （3）NumberTitle属性。
% （4）MenuBar属性。用于控制图形窗口是否具有菜单栏。
% （5）ToolBar属性。用于控制图形窗口是否具有工具栏。
% （6）Pointer属性。用于指定光标指针样式。
% （7）SizeChangedFcn和ResizeFcn属性。用于指定当窗口大小发生改变和窗口大小重新定义时调用的函数或命令。
% 图形窗口对象的默认度量单位（Units）为'pixels'，即像素。

%%
% 建立一个图形窗口。该图形窗口没有菜单条，标题名称为“图形窗口示例”。图形窗口位于距
% 屏幕左下角[2cm, 2cm]处，宽度和高度分别为24cm和16cm。当用户在键盘按下任意键时，
% 在图形窗口绘制正弦曲线。

hf=figure;
hf.MenuBar='None';
hf.NumberTitle='Off';
hf.Name='图形窗口示例';
hf.Units='centimeters';  %设置度量单位为cm
hf.Position=[2,2,24,16];
hf.KeyPressFcn='fplot(@(x)sin(x),[0,2*pi])';

% 高版本中运行

%% 坐标轴的基本操作
% 建立坐标轴对象使用axes函数，调用格式如下。
%
% 	句柄变量=axes(parent, 属性名1,属性值1,属性名2,属性值2,…)
%
% 属性用于设置坐标轴的特征，选项parent用于指定坐标轴的父对象。若调用axes函数时不带参数，则按坐标轴的默认属性在当前图形窗口创建坐标轴。
% 
% 设定该句柄代表的坐标轴为当前坐标轴：
% axes(坐标轴句柄)
%
% 清除坐标轴中的图形：
% cla(坐标轴句柄)
% 不带参数的cla函数，表示清除当前坐标轴中的图形。

%%
% 坐标轴的属性

% （1）Box属性。决定坐标轴是否带有边框，可取值是'on'或'off'。
% （2）GridLineStyle属性。用于定义网格线的类型，可取值是'-'（默认值）、':'、'-.'、'--'或'none'。
% （3）Title属性。用于设置和修改坐标轴标题，值是通过title函数建立的标题对象的句柄。
% （4）	XLabel、YLabel、ZLabel属性。用于设置和修改x、y、z轴的标签，取值分别是通过xlabel、ylabel、zlabel函数建立的标签对象的句柄。
% （5）XLim、YLim、ZLim 属性。取值是2元向量[Lmin, Lmax]，分别定义x、y、z轴的下限和上限，默认为[0, 1]。
% （6）XScale、YScale、ZScale 属性。用于定义x、y、z轴的刻度类型，取值是'linear'（默认值）或'log'。
% （7）XTickLabel、YTickLabel、ZTickLabel属性。用于定义x、y、z轴的刻度线标签。
% （8）Xdir、Ydir、Zdir属性。用于定义沿x、y、z轴逐渐增加的值的方向，取值是'normal'（默认值）或'reverse'。
% （9）View属性。用于定义视点，取值是2元向量[azimuth elevation]，azimuth指定观察方位角，elevation指定仰角。
% 坐标轴对象的默认度量单位（Units）为'normalized'，即根据容器（图形窗口或面板）进行归一化，容器的左下角映射为(0,0)，右上角映射为(1,1)。


%%
% 利用坐标轴对象实现图形窗口的任意分割
[x,y]=meshgrid(0:0.1:pi/2,0:0.05:pi);
z=sin(x.^2)+cos(y.^2);
ha1=axes('Position',[0.05,0.6,0.3,0.3]);
plot(x,z);
ha1.YDir='reverse';  %设置y轴反向递增
ha2=axes('Position',[0.45,0.6,0.5,0.35]);
plot3(x,y,z);
ha2.View=[45,-45];  %设置视点方位角为45，仰角为-45
ha3=axes('Position',[0.1,0.05,0.8,0.5]);
plot3(x,y,z); 
grid on;  %显示网格线

%% 曲线对象
% 曲线对象除了用plot、plot3函数创建外，还可以用line函数创建。line函数调用格式如下。
%
% 	h=line(ax, x, y, 属性名1, 属性值1, 属性名2, 属性值2,…)
%
% 	h=line(ax, x, y, z, 属性名1, 属性值1, 属性名2, 属性值2,…)
%
% 参数 x、y、z的含义和用法与plot、plot3函数一样，属性的设置与前面介绍过的figure、axes函数类似。
% 选项ax用于指定曲线所属坐标轴，默认在当前坐标轴绘制曲线。

% 曲线对象常用属性。
% （1）LineStyle属性。用于定义线型，默认值为'-'。
% （2）LineWidth属性。用于定义线宽，默认值为0.5磅。
% （3）LineJoin属性。用于定义线条边角的样式，可取值是'round'（默认值）、'miter'、'chamfer'。
% （4）Marker属性。用于定义标记符号，默认值为'none'。
% （5）MarkerSize属性。用于定义标记符号的大小，默认值为6磅。
% （6）MarkerEdgeColor属性。用于定义标记符号边框的颜色，默认值为'auto'。
% （7）MarkerFaceColor属性。用于定义标记符号内的填充色，默认值为'none'。
% （8）XData、YData、ZData属性。属性值是数值向量，分别存储曲线对象各个数据点的位置数据，XData、YData默认为[0 1]，
% ZData默认为空矩阵。
% 曲线的默认度量单位（Units）为磅。
% plot函数每调用一次，就会刷新坐标轴，清空原有图形，再绘制新的曲线。
% line函数生成的曲线则在已有图形上叠加显示。

%%
% 利用line函数绘制曲线 $y=e^{-t}\sin(2\pi t)$和 $y=\cos(\frac{\pi}{2}t)$.
t=linspace(0,4,100);
y=sin(2*pi*t).*exp(-t);
figure('Position',[120,100,480,320]);
ha=axes('GridLineStyle','-.');
htitle=get(ha,'Title');
htitle.String='e^{-t}sin(2{\pi}t) 和 cos({\pi}t/2)';
hl1=line('XData',t,'YData',sin(2*pi*t).*exp(-t));
hl1.LineStyle='-.';
hl2=line('XData',t,'YData',cos(pi/2*t));
hl2.LineStyle=':';
grid on

%% 曲面对象
% 建立曲面对象
% 除了使用mesh、surf等函数外，还可以使用surface函数，调用格式为
%
% h=surface(ax, Z, C, 属性名1,属性值1, 属性名2,属性值2,…)
%
% h=surface(ax, X, Y, Z, C, 属性名1,属性值1, …)
%
% X、Y是网格坐标矩阵，Z是网格点上的高度矩阵。
%
% 当输入参数只有一个矩阵Z时，将Z每个元素的行和列索引用作 x 和 y 坐标，将Z每个元素的值用作 z 坐标绘制图形。
% 选项C用于指定在不同高度下的曲面颜色。C省略时，MATLAB认为C=Z，亦即颜色的设定是正比于图形高度的。
% 选项ax用于指定曲面所属坐标轴，默认在当前坐标轴绘制图形。

% 常用属性
% （1）EdgeColor属性。用于定义曲面网格线的颜色。
% （2）FaceColor属性。用于定义曲面网格片的颜色或着色方式。
% （3）FaceAlpha属性。用于定义曲面的透明度，可取值为0（完全透明）~1（完全不透明）之间的数或'flat'、'interp'、texturemap，默认为1。
% （4）FaceLighting属性。用于定义投影到曲面的灯光的效果，可取值为'flat' (默认值)、'gouraud'、'none'。
% （5）BackFaceLighting属性。用于定义背光效果，可取值为'reverslit' (默认值)、'unlit'、'lit'。
% 曲面的默认度量单位（Units）为磅。
% surf、mesh函数每调用一次，就会刷新坐标轴，清空原有图形，再绘制新的图形。
% surface函数生成的曲面则在已有图形上叠加显示。

%%
% 利用曲面对象绘制三维曲面 $z=x^2-2y^2$。
[x,y]=meshgrid(-10:0.5:10);
z=x.^2-2*y.^2;
axes('view',[-37.5,30],'Position',[0.05,0.1,0.4,0.85])
hs1=surface(x,y,z);
hs1.FaceColor='none'; %设置网格片无填充
hs1.EdgeColor='b';  %设置网格片边框为蓝色
hT1=get(gca,'Title');
set(hT1,'String','网格曲面','FontSize',12,'Position',[5,10]);  
axes('view',[-37.5,30],'Position',[0.55,0.1,0.4,0.85])
hs2=surface(x,y,z);
hs2.FaceColor='interp';  %设置网格片用渐变色填充
hs2.EdgeColor='flat';  %设置网格片边框为单一颜色
hT2=get(gca,'Title');
set(hT2,'String','着色曲面','FontSize',12,'Position',[5,10]);

% 高版本可以

%%
% 设置曲面颜色
% 曲面对象的CData 属性称为颜色索引，用于定义曲面顶点的颜色。CData 属性的定义有以下两种方法。
%  使用色图
%
% 若CData属性值是一个与输入参数X、Y、Z同型的矩阵C，C中数据与色图（Colormap）中的颜色相关联，曲面网格顶点(i,j)的颜色为C(i,j)在色图中对应的颜色。
% MATLAB默认将CData属性完整的数据范围映射到色图上，颜色索引的最小值映射到色图矩阵的第一个RGB三元组，最大值映射到色图矩阵的最后一个RGB三元组，所有中间值线性映射到色图的矩阵中间的RGB三元组。

%%
% 绘制三维曲面 $z=x^2-2y^2$。，生成一个与z同型的随机矩阵C，
% 将其作为CData属性值，观察曲面颜色与矩阵C的对应关系。

[X,Y]=meshgrid(-10:1:10);
Z=X.^2-2*Y.^2;
%生成元素值在[11,19]的随机矩阵
C=randi(9,size(Z))+10;
axes('view',[-37.5,30])
h1=surface(X,Y,Z); 
h1.CData=C;
colorbar
Cmap=colormap(gray);

% 曲面对象的CData 属性称为颜色索引，用于定义曲面顶点的颜色。CData 属性的定义有以下两种方法。

% （1）使用色图
% （2）使用自定义颜色

% 若CData是一个m×n×3（输入参数X、Y、Z是m×n矩阵）的三维数组，则曲面网格顶点使用CData的第3维的RGB三元组定义的颜色。

%% 文本对象
% 使用text函数可以创建文本对象。text函数的调用格式为
% h=text(ax, x,y, 说明文本, 属性名1,属性值1,…)
% h=text(ax, x,y,z, 说明文本, 属性名1,属性值1,…)
% x、y、z定义文本对象的位置。
% 选项ax用于指定文本对象所属坐标轴，默认在当前坐标轴输出文本。
  h=text(10,8,50,'{\gamma}={\rho}^2');
% 将在当前坐标轴的指定位置输出γ=ρ^2。

%%
% 常用属性

% （1）String属性。指定显示的文本。
% （2）Interpreter属性。用于控制对文本字符的解释方式，属性值是'tex'（默认值，使用TeX标记子集解释字符）、'latex'（使用LaTeX标记解释字符）或'none'。
% （3）字体属性。
% FontName属性用于指定文本使用的字体的名称；
% FontSize属性指定字体大小，度量单位默认为磅；
% FontWeight属性用于指定文本字符是否加粗，取值是'normal'（默认值）或'bold'（加粗）；
% FontAngle属性用于文本字符是否倾斜，取值是'normal'（默认值）或'italic'。
% （4）Rotation属性。用于定义文本反向，取正值时表示逆时针方向旋转，取负值时表示顺时针方向旋转。属性值是以度为单位的数，默认为0。
% （5）HorizontalAlignment属性。控制文本水平方向的对齐方式，其取值为left（默认值）、center或right。
% （6）VerticalAlignment属性。控制文本垂直方向的对齐方式，其取值为'middle'（默认值）、'top'、'bottom'、'baseline'或'cap'。

%% 
% 利用曲线对象绘制曲线并利用文本对象完成标注
x=-pi:0.1:pi;
y1=sin(x);
y2=cos(x);
h1=line(x,y1,'LineStyle',':');
h2=line(x,y2,'LineStyle','--');
xlabel('{-\pi}{\leq}{\Theta}{\leq}{\pi}')
ylabel('sin{\Theta}')
text(-pi/4,sin(-pi/4),'{\leftarrow}sin(-{\pi}{\div}4)','FontSize',12)

%% 动画对象
% 创建轨迹动画
% 描绘质点运动轨迹的动画，称为轨迹动画。
% MATLAB中提供了comet和comet3函数展现质点在二维平面和三维空间的运动轨迹。
%
% comet(x, y , p)
%
%  comet3(x, y, z ,p)
%
% x、y、z组成曲线数据点的坐标。
% p用于设置绘制的彗星轨迹线的彗长，彗长为p倍y向量的长度，p的可取值在[0,1]之间，默认p为0.1。

%%
% 用彗星运动轨迹演示曲线 $\left\{
%   \begin{array}{l}
%     x=\sin t+t \cos t  \\
%     y=\cos t-t\sin t \\
%     z=t
%   \end{array}
% \right. 0\leq t\leq10\pi$ 
% 的绘制过程

t=linspace(0,10*pi,200);
x=sin(t)+t.*cos(t);
y=cos(t)-t.*sin(t);
comet3(x,y,t);

%%
% MATLAB提供animatedline函数创建动画线条对象，调用格式为：
%
% h = animatedline(ax,x,y,z,属性名1,属性值1,…)
%
% ax指定动画线条对象的父对象，默认为当前坐标轴。
% x、y、z定义动画线条对象的起始位置。

a=axes('view',[-37.5,30]);
ha.XLim=[-30,30];
ha.YLim=[-30,30];
ha.ZLim=[0,30];
h = animatedline;
%生成数据
t=linspace(0,10*pi,200);
x=sin(t)+t.*cos(t);
y=cos(t)-t.*sin(t);
%逐个添加数据点并绘制
for k = 1:length(t)
    addpoints(h,x(k),y(k),t(k));
    drawnow
end

% 高版本中运行

%% 参考文献
 
 % 蔡旭晖等，《MATLAB基础与应用教程》第二版，人民邮电出版社，2019年1月。
 