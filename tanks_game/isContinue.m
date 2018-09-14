function [ bool ] = isContinue( board )
%ISCONTINUE Summary of this function goes here
%   Detailed explanation goes here
    boardZero = find(board == 0);              % Gets the zero entities
    [rows,cols] = size(boardZero);
%    [nonZeroRows,nonZeroCols] = size(nonZero);
    if (rows ~= 0)
        bool = 1;                     % Game Drawn
    else
        bool = 0;
    end
end

