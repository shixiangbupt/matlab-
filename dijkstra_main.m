makeGraph;
start =1;
while start >0
    gplot(A,coord,'ro-')
    hold on
    for index =1:length(coord)
        str =char('A' +index -1);
        text(coord(index,1)+0.2,coord(index,2)+0.3,str);
    end
    axis([0,11,0,10]);axis off ;hold on
    ch =input('��ʼ�ڵ�(��д��ĸA):','s');
    
    start =ch- 'A'+1;
    if start>0
        ch=input('Ŀ��ڵ�(H)��','s')
       target =ch- 'A'+1;
    disp('ԭͼ');pause
    
    
    D=grDijkstra(A,start,target);
    
    gplot(D,coord,'bo-')
end
end