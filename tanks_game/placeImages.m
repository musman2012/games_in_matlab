    % takes box number in x and y for grid
    % flag will be telling where to place a zero or cross 1 ==> Zero, 2 ==>
    % Cross
    
 function grid = placeImages(boxY, boxX, BOXWIDTH, BOXHEIGHT, grid, flag)
 
     function image = enhanceGraphics(image1)
        white = find(image1 > 128);
        black = find(image1 <= 128);
        
        image1(white(:,:)) = 1;
        
        image1(black(:,:)) = 0;
        
        image = image1;
        
     end
        
        
        rowsForImageTobePlaced = BOXHEIGHT - 4;
        colsForImageTobePlaced = BOXWIDTH - 4;
        imageCross = ones(rowsForImageTobePlaced, colsForImageTobePlaced,3);     % Decrease 2 from both sides
       % imageCross = 
        
        LeftPlayerOne = imread('Images/tank1Left.jpg');
        LeftPlayerTwo = imread('Images/tank2Left.jpg');
        LeftPlayerThree = imread('Images/tank3Left.jpg');
        LeftPlayerFour = imread('Images/tank4Left.jpg');
        
        RightPlayerOne = imread('Images/tank1Right.jpg');
        RightPlayerTwo = imread('Images/tank2Right.jpg');
        RightPlayerThree = imread('Images/tank3Right.jpg');
        RightPlayerFour = imread('Images/tank4Right.jpg');
        
        DownPlayerOne = imread('Images/tank1Down.jpg');
        DownPlayerTwo = imread('Images/tank2Down.jpg');
        DownPlayerThree = imread('Images/tank3Down.jpg');
        DownPlayerFour = imread('Images/tank4Down.jpg');
        
        
        UpPlayerOne = imread('Images/tank1Up.jpg');
        UpPlayerTwo = imread('Images/tank2Up.jpg');
        UpPlayerThree = imread('Images/tank3Up.jpg');
        UpPlayerFour = imread('Images/tank4Up.jpg');
        
        
        stone = imread('Images/stoneNew.png');
        
        splash = imread('Images/tile.png');
%        imwrite(imgZero,'test','PNG');
        
        
        [imageRows,imageCols] = size(LeftPlayerOne);            % 91 98 3
        
        finalX = (BOXWIDTH * boxX) - 5;
        finalY = (BOXHEIGHT * boxY) - 5;
        startingX = (BOXWIDTH * (boxX - 1)) + 2;
        startingY = (BOXHEIGHT * (boxY - 1)) + 2;
        
%        imgPlayerOne = enhanceGraphics(imgPlayerOne);
        
 %       imgPlayerTwo = enhanceGraphics(imgPlayerTwo);
        
 %       splashOne = enhanceGraphics(splashOne);
        
 %       splashTwo = enhanceGraphics(splashTwo);
 
 %       stone = enhanceGraphics(stone);        
  
%         for x = 1:imageCols
%             for y = 1:imageRows
%                 if (imgCross1(x,y) > 128)
%                     imgCross1(x,y) = 1;
%                 else
%                     imgCross1(x,y) = 0;
%                 end
%             end
%         end
        
        differenceX = startingX - 1;
        differenceY = startingY - 1;
        
       % imshow(grid)
        for i = 1:(BOXWIDTH - 5)
            for j = 1:(BOXWIDTH - 5)
                if (flag == 1)          % Place a cross here
                    grid(i+differenceY,j+differenceX,:) = LeftPlayerOne(i,j,:);
                elseif (flag == 2)
                    grid(i+differenceY,j+differenceX,:) = LeftPlayerTwo(i,j,:);
                elseif (flag == 3)
                    grid(i+differenceY,j+differenceX,:) = LeftPlayerThree(i,j,:);
                elseif (flag == 4)
                    grid(i+differenceY,j+differenceX,:) = LeftPlayerFour(i,j,:);

                elseif (flag == 6)
                    grid(i+differenceY,j+differenceX,:) = RightPlayerOne(i,j,:);                    
                elseif (flag == 7)
                    grid(i+differenceY,j+differenceX,:) = RightPlayerTwo(i,j,:);
                elseif (flag == 8)
                    grid(i+differenceY,j+differenceX,:) = RightPlayerThree(i,j,:);
                elseif (flag == 9)
                    grid(i+differenceY,j+differenceX,:) = RightPlayerFour(i,j,:);

                elseif (flag == 11)
                    grid(i+differenceY,j+differenceX,:) = UpPlayerOne(i,j,:);                    
                elseif (flag == 12)
                    grid(i+differenceY,j+differenceX,:) = UpPlayerTwo(i,j,:);
                elseif (flag == 13)
                    grid(i+differenceY,j+differenceX,:) = UpPlayerThree(i,j,:);
                elseif (flag == 14)
                    grid(i+differenceY,j+differenceX,:) = UpPlayerFour(i,j,:);
                    
                    
                elseif (flag == 16)
                    grid(i+differenceY,j+differenceX,:) = DownPlayerOne(i,j,:);                    
                elseif (flag == 17)
                    grid(i+differenceY,j+differenceX,:) = DownPlayerTwo(i,j,:);
                elseif (flag == 18)
                    grid(i+differenceY,j+differenceX,:) = DownPlayerThree(i,j,:);
                elseif (flag == 19)
                    grid(i+differenceY,j+differenceX,:) = DownPlayerFour(i,j,:);
                    
                    
                    
                elseif (flag > 20 && flag < 25)
                    grid(i+differenceY,j+differenceX,:) = splash(i,j,:);
                elseif (flag == -99)
                    grid(i+differenceY,j+differenceX,:) = stone(i,j,:);
                   
                end
            end
        end
        
        
%        grid(startingY:1:finalY,startingX:1:finalX,:) = imageCross(1:1:95,1:1:95,:);
        
        
 end