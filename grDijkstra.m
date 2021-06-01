function D = grDijkstra(A,home,target) 
% 输入为邻接矩阵，起始节点的索引，终止节点的索引
 pq= pqEnq([],Path(home,0)); % 初始化优先队列，包含起始节点，成本为0
  while ~isempty(pq)
      [pq current]=qDeq(pq); %此时，队列包含一个路径结构体
      if pthGetLast(current) == target%如果出队的节点是target，则该函数将
          %创建一个新的邻接矩阵，表示从home节点到target的路径
          D=sparse(0);
          answer =current.nodes;
          for ans=1:length(answer)-1
              D(answer(ans),answer(ans+1)) =1;
          end  %如果出队的节点是target，则该函数将创建一个新的邻近矩阵，表示从home节点
          % 到target节点的路径
          return;
      end % if last(current)==target
      endnode = pthGetLast(current); %否则返回上一个节点
      children=A(endnode,:); %%检索其子节点
      children =find(children ~=0);
      for achild =children   %遍历这些子节点，检查它们是否在当前路径上，当一个子节点
          % 入队时，将它添加到当前路径的末尾，同时，整个路径被插入队列
          len =A(endnode,achild);
          if ~any(achild == current.nodes)
              gclone = Path(  [current.nodes achild]   , current.key+ len ) ;  
              pq=pqEnq(pq,gclone);
          end
      end
      D =[];
  end
  

end

function ret=Path(nodes,len) %路径构造函数
    ret.nodes =nodes;
    ret.key= len;
end
function ret =pthGetLast(apath)
% 返回路径上最后节点的数
 ret =apath.nodes(end);
end

