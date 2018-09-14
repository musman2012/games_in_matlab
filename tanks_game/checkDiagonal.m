function bool = checkDiagonal(board,rowIndex,colIndex,value)
    [rows,cols] = size(board);
    %if(rowIndex ~= 1 || rowIndex ~= rows)
    middle = ceil (rows/2);
    bool = 1;
    if(board(middle,middle) == 0)           % Middle of the board is empty
        bool = 0;
    end
    for i=1:(rows-1)
        if (board(i,i)-board(i+1,i+1) ~= 0)
            bool = 0;
        end
    end


end