clear all
%样本向量
x=0:.5:10;
y=0.12*exp(-0.213*x)+0.54*exp(-0.17*x).*sin(1.23*x);

%训练网络
net=fitnet(5);
net.trainParam.epochs=1000;
[net,b]=train(net,x,y);
plotperform(b)

x0=0:.1:10;
y0=0.12*exp(-0.213*x0)+0.54*exp(-0.17*x0).*sin(1.23*x0);
%预测效果如何？
y1=net(x0);
plot(x,y,'o',x0,y0,x0,y1,':');

%  syms x  n;
% f=n*atan(1/(n*(x^2+1)+x))*tan(pi/4+x/2/n)^n;
% limit(f,n,inf)

