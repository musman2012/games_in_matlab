%%%%%% --------- This function accepts number of rows and columns as paramaters and returns the board of rows x columns      --------- %%%%%%

function x = initBoard(rows,cols)
   x = zeros(rows,cols);                % Initialize the board with all zeros
 %  x(8,1) = 1;                          % Place player one
 %  x(1,8) = 2;                          % Place player two
    
   mid = ceil (rows/2);
 
   x(1,rows) = 2;
   
   x(1,1) = 1;
   
   x(rows,1) = 3;
   
   x(rows,cols) = 4;
   
   x(1,mid) = -99;
   x(2,mid) = -99;
   x(3,mid) = -99;
   
   
   x(rows,mid) = -99;
   x(rows-1,mid) = -99;
   x(rows-2,mid) = -99;
   
   
   x(mid,1) = -99;
   x(mid,2) = -99;
   x(mid,3) = -99;
   
   x(mid,rows) = -99;
   x(mid,rows-1) = -99;
   x(mid,rows-2) = -99;
   
   x(mid,mid) = -99;
   
   x(mid,mid - 2) = -99;
   x(mid - 2,mid) = -99;
   x(mid,mid + 2) = -99;
   x(mid + 2,mid) = -99;
   
   x(4,4) = -99;
   x(4,5) = -99;
   x(5,4) = -99;
      
   x(rows-3,4) = -99;
   x(rows-3,5) = -99;
   x(rows-4,4) = -99;
   
   
   x(4,cols-3) = -99;
   x(5,cols-3) = -99;
   x(4,cols-4) = -99;
   
   x(rows-4,cols-3) = -99;
   x(rows-3,cols-3) = -99;
   x(rows-3,cols-4) = -99;
   
   
   %%%%%%%%%%%%%%%%%%%%%%%%%%%
%   x(3,5) = 1;
%   x(mid,mid + 1) = 17;
 
end
