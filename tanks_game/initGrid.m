
%%%%%% --------- This function accepts number of horizontal and vertical lines as paramaters and returns the grid in its initial form, that is, 
%                empty cells of grid      --------- %%%%%%

function [HEIGHT,WIDTH,grid] = initGrid(hLines,vLines)
    HEIGHT = 525;                                   % Height of the grid
    WIDTH = 525;                                    % Width of the grid

    rowInterval = ceil (HEIGHT/hLines);     
    colInterval = ceil (WIDTH/vLines);
    
    grid = imread('images/NewBoard.jpg');
    
    
%    for i = 1:hLines
%        grid((i*rowInterval),:,:) = 0;
%        grid((i*rowInterval),:,:)
%    end    
    
    grid(rowInterval:rowInterval:HEIGHT,:,:) = 255;     % Making rows, which are multiple of 50, black
    grid(:,colInterval:colInterval:WIDTH,:) = 255;      % Making cols, which are multiple of 50, black
    
    
%    imshow(grid)
    
end