%%  matlab�ļ�����
%  ɽ������ѧ��ѧԺ ������
%
% 20151127

%% �������ݵ��ļ�
% Description of first code block
mymat = rand(2,3)
save testfile.dat mymat -ascii %save���Ǵ��ļ���ͷд��
% ��ʾ�ļ�����
type testfile.dat 
%%
% ׷������
 mymat=rand(3,3);
 save testfile.dat mymat -ascii -append
 type testfile.dat
 

%%
% �����Ĭ�ϸ�ʽ
savefile = 'pqfile.mat';
p = rand(1, 10);
q = ones(10);
save(savefile, 'p', 'q')
 clear
load pqfile.mat
p


%%  
% С��ϰ����ʾ�û�������������������������һ���������Ȼ�󽫾���д��һ���ļ���

%% ���ļ��ж�����
clear
load testfile.dat 
who
%%
% load��������ܶ�����������ͬ���ļ������Զ��������ݿ��Դ浽�����У�
% save��������ܽ������е�����д���ļ���.
% �������������Ҫ�õ��ͼ����ļ�I/O������
% timetempprob.m
load timetemp.dat %����������ͬ
%0 3 6 9 12 15 18 21
% 55.5 52.4 52.6 55.7 75.6 77.7 70.3 66.6
time = timetemp(1,:);
temp = timetemp(2,:);
plot(time,temp,'k+')
xlabel('ʱ��'),ylabel('temperature'),title('������¶�')

 %%
 % ������һ�������ļ�������������ΰ����������
 clear
 load expresults.dat
% 7 55.2
% 6 51.9
% 5 49.5
% 4 53.4
% 3 44.3
% 2 50.0
% 1 55.5
 expresults
 correctorder=flipud(expresults)
 save neworder.dat correctorder -ascii
 
%% ����txt�ļ�
clear 
a=linspace(1,30,8);
save d:\exper.txt a -ascii;
b=load('d:\exper.txt');

%%
% ����ı��ļ��д洢�˲�ͬ���͵��ַ������ݣ������ȡ������textread������
% ����Ҫʹ��fopen������ļ��Ϳ���ֱ�Ӷ�ȡtxt���ݡ�
% [A,B,C,...]=textread('�ļ���','��ʽ',N,'headerline',M),Nָ��ȡ�Ĵ�����ÿ�ζ�һ��
% headerlines ��ʾ�Ӵӵ�M+1�п�ʼ����
clear
[name,type1,x,y,answer]=textread('d:\t.txt','%s Type%d %f %n %s',2,'headerlines',1);%�ӵڶ��п�ʼ������2��

%% matlab�����е�������
% Home����ϣ�"import Data"��ť

%% �߼��ļ�����/���
% ǰ�潲��input()��ȡ����ֵ��disp()��fprints����Ļ����ʾ��Ϣ�����������ͨ��load��save���������ļ�������������
% 
% ��load��save����ʱ��һֱʹ��Ascii��ʽ�ļ������͵��ļ�����Ϊ.dat��.txt������ÿ��ֵ�ĸ�����ͬ��ֵ������
% ��ͬʱ������load������ڰ���Щ���ݴ洢��һ�������У�save������������ݴӾ���д�뵽�ļ��С�
%
% ���Ҫд������ݻ��ȡ���ļ��ĸ�ʽ���ȡ���ļ��ĸ�ʽ��ͬ������ʹ�õͼ��ļ�����/���������
% matlab���һЩ�������ԴӲ�ͬ���ļ����Ͷ�ȡ��д�����ݣ�����ӱ�excel��matlabҲ���Լ��Ķ������ļ����ͣ�ʹ����չ��.mat,����
% �����洢matlab�д����ı�����
%%
% �ͼ����ļ�I/O����
% �����ļ��ж�ȡ����ʱ��ֻ�����ļ��е������ǹ���ʱ(ÿ������������ͬ��ÿ�и�ʽ��ͬ)��load�������ܹ������Ա��ܶ��뵽һ�������С�
% ��������load����ʱ��matlab�еͼ��ļ����뺯�����Ե��á����ļ������Һͽ����ļ��������ļ���ʼ�����ñ�־����ȡ���ʱ���ر��ļ���

%%
% �򿪺͹ر��ļ�
%
% fid=fopen('filename','permission string');% ���ļ�������ȡ
% Ȩ���ַ���������r��ȡ(Ĭ��)��wд�룬a׷�ӣ�
% ͨ��help fopen���ġ������ļ�ʧ�ܣ�����-1�����ɹ�������һ���������ļ���ʶ����

fid=fopen('samp.dat');
if fid == -1
    disp('File open not successful')
else
    % ִ�к�ʹ�ø��ļ�
end
% ���Է���ֵ��������ӡ������Ϣ

% ��������ɶ�ȡ��д���Ӧ�ر��ļ���fclose()���رճɹ�����0��Ҳ����ͨ��ָ���ļ���ʶ�����رյ����ļ�����
% ������˶���ļ���ͨ�������ַ���'all'��fclose�������ر����еĴ�״̬���ļ���
closeresult=fclose(fid);
closeresult=fclose('all');
%%
% ��if-else��������fclose�����Ƿ�ɹ��ر��ļ���
fid =fopen('filename','permission string');
if fid == -1
     disp('File open not successful')
else
    closeresult = fclose(fid);
    if closeresult == 0
        disp('File close successful')
    else
        disp('File close not successful')
    end
end
%%
% 2. ��ȡ�ļ�
% fscan������ȡ��ʽ�����ݵ�һ������ת����ʽ��%d����������%s�����ַ�����%f����ʵ�͡�
% textscan������һ���ļ��ж�ȡ�ı����ݲ�����洢��Ԫ�������С�fgets������fgetl����ÿ�δ�һ���ļ��ж�ȡһ���ַ���������ĩ�л��з���fgets
% �����ᱣ��������fgetl�������ᡣ
%
% ��Ϊfgetl��fgetsÿ�ζ�һ��������Щ����ͨ������ѭ����ʽִ�У�fscan��textscan�������԰�һ�������������ļ����뵽һ�����ݽṹ����������������𣬽���load������������fgetl�ĵͼ�����֮�䡣
% feof����������ȡ���ļ���β��feof���������߼��棬����ļ���ʶ��fid�����ļ��Ľ�β��feof(fid)�������ý������߼��棬����Ϊ�١�
fid = fopen('filename');
if fid == -1
    disp('����ļ�δ�ɹ��򿪣�');
else
    while feof(fid) == 0%�� while ~feof(fid)
        aline=fgetl(fid);
    end
    closeresult=fclose(fid);
    if closeresult == 0
        disp('�ļ��رճɹ���')
    else
        disp('�ļ�δ�رճɹ���')
    end
end

%%
% ����
fid =fopen('k1.txt','r');
while ~feof(fid) %���ļ�����ǰ���ж�ȡ����
    s=fgets(fid);
    fprintf(1,'%s',s);%�����з�
end
fclose(fid);
%fgetl�������з�
%%
% Ȩ���ַ������԰�����fopen�����ĵ����У��磬fid=fopen('�ļ���','r');
%
% ���⣬������һ�����ļ�subjexp.dat
% 
% 5.3 a
% 
% 2.2 b
%
% 3.3 a
%
% 4.4 a
%
% 1.1 b
%
% �����ֺ��ı���load�������ܰ�������һ�������У�������fgetl������ÿ�ж���һ���ַ�����Ȼ�����ַ����������ָ����ֺ��ַ�

% fileex.m
fid =fopen('subjexp.dat');
if fid ==-1
    disp('�ļ���ʧ��');
else
    while feof(fid) ==0
        aline =fgetl(fid);
        [num ,charcode]=strtok(aline);
        fprintd('%.2f %s\n',str2num(num),charcode)
    end
    closeresult =fclose(fid);
    if closeresult ==0
        disp('�ļ��رճɹ�');
    else
        disp('�ļ��ر�ʧ��');
    end
end
% ����
% fileex

% С��ϰ���޸��ļ����������ļ��е�������͡�

%%
% �ܽ᣺
% �򿪺Ͷ�д�ļ��� fopen,fclose
% ��ʽ����д��fprintf,fscanf,fgetl,fgets
% �Ǹ�ʽ����д��fread,fwrite
clear
t=0:0.001:1;
fp=fopen('k.txt','w');
fprintf(fp,'%d',t);%������д��fpָ�����ļ���
length(t)

clear
x=0:10;
y=[x;exp(x)];
fid=fopen('k1.txt','w');
fprintf(fid,'%6.2f  %12.8f\n',y);
fclose(fid);
% ����f(x)=e^xֵ���ѽ��д��k1.txt
fid=fopen('k1.txt','r');
[a,count]=fscanf(fid,'%f %f',[2 inf]);
%[2 inf]��ʾÿ������Ԫ�أ�����fid��ָ��ȫ��Ԫ��
fprintf(1,'%f  %f\n',a);% 1��ʾ�������Ļ
fclose(fid);
% mat = fscanf(fileID, format, [dimensions])
% fscanfֱ�Ӷ�ȡ�ļ���һ��������

%%
% fscanf���еķ�ʽ��ȡ���ݵ��������mat��
fid=fopen('subjexp.dat')
mat=fscanf(fid,'%f  %c',[2 inf])% ����ֵ֪�ĸ������ڶ�ά��inf
% ��Ϊ����洢��ͬ�����͵�ֵ���ַ������ַ������ж�Ӧ��ASCII����ʽ�洢����Ч�ķ����ǰ��зֳ�����������
% ���ѵڶ���ת�����ַ���

nums=mat(1,:);
charcodes=char(mat(2,:));
fclose(fid);
%% �ļ���״̬�Ͷ�λ
clc;
close all;
fid =fopen('k.txt','r');
fseek(fid,0,'eof');% �����ļ�λ��ָ��
x=ftell(fid);%��ѯ��ǰ�ļ�ָ���λ��
fprintf(1,'File size=%d\n',x);
frewind(fid);%ʹ�ļ�ָ���ط��ļ���ͷ
x=ftell(fid);
fprintf(1,'File positon =%d\n',x);
fclose(fid);
% status=feof(fid);%����ļ��Ƿ��ѽ���

%%
% textscan�������ļ��ж�ȡ�ı����ݲ�����洢��һ��Ԫ��������.
% cellarray=textscan(fid,'format');
clear
fid=fopen('subjexp.dat','r');
subjdata=textscan(fid,'%f %c');%1*2��Ԫ���������
fclose(fid);
subjdata
subjdata{1}
subjdata{2}
subjdata{3}(3) %����������Ԫ�����飬����С����������������

%%
% С��ϰ���Ȳ�Ҫ����𡣶�����������ݲ���ӡ���Ľű����£�
% textscanex.m
% ��textscan��ȡ����
fid =fopen('subjexp.dat');
if fid == -1
    disp('�ļ�δ�ɹ��򿪣�');
else
    subjdata=textscan(fid,'%f %c');
    len=length(subjdata{1});
    for i=1:len
        fprintf('%.1f %c\n',subjdata{1}(i),subjdata{2}(i));
    end
    closeresult=fclose(fid);
    if closeresult ==0
        disp('�ļ��رճɹ���');
    else
        disp('�ļ��ر�δ�ɹ���');
    end
end
% ���� textscanex,�س�
%% �����ļ������ıȽ�
clear
type xypoints.dat
% x2.3y4.56
% x7.7y11.11
% x12.5y5.5
% �ļ����д洢�ַ���������ϣ���˲�����load������Ҫ���ַ��������� �������
% filelnpCompare.m
x=[2.3 7.7 12.5];y=[4.56 11.11 5.5];
fid =fopen('xypoints.dat');
if fid ==-1
    disp('�ļ��򿪲��ɹ���');
else
     plot(x,y,'k*') %�˴���Ҫ���ļ��л�ȡ�������,�Լ�����ȥ
    xlabel('x')
    ylabel('y')
    closeresult=fclose(fid);
    if closeresult==0
        disp('�ļ��رճɹ���');
    else
        disp('�ļ��رղ��ɹ���');
    end
end 

%%
% 
% * �ܽ᣺�����ֶ�ȡ�ļ��ķ�����load����ֻ�������ļ���������ͬ��ÿ��ֵ�ĸ�����ͬ���������԰����Ƕ���һ�������С�
% fscanf�����������ʱ�����ַ�ת��Ϊ��Ӧ��ascii�롣
% textscan������֮�Խ����ݶ��뵽һ��Ԫ�������У��Ұ��ļ���ÿһ�зֱ�洢��Ԫ��������������С�
% ��ѭ����ʹ��fgetl������ �ļ���ÿ����Ϊһ���������ַ�������ȡ�������ַ������������Ѹô��ָת������ֵ��

%% д���ļ�
% �м��ֵͼ�������������д���ļ���fprintf����
% fprintf(fid,'format',variable(s));%��Ļ��Ĭ�ϵ�����豸��Ĭ���ļ�����ʶ������1��ָ��Ļ
% ������뿴������д����ļ��ֽ��������Խ���������
clear
fid = fopen('tryit.txt','w');
for i=1:3
    fprintf(fid,'ѭ������Ϊ%d\n',i);
end
fclose(fid);

%%
% 
% * ���ȡ�ļ�һ����Ҫ���fopen��fclose�Ľ����ȷ��������Ƿ�ɹ���fopen������ͼ���ļ�����д�룬����ļ����ڣ�������
% ��ɾ��������ļ������ڣ���Ҫ����һ�����ļ������û�пռ䴴��һ�����ļ�����fopen�п���ʧ�ܡ�
% Ϊ�鿴д�����ݣ�����fgetlѭ����ȡÿһ��
fid =fopen('tryit.txt');
while ~feof(fid)
    aline=fgetl(fid)
end

%%
% ���⣺�Ѿ���д���ļ�
clear 
mat =randint(2,3,[5,20])
fid =fopen('randmat.dat','w');
fprintf(fid,'%d %d\n',mat);
fclose(fid);
%��Ϊ��һ�����󣬿�����load������ȡ
load randmat.dat
randmat
randmat' %ԭ��ʽ
% ��׷���ļ����� fid=fopen('filename','a');

%% д��Ͷ�ȡ���ӱ�����ļ�
% д�뵽ranexcel.xls�ļ���
ranmat=randi(100,[5,3]);
xlswrite('ranexcle',ranmat);
% xlsread�������Զ�ȡ���ӱ�����ļ�
ssnums=xlsread('ranexcle');
%%
% �����ӱ���л����ı���

% a 315 shuxue
% b 333 suzanne
% c 432 bangongshi
% d 312 Xinke
 [nums,txt]=xlsread('texttest.xls');
 %�����ֵ����һ��double�������У��ı�����һ��Ԫ������txt��
 txt{1,2}
 txt{1,3}
 %ͨ��ѭ���ٴδ�ӡ����е�ֵ
 for i=1:length(nums)
     fprintf('%c %d %s \n',txt{i,1},nums(i),txt{i,3});
 end
 
%% ʹ��MAT�ļ�����
% �������ļ����ͣ�Matlab��������ļ��ж�ȡ�ͱ�������ĺ�������Щ�ļ���Ϊmat�ļ������Դ洢���������ƺ����ݡ�
%%
% 
% # ������д�뵽�ļ�
mymat=rand(3,5);
x=1:6;
y=x.^2;
who
save sess1
who -file sess1
% ֻ����һ���������ļ���
save sess2 mymat
 who -file sess2
 % ������׷�ӵ�mat�ļ���
 save -append sess2 x
 who -file sess2
 % ��ָ���������
 save -append 
 %��ѵ�ǰ����������еı�����ӵ��ļ��У����������ı���������
 %%
 % 
 % # ��Mat�ļ��ж�ȡ
 who
 load sess2
 who
 
 % 
 
 

 
    




        

