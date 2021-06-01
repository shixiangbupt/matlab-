function [c,ceq]=c5mcpl(x)
ceq=[];
A1=sqrt((745*x(4)/x(2)/x(3))^2+16.91e6); B1=0.1*x(6)^3;
A2=sqrt((745*x(5)/x(2)/x(3))^2+157.5e6); B2=0.1*x(7)^3;
c=[-x(1)*x(2)^2*x(3)+27; -x(1)*x(2)^2*x(3)^2+397.5;
   -x(2)*x(6)^4*x(3)/x(4)^3+1.93; A1/B1-1100; 
   -x(2)*x(7)^4*x(3)/x(5)^3+1.93; A2/B2-850;
   x(2)*x(3)-40; -x(1)/x(2)+5; x(1)/x(2)-12;
   1.5*x(6)+1.9-x(4); 1.1*x(7)+1.9-x(5)];