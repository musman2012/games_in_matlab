function board = updateBoard(board, moveId, dX, dY, tankId)
    % Move Id = 1 ==> Fire
    % Move Id = 2 ==> Move to next block
    % Move Id = 3 ==> change direction by +90 degree ( right -> up, up -> left, left -> down, down -> right)
    % Move Id = 4 ==> change direction by -90 degree ( right -> down, down ->
    % left, left -> up, up -> right)
    
    [playerX,playerY] = find(board == tankId);
    tankNumber = mod(tankId,5);               % This will give us the number between 1 - 4, which is actually our tank number
    playerSplash = 20 + tankNumber;           % 21 is conquered area of tank 1, 22 is conquered area for tank 2 and so on
    
    
    if moveId == 2                            % This id is indicating that the player want to explore the neighbouring box
        board(playerX,playerY) = playerSplash;
        board(dX,dY) = tankId;
    end
    
    
%     isRight = 0, isLeft = 0, isAbove = 0, isBelow = 0;
%     counter = 1;
%     if(playerX == dX)           % Row is same
%         if(playerY > dY)        % Below, new is less
%             isLeft = 1;
%         else
%             isRight = 1;
%         end
%     else                        % Col is same
%         if(playerX < dX)        % Left, new is less
%             isBelow = 1;
%         else
%             isAbove = 1;
%         end
%     end
%     
%     if(isRight == 1)
%          board(playerX,playerY+counter) = tankId;
%     elseif(isLeft == 1)
%          board(playerX,playerY-counter) = tankId;
%     elseif(isAbove == 1)
%          board(playerX-counter,playerY) = tankId;
%     else
%          board(playerX+counter,playerY) = tankId;
%         
%     end

    
%     flag = 0;
    % isRight
    % isLeft
    % isAbove
    % isBelow
%     if board(dX,dY) ~= 0
%         
%         if(isRight == 1)
%             while((board(playerX,playerY+counter) == splash(TURN)) && ( playerY + counter + 1 < 9))
%                 counter = counter + 1;
%                 flag = 1;
%             end
%             if (board(playerX,playerY+counter) ~= splash(TURN))
%                 counter = counter - 1;
%             end
%             board(playerX,playerY+counter) = TURN;
%         elseif(isLeft == 1)
%             while((board(playerX,playerY-counter) == splash(TURN)) && ( playerY - (counter + 1) > 0))
%                 counter = counter + 1;
%                 flag = 1;
%             end
%             if board(playerX,playerY-counter) ~= splash(TURN)
%                 counter = counter - 1;
%             end
%             board(playerX,playerY-counter) = TURN;
%         elseif(isAbove == 1)
%             while((board(playerX - counter,playerY) == splash(TURN)) && ( playerX - ( counter + 1 ) > 0))
%                 counter = counter + 1;
%                 flag = 1;
%             end
%             if (board(playerX - counter,playerY) ~= splash(TURN))
%                 counter = counter - 1;
%             end
%             board(playerX - counter,playerY) = TURN;
%         else
%             while((board(playerX + counter,playerY) == splash(TURN)) && ( playerX + (counter + 1) < 9))
%                 counter = counter + 1;
%                 flag = 1;
%             end
%             if (board(playerX + counter,playerY) ~= splash(TURN))
%                 counter = counter - 1;
%             end
%             board(playerX + counter,playerY) = TURN;
% 
%         end
%     else    
%         if(isRight == 1)
%             board(playerX,playerY+counter) = TURN;
%         elseif(isLeft == 1)
%             board(playerX,playerY-counter) = TURN;
%         elseif(isAbove == 1)
%             board(playerX-counter,playerY) = TURN;
%         else
%             board(playerX+counter,playerY) = TURN;
%         
%         end
%     
%     end
    

end