%% figure object��ͼ�ζ���
% ɽ��������ѧ��ѧ��ͳ��ѧԺ

%% 
% ��MATLAB�У�ÿһ�������ͼ�ζ��������ɸ���ͬ��ͼ�ζ�����ɵġ�
% һ����Ŀ���԰���һ������ͼ�δ��ڣ�һ��ͼ�δ��ڿɰ���һ�����������ᣬ
% ÿһ�����������ֿɻ��ƶ���ͼ�Σ������ߡ����桢�ı��ȡ�
% ��MATLABϵͳ�н���һ������ϵͳ�ͻὨ��һ��ӳ��ö���ľ����
% ���ڴ洢��Ӧ��������ԡ�MATLAB��ͨ�������ͼ�ζ�����в�����
%
% ͼ�ζ������в�εġ�ϵͳ������ͼ�ζ������νṹ��֯������
%% ͼ�ζ�����  
% ��ǰ��MATLAB �汾�У�ͼ�ξ����Handle����һ��ʵ����
% ��R2014b��ͼ�ξ����Ϊ�˶�������һ�������Ӧ��һ��ͼ�ζ��󣬿����ö��������ú�
% ��ѯ�������ԡ�
%% 
% �ض�ͼ�ζ����ʶ��
%
% gcf()	��ȡ��ǰͼ�δ��ڵľ��
%
% gca()	��ȡ��ǰͼ�δ�����������ľ��
%
% gco()	��ȡ��ǰͼ�δ����е�ǰ����ľ��
%
% gcbf()	��ȡ����ִ�еĻص������Ӧ�Ķ������ڴ��ڵľ��
%
% gcbo()	��ȡ����ִ�еĻص������Ӧ��ͼ����
%
% findobj()	����Ĳ���
%
% ancestor()	���Ҷ���ĸ�����
%
% ͼ�ζ����Parent���Ի�ȡ���ݴ�ͼ�ζ����������Children���Ի�ȡ�˶��������ɵ�ͼ�ζ���
% �������߲��鿴�йض�������ԡ�
% �����������£�
x=linspace(-pi, pi,30);
plot(x,5*sin(x),'rx',x,x.^2,x,1./x);
h1=gca;   %��ȡ��ǰ������ľ��                            
% h1.Children	%��ѯ��ǰ��������Ӷ���
% matlab2019���н����
% 3��1 Line ����:
% 
%   Line
%
%   Line
%
%   Line
%
% h1.Children(1)
 
% �������߲��鿴�йض�������ԡ�
% �鿴��1����������ԣ�
% ans = 
% 
%   Line - ����:
% 
%               Color: [0.9290 0.6940 0.1250]
%           LineStyle: '-'
%           LineWidth: 0.5000
%              Marker: 'none'
%          MarkerSize: 6
%     MarkerFaceColor: 'none'
%               XData: [1��30 double]
%               YData: [1��30 double]
%               ZData: [1��0 double]
 


%% ͼ�ζ�������
% MATLAB����ͨ�������ԵĲ��������ƺ͸ı�ͼ�ζ������ۺ���Ϊ��
%
%  ������������ֵ
% 
% ͬһ�����������ͬ�����ԣ����Ե�ȡֵ�����˶���ı��֡�
% ���磬LineStyle�����߶����һ�����ԣ�����ֵ���������ͣ�ȡֵ������'-' ��':'��'-.'��'--'��'none'��
% ����������д���У���������ĸ�Ĵ�Сд�������ڲ����������ǰ���£�����������ֻдǰһ���֡����磬
% lines�ʹ���LineStyle��
%%
% ���ԵĲ���
% MATLAB 2014b���Ժ�İ汾��һ��ʹ�õ�����������ʶ������ԣ�һ����ʽ�ǣ�������.������
%  
% ����ͼ�ζ������ԣ�
% H.������ = ����ֵ
% ���У�H��ͼ�ζ���ľ����

% �����������ߣ�Ȼ�����������޸�Ϊ���ߣ�������ɫΪ��ɫ��

% �Ͱ汾2014a�о�����Ϣ
% h1=fplot(@(x)sin(x),[0,2*pi]);
%  h1.Color=[1 0 0];
%   h1.LineStyle=':';

%%
% ���ԵĲ�����
%
% ��ͬʱ����һ��ͼ�ζ�������ԣ����Բ���set���������ø�ʽΪ
%
% set(H,Name,Value)
%
% set(H,NameArray,ValueArray)
%
% ���У�H����ָ��Ҫ������ͼ�ζ������H��һ���ɶ��ͼ�ζ��������ɵ�������
% �����ʩ����H�����ж���
 
 
% ����3�����ߣ�Ȼ����������ȫ���޸�Ϊ���ߣ�������ɫΪ��ɫ������ʹ���������
%   hlines=fplot(@(x)[sin(x),sin(2*x),sin(3*x)],[0,2*pi]);
%   set(hlines,'Color',[0 0 1],'LineStyle',':');
%%
% ��3�����߷ֱ���ò�ͬ��ɫ����ͬ���ͣ������ʹ���������
%   hlines =fplot(@(x)[sin(x),sin(2*x),sin(3*x)],[0,2*pi]);
%   NArray = {'LineStyle','Color'};
%   VArray = {'--',[1 0 0]; ':',[0 1 0]; '-.',[0 0 1]};
%   set(hlines,NArray,VArray)
 % ��Ҫ�߱���������
 
 %% 
% ���ԵĲ���
% 
%  ��ȡͼ�ζ������ԣ�
% V = H.Name
% ���У�H��ͼ�ζ���ľ����Name����������
% ���磬���ǰ������h1����ɫ����ֵ

hcolor=h1.Color     %��hcolor=get(h1,'Color')
%%
% ����Ҫ��ȡһ��ͼ�ζ�������ԣ����Բ���get������get�����ĵ��ø�ʽΪ
% V=get(H, Name)
% ���У�H��ͼ�ζ�������ѡ��Nameָ��Ҫ���ʵ����ԣ�V�洢���ص�����ֵ��

% hlines_p=get(hlines,{'Color','LineStyle'}) %ͼ��hlines���ܹر�

%%
% ���ԵĲ���
%
%  ���Լ����
%
% inspect���������Լ��������ѯ���޸�ͼ�ζ�������ԡ����ø�ʽ���£�
%
% inspect(H)
%
% inspect([h1,h2,...])
%
% ���У�����H��h1��h2������ͼ�ζ�����
x=linspace(0, 2*pi,100);
  h1=plot(x,log(x).*sin(x),'r:');
  inspect(h1);
  h2=text(1,0,'example');  
  inspect([h1,h2])
%%
% ����Ĺ�������
% 
% # Children���ԡ� 
% #  Parent���ԡ�
% # Color���ԡ�
% # Position���ԡ�����ֵ��һ����4��Ԫ�ع��ɵ�������������ʽΪ[x, y, w, h]���������������ͼ�ζ������ϲ�����ϵ�λ�úʹ�С������x��y�ֱ�Ϊ�������½ǵĺᡢ�����꣬w��h�ֱ�Ϊͼ�ζ���Ŀ��Ⱥ͸߶ȡ�
% # Units���ԡ�����ͼ�ζ�����ʹ�õĳ��ȵ�λ��
% # Tag���ԡ�����ı�ʶ����
% # Type���ԡ�
% # Visible���ԡ�
% # CreateFcn���Ժ� DeleteFcn���ԡ�����ָ������ͼ�ζ����ɾ��ͼ�ζ���ʱ���õĺ�����ִ�е����
% # KeyPressFcn���ԡ�����ָ�����̰����¼�����ʱ���õĺ�����ִ�е����
% # WindowButtonDownFcn��ButtonDownFcn���ԡ�����ָ����갴���¼�����ʱ���õĺ�����ִ�е����
% # WindowButtonMotionFcn���ԡ�����ָ������ƶ��¼�����ʱ���õĺ�����ִ�е����

%%
% �ֱ��ڲ��ŵ������������л���һ�����ߺ�һ�����档Ȼ��������������ı���ɫΪ��ɫ��
% ����������ɫΪ��ɫ��������������ı���ɫΪ��ɫ��
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
% �߰汾�п���

%% ͼ�δ��ڶ���
% ͼ�δ��ڵĻ�������
% figure�������������ڶ��󣬵��ø�ʽ���¡�
%
% �������=figure(������1,����ֵ1,������2,����ֵ2,��)
%
% ������������ͼ�δ��ڵĳ��ַ�ʽ���������ʱ������������ͼ�δ��ڵ�Ĭ������ֵ����ͼ�δ��ڡ�
% �趨�����Ӧ�Ĵ���Ϊ��ǰ���ڣ�
%
% figure(���ھ��)
%
% �ر�ͼ�δ��ڣ�
%
% close(���ھ��)
%
% ���ͼ�δ��ڵ����ݣ������رմ��ڣ���ʹ��clf������
% clf(���ھ��)
% 

%%
% ͼ�δ��ڵ�����

% ��1��Name���ԡ�����ֵ��һ���ַ���������ָ��ͼ�δ��ڵı��⡣
% ��2��Number���ԡ�ͼ�δ��ڵ���š�
% ��3��NumberTitle���ԡ�
% ��4��MenuBar���ԡ����ڿ���ͼ�δ����Ƿ���в˵�����
% ��5��ToolBar���ԡ����ڿ���ͼ�δ����Ƿ���й�������
% ��6��Pointer���ԡ�����ָ�����ָ����ʽ��
% ��7��SizeChangedFcn��ResizeFcn���ԡ�����ָ�������ڴ�С�����ı�ʹ��ڴ�С���¶���ʱ���õĺ��������
% ͼ�δ��ڶ����Ĭ�϶�����λ��Units��Ϊ'pixels'�������ء�

%%
% ����һ��ͼ�δ��ڡ���ͼ�δ���û�в˵�������������Ϊ��ͼ�δ���ʾ������ͼ�δ���λ�ھ�
% ��Ļ���½�[2cm, 2cm]�������Ⱥ͸߶ȷֱ�Ϊ24cm��16cm�����û��ڼ��̰��������ʱ��
% ��ͼ�δ��ڻ����������ߡ�

hf=figure;
hf.MenuBar='None';
hf.NumberTitle='Off';
hf.Name='ͼ�δ���ʾ��';
hf.Units='centimeters';  %���ö�����λΪcm
hf.Position=[2,2,24,16];
hf.KeyPressFcn='fplot(@(x)sin(x),[0,2*pi])';

% �߰汾������

%% ������Ļ�������
% �������������ʹ��axes���������ø�ʽ���¡�
%
% 	�������=axes(parent, ������1,����ֵ1,������2,����ֵ2,��)
%
% �������������������������ѡ��parent����ָ��������ĸ�����������axes����ʱ�������������������Ĭ�������ڵ�ǰͼ�δ��ڴ��������ᡣ
% 
% �趨�þ��������������Ϊ��ǰ�����᣺
% axes(��������)
%
% ����������е�ͼ�Σ�
% cla(��������)
% ����������cla��������ʾ�����ǰ�������е�ͼ�Ρ�

%%
% �����������

% ��1��Box���ԡ������������Ƿ���б߿򣬿�ȡֵ��'on'��'off'��
% ��2��GridLineStyle���ԡ����ڶ��������ߵ����ͣ���ȡֵ��'-'��Ĭ��ֵ����':'��'-.'��'--'��'none'��
% ��3��Title���ԡ��������ú��޸���������⣬ֵ��ͨ��title���������ı������ľ����
% ��4��	XLabel��YLabel��ZLabel���ԡ��������ú��޸�x��y��z��ı�ǩ��ȡֵ�ֱ���ͨ��xlabel��ylabel��zlabel���������ı�ǩ����ľ����
% ��5��XLim��YLim��ZLim ���ԡ�ȡֵ��2Ԫ����[Lmin, Lmax]���ֱ���x��y��z������޺����ޣ�Ĭ��Ϊ[0, 1]��
% ��6��XScale��YScale��ZScale ���ԡ����ڶ���x��y��z��Ŀ̶����ͣ�ȡֵ��'linear'��Ĭ��ֵ����'log'��
% ��7��XTickLabel��YTickLabel��ZTickLabel���ԡ����ڶ���x��y��z��Ŀ̶��߱�ǩ��
% ��8��Xdir��Ydir��Zdir���ԡ����ڶ�����x��y��z�������ӵ�ֵ�ķ���ȡֵ��'normal'��Ĭ��ֵ����'reverse'��
% ��9��View���ԡ����ڶ����ӵ㣬ȡֵ��2Ԫ����[azimuth elevation]��azimuthָ���۲췽λ�ǣ�elevationָ�����ǡ�
% ����������Ĭ�϶�����λ��Units��Ϊ'normalized'��������������ͼ�δ��ڻ���壩���й�һ�������������½�ӳ��Ϊ(0,0)�����Ͻ�ӳ��Ϊ(1,1)��


%%
% �������������ʵ��ͼ�δ��ڵ�����ָ�
[x,y]=meshgrid(0:0.1:pi/2,0:0.05:pi);
z=sin(x.^2)+cos(y.^2);
ha1=axes('Position',[0.05,0.6,0.3,0.3]);
plot(x,z);
ha1.YDir='reverse';  %����y�ᷴ�����
ha2=axes('Position',[0.45,0.6,0.5,0.35]);
plot3(x,y,z);
ha2.View=[45,-45];  %�����ӵ㷽λ��Ϊ45������Ϊ-45
ha3=axes('Position',[0.1,0.05,0.8,0.5]);
plot3(x,y,z); 
grid on;  %��ʾ������

%% ���߶���
% ���߶��������plot��plot3���������⣬��������line����������line�������ø�ʽ���¡�
%
% 	h=line(ax, x, y, ������1, ����ֵ1, ������2, ����ֵ2,��)
%
% 	h=line(ax, x, y, z, ������1, ����ֵ1, ������2, ����ֵ2,��)
%
% ���� x��y��z�ĺ�����÷���plot��plot3����һ�������Ե�������ǰ����ܹ���figure��axes�������ơ�
% ѡ��ax����ָ���������������ᣬĬ���ڵ�ǰ������������ߡ�

% ���߶��������ԡ�
% ��1��LineStyle���ԡ����ڶ������ͣ�Ĭ��ֵΪ'-'��
% ��2��LineWidth���ԡ����ڶ����߿���Ĭ��ֵΪ0.5����
% ��3��LineJoin���ԡ����ڶ��������߽ǵ���ʽ����ȡֵ��'round'��Ĭ��ֵ����'miter'��'chamfer'��
% ��4��Marker���ԡ����ڶ����Ƿ��ţ�Ĭ��ֵΪ'none'��
% ��5��MarkerSize���ԡ����ڶ����Ƿ��ŵĴ�С��Ĭ��ֵΪ6����
% ��6��MarkerEdgeColor���ԡ����ڶ����Ƿ��ű߿����ɫ��Ĭ��ֵΪ'auto'��
% ��7��MarkerFaceColor���ԡ����ڶ����Ƿ����ڵ����ɫ��Ĭ��ֵΪ'none'��
% ��8��XData��YData��ZData���ԡ�����ֵ����ֵ�������ֱ�洢���߶���������ݵ��λ�����ݣ�XData��YDataĬ��Ϊ[0 1]��
% ZDataĬ��Ϊ�վ���
% ���ߵ�Ĭ�϶�����λ��Units��Ϊ����
% plot����ÿ����һ�Σ��ͻ�ˢ�������ᣬ���ԭ��ͼ�Σ��ٻ����µ����ߡ�
% line�������ɵ�������������ͼ���ϵ�����ʾ��

%%
% ����line������������ $y=e^{-t}\sin(2\pi t)$�� $y=\cos(\frac{\pi}{2}t)$.
t=linspace(0,4,100);
y=sin(2*pi*t).*exp(-t);
figure('Position',[120,100,480,320]);
ha=axes('GridLineStyle','-.');
htitle=get(ha,'Title');
htitle.String='e^{-t}sin(2{\pi}t) �� cos({\pi}t/2)';
hl1=line('XData',t,'YData',sin(2*pi*t).*exp(-t));
hl1.LineStyle='-.';
hl2=line('XData',t,'YData',cos(pi/2*t));
hl2.LineStyle=':';
grid on

%% �������
% �����������
% ����ʹ��mesh��surf�Ⱥ����⣬������ʹ��surface���������ø�ʽΪ
%
% h=surface(ax, Z, C, ������1,����ֵ1, ������2,����ֵ2,��)
%
% h=surface(ax, X, Y, Z, C, ������1,����ֵ1, ��)
%
% X��Y�������������Z��������ϵĸ߶Ⱦ���
%
% ���������ֻ��һ������Zʱ����Zÿ��Ԫ�ص��к����������� x �� y ���꣬��Zÿ��Ԫ�ص�ֵ���� z �������ͼ�Ρ�
% ѡ��C����ָ���ڲ�ͬ�߶��µ�������ɫ��Cʡ��ʱ��MATLAB��ΪC=Z���༴��ɫ���趨��������ͼ�θ߶ȵġ�
% ѡ��ax����ָ���������������ᣬĬ���ڵ�ǰ���������ͼ�Ρ�

% ��������
% ��1��EdgeColor���ԡ����ڶ������������ߵ���ɫ��
% ��2��FaceColor���ԡ����ڶ�����������Ƭ����ɫ����ɫ��ʽ��
% ��3��FaceAlpha���ԡ����ڶ��������͸���ȣ���ȡֵΪ0����ȫ͸����~1����ȫ��͸����֮�������'flat'��'interp'��texturemap��Ĭ��Ϊ1��
% ��4��FaceLighting���ԡ����ڶ���ͶӰ������ĵƹ��Ч������ȡֵΪ'flat' (Ĭ��ֵ)��'gouraud'��'none'��
% ��5��BackFaceLighting���ԡ����ڶ��屳��Ч������ȡֵΪ'reverslit' (Ĭ��ֵ)��'unlit'��'lit'��
% �����Ĭ�϶�����λ��Units��Ϊ����
% surf��mesh����ÿ����һ�Σ��ͻ�ˢ�������ᣬ���ԭ��ͼ�Σ��ٻ����µ�ͼ�Ρ�
% surface�������ɵ�������������ͼ���ϵ�����ʾ��

%%
% ����������������ά���� $z=x^2-2y^2$��
[x,y]=meshgrid(-10:0.5:10);
z=x.^2-2*y.^2;
axes('view',[-37.5,30],'Position',[0.05,0.1,0.4,0.85])
hs1=surface(x,y,z);
hs1.FaceColor='none'; %��������Ƭ�����
hs1.EdgeColor='b';  %��������Ƭ�߿�Ϊ��ɫ
hT1=get(gca,'Title');
set(hT1,'String','��������','FontSize',12,'Position',[5,10]);  
axes('view',[-37.5,30],'Position',[0.55,0.1,0.4,0.85])
hs2=surface(x,y,z);
hs2.FaceColor='interp';  %��������Ƭ�ý���ɫ���
hs2.EdgeColor='flat';  %��������Ƭ�߿�Ϊ��һ��ɫ
hT2=get(gca,'Title');
set(hT2,'String','��ɫ����','FontSize',12,'Position',[5,10]);

% �߰汾����

%%
% ����������ɫ
% ��������CData ���Գ�Ϊ��ɫ���������ڶ������涥�����ɫ��CData ���ԵĶ������������ַ�����
%  ʹ��ɫͼ
%
% ��CData����ֵ��һ�����������X��Y��Zͬ�͵ľ���C��C��������ɫͼ��Colormap���е���ɫ��������������񶥵�(i,j)����ɫΪC(i,j)��ɫͼ�ж�Ӧ����ɫ��
% MATLABĬ�Ͻ�CData�������������ݷ�Χӳ�䵽ɫͼ�ϣ���ɫ��������Сֵӳ�䵽ɫͼ����ĵ�һ��RGB��Ԫ�飬���ֵӳ�䵽ɫͼ��������һ��RGB��Ԫ�飬�����м�ֵ����ӳ�䵽ɫͼ�ľ����м��RGB��Ԫ�顣

%%
% ������ά���� $z=x^2-2y^2$��������һ����zͬ�͵��������C��
% ������ΪCData����ֵ���۲�������ɫ�����C�Ķ�Ӧ��ϵ��

[X,Y]=meshgrid(-10:1:10);
Z=X.^2-2*Y.^2;
%����Ԫ��ֵ��[11,19]���������
C=randi(9,size(Z))+10;
axes('view',[-37.5,30])
h1=surface(X,Y,Z); 
h1.CData=C;
colorbar
Cmap=colormap(gray);

% ��������CData ���Գ�Ϊ��ɫ���������ڶ������涥�����ɫ��CData ���ԵĶ������������ַ�����

% ��1��ʹ��ɫͼ
% ��2��ʹ���Զ�����ɫ

% ��CData��һ��m��n��3���������X��Y��Z��m��n���󣩵���ά���飬���������񶥵�ʹ��CData�ĵ�3ά��RGB��Ԫ�鶨�����ɫ��

%% �ı�����
% ʹ��text�������Դ����ı�����text�����ĵ��ø�ʽΪ
% h=text(ax, x,y, ˵���ı�, ������1,����ֵ1,��)
% h=text(ax, x,y,z, ˵���ı�, ������1,����ֵ1,��)
% x��y��z�����ı������λ�á�
% ѡ��ax����ָ���ı��������������ᣬĬ���ڵ�ǰ����������ı���
  h=text(10,8,50,'{\gamma}={\rho}^2');
% ���ڵ�ǰ�������ָ��λ�������=��^2��

%%
% ��������

% ��1��String���ԡ�ָ����ʾ���ı���
% ��2��Interpreter���ԡ����ڿ��ƶ��ı��ַ��Ľ��ͷ�ʽ������ֵ��'tex'��Ĭ��ֵ��ʹ��TeX����Ӽ������ַ�����'latex'��ʹ��LaTeX��ǽ����ַ�����'none'��
% ��3���������ԡ�
% FontName��������ָ���ı�ʹ�õ���������ƣ�
% FontSize����ָ�������С��������λĬ��Ϊ����
% FontWeight��������ָ���ı��ַ��Ƿ�Ӵ֣�ȡֵ��'normal'��Ĭ��ֵ����'bold'���Ӵ֣���
% FontAngle���������ı��ַ��Ƿ���б��ȡֵ��'normal'��Ĭ��ֵ����'italic'��
% ��4��Rotation���ԡ����ڶ����ı�����ȡ��ֵʱ��ʾ��ʱ�뷽����ת��ȡ��ֵʱ��ʾ˳ʱ�뷽����ת������ֵ���Զ�Ϊ��λ������Ĭ��Ϊ0��
% ��5��HorizontalAlignment���ԡ������ı�ˮƽ����Ķ��뷽ʽ����ȡֵΪleft��Ĭ��ֵ����center��right��
% ��6��VerticalAlignment���ԡ������ı���ֱ����Ķ��뷽ʽ����ȡֵΪ'middle'��Ĭ��ֵ����'top'��'bottom'��'baseline'��'cap'��

%% 
% �������߶���������߲������ı�������ɱ�ע
x=-pi:0.1:pi;
y1=sin(x);
y2=cos(x);
h1=line(x,y1,'LineStyle',':');
h2=line(x,y2,'LineStyle','--');
xlabel('{-\pi}{\leq}{\Theta}{\leq}{\pi}')
ylabel('sin{\Theta}')
text(-pi/4,sin(-pi/4),'{\leftarrow}sin(-{\pi}{\div}4)','FontSize',12)

%% ��������
% �����켣����
% ����ʵ��˶��켣�Ķ�������Ϊ�켣������
% MATLAB���ṩ��comet��comet3����չ���ʵ��ڶ�άƽ�����ά�ռ���˶��켣��
%
% comet(x, y , p)
%
%  comet3(x, y, z ,p)
%
% x��y��z����������ݵ�����ꡣ
% p�������û��Ƶ����ǹ켣�ߵ��糤���糤Ϊp��y�����ĳ��ȣ�p�Ŀ�ȡֵ��[0,1]֮�䣬Ĭ��pΪ0.1��

%%
% �������˶��켣��ʾ���� $\left\{
%   \begin{array}{l}
%     x=\sin t+t \cos t  \\
%     y=\cos t-t\sin t \\
%     z=t
%   \end{array}
% \right. 0\leq t\leq10\pi$ 
% �Ļ��ƹ���

t=linspace(0,10*pi,200);
x=sin(t)+t.*cos(t);
y=cos(t)-t.*sin(t);
comet3(x,y,t);

%%
% MATLAB�ṩanimatedline�������������������󣬵��ø�ʽΪ��
%
% h = animatedline(ax,x,y,z,������1,����ֵ1,��)
%
% axָ��������������ĸ�����Ĭ��Ϊ��ǰ�����ᡣ
% x��y��z���嶯�������������ʼλ�á�

a=axes('view',[-37.5,30]);
ha.XLim=[-30,30];
ha.YLim=[-30,30];
ha.ZLim=[0,30];
h = animatedline;
%��������
t=linspace(0,10*pi,200);
x=sin(t)+t.*cos(t);
y=cos(t)-t.*sin(t);
%����������ݵ㲢����
for k = 1:length(t)
    addpoints(h,x(k),y(k),t(k));
    drawnow
end

% �߰汾������

%% �ο�����
 
 % �����͵ȣ���MATLAB������Ӧ�ý̡̳��ڶ��棬�����ʵ�����磬2019��1�¡�
 