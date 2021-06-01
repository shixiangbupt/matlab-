function X=lyapsym(A,B,C)
if nargin==2
    C=B; 
    B=A'; 
end %若输入个数为2，则设置成Lyapunov方程
[nr,nc]=size(C); 
A0=kron(eye(nc),A)+kron(B.',eye(nr)); %系数矩阵
if rank(A0)==nr*nc
    x0=-inv(A0)*C(:); 
    X=reshape(x0,nr,nc);
else
    error('singular matrix found.');
    
end
