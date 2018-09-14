function [boardX,boardY,BOXWIDTH,BOXHEIGHT] = gridToBoard(HEIGHT,WIDTH,x,y,totalRows,totalCols)
    boardX = 0;
    boardY = 0;
    BOXHEIGHT = ceil (HEIGHT/totalRows);
    BOXWIDTH = ceil (WIDTH/totalRows);
    boardX = ceil (x / BOXHEIGHT);
    boardY = ceil (y / BOXWIDTH);
end