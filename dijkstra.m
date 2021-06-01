function [d,p0]=dijkstra(W,s,t)
[n,m]=size(W); ix=(W==0); W(ix)=Inf; %将权值设为无穷大
if n~=m, error('Square W required'); end %关联矩阵设为方阵
visited(1:n)=0; dist(1:n)=Inf; dist(s)=0; d=Inf; w=[1:n]';
for i=1:(n-1)
   ix=(visited==0); vec(1:n)=Inf; vec(ix)=dist(ix);
   [a,u]=min(vec); visited(u)=1;
   for v=1:n
      if (W(u,v)+dist(u)<dist(v))
         dist(v)=dist(u)+W(u,v); parent(v,i)=u;
end; end; end
u=parent(:,1)==s; p0(u,1)=s; p0(u,2)=w(u); w(u)=0; 
for k=1:n, vec=parent(k,:); vec=vec(vec~=0);
   if length(vec)>0, vec=vec(end); 
       if w(vec)==0
           v1=p0(vec,:); v1=v1(v1~=0); aa=[v1, k]; w(k)=0;
           for j=1:length(aa), p0(k,j)=aa(j); end
end, end, end
p0=p0(t,:); d=dist(t);
