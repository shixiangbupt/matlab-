 x0=[4 9 21 26 47 57 62 70 76 76 96];
 y0=[49 30 56 26 19 38 11 30 59 4 32];
n=11;
for i=1:n
    for j=1:n
        D(i,j)=sqrt((x0(i)-x0(j))^2+(y0(i)-y0(j))^2);
    end
end
D=D+10000*eye(n); %对角元素1000，接近inf
P=optimproblem;
x=optimvar('x',n,n,'Type','integer','Lower',0,'Upper',1);
P.Objective=sum(D(:).*x(:));
P.Constraints.c1=sum(x(:))==n;
P.Constraints.x=sum(x,1)==1;
P.Constraints.y=sum(x,2)==1;
sol=solve(P);
x1=round(sol.x);
sparse(x1)

tours=tsp_solve(x0,y0),T=[tours{1}]'

