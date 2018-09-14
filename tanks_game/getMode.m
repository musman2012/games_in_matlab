% Takes Field of vision as an input argument and return mode for that
% scenario of vision

function mode = getMode(FoV)
% Take mod of values in FoV and find it here by replacing with 12
    
   [rows,cols] = find(FoV == 0);            
   
   [rows1,cols1] = find(FoV == -999);
   
    totalSize = length(rows) + length(rows1);   % Number of zeros plus -999
    
    [rows2, cols2] = size(FoV);                 
    
    if rows2 * cols2 == (totalSize + 1)               % Total number of elements
        mode = 1;                       % Normal Mode
    else
        mode = 2;                       % Battlle Mode
    end
   
end