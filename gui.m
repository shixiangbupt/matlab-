%% APP���
% ɽ������ѧ��ѧԺ  ������

%% ѧϰĿ��
% ����ͼ���û�������Ƶķ�����
% ��Ϥ�ؼ��ĳ������ԡ�
% ����GUIDE��ʹ�á�
% ����GUI�ص������Ķ��巽����
% ����App��ƹ��ߵ�ʹ�á�

%% �û�����������
% �ؼ���Controls��
% ��1����ť��һ����ť����һ�ֲ�����Ҳ��Ϊ���ť��
% ��2�����������û�����ͨ���ƶ��������ı们���������ֵ��
% ��3����ѡ��ť������ѡ��ʱ��ԲȦ��������һ��ʵ�ĵĺڵ㣬����ԲȦΪ�հס���һ�鵥ѡ��ť�У�ֻ����һ����ѡ�С�
% ��4����ѡ�򡣱�ѡ�е�����С�������С̡���ѡ��һ�ο���ѡ����
% ��5���ɱ༭�ı������û����������á��༭������������ַ���������������ǰ��Ҫת��Ϊ��Ӧ������
% ��6����̬�ı���һ�����������ؼ��ı�ǩ����ʾ��

%%
% �˵���Menus��
% ͨ��ʹ�ò˵������԰ѶԳ���ĸ��ֲ�������ǳ��淶��Ч�س��ָ��û��������˵������ִ����Ӧ�Ĺ��ܡ�
% �˵�������ͼ�δ��ڵ��Ӷ���
% ��ݲ˵���ContextMenu����������Ҽ�����ĳ����ʱ����Ļ�ϵ����Ĳ˵���Ҳ��Ϊ�����Ĳ˵���

%%
% 3����������Toolbars��
% ��������ͼ�귽ʽ�ṩ�˳�������Ŀ��ٷ��ʰ�ť��

%% �ؼ��Ĺ�������
% 1����ۿ�������
% ��1��Style���ԡ����ڶ���ؼ���������͡�
% ��2��Tag���ԡ����ڶ���ؼ���ʶ��
% ��3��String���ԡ����ڶ���ؼ������˵�����֡�
% ��4��Enable���ԡ����ڿ��ƿؼ������Ƿ���ã�ȡֵ�ǡ�on����Ĭ��ֵ����off����
% ��5��HorizontalAlignment���ԡ���������˵�����ֵ�ˮƽ���뷽ʽ����ȡֵΪ'center'��Ĭ��ֵ����'left'��'right'��
% ��6��BackgroundColor���ڶ���ؼ���������ı���ɫ��Ĭ��ֵΪ[.94 .94 .94]��ǳ��ɫ����
% % ForegroundColor�������ڶ���ؼ�����˵�����ֵ���ɫ��Ĭ��Ϊ��ɫ��
% 
% ��7��Position���ԡ����ڶ���ؼ��������û������е�λ�úʹ�С������ֵ��һ��4Ԫ���� [n1��n2��n3��n4]��n1��n2�ֱ�Ϊ�ؼ��������½�����ڸ������x��y���꣬n3��n4�ֱ�Ϊ�ؼ�����Ŀ�Ⱥ͸߶ȡ�
% ��8��Max��Min���ԡ�����ָ���ؼ���������ֵ����Сֵ��Ĭ��ֵ�ֱ���1��0��
% 	��9��Value���ԡ����ڻ�ȡ�����ÿؼ�����ĵ�ǰֵ�� 
% ��10��UserData���ԡ����ڴ洢��ؼ�������������ݣ�Ĭ��Ϊ�����顣

%%
% 2���¼���Ӧ����
% ��1��Callback���ԡ�����ֵ������������ַ�������������������ؼ�ʱ��ϵͳ���Զ�ִ���ַ����������������þ��������ĺ�����ʵʩ��ز�����
% ��2��ButtonDownFcn���ԣ����ڶ����ڿؼ������ϵ���������ʱִ�е����
% ��3��KeyPressFcn���ԡ����ڶ����ڿؼ������ϰ��¼��̼�ʱִ�е����
% ��4��KeyReleaseFcn���ԡ�����ָ���ڿؼ������ϰ��¼��̼����ͷ�ʱִ�е����
% ��5��CreateFcn���ԣ�����ָ���ڽ����ؼ�����ʱִ�е����
% ��6��DeleteFcn���ԣ�����ָ��ɾ���ؼ�����ʱִ�е����
%% �ص�����
% 1���¼���������
% �������ĳ���������Զ����֪�¼��Ĺ���Ϊ��̵�λ�����¼�����ʱ����Ӧ�ĳ���βŻ����С�
% �¼������û������ϵͳ�����Ķ�����
% gcbo�������ڻ�ȡ����ִ�лص��Ķ�������
%%
% 2���ص�����
% �ص����������������������Ϣ����Ӧĳ�¼����ú��������������У��������س�����õġ�
% �ص������Ļ����ṹ��
% function �ص�������(source, eventdata)
% ����
% end
% ����source�Ƿ����¼���Դ��������eventdata�洢�¼�����

%%
%���� 1������[0,2��]���������ߣ����������ϵ���������ʱ��������������ɫ��Ϊ��ɫ�� 

% ���ȶ���ص�����setlinecolor��
% function setlinecolor(source,~)
%     source.Color='r';
% end

% ��������������Ϊ�����ļ�setlinecolor.m��Ȼ���������ִ���������
    x=linspace(0,2*pi,50);
    h=plot(x,sin(x));
    h.ButtonDownFcn=@setlinecolor;
    % matlab2016��ִ��
%% GUI����
% �����ؼ�����
% ����uicontrol���ڽ����ؼ�����ģ����ø�ʽΪ
% h = uicontrol(parent,����1,����ֵ1,����2,����ֵ2, ��)
% ����parent����ָ���ؼ�������������������󣩣����Լ���ȡֵ�����˿ؼ������������
% ���磬��ͼ�δ����Ϸ���һ����������

fh=figure('position',[100,200,320,160]);
sh = uicontrol(fh,'Style','slider', ...
                'Max',100,'Min',0,'Value',25, ...
                'SliderStep',[0.05 0.2], ...
                'Position',[60 100 150 30]);
%%
% uibuttongroup������uipanel������uitoolbar�������ֱ����ڽ�����ť�顢��塢�����������ø�ʽΪ
% h = uibuttongroup(parent,����1,����ֵ1,����2,����ֵ2, ��)
% h = uipanel(parent,����1,����ֵ1,����2,����ֵ2, ��)
% h = uitoolbar(parent,����1,����ֵ1,����2,����ֵ2, ��)

fh=figure;
  bg = uibuttongroup(fh,'Position',[0.1,0.1,0.5,0.1]);
  r1 = uicontrol(bg,'Style','radiobutton',...
                  'String','ѡ��A',...
                  'Position',[10 10 100 30]);
  r2 = uicontrol(bg,'Style','radiobutton',...
                  'String','ѡ��B',...
                  'Position',[110 10 100 30],...
                  'Value',1);
  %% �����û��˵�
%   1�������˵�
% MATLAB�ṩ��uimenu���������������á��޸Ĳ˵����������ø�ʽΪ
% m = uimenu(parent,����1,����ֵ1,����2,����ֵ2, ��)
% �����˵�ʱ��parentΪͼ�δ��ڵľ����Ĭ���ڵ�ǰͼ�δ����н�������˵���
hm=uimenu(gcf,'Label','�ļ�');
  hm1=uimenu(hm,'Label','��');
  hm2=uimenu(hm,'Label','�½�');
  hm3=uimenu(hm,'Label','����');
  hm21=uimenu(hm2,'Label','ͼ�δ���');
  hm22=uimenu(hm2,'Label','������');
% MATLABͼ�δ��ڴ���Ĭ�ϲ˵���������Ҫͼ�δ��ڵ�Ĭ�ϲ˵�Ϊ�˽����û��Լ��Ĳ˵�ϵͳ��
% �����Ƚ�ͼ�δ��ڵ�MenuBar��������Ϊnone��

%%
% 2���˵�����
% �˵����������Children��Parent��Tag�ȹ��������⣬����һЩ�������ԡ�
% Label���ԣ����ڶ���˵�������ʾ�����֡�
% Accelerator���ԣ����ڶ���˵���Ŀ�ݼ���
% Checked���ԣ�ָʾ�˵����Ƿ���ѡ�С� 
% Enable���ԣ����Ʋ˵���Ŀ�ѡ���ԡ�
% Separator���ԣ��ڲ˵����Ϸ����һ���ָ��ߡ�

%% ������ݲ˵�
% ��1��uicontextmenu�������ڽ�����ݲ˵����������ø�ʽΪ
% m = uicontextmenu(parent,����1,����ֵ1,����2,����ֵ2, ��)
% ��2������uimenu����Ϊ��ݲ˵�������һ���˵��
% ��3��ͨ��ͼ�ζ����UIContextMenu���Խ���ݲ˵���ͼ�ζ��������

%% ʵ�� �������� x=sin t+sin 2t,y=cos t- cos 2t, ������һ����ݲ˵����������ߵ����ͺ���ɫ��

syms t;
x=sin(t)+sin(2*t);
y=cos(t)-cos(2*t);
hf=figure('Name','��ݲ˵���ʾ');
hl=fplot(x,y,'Tag','myline');
hc=uicontextmenu;              %������ݲ˵�
%����һ���˵���
hcs=uimenu(hc,'Text','����'); 
hcc=uimenu(hc,'Text','������ɫ');
%���������˵���
uimenu(hcs,'Text','����','Tag',':','CallBack',@LineStatus)
uimenu(hcs,'Text','ʵ��','Tag','-','CallBack',@LineStatus);
uimenu(hcc,'Text','��','Tag','r','CallBack',@LineStatus);
uimenu(hcc,'Text','��','Tag','k','CallBack',@LineStatus);
%���ÿ�ݲ˵������߶������
hl.UIContextMenu=hc; 

%Ȼ�� ���������ļ�LineStatus.m�ص�����
 
% function LineStatus(source,~)
% h=findobj('Tag','myline');
% if source.Parent.Text=="������ɫ"  
%     h.Color=source.Tag;
% elseif source.Parent.Text=="����"
%     h.LineStyle=source.Tag;        
% end

%% GUIDE���
% 1����GUIDE
% ��GUIDE�����ַ�����
% ��1����MATLAB���棬 ѡ����ҳ��ѡ��������������ġ��½������ť�����ӵ����������б���ѡ��App���µ������� ��GUIDE����
% ��2����MATLAB�����д�������guide���

% 3���ص�����
% ���ڶ����������������Ϣ����Ӧ�¼���
% ��GUIDE�У���ť��ؼ��Ͳ˵���ĵ����¼���Ĭ�ϻص�������Callback ������ͼ�ζ���Ļص����Ի���ButtonDownFcn��KeyPressFcn��SelectionChangeFcn�ȡ�
% ��GUIDE�У��ؼ��Ļص�����ֵĬ��Ϊ��%automatic�������Զ�ʹ��Ĭ�ϵĻص�������
% GUIDE�Զ����ɵĻص�����ͷ��ʽΪ��

% function pushbutton1_Callback(hObject,eventdata,handles)
% hObject�洢�¼�������Դ�ؼ�
% eventdata�洢�¼�����
% handles�洢�û����������ж���ľ����

% ���磬�û���������һ����ť����pushbutton1��1����̬�ı�����text1��������ʱ������ťpushbutton1��
% ʹtext1����ʾ��Hello, World�������ڻص�����pushbutton1_Callback�ĺ������м���������䣺

% handles.text1.String='Hello, World';

% guiex1

% ���磬�ڻص�����pushbutton1_Callback�ĺ������м���������䣺
% handles.mydata="This is an example.";
% guidata(hObject, handles);
% ��pushbutton2_Callback�ĺ������м���������䣬�ڶ���text1����ʾ�����ַ�����
% handles.text1.String=handles.mydata;

%% ������ƹ���
% 1�����Լ������Property Inspector��
% ���ڲ鿴�������û������и�����������ԡ�
% ˫��ĳ�����󣬻�ѡ�ж���󣬵����༭���������� �����Լ��������ť����ӡ���ͼ���˵���ѡ�˵�����Լ���������������Լ������
% ��MATLAB�����д����������inspect���������Լ������

%%
% 2���˵��༭����Menu Editor��
% ���ڴ��������á��޸�����ʽ�˵��Ϳ�ݲ˵���
% ��1�������˵�
 
% �˵�/�˵������Ҫ���ԡ�
% 	Label����ǩ�����ԡ����ڶ���˵��������ʾ�����֡������ַ����м��롰&���ַ���������ڡ�&������ַ���һ���»��ߡ��������ִ����»����ַ��Ĳ˵�/�˵��������Alt+���ַ��������
% 	Tag����ǣ����ԡ���Ϊ�˵���ı�ʶ��
% 		Callback���ص������ԡ������Ե�ȡֵ�Ǻ�������������ַ���������MATLAB����û���������ʱ��������ĳ�˵��MATLAB���Զ����øò˵���ص������ж���ĺ��������
%%
% 3���������༭����Toolbar Editor��
% ���������á��޸Ĺ�������
%% 
% �����������Object Browser��
% ������������ڲ鿴������������ͼ�ζ����չʾ�������֯�ܹ���

%%
% Tab��˳��༭����Tab Order Editor��
% ����Tab��˳��༭�������������û��������ϵ�Tab��ʱ���û������ϵĶ��󱻼�����Ⱥ�˳��

%% GUIDE�����ʾ��

% �� ����GUIDE��ƹ��������ͼ ��ʾ���û����档�ý��������ʾ����ͼ������ͼ�͵ȸ���ͼ��
% ����ͼ�εĹ���ͨ��3�����ť��ʵ�֣�����ͼ������Ҫ������ͨ��һ���б���ѡȡ��
 % ��λ�Ǻ��������ӵ���������ã�ͼ��ʹ�õ�ɫͼͨ�������б����ѡ����ɫ��ʽͨ����ѡ��ť�����ѡ��
 % �л���ť�������ػ���ʾ����������
 [x,y]=meshgrid(-8:0.3:8);
r=sqrt(x.^2+y.^2);
% sinc=sin(r)./(r+eps);
mesh(x,y,r)
 
 %%
%  1����GUIDE������й�ͼ�ζ���
% �½�һ��Blank GUI���ڽ���༭�����1�������ᡢ3����ť��1��˫λ��ť��1���б��1����壨�ӵ㣩��
% 1������ʽ�˵���ɫͼ����1����ť�飨��ɫ��ʽ������������з��������ɱ༭�ı����ڰ�ť���з���3����ѡ��ť��
% ���ö�����󹤾ߣ���ͼ�����ø����ؼ�����Ĵ�С��λ�á�
% ����û����沼�ֺ󱣴���档
% ����Ƶ��û����汣��Ϊ.fig�ļ�����ʱϵͳ�����Զ�����һ��ͬ����.m�ļ���
% ���ڱ����û������ʼ�������Լ�ͼ�δ��ںͿؼ��Ļص�������

%%
% ��д���룬ʵ�ֿؼ����ܡ�
% ��1��ͼ�δ��ڵĻص�����

%% 
% ��ͼ�δ��ڵ�OpeningFcn���������������´��룺
% %����ͼ������
% handles.peaks=peaks(34); 
% handles.membrane=membrane;
% [x,y]=meshgrid(-8:0.3:8);
% r=sqrt(x.^2+y.^2);
% sinc=sin(r)./(r+eps);
% handles.sinc=sinc;
% %��Ĭ�ϻ�ͼ���ݴ洢��handles��current_data��Ա��
% handles.current_data=handles.sinc;
% %�ں�����ͼ����ʱ��ʹ��springɫͼ����ͼ��
% colormap(spring);
%%

% 2���ؼ�����Ļص�����
%  3����ͼ��ť���ڻ��Ʊ���ͼ������ͼ�͵ȸ���ͼ��

% ��Mesh_Callback���������������´��롣
% mesh(handles.current_data)
% ��Surf_Callback���������������´��롣
% surf(handles.current_data);
% ��Contour3_Callback���������������´��롣
% contour3(handles.current_data)
% �л���ťGridSwitch������ʾ/��������
% ��GridSwitch_Callback���������������´��롣

% if hObject.Value==1
%     grid on
%     hObject.String='��������';
% else 
%     grid off
%     hObject.String='��ʾ����';
% end
% �б��ChooseFun����ѡ���ͼ����Դ��
% ��ChooseFun_Callback���������������´��롣

% str=hObject.String; %��ȡ�б���е��б���
% val=hObject.Value; %��ȡѡ��������
% %����ѡ������ı�ȷ��������һ������Դ��Ϊ��ͼ����
% switch strtrim(str{val})
% case 'Peaks' 
%    handles.current_data=handles.peaks;
% case 'Membrane' 
%    handles.current_data=handles.membrane;
% case 'Sinc'
%    handles.current_data=handles.sinc;
% end
% %����handles
% guidata(hObject,handles)
% 

%%
% ����ʽ�˵�ChooseCMap�������û�ͼ�����õ�ɫͼ��
% ��ChooseCMap_Callback���������������´��롣

% str=hObject.String; %��ȡ�б���е��б���
% cm=hObject.Value; %��ȡѡ��������
% colormap(eval(str{cm}));

% �ӵ�������������ӵ㣬������λ�Ǻ����ǣ��������еİ�ťConfigView������view���������ӵ㡣
% ��ConfigView_Callback���������������´��롣
% el=eval(handles.edit_el.String);
% az=eval(handles.edit_az.String);
% view(az,el)
% ��ť��ChooseShading�е�ѡ����ı�ʱ���ᴥ��SelectionChanged�¼���
% ��ChooseShading_SelectionChangedFcn���������������´��롣
% %������ѡ���Tag����ȷ����ɫ��ʽ
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
