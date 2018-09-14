function [ neighbour, direction ] = isNeighbour( srcX, srcY, destX, destY )
    neighbour = 0;
    direction = -99;
    if(srcX-destX == 1)
        neighbour = 1;
        direction = 1;
    elseif (srcX-destX == -1)
        neighbour = 1;
        direction = 2;
    elseif (srcY-destY == 1)
        neighbour = 1;
        direction = 4;
    elseif (srcX-destX == -1)
        neighbour = 1;
        direction = 3;
    end
end

