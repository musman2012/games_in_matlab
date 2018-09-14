function bool = evaluateState(board, turn)
    nonZero = find(board);              % Gets the non zero entities
    [nonZeroRows,nonZeroCols] = size(nonZero);
    if (nonZeroCols == 0)
        bool = 'd';                     % Game Drawn
    end
   
end