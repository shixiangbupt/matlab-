%  sudoku.m 
% 0表示空格，每行每列以及每宫中数字没有重复。
% B=unique(A)    % 返回与A元素相同但不重复的向量
% C=union(A,B)   % 集合的并
% C=intersect(A,B) % 集合的交
% C=setdiff(A,B)   % 返回集合的差 C=A\B
% C=ismember(A,B) % 返回与A同维的向量C，若A(k)属于B，则C(k)=1,否则为0
% 对于空格(i,j)，只能填哪些第i行第j列以及空格(i,j)所在的九宫中未出现的数字，如果发现某个空格无合适的数字可填，则此游戏失败
% 如果某个空格只有一个数字可填，则此空格必须填这个数字；
% 如果所有空格都有两个以上数字可填，则有多种选择，但不是每个选择都保证成功，是否成功要填到最后一个空格才知道。
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

% 对于第一一个数独，输  
% m=[2 1 0 6 3 0 8 9 0;0 4 0 0 0 7 0 0 5;0 0 0 9 0 0 0 0 7;0 0 2 0 0 0 0 4 0;4 0 0 1 0 2 0 0 6;0 6 0 0 0 0 1 0 0;7 0 0 0 0 3 0 0 0;8 0 0 7 0 0 0 6 0;0 3 5 0 9 4 0 2 1]
% 运行sudoku(m)
% 对于第二个数独,输  
% [7 0 0 2 5 0 0 9 8;0 0 6 0 0 0 0 1 0;0 0 0 6 1 0 3 0 0;9 0 0 0 0 1 0 0 0;0 0 0 0 8 0 4 0 9;0 0 7 5 0 2 8 0 1;0 9 4 0 0 3 0 0 0;0 0 0 0 4 9 2 3 0;6 1 0 0 0 0 0 4 0]