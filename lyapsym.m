function X=lyapsym(A,B,C)
if nargin==2
    C=B; 
    B=A'; 
end %���������Ϊ2�������ó�Lyapunov����
[nr,nc]=size(C); 
A0=kron(eye(nc),A)+kron(B.',eye(nr)); %ϵ������
if rank(A0)==nr*nc
    x0=-inv(A0)*C(:); 
    X=reshape(x0,nr,nc);
else
    error('singular matrix found.');
    
end
