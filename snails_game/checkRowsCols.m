% Flag is being used to diff rows and cols
% This function is being called with the value we want to look for in
% complete rows or complete column.
% For example: checkRowsCols(board,index,value,flag) will check if there is
% 
function bool = checkRowsCols(board,rowIndex,colIndex,value)
    [rows,cols] = size(board);
    counter = 0;
    bool = 0;
    for i=1:cols 
        if(board(rowIndex,i) == value)
             counter = counter + 1;
        end
    end
    if(counter == 3)
        bool = 1;
    end
    counter = 0;
    for i=1:rows 
        if(board(i,colIndex) == value)
            counter = counter + 1;
        end
    end
    if(counter == 3)
        bool = 1;
    end

%NICE
end