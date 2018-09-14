
%%%%%% --------- This function accepts number of horizontal and vertical lines as paramaters and returns the grid in its initial form, that is, 
%                empty cells of grid      --------- %%%%%%

function [HEIGHT,WIDTH,grid] = initGrid(hLines,vLines)
    HEIGHT = 400;                                   % Height of the grid
    WIDTH = 400;                                    % Width of the grid

    rowInterval = ceil (HEIGHT/hLines);     
    colInterval = ceil (WIDTH/vLines);
        
    grid = ones(HEIGHT,WIDTH);                      % Making the whole grid white
    
    grid(rowInterval:rowInterval:HEIGHT,:) = 0;     % Making rows, which are multiple of 50, black
    grid(:,colInterval:colInterval:WIDTH) = 0;      % Making cols, which are multiple of 50, black
    
end