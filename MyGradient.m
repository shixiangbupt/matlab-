function g= MyGradient( f_name,x )
% 常用的有插复值型求导公式用于求某点上导数，
% 样条求导公式用于求利用插值的结果拟合出的结果。一般有3点公式或者制5点公式。
%    
n=length(x);h0=1e-3;E=eye(n);g=zeros(n,1);y0=feval(f_name,x);
for j=1:n
    h=h0.*E(:,j);
    for i=1:4
        y(i)=feval(f_name,x+i*h); z(i)=feval(f_name,x-i*h);
    end
   d(1)=(-25*y0+48*y(1)-36*y(2)+16*y(3)-3*y(4))/(12*h0); 
   d(2)=(-3*z(1)-10*y0+18*y(1)-6*y(2)+y(3))/(12*h0);
   d(3)=(z(2)-8*z(1)+8*y(1)-y(2))/(12*h0);
   d(4)=(3*y(1)+10*y0-18*z(1)+6*z(2)-z(3))/(12*h0);
   d(5)=(25*y0-48*z(1)+36*z(2)-16*z(3)+3*z(4))/(12*h0);
   g(j)=mean(d);
end

end

