function children = generateChildren(board, nextTurn, splash)
    % Children 11 agar x pay hai aur right pay jana chahta hai tou jahan
    % tak 1 hain udhar tak chala jaey

    [rows,cols] = size(board);
    opTurn = mod(nextTurn,2) + 1;                           % Opposite player piece
    [playerX,playerY] = find(board == nextTurn);
    numberOfChildren = 4;                                   % Lets assume that we have four children for every state
    
    
    % If player is at the top or at the bottom, one children would be neglected
    if playerX == 1 || playerX == 8 || board(playerX + 1, playerY) == splash(opTurn) || board(playerX + 1, playerY) == opTurn                 
        numberOfChildren = numberOfChildren - 1;
    end
    
    if playerX > 1
        if board(playerX - 1, playerY) == splash(opTurn) || board(playerX - 1, playerY) == opTurn
            numberOfChildren = numberOfChildren - 1;
        end
    end
    
     % If player is at the left or at the right, one more would be neglected
    if playerY == 1 || playerY == 8 || board(playerX, playerY + 1) == splash(opTurn) || board(playerX, playerY - 1) == splash(opTurn) || board(playerX, playerY + 1) == opTurn || board(playerX, playerY - 1) == opTurn
        numberOfChildren = numberOfChildren - 1;
    end
        
    children = zeros(rows,cols,numberOfChildren);           % Now generate the children in there initial stage
    
    counter = 1;                                            % It will work as an index for the 3D board
    
     if playerX ~= 1 && board(playerX - 1, playerY) ~= splash(opTurn) && board(playerX - 1, playerY) ~= opTurn     % Ensuring that there is a space above
         children(:,:,counter) = updateBoard(board, playerX - 1, playerY, nextTurn, splash);
         counter = counter + 1;
     end
     if playerX ~= 8 && board(playerX + 1, playerY) ~= splash(opTurn) && board(playerX + 1, playerY) ~= opTurn    % Ensuring that there is a space below
         children(:,:,counter) = updateBoard(board, playerX + 1, playerY, nextTurn, splash);
         counter = counter + 1;
     end
     
     if playerY ~= 1 && board(playerX, playerY - 1) ~= splash(opTurn) && board(playerX, playerY - 1) ~= opTurn  % Ensuring that there is a space at left side
         children(:,:,counter) = updateBoard(board, playerX, playerY - 1, nextTurn, splash);
         counter = counter + 1;
     end
     if playerY ~= 8 && board(playerX, playerY + 1) ~= splash(opTurn) && board(playerX, playerY + 1) ~= opTurn  % Ensuring that there is a space at right side
         children(:,:,counter) = updateBoard(board, playerX, playerY + 1, nextTurn, splash);
         counter = counter + 1;
     end

    children    
end