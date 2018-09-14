function [ updatedBoard, updatedPlan, playerPositions] = executePlan( plan, globalBoard,  myTankID, playerPositions)
%EXECUTEPLAN Summary of this function goes here
%   Detailed explanation goes here
% Move Up = 1, Move Down = 2, Move Right = 3, Move Left = 4
% Turn Up = 11, Turn Down = 12, Turn Right = 13, Move Left = 14
% Fire = 0
    [myX, myY] = find(globalBoard == myTankID);
    counter = 1;
    
    turn = mod(myTankID,5);
    while(plan(1,counter) == -99)
        counter = counter + 1;
    end
    
    nextMove = plan(1,counter);         % We have found the immediate move
    
    switch nextMove
        case 0
            globalBoard = fire(globalBoard,myTankID);
            playerPositions(turn, 1) = myX;
            playerPositions(turn, 2) = myY;
        case 1                      % Move Up
            globalBoard(myX - 1, myY) = myTankID;
            globalBoard(myX, myY) = 20 + mod(myTankID, 5);
        case 2                      % Move Down
            globalBoard(myX + 1, myY) = myTankID;
            globalBoard(myX, myY) = 20 + mod(myTankID, 5);
        case 3                      % Move Right
            globalBoard(myX, myY + 1) = myTankID;
            globalBoard(myX, myY) = 20 + mod(myTankID, 5);
        case 4                      % Move Left
            globalBoard(myX, myY - 1) = myTankID;
            globalBoard(myX, myY) = 20 + mod(myTankID, 5);
            
        case 11                      % Turn Up
            globalBoard(myX, myY) = 10 + mod(myTankID, 5);
        case 12                      % Turn Down
            globalBoard(myX, myY) = 15 + mod(myTankID, 5);
        case 13                      % Turn Right
            globalBoard(myX, myY) = 5 + mod(myTankID, 5);
        case 14                      % Turn Left
            globalBoard(myX, myY) = 0 + mod(myTankID, 5);
            
    end
    
    plan(1,counter) = -99;
    
    updatedBoard = globalBoard;
    updatedPlan = plan;
    
    
end

