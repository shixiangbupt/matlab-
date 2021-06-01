function S=solve_sudoku(B,n)
if nargin==0, B=[]; n=3; end
if size(B)~=3, [i,j,s]=find(B); B=[i,j,s]; end
if nargin==1, n=sqrt(length(sparse(B(:,1),B(:,2),B(:,3)))); end
x=optimvar('x',n^2,n^2,n^2,'Type','integer','Lower',0,'Upper',1);
P=optimproblem;
P.Constraints.x=sum(x,1)==1;
P.Constraints.y=sum(x,2)==1; P.Constraints.z=sum(x,3)==1;
D=[]; 
for u=0:n:n^2-1, for v=0:n:n^2-1
   a=x(u+1:u+n,v+1:v+n,:); 
   s=sum(sum(a,1),2)==ones(1,1,n^2); D=[D; s(:)];
end, end
P.Constraints.D=D; 
for u=1:size(B,1), x.LowerBound(B(u,1),B(u,2),B(u,3))=1; end
sol=solve(P); x=round(sol.x); 
for k=2:n^2, x(:,:,k)=k*x(:,:,k); end, S=sum(x,3);
