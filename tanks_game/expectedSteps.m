function [ steps ] = expectedSteps( board, ID, oppX, oppY )
    [X,Y] = find(board == ID);
    
    steps = min(abs(oppX-X),abs(oppY-Y));
end