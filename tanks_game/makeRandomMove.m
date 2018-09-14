function [children, playerPositions] = makeRandomMove(myTankID, index, globalBoard, playerPositions)

% Index = 0 ==> Fire
% Index = 1 ==> Move Up, Index = 2 ==> Move Down, Index = 3 ==> Move Right, Index = 4 ==> Move Left
% Index = 5 ==> Turn Up, Index = 6 ==> Turn Down, Index = 7 ==> Turn Right, Index = 8 ==> Turn Left 

 [myX, myY] = findPlayer(globalBoard, myTankID);
     if index == 1 & myX == 1  
         index = index + 1;
     elseif index == 2 & myX == 15
         index = index - 1;
     elseif index == 3 & myY == 15          % Index is asking to move right
         index = index + 1;
     elseif index == 4 & myY == 1
         index = index - 1;
     end
     
     switch index
%        case 0
%            globalBoard = fire(globalBoard, myTankID);
%            playerPositions(mod(myTankID,5), 1) = myX;
%            playerPositions(mod(myTankID,5), 2) = myY;
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
            
        case 5                      % Turn Up
            globalBoard(myX, myY) = 10 + mod(myTankID, 5);
        case 6                      % Turn Down
            globalBoard(myX, myY) = 15 + mod(myTankID, 5);
        case 7                      % Turn Right
            globalBoard(myX, myY) = 5 + mod(myTankID, 5);
        case 8                      % Turn Left
            globalBoard(myX, myY) = 0 + mod(myTankID, 5);
            
    end
 children = globalBoard;
 
end