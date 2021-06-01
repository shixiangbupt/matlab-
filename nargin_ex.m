function y=nargin_ex(n)
% 内置函数nargin
 if nargin ==0 %默认参数
    n=6; 
 end
    y=zeros(n);
    for m=1:n-1
        for mn=(m+1):n
            y(m,mn)=mn-1;
        end
    end
end

