
function [newBoard, value] = searchTree(board, turn, agentTurn, depth, splash)
    % exaustive search
  %  prevTurn = mod(turn,2) + 1;
    
    turn = mod(turn,2) + 1;
    status = evaluateBoard(board, agentTurn);
    hval = evaluateHeuristic(board, turn, splash);
    
 % Implement a heuristic function that can return numbers -10 to 10
 % depending on how good or how bad a move is.
    
    if(status ~= 0 || depth == 0)             
        newBoard = board;
        value = status + hval;
    else
        % Heuristic values would be added into value so that we can get
        % non-zero values
        
        
        children = generateChildren(board,turn,splash);
        
        

        noOfChildren = size(children,3);
        
        boards = zeros(8,8,noOfChildren);
        vals = zeros(1,1,noOfChildren);
        
        
        for i = 1 : noOfChildren
            
            [boards(:,:,i), vals(i)] = searchTree(children(:,:,i), turn, agentTurn, depth - 1, splash);
            
%            if agentTurn == turn 
%                max
   %         value = vals(i);
   %         newBoard = boards(:,:,i);
            
        end
        
    %    turn = mod(turn,2) + 1;
        
        if turn == agentTurn
           [value,index] = max(vals);
           
           
        %   value = vals(index(0));
           newBoard = children(:,:,index);
          % board
           
        else
           [value,index] = min(vals);
           newBoard = children(:,:,index);
           
        end
       
    end
end