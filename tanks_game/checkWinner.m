function [ winner ] = checkWinner( scores )
%CHECKWINNER Summary of this function goes here
%   Detailed explanation goes here
    [value, index] = max(scores);
    
    winner = index;
end

