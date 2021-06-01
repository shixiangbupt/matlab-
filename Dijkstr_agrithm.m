%% Dijkstra�㷨�ο�
% ��һ�ַ������Ƚ������ڼ�����㷨
%
% ����.M.ʷ��˹����׿�����룬��MATLAB���̼��㡷�����棬 ��е��ҵ������2018��
% 
% ��Ҫ����


% function D = grDijkstra(A,home,target) 
% % ����Ϊ�ڽӾ�����ʼ�ڵ����������ֹ�ڵ������
% %   �˴���ʾ��ϸ˵��
%  pq= pqEnq([],Path(home,0)); % ��ʼ�����ȶ��У�������ʼ�ڵ㣬�ɱ�Ϊ0
%   while ~isempty(pq)
%       [pq current]=qDeq(pq); %��ʱ�����а���һ��·���ṹ��
%       if pthGetLast(current) == target
%           D=sparse(0);
%           answer =current.nodes;
%           for ans=1:length(answer)-1
%               D(answer(ans),answer(ans+1)) =1;
%           end  %������ӵĽڵ���target����ú���������һ���µ��ڽ����󣬱�ʾ��home�ڵ�
%           % ��target�ڵ��·��
%           return;
%       end % if last(current)==target
%       endnode = pthGetLast(current);
%       children=A(endnode,:); %%�������ӽڵ�
%       children =find(children ~=0);
%       for achild =children   %������Щ�ӽڵ㣬��������Ƿ��ڵ�ǰ·���ϣ���һ���ӽڵ�
%           % ���ʱ��������ӵ���ǰ·����ĩβ��ͬʱ������·�����������
%           len =A(endnode,achild);
%           if ~any(achild == current.nodes)
%               gclone = Path(  [current.nodes achild]   , current.key+ len ) ;  
%               pq=pqEnq(pq,gclone);
%           end
%       end
%       D =[];
%   end
%   



%% ��������--����

% function pq =pqEnq(pq,item)
% %��˳�����
% % ���ȶ��е�enqueue����
%  in=1;
%  at= length(pq)+1;
%  while in<= length(pq)
%      if is_before(item,pq{in})
%          at =in;
%          break;
%      end
%      in=in+1;
%  end
%  pq =[pq(1:at-1) {item} pq(at:end)];
% end
%  
% 
%  
% 
% function ans =is_before(a,b)
% % �Ƚ��������� 
% acl=class(a);
% ans=false;
%  if isa(b,acl)
%      switch acl
%          case 'double'
%              ans= a<b;
%          case 'struct'
%              if isfield(a,'key')
%                   
%              ans=a.key<b.key;
%              elseif isfield(a,'dod')
%                  ans=age(a)<age(b);
%              else 
%                  error('��ͬ�Ľṹû���Ƚϣ�')
%              end
%          otherwise
%              error(['can' 't compare ' acl 's'])
%      end
%  end
% end

% function [q ans]=qDeq(q)
% % ����
% ans=q{1};
% q=q(2:end);
% end

%%   

% function A= graAdjacency(node,cost,dir)
% % ��ͼ������node,cost,direction����ת��Ϊ�ڽӾ���
% [m,cols]=size(node)
% n=length(cost);
% k=0; %ϡ�����Ԫ�ظ���
% for is= 1:n %�����ߵ��б�
%     iv=0; % ��ʼ�����ӵ��ñߵĽڵ���
%     for ir=1:m %�����ڵ�����Ľڵ�
%         for ic=1:cols  % �����ڵ�������У��������ӵ��ñߵĽڵ�
%             if node(ir,ic) == is
%                 iv= iv+1;
%                 if iv>2 %ÿ����ֻ�������˵㣬�������2����ʾ��һ����������ݼ�
%                     error('����Ľ������');
%                 end
%                 ij(iv) =ir; % �������˵㱣�浽�ֲ�����ij��
%             end
%         end
%     end
%     if iv~=2 % ���������ʱ���ߵ����˱��붼��һ���ڵ�
%         error(sprintf('�Ҳ����� %d ���ն�' ,is));
%     end
%     t=cost(is); %��ȡ�ߵ�Ȩ��
%     
%     if dir(is) ~= -1 % ˫��߱����ھ����г������Σ����ñ���˫���������
%         k=k+1;
%         ip(k)=ij(1);
%        jp(k)=ij(2);
%        
%        tp(k)=t;
%     end
%     if dir(is) ~=  1 % ͬ��������߲�������ģ����뷴��·��
%         k=k+1;
%       ip(k)=ij(2);
%       jp(k)=ij(1);
%        tp(k)=t;
%     end
% end
% A=sparse(ip,jp,tp); % ����ϡ�����
% end
%% ׼������
%  % makeGraph.m
  cost=[2 2 2 2 2 3 3 3 3 1 2 1 3]; %�ߵ�Ȩ��
  dir=[2 2 2 2 2 2 2 2 2 2 2 2 2]; %�ߵķ���
  node=[1 2 3 4 5;1 6 7 0 0;2 7 8 0 0 ;3 8 9 0 0;4 11 13 9 0;5 6 10 0 0;10 11 12 0 0;12 13 0 0 0];
% %  �ߵ�����Ϊ��A-B,A-C,A-D,A-E,A-F,B-F,B-C,C-D,D-E,F-G,E-G,G-H,E-H
%  %����node��ÿһ��Ԫ�أ�ָ�ֱ��A��B��...,H��ʼ�ı�
  coord=[5 6 ;3 9;1 6 ;3 1;6 2;6 8;9 7;10 2]; %A��B,...,H�����ֻ꣬�ڻ�ͼʱ��
  A=graAdjacency(node,cost,dir) %��������
% 
%%  ���ű�������ͼ�㷨

 %dijkstra_main.m �˽ű�������input����ʽ��������Ҫ������һ�������ļ��е�������
 
% start =1;
% while start >0
%     gplot(A,coord,'ro-')
%     hold on
%     for index =1:length(coord)
%         str =char('A' +index -1);
%         text(coord(index,1)+0.2,coord(index,2)+0.3,str);
%     end
%     axis([0,11,0,10]);axis off ;hold on
%     ch =input('��ʼ�ڵ�(��д��ĸA):','s');
%     
%     start =ch- 'A'+1;
%     if start>0
%         ch=input('Ŀ��ڵ�(H)��','s')
%        target =ch- 'A'+1;
%     disp('ԭͼ');pause
%     
%     
%     D=grDijkstra(A,start,target);
%     
%     gplot(D,coord,'bo-')
% end
% end
