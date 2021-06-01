function stours=tsp_solve(x0,y0,r)
x0=x0(:); y0=y0(:); n=length(x0); if nargin==2, r=2.5; end
for i=1:n, for j=1:n
   D(i,j)=sqrt((x0(i)-x0(j))^2+(y0(i)-y0(j))^2); %Euclid距离矩阵
end, end
D=D+100000*eye(n); t=linspace(0,2*pi,100); P=optimproblem;
x=optimvar('x',n,n,'Type','integer','Lower',0,'Upper',1);
P.Objective=sum(sum(D.*x));
P.Constraints.x=sum(x,1)==1; P.Constraints.y=sum(x,2)==1;
sol=solve(P); x1=round(sol.x); sparse(x1); cstr=[];
while (1) %用迭代方法消除局部回路
   stours=find_subtours(x1); length(stours) %找出局部回路
   if length(stours)==1, break; end %如果只有一个回路则结束搜索
   for i=1:length(stours) %由每个现有回路单独处理
      u=stours{i}(:,1); v=stours{i}(:,2); s=0; n0=length(u);
      for j=1:n0, s=s+x(u(j),v(j)); end
      cstr=[cstr; s<=n0-1]; %增添一条约束条件
   end
   P.Constraints.cc=cstr; %重新设置约束条件并求解
   sol=solve(P); x1=round(sol.x); sparse(x1);
end
for i=1:length(x0), line(x0(i)+r*cos(t),y0(i)+r*sin(t)), end
stours=find_subtours(x1); u=stours{1}(:,1); v=stours{1}(:,2);
line([x0(u); x0(v(end))],[y0(u); y0(v(end))]); %绘制最优路径
