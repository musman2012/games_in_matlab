% This function should return 10 for WIN, 5 for Draw, 0 for continue and
% -10 for Loss.

function status = evaluateBoard(board, agentTurn)
%    [rows,cols] = size(board);
%    rowIndex = ceil (index/rows);
%    colIndex = mod(index,cols);
%    indices = find(board == turn);
    
    humanTurn = mod(agentTurn,2) + 1;
    
    if isContinue(board) == 1
        status = 0;             % There are empty spaces    
    else
        status = isWin(board, agentTurn);
    end
    
    
    
end