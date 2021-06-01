function stours=find_subtours(x)
[n,~]=size(x); u=1; visited=zeros(n,1);
for k=1:n, s0(k)=k; d0(k)=find(x(k,:)==1); end
for i=1:n, if visited(i)==1, continue; end
s1=s0(i); v=s1; d=d0(i); mat=[s1,d]; visited(i)=1;
while d~=s1, d1=d; visited(d)=1; d=d0(d); mat=[mat; d1,d]; end
   stours{u}=mat; u=u+1;
end
