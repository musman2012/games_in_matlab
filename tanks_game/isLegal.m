function bool = isLegal(board,dX,dY,TURN,splash)
    bool1 = 0;
    bool = 0;
    [playerX,playerY] = find(board==TURN);                  % Find where is the current position of player
    
    if dX == playerX && dY == playerY
        bool = 0;
    
    else
    
        if( board(dX,dY) == splash(TURN))                       
            if(dX == playerX || dY == playerY)
                bool1 = 1;
            end
        elseif ((abs(dX-playerX) == 1 && abs(dY-playerY) == 0) || (abs(dX-playerX) == 0 && abs(dY-playerY) == 1))
            bool1 = 1;
        end
        if(TURN == 1)
            if(board(dX,dY) == 0 || board(dX,dY) == 11)
                bool1 = bool1+1;
            else
                bool1 = bool1+0;
            end
        else
            if(board(dX,dY) == 0 || board(dX,dY) == 22)
                bool1 = bool1+1;
            else
                bool1 = bool1+0;
            end
        end

        if(bool1 == 2)
            bool = 1;
        else
            bool = 0;
        end
    end
end