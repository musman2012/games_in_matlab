function [ plan ] = makeExploringPlan( shortestPath, tankId, srcX, srcY )
%MAKEEXPLORINGPLAN Summary of this function goes here
%   Detailed explanation goes here
    i = 1;
    plan = zeros(1,15);
    plan(1,:) = -99;
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

end

