function [ board, mode, plan, playerPositions] = makeTurn( board, turn, preMode, plan, playerPositions)   
    [X,Y] = findPlayer(board, turn);
    fov = FOV(board, X, Y);
    for i = 1:4
       if playerPositions(i,1) == -99
           continue
       else
           row = playerPositions(i,1);
           col = playerPositions(i,2);
           fov(row, col) = board(row, col);
       end
    end
    mode = getMode(fov);
    if mode == 2
        if preMode == 1 || isPlanFinished(plan) == 1
            [goalX, goalY] = getGoal(fov,mode,board(X,Y));
            direction = getDirection(goalX, goalY, board(X,Y), fov);
            shortestPath = searchTree(board,board(X,Y), board, goalX, goalY);
            plan = makeBattlePlan(shortestPath, direction, board(X,Y), X, Y);
        end
    
    elseif mode == 1
        if (size(unique(fov(X,:)),2)==2 && size(unique(fov(X+1,:)),2)==1)
        %if (fov(X,:) == -999 && fov(X+1,:) == -999)
            board(X,Y) = turn + 15;
            return
     
        elseif preMode == 2 || isPlanFinished(plan) == 1
            [goalX, goalY] = getGoal(fov,mode,board(X,Y));
            shortestPath = searchTree(board,board(X,Y), board, goalX, goalY);
            plan = makeExploringPlan(shortestPath, board(X,Y), X, Y);
        end
    
    end
    [updatedBoard, updatedPlan, playerPositions] = executePlan(plan, board, board(X,Y), playerPositions);
    plan = updatedPlan;
    board = updatedBoard;

    
end

