 
function A= graAdjacency(node,cost,dir)
% ��ͼ������node,cost,direction����ת��Ϊ�ڽӾ���
[m,cols]=size(node)
n=length(cost);
k=0; %ϡ�����Ԫ�ظ���
for is= 1:n %�����ߵ��б�
    iv=0; % ��ʼ�����ӵ��ñߵĽڵ���
    for ir=1:m %�����ڵ�����Ľڵ�
        for ic=1:cols  % �����ڵ�������У��������ӵ��ñߵĽڵ�
            if node(ir,ic) == is
                iv= iv+1;
                if iv>2 %ÿ����ֻ�������˵㣬�������2����ʾ��һ����������ݼ�
                    error('����Ľ������');
                end
                ij(iv) =ir; % �������˵㱣�浽�ֲ�����ij��
            end
        end
    end
    if iv~=2 % ���������ʱ���ߵ����˱��붼��һ���ڵ�
        error(sprintf('�Ҳ����� %d ���ն�' ,is));
    end
    t=cost(is); %��ȡ�ߵ�Ȩ��
    
    if dir(is) ~= -1 % ˫��߱����ھ����г������Σ����ñ���˫���������
        k=k+1;
        ip(k)=ij(1);
       jp(k)=ij(2);
       
       tp(k)=t;
    end
    if dir(is) ~=  1 % ͬ��������߲�������ģ����뷴��·��
        k=k+1;
      ip(k)=ij(2);
      jp(k)=ij(1);
       tp(k)=t;
    end
end
A=sparse(ip,jp,tp); % ����ϡ�����
end
% %  % makeGraph.m
%   cost=[2 2 2 2 2 3 3 3 3 1 2 1 3]; %�ߵ�Ȩ��
%   dir=[2 2 2 2 2 2 2 2 2 2 2 2 2]; %�ߵķ���
%   node=[1 2 3 4 5;1 6 7 0 0;2 7 8 0 0 ;3 8 9 0 0;4 11 13 9 0;5 6 10 0 0;10 11 12 0 0;12 13 0 0 0];
% % %  �ߵ�����Ϊ��A-B,A-C,A-D,A-E,A-F,B-F,B-C,C-D,D-E,F-G,E-G,G-H,E-H
% %  %����node��ÿһ��Ԫ�أ�ָ�ֱ��A��B��...,H��ʼ�ı�
%   coord=[5 6 ;3 9;1 6 ;3 1;6 2;6 8;9 7;10 2]; %A��B,...,H�����ֻ꣬�ڻ�ͼʱ��
%   A=graAdjacency(node,cost,dir) %��������
% % 
%  
% 
