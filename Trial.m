function [a,b,c ] = Trial( f_name,xk,dk,a0,h0,t,e )
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
MaxIterations=500;
Iterations=0;
f0=feval(f_name,xk+a0*dk);%��ʼ�㺯��ֵ
a1=a0+h0;f1=feval(f_name,xk+a1*dk);
while abs(f1-f0)<e
    a1=a1+t*h0;f1=feval(f_name,xk+a1*dk);
end
if f1>f0
    a2=a0-h0;
    f2=feval(f_name,xk+a2*dk);
    while f2<=f0
        a2=a2-t*h0;
        f2=feval(f_name,xk+a2*dk);
        Iterations=Iterations+1;
    if Iterations>MaxIterations
        break
    end
    end
    
 
a=a2;b=a1;c=a0;
elseif f1<f0
    a2=a1+t*h0;
    f2=feval(f_name,xk+a2*dk);
    while f2<=f1
        a2=a2+t*h0;
        f2=feval(f_name,xk+a2*dk);
    Iterations=Iterations+1;    
    if Iterations>MaxIterations
        break
    end
end
a=a0;b=a2;c=a1;
end
fa=feval(f_name,xk+a*dk);fb=feval(f_name,xk+b*dk);fc=feval(f_name,xk+c*dk);
if (fa<fc)&(fc<fb)
    fprintf('�������������������ǵ�����������û�а�����С��ĵ�����')
elseif(fa>fc) &(fc>fb)
     fprintf('�������������������ǵ�����������û�а�����С��ĵ�����')
end


 

