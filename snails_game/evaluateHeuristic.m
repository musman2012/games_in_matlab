function status = evaluateHeuristic(board, agentTurn, splash)
    % Using values -10 to 10, this function will tell how good or bad a
    % move is.
    
    % Firstly we'll stop the oppoenent from winning
 %   agentTurn = mod(agentTurn,2) + 1;
    
    opTurn = mod(agentTurn,2) + 1;
    [rows1,cols1] = find(board == opTurn);
    x1 = 0, y1 = 0;
    
    x0 = 1;                             % Initial position of player 2
    y0 = 8;                             % Initial position of player 2
    
    % Scale should be equal to the distance between both players divided by
    % two
    
    if agentTurn == 1
        x0 = 8;                         % Initial position of player 1
        y0 = 1;                         % Initial position of player 1
    end
    
    [agentSplashRows,agentSplashCols] = find(board == splash(agentTurn));           % Find the position of splashes of agent
    
    numberOfSplashes = length(agentSplashRows);                                     % Find the number of splashes of agent
    
    [agentRows,agentCols] = find(board == agentTurn);                               % Final position of player
    
    agentSplashRows = [agentSplashRows ; agentRows];                                % Append the player position to conquered area
    
    agentSplashCols = [agentSplashCols ; agentCols];                                % Append the player position to conquered area
    
    if agentTurn == 2                                                                
        x1 = max(agentSplashRows);
        y1 = min(agentSplashCols);
    else
        x1 = min(agentSplashRows);
        y1 = max(agentSplashCols);
    end
    
    diffX = abs(x1 - x0);                                                           % Finding the difference of player final and initial position
    diffY = abs(y1 - y0);
    
    diffX1 = abs(x1 - rows1);                                                       % Finding the difference of both player positions
    diffY1 = abs(y1 - cols1);
    
    scaleX = floor (diffX1/2);                                                      
    scaleY = floor (diffY1/2);
    
    area = (diffX + scaleX) * (diffY + scaleY);                                     % Conquered area (number of cells)
    
    numberOfEmptyBoxes = area - numberOfSplashes;                                   % Number of empty boxes in covered area
    
    status = (numberOfSplashes * 1) + (numberOfEmptyBoxes * 0.5);                   % Giving empty boxes 0.5 score and splashes 1, within conquered area


end