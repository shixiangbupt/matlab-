function D = grDijkstra(A,home,target) 
% ����Ϊ�ڽӾ�����ʼ�ڵ����������ֹ�ڵ������
 pq= pqEnq([],Path(home,0)); % ��ʼ�����ȶ��У�������ʼ�ڵ㣬�ɱ�Ϊ0
  while ~isempty(pq)
      [pq current]=qDeq(pq); %��ʱ�����а���һ��·���ṹ��
      if pthGetLast(current) == target%������ӵĽڵ���target����ú�����
          %����һ���µ��ڽӾ��󣬱�ʾ��home�ڵ㵽target��·��
          D=sparse(0);
          answer =current.nodes;
          for ans=1:length(answer)-1
              D(answer(ans),answer(ans+1)) =1;
          end  %������ӵĽڵ���target����ú���������һ���µ��ڽ����󣬱�ʾ��home�ڵ�
          % ��target�ڵ��·��
          return;
      end % if last(current)==target
      endnode = pthGetLast(current); %���򷵻���һ���ڵ�
      children=A(endnode,:); %%�������ӽڵ�
      children =find(children ~=0);
      for achild =children   %������Щ�ӽڵ㣬��������Ƿ��ڵ�ǰ·���ϣ���һ���ӽڵ�
          % ���ʱ��������ӵ���ǰ·����ĩβ��ͬʱ������·�����������
          len =A(endnode,achild);
          if ~any(achild == current.nodes)
              gclone = Path(  [current.nodes achild]   , current.key+ len ) ;  
              pq=pqEnq(pq,gclone);
          end
      end
      D =[];
  end
  

end

function ret=Path(nodes,len) %·�����캯��
    ret.nodes =nodes;
    ret.key= len;
end
function ret =pthGetLast(apath)
% ����·�������ڵ����
 ret =apath.nodes(end);
end

