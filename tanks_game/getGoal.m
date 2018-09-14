function [ goalX, goalY ] = getGoal( FOV, mode, tankId )
%If mode is 1 (exploring), returns the X and Y coordinates of the nearest
%unexplored box.
    [X,Y] = find(FOV==tankId);
    if mode == 1
        [unoccupiedCellsX, unoccupiedCellsY] = find(FOV==0);
        steps = abs(unoccupiedCellsX-X) + abs(unoccupiedCellsY-Y);
        [~, goalInd] = min(steps);
        goalX = unoccupiedCellsX(goalInd);
        goalY = unoccupiedCellsY(goalInd);
        
%         % find the shortest unoccupied on right side
%         %[Points(1,1),Points(1,2)] = find(FOV(X,Y:size(FOV,2)==0));
%         vector = find(FOV(X,Y:size(FOV,2)==0));
%         if ~isempty(vector)
%             [Points(1,2)] = vector(1);
%             goalX = X;
%             goalY = Points(1,2) + Y - 1;
%             %Points(1,1) = X;
%             %Points(1,2) = Points(1,2) + Y - 1;
%         end
%         
%         % find the shortest unoccupied on left side
%         vector = find(FOV(X,1:Y)==0);
%         if ~isempty(vector)
%             goalX = X;
%             goalY = vector(size(vector,2));
%         end
%         
%         % find the shortest unoccupied towards north
%         vector = find(FOV(1:X,Y)==0);
%         if ~isempty(vector)
%             goalY = Y;
%             goalX = vector(size(vector,1));
%         end
%         % find the shortest unoccupied towards south
%         vector = find(FOV(X:size(FOV,1),Y)==0);
%         if ~isempty(vector)
%             goalY = Y;
%             goalX = vector(size(vector,1));
%         end
        
%If mode is 2 (battle), returns the X and Y coordinates of the nearest
%firing cell.
    elseif mode == 2
            %find opponent
            [opponentsX, opponentsY] = getOpponent(tankId, FOV);
            distancesX = abs(X-opponentsX);
            distancesY = abs(Y-opponentsY);
            
            if min(distancesX) < min(distancesY)
               [~, nearestRowIndex] = min(distancesX);
               goalX =  opponentsX(nearestRowIndex);
               goalY = Y;
              % track = FOV(goalX,opponentsY(nearestRowIndex,1):goalY-1);
            else
                [~, nearestColIndex] = min(distancesY);
                goalY =  opponentsY(nearestColIndex);
                goalX = X;
            end
            
            
            
            
            
%             opponents = zeros(4,2);
%             tempId = tankId + 1;
%             for i = 1:3
%                 if tempId == 5
%                     tempId = 1;
%                 end
%                 
%                 for j = 1:4
%                     [oppX, oppY] = find(FOV==tempId);
%                     if ~isempty(oppX)
%                         opponents(i,1) = oppX(1);
%                         opponents(i,2) = oppY(1);
%                     end
%                     tempId = tempId + 5;
%                 end
%                 tempId = (tempId - 19);
%             end
%             opponents( ~any(opponents,2), : ) = [];
%             rows = opponents(:,1) - X;
%             cols = opponents(:,2) - Y;
%             [minRow, minRIndex] = min(rows(:,1));
%             [minCol, minCIndex] = min(cols(:,1));
%             if abs(minRow) < abs(minCol)
%                 goalX = X + minRow;
%                 goalY = Y;
%                 %result = opponents(minRIndex,:);
%             else
%                 goalX = X;
%                 goalY = Y + minCol;
%                 %result = opponents(minCIndex,:);
%             end
%             %goalX = result(1);
%             %goalY = result(2);
%        end
    end
end

