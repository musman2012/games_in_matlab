function [ plan ] = makeBattlePlan( shortestPath, direction, tankId, srcX, srcY )
    i = 1;
    plan = zeros(1,15);
    plan(plan==0)=-99;
    myDir = getDirection(srcX,srcY,tankId,shortestPath);
    [~, oppY] = getOpponent(tankId, shortestPath);
    while(myDir ~= direction)
        if srcY > oppY
            plan(1,i) = mod((myDir + 10),20);
        else
            plan(1,i) = mod((myDir - 10),20);
        end
        myDir = plan(1,i);
    end
    plan(1,i) = direction;
    i = i + 1;
    [shortestXs,shortestYs] = find(shortestPath==123 | shortestPath == tankId);
    shortestCells = [transpose(shortestXs); transpose(shortestYs)];
    shortestCells = transpose(shortestCells);
    [~,index] = ismember(transpose([srcX;srcY]),shortestCells,'rows');
    shortestCells(index,:) = 0;
    shortestCells( ~any(shortestCells,2), : ) = [];
    j = 1;
    while ~isempty(shortestCells)
        [neighbour, dir] = isNeighbour(srcX, srcY,shortestCells(j,1), shortestCells(j,2));
      if neighbour == 1
          plan(i) = dir;
          srcX = shortestCells(j,1);
          srcY = shortestCells(j,2);
          shortestCells(j,1) = 0;
          shortestCells(j,2) = 0;
          shortestCells( ~any(shortestCells,2), : ) = [];
          i = i + 1;
      end
      j = 1 + mod(j, size(shortestCells,1));
    end
    
    plan(1,i) = 0;
     
%     [currentX, currentInd] = find(shortestXs == srcX);
%     shortestXs(currentInd,1) = 0;
%     shortestYs(currentInd,1) = 0;
%     shortestYs( ~any(shortestYs,2), : ) = [];
%     shortestXs( ~any(shortestXs,2), : ) = [];
end