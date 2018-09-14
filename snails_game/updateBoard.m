function board = updateBoard(board,dX,dY,TURN,splash)
    [playerX,playerY] = find(board==TURN);
    board(playerX,playerY) = splash(TURN);
    
%    finalX = dX;
%    finalY = dY;
    isRight = 0, isLeft = 0, isAbove = 0, isBelow = 0;
    counter = 1;
    if(playerX == dX)           % Row is same
        if(playerY > dY)        % Below, new is less
            isLeft = 1;
        else
            isRight = 1;
        end
    else                        % Col is same
        if(playerX < dX)        % Left, new is less
            isBelow = 1;
        else
            isAbove = 1;
        end
    end
    flag = 0;
    % isRight
    % isLeft
    % isAbove
    % isBelow
    if board(dX,dY) ~= 0
        
        if(isRight == 1)
            while((board(playerX,playerY+counter) == splash(TURN)) && ( playerY + counter + 1 < 9))
                counter = counter + 1;
                flag = 1;
            end
            if (board(playerX,playerY+counter) ~= splash(TURN))
                counter = counter - 1;
            end
            board(playerX,playerY+counter) = TURN;
        elseif(isLeft == 1)
            while((board(playerX,playerY-counter) == splash(TURN)) && ( playerY - (counter + 1) > 0))
                counter = counter + 1;
                flag = 1;
            end
            if board(playerX,playerY-counter) ~= splash(TURN)
                counter = counter - 1;
            end
            board(playerX,playerY-counter) = TURN;
        elseif(isAbove == 1)
            while((board(playerX - counter,playerY) == splash(TURN)) && ( playerX - ( counter + 1 ) > 0))
                counter = counter + 1;
                flag = 1;
            end
            if (board(playerX - counter,playerY) ~= splash(TURN))
                counter = counter - 1;
            end
            board(playerX - counter,playerY) = TURN;
        else
            while((board(playerX + counter,playerY) == splash(TURN)) && ( playerX + (counter + 1) < 9))
                counter = counter + 1;
                flag = 1;
            end
            if (board(playerX + counter,playerY) ~= splash(TURN))
                counter = counter - 1;
            end
            board(playerX + counter,playerY) = TURN;

        end
    else    
        if(isRight == 1)
            board(playerX,playerY+counter) = TURN;
        elseif(isLeft == 1)
            board(playerX,playerY-counter) = TURN;
        elseif(isAbove == 1)
            board(playerX-counter,playerY) = TURN;
        else
            board(playerX+counter,playerY) = TURN;
        
        end
    
    end
    

end