function pq =pqEnq(pq,item)
%��˳�����
% ���ȶ��е�enqueue����
 in=1;
 at= length(pq)+1;
 while in<= length(pq)
     if is_before(item,pq{in})
         at =in;
         break;
     end
     in=in+1;
 end
 pq =[pq(1:at-1) {item} pq(at:end)];
end
 

 

function ans =is_before(a,b)
% �Ƚ��������� 
acl=class(a);
ans=false;
 if isa(b,acl)
     switch acl
         case 'double'
             ans= a<b;
         case 'struct'
             if isfield(a,'key')
                  
             ans=a.key<b.key;
             elseif isfield(a,'dod')
                 ans=age(a)<age(b);
             else 
                 error('��ͬ�Ľṹû���Ƚϣ�')
             end
         otherwise
             error(['can' 't compare ' acl 's'])
     end
 end
end

             
