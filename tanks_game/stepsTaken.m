function [value] = stepsTaken(board, virtualSpash)

    [rows,cols] = find(board == virtualSpash);

    value = length(rows)

end