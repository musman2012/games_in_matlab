function [ vision ] = FOV( globalBoard, playerX, playerY )
%FOV Summary of this function goes here
%   Detailed explanation goes here
    player = globalBoard(playerX,playerY);
    
    direction = 0;          % default right
    
    vision = zeros(15,15);
    
    vision(:,:) = -999;
    
    if player < 5           % looking left
        direction = 180;
    elseif player < 10 
        direction = 0;      % looking right
    elseif player < 15
        direction = 90;     % looking up
    elseif player < 20 
        direction = -90;    % down
    end
        
    if direction == 90          % Upward
        endingRow = playerX - 7;
        endingRow = max(endingRow,1);
        
        counter = 0;

        while(counter < 8)
            if playerY - counter > 0
                vision(endingRow:(playerX - counter), playerY - counter) = globalBoard(endingRow:(playerX - counter), playerY - counter);
            end
            if playerY + counter < 16
                vision(endingRow:(playerX - counter), playerY + counter) = globalBoard(endingRow:(playerX - counter), playerY + counter);
            end
            counter = counter + 1;
        end
        
        %%%%%%%%%%%%%% Now Limit the vision due to stones %%%%%%%%%%%%%% 
        
        [rows,cols] = find(vision==-99);
        
        numberOfStones = size(cols);
        
        for i = 1:numberOfStones
            
            vision(1:rows(i),cols(i)) = -999;
        end
            
            
        
    elseif direction == -90             % Down
        
        endingRow = playerX + 7;
        endingRow = min(endingRow,15);
        
        counter = 0;

        while(counter < 8)
            if playerY - counter > 0
                %%%%% IN PROGRESS
                vision(playerX + counter:endingRow, playerY - counter) = globalBoard(playerX + counter:endingRow, playerY - counter);
            end
            if playerY + counter < 16
                vision(playerX + counter:endingRow, playerY + counter) = globalBoard(playerX + counter:endingRow, playerY + counter);
            end
            counter = counter + 1;
        end
        
        %%%%%%%%%%%%%% Now Limit the vision due to stones %%%%%%%%%%%%%% 
        
        [rows,cols] = find(vision==-99);
        
        numberOfStones = size(cols);
        
        for i = 1:numberOfStones
            
            vision(rows(i):15,cols(i)) = -999;
        end


        
    elseif direction == 0       % Right
        
        endingCol = playerY + 7;
        endingCol = min(endingCol,15);
        
        counter = 0;
        
        while(counter < 8)
            if playerX - counter > 0
                vision(playerX - counter, playerY + counter:endingCol) = globalBoard(playerX - counter, playerY + counter:endingCol);
            end
            if playerX + counter < 16
                vision(playerX + counter, playerY + counter:endingCol) = globalBoard(playerX + counter, playerY + counter:endingCol);
            end
            counter = counter + 1;
        end
        
        %%%%%%%%%%%%%% Now Limit the vision due to stones %%%%%%%%%%%%%% 
        
        [rows,cols] = find( vision == -99 );
        
        numberOfStones = size(cols);
        
        for i = 1:numberOfStones
            
            vision(rows(i),cols(i):15) = -999;
        end

        
    elseif direction == 180     % Left
        
        startingCol = playerY - 7;
        startingCol = max(startingCol,1);           % If startingCol is less than 1 then make it 1.
        counter = 0;
        
        while(counter < 8)
            if playerX - counter > 0
                vision(playerX - counter, startingCol:playerY  - counter) = globalBoard(playerX - counter, startingCol:playerY - counter);
            end
            if playerX + counter < 16
                vision(playerX + counter, startingCol:playerY - counter) = globalBoard(playerX + counter, startingCol:playerY - counter);
            end
            counter = counter + 1;
        end
        
        %%%%%%%%%%%%%% Now Limit the vision due to stones %%%%%%%%%%%%%% 
        
        [rows,cols] = find( globalBoard == -99 );
        
        numberOfStones = size(cols);
        
        for i = 1:numberOfStones
            
            vision(rows(i),1:cols(i)) = -999;
        end

        
        
    end
    
    
end

