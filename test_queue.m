q = []; %测试队列
for ix = 1:10
    q = qEnq(q, ix);
end
CAToString(q)
[q ans] = qDeq(q); %出列
fprintf('dequeue -> %d leaving \n%s\n', ...
    ans, CAToString(q) );
fprintf('peek at queue -> %d leaving \n%s\n', ...
    q{1}, CAToString(q) );
pq = [];
for ix = 1:10
    value = floor(100*rand);%随机产生10个整数
    fprintf(' %g:', value );
    pq = pqEnq(pq, value ); %优先队列
end
fprintf('\npriority queue is \n%s\n', ...
    CAToString(pq) );