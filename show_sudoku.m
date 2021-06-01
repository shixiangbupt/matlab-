function show_sudoku(B,n)
% Function for drawing the n^2-by-n^2 Sudoku board
% Extended from the one by MathWorks. 
if size(B)~=3, [i,j,s]=find(B); B=[i,j,s]; end
if nargin==1, n=sqrt(length(sparse(B(:,1),B(:,2),B(:,3)))); end
figure; hold on; axis off; axis equal % prepare to draw
rectangle('Position',[0 0 n^2 n^2],'LineWidth',3,'Clipping','off') % outside border
for k=1:n^2-1
   h1=line([0,n^2],k*[1 1]); set(h1,'LineWidth',0.5);
   h2=line(k*[1 1],[0,n^2]); set(h2,'LineWidth',0.5);
   if k/n==round(k/n), set([h1,h2],'LineWidth',1.5); 
end, end
for ii = 1:size(B,1)
   if B(ii,3)==0, continue; 
   elseif B(ii,3)>=10, xx=0.8; else, xx=0.5; end
   text(B(ii,2)-xx,n^2+0.5-B(ii,1),num2str(B(ii,3)))    
end
hold off
