q = []; %���Զ���
for ix = 1:10
    q = qEnq(q, ix);
end
CAToString(q)
[q ans] = qDeq(q); %����
fprintf('dequeue -> %d leaving \n%s\n', ...
    ans, CAToString(q) );
fprintf('peek at queue -> %d leaving \n%s\n', ...
    q{1}, CAToString(q) );
pq = [];
for ix = 1:10
    value = floor(100*rand);%�������10������
    fprintf(' %g:', value );
    pq = pqEnq(pq, value ); %���ȶ���
end
fprintf('\npriority queue is \n%s\n', ...
    CAToString(pq) );