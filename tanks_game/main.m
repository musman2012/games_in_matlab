function x = main(rows, cols)

    HEIGHT = 0;
    WIDTH = 0;
    global dX;
    global dY;
    
    playerPositions = zeros(4,2);
    playerPositions(:,:) = -99;
    
    splash = [11,22];                                   % ith index is for ith player
    TURN = 2;
    %TURN = randint(1,1,[1 2]);                          % Start with a random value
    board = initBoard(rows,cols);                       % Initializes the board e. g. 8 x 8 board of zeros
    [HEIGHT,WIDTH,grid] = initGrid(rows,cols);          % Initializes the grid of game to be seen by the user
    
    BOXHEIGHT = ceil (HEIGHT/rows);                     % Height of one cell of the grid
    BOXWIDTH = ceil (WIDTH/cols);                       % Width of one cell of the grid
    
    grid = updateGrid(grid,board,BOXWIDTH,BOXHEIGHT);   % Now make the grid according to board, place player icons on corners
    
    set(gca,'Position', [0 0 1 1]);                     % Window settings
    bool = 1;                                           % A flag to implement a do - while loop
   % dX = 0, dY = 0;
   
  %  name = inputdlg('Enter your name.','Input Name');
    
  iptsetpref('ImshowBorder','loose');   %no border
  
%  iptsetpref('ImshowBorder','tight');   %no border
  figure;
  imshow(grid)
  counter = 0;
  plan = zeros(1,15);
  plan(1,:) = -99;
  mode = 1;
  
%  tempBoard = zeros(15);
  
  while(~isFinished(counter))
      s = getScore(board);
      title(strcat('Red: ',num2str(s(1,1)),' Yellow: ',num2str(s(1,2)),' Blue: ',num2str(s(1,3)),' White: ',num2str(s(1,4))))

      tempBoard = board;
      pause(0.5);
      if counter == 6
          print ('Pohanch gya');
      end
      if TURN == 1
          playerPositions(:,:) = -99;
      end
      
      if TURN == 2
          [board, mode, plan, playerPositions] = makeTurn(board, TURN, mode, plan, playerPositions);
      else
          while isequal(board,tempBoard)
              [tempBoard, playerPositions] = makeRandomMove(TURN, randint(1,1,[1 8]), board, playerPositions);
          end
          board = tempBoard;
      end
      grid = updateGrid(grid,board,BOXWIDTH,BOXHEIGHT);
      imshow(grid);
      title(strcat('Red: ',num2str(s(1,1)),' Yellow: ',num2str(s(1,2)),' Blue: ',num2str(s(1,3)),' White: ',num2str(s(1,4))))
      TURN = changeTurn(TURN);
      counter = counter + 1;
%       [srcX, srcY] = findPlayer(board,TURN);
%       fov = FOV(board,srcX,srcY);
%       mode = getMode(fov);
%       [destinationX, destinationY] = getGoal(fov,mode,board(srcX, srcY));
%       shortestPath = searchTree(board,board(srcX,srcY), board, destinationX, destinationY);
%       if mode == 2
%           [shortestXs,shortestYs] = find(shortestPath==123 | shortestPath==122 | shortestPath == TURN);
%           [currentX, currentInd] = find(shortestXs == srcX);
%           shortestXs(currentInd,1) = 0;
%           shortestYs(currentInd,1) = 0;
%           shortestYs( ~any(shortestYs,2), : ) = [];
%           shortestXs( ~any(shortestXs,2), : ) = [];
%       else
%           [shortestXs,shortestYs] = find(shortestPath == TURN);
%       end
%       i = 1;
%       while ~isempty(shortestXs)
%           if isNeighbour(srcX, srcY,shortestXs(i), shortestYs(i))
%               board = updateBoard(board,2,shortestXs(i), shortestYs(i),TURN);
%               %[HEIGHT,WIDTH,grid] = initGrid(rows,cols);
%               grid = updateGrid(grid,board,BOXWIDTH,BOXHEIGHT);
%               imshow(grid);
%               %TURN = changeTurn();
%               shortestXs(i) = 0;
%               shortestYs(i) = 0;
%               shortestYs( ~any(shortestYs,2), : ) = [];
%               shortestXs( ~any(shortestXs,2), : ) = [];
%               [srcX, srcY] = findPlayer(board,TURN);
%           end
%           i = 1 + mod(i, size(shortestXs,1));
%       end
%       counter = counter + 1;
  end
  winner = checkWinner(s);
%  playerWon;
  if winner == 1
      playerWon = ' RED';
  elseif winner == 2
      playerWon = ' YELLOW';
  end

  title(strcat('Winner is : ', playerWon));

  %  names = {name(1), 'AI-Agent'};
   
   % while(bool == 1)
        
   %     if TURN == 1
   %         ylabel(['Turn of player ', name], 'FontSize', 12, 'Fontname','Verdana');
   %     else
   %         ylabel('Turn of AI player ', 'FontSize', 12, 'Fontname','Verdana');
   %     end
        
   %     title('Turn of player ',num2str(TURN))
        
  %      if(TURN == 2)
   %         board = searchTree(board, 1, TURN, 4, splash);
%               
    %    elseif(TURN == 1)    
    %        terminate = 0;
    %     while(terminate == 0)
     %       [y,x] = ginput(1);
     %       [dX,dY,BOXWIDTH,BOXHEIGHT] = gridToBoard(HEIGHT,WIDTH,x,y,rows,cols);
     %            if(isLegal(board,dX,dY,TURN,splash) == 1)
     %                terminate = 1;
     %            end
    %      end
%             % Pass the variables HEIGHT and WIDTH by reference.
% 
%             % After checking the validity, update the grid
     %   board = updateBoard(board,dX,dY,TURN,splash);                 %  Complete this 

%        board(dX,dY) = TURN;
%         
%        end
% 
     %    board
         
     %    response = evaluateBoard(board,2);                         % Get the response for the current state of board
%         
%         % Change turn and send appropriate flags
% 
        % figure;
     %    set(gca,'Position', [0 0 1 1]);
         
     %    imwrite(grid, 'test1', 'png');
%        
         
%         
%         bool = isContinue(board)
     %    sentense = ['Player ', num2str(TURN),' has won the game!!! '];
%         
    %     if(response ~= 0)                                      % Game is finished
%             disp(sentense)
 %            break;
  %       end
         
   %      grid = updateGrid(grid,board,BOXWIDTH,BOXHEIGHT);      % Update the front end of the game according the back-end
         
    %     imshow(grid);
%         
         
%         
     %   end
        
         
     %   TURN = changeTurn(TURN);                                % Change the turn
  % end
    
end