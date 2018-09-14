
function [newBoard, value] = searchTree(board, source, tempBoard, destX, destY)
    % exaustive search
  %  prevTurn = mod(turn,2) + 1;
    
%%%    turn = mod(turn,2) + 1;
  %  status = evaluateBoard(board, agentTurn);
    %actualSteps = stepsTaken(tempBoard, 123);                                  % We need to introduce another integer here
%    expSteps = expectedSteps( tempBoard, source, destination);         % We need to increase its debdt. Steps taken impact != Expected Steps impact
    
 % Implement a heuristic function that can return numbers -10 to 10
 % depending on how good or how bad a move is.
    
%    if(depth == 0)             
      %  newBoard = board;
%        newBoard = tempBoard;
%        value = actualSteps + (expSteps * 2);
%    else
        % Heuristic values would be added into value so that we can get
        % non-zero values
        [myX, myY] = find(tempBoard==source);
        
        if ((myX == destX) & (myY == destY))
            newBoard = tempBoard;
            value = 1;
            
        else
            children = generateChildren(tempBoard, source);

            noOfChildren = size(children,3);

            children = children(:,:,4:noOfChildren);

            noOfChildren = size(children,3);

            boards = zeros(15,15,noOfChildren);
            vals = zeros(1,noOfChildren);

            expStepsAll = zeros(1,noOfChildren);


            for i = 1 : noOfChildren
                expStepsAll(i) = expectedSteps(children(:,:,i), source, destX, destY);
            end

            [value,index] = min(expStepsAll);
            tempBoard = children(:,:,index);

            newBoard = searchTree(board, source, tempBoard, destX, destY);
        
        end
    %    for i = 1 : noOfChildren
    %        [boards(:,:,i), vals(i)] = searchTree(board, source, tempBoard, destination);
    %    end
        
    %    turn = mod(turn,2) + 1;
        
  %      if turn == agentTurn
  %       [value,index] = min(vals);
           
  %       newBoard = children(:,:,index);
           
%        else
%           [value,index] = min(vals);
%           newBoard = children(:,:,index);
           
%       end
       
    
end