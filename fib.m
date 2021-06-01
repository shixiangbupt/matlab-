function y= fib(n)
y(1)=1;
y(2)=1;
for i=3:n
y(i)=y(i-2)+y(i-1);
end
 
end

