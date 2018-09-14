%%%%%% --------- This function accepts number of rows and columns as paramaters and returns the board of rows x columns      --------- %%%%%%

function x = initBoard(rows,cols)
   x = zeros(rows,cols);                % Initialize the board with all zeros
   x(8,1) = 1;                          % Place player one
   x(1,8) = 2;                          % Place player two
end
