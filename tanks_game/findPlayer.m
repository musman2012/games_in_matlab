function [pRow, pCol] = findPlayer(board, turn)
    [pRow, pCol] = find(board > 0 & board < 20 & mod(board,5) == turn);
end