function [ direction ] = getDirection( goalX, goalY, tankID, FoV )
% GETDIRECTION Summary of this function goes here
%   This function will return the required direction of our tank when it
%   reached at the goal
    [oppRowX, oppColY] = getOpponent(tankID, FoV);
    
   % direction = -99;
%    opponent = FoV(oppRowX, oppColY);
    
    if oppColY == goalY       % Same column
        if oppRowX > goalX     % Opponent is below
            direction = 12;
        else                    % Opponent is above
            direction = 11;
        end
    else                        % Same Row
        if oppColY > goalY     % Opponent is at right
            direction = 13;
        else                    % Opponent is at left
            direction = 14;
        end
    end
end

