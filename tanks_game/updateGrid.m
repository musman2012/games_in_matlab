%%%%%%% -------- Gets current state of board, previous grid, box-height,
%%%%%%% and box-width as parameter and returns the updated grid by placing
%%%%%%% the images of size box-height x box-width. -------- %%%%%%%

function grid = updateGrid(grid, board,BOXWIDTH,BOXHEIGHT)
        [x,y] = size(board);
        for i = 1:x
            for j = 1:y
                if board(i,j) == 0
                    continue;
                % Check for other options too where we dont need to place
                % images
                else                                          % Place image for player one snail
                    grid = placeImages(i,j,BOXWIDTH,BOXHEIGHT,grid,board(i,j));
                           
                end
            end
        end
 end