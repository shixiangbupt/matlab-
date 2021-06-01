X=[ 0, 0, 0, 1, 0 ,0, 0, 3, 0;
    0, 9 ,4, 3, 0 ,0, 7, 0, 0;
    1, 0, 6, 0, 0, 0, 8, 2, 0;
    0, 0, 0, 5, 0, 0, 0 ,0, 0;
    6, 2, 8, 0, 0, 0, 5, 1, 9;
    0, 0, 0, 0 ,0 ,6, 0, 0 ,0;
    0, 4, 1, 0, 0, 0, 2, 0, 5;
    0, 0, 9 ,0, 0, 2, 4 ,8, 0;
    0, 8 ,0, 0, 0, 5, 0, 0, 0];
show_sudoku(X)
pause
S=solve_sudoku(X)
pause
show_sudoku(S)

M=magic(4);Y=blkdiag(M,M,M,M);
show_sudoku(Y)
pause
S1=solve_sudoku(Y)
pause
show_sudoku(S1)