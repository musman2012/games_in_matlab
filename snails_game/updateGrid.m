%%%%%%% -------- Gets current state of board, previous grid, box-height,
%%%%%%% and box-width as parameter and returns the updated grid by placing
%%%%%%% the images of size box-height x box-width. -------- %%%%%%%

function grid = updateGrid(grid, board,BOXWIDTH,BOXHEIGHT)
        [x,y] = size(board)
        for i = 1:x
            for j = 1:y
                if board(i,j) == 0
                    continue;
                elseif board(i,j) == 1                                          % Place image for player one snail
                    grid = placeImages(i,j,BOXWIDTH,BOXHEIGHT,grid,1);
                elseif board(i,j) == 2                                          % Place image for player two snail
                    grid = placeImages(i,j,BOXWIDTH,BOXHEIGHT,grid,2);
                elseif board(i,j) == 11                                         % Place image for player one splash
                    grid = placeImages(i,j,BOXWIDTH,BOXHEIGHT,grid,3);
                elseif board(i,j) == 22                                         % Place image for player two splash
                    grid = placeImages(i,j,BOXWIDTH,BOXHEIGHT,grid,4);
                end
            end
        end
 end