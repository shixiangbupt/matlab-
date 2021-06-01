function y = Sylvester(x) 
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明
A=[-1 -5;4 1;7 -4;10 9;3 4;8 2];[m,n]=size(A);
for i=1:m
    d(i)=sqrt((x(1)-A(i,1))^2+(x(2)-A(i,2))^2);
end
y=d(1);
for i=2:m
    y=((y+d(i))+abs(y-d(i)))/2;
end


end

