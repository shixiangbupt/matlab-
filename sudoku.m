%  sudoku.m 
% 0��ʾ�ո�ÿ��ÿ���Լ�ÿ��������û���ظ���
% B=unique(A)    % ������AԪ����ͬ�����ظ�������
% C=union(A,B)   % ���ϵĲ�
% C=intersect(A,B) % ���ϵĽ�
% C=setdiff(A,B)   % ���ؼ��ϵĲ� C=A\B
% C=ismember(A,B) % ������Aͬά������C����A(k)����B����C(k)=1,����Ϊ0
% ���ڿո�(i,j)��ֻ������Щ��i�е�j���Լ��ո�(i,j)���ڵľŹ���δ���ֵ����֣��������ĳ���ո��޺��ʵ����ֿ�������Ϸʧ��
% ���ĳ���ո�ֻ��һ�����ֿ����˿ո������������֣�
% ������пո��������������ֿ�����ж���ѡ�񣬵�����ÿ��ѡ�񶼱�֤�ɹ����Ƿ�ɹ�Ҫ����һ���ո��֪����
function result= sudoku(m)

while 1

  m0= ceil(m/9);

   l=81-sum( sum(m0));

   x=[];flag=1;

   for k=1:l

     for i=1:9

       for j=1:9

          if m(i,j)== 0

            k1 =ceil(i/3);k2 =ceil(j/3);

            m1=m(3*k1-2:3*k1,3*k2-2:3*k2);
            a= m(i,:);b= m(:,j)';c(1:9)=m1;

          d=setdiff(1:9,union(union(a,b),c));
          if length(d)==0
            flag=0;
            break
         elseif length(d)== 1

          m(i,j)=d(1);
          x=[x;[i,j,d(1)]];
          else
          r=i;c=j;choise=d;
          end
         end
       end
      if flag==0
          break
      end
     end
if flag==0
break
end
   end
if flag==0
disp('Impossible to complete!')
break
elseif all(all(m))==0
 disp(' Choose a number and fill into the blank  square,try again!' )
m
[r,c]
choise
r=input('r=' );
c=input('c= ');
m(r,c)= input('m(r,c)=');
else
disp( 'Success!' )
result= m;
break
end
end

% ���ڵ�һһ����������  
% m=[2 1 0 6 3 0 8 9 0;0 4 0 0 0 7 0 0 5;0 0 0 9 0 0 0 0 7;0 0 2 0 0 0 0 4 0;4 0 0 1 0 2 0 0 6;0 6 0 0 0 0 1 0 0;7 0 0 0 0 3 0 0 0;8 0 0 7 0 0 0 6 0;0 3 5 0 9 4 0 2 1]
% ����sudoku(m)
% ���ڵڶ�������,��  
% [7 0 0 2 5 0 0 9 8;0 0 6 0 0 0 0 1 0;0 0 0 6 1 0 3 0 0;9 0 0 0 0 1 0 0 0;0 0 0 0 8 0 4 0 9;0 0 7 5 0 2 8 0 1;0 9 4 0 0 3 0 0 0;0 0 0 0 4 9 2 3 0;6 1 0 0 0 0 0 4 0]