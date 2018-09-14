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
        
        imgPlayerOne = imread('Images/snail.png');
        imgPlayerTwo = imread('Images/Snail2.png');
        splashOne = imread('Images/splash1.png');
        splashTwo = imread('Images/splash2.png');
        
%        imwrite(imgZero,'test','PNG');
        
        
        [imageRows,imageCols] = size(imgPlayerOne);            % 91 98 3
        
        finalX = (BOXWIDTH * boxX) - 5;
        finalY = (BOXHEIGHT * boxY) - 5;
        startingX = (BOXWIDTH * (boxX - 1)) + 2;
        startingY = (BOXHEIGHT * (boxY - 1)) + 2;
        
        imgPlayerOne = enhanceGraphics(imgPlayerOne);
        
        imgPlayerTwo = enhanceGraphics(imgPlayerTwo);
        
        splashOne = enhanceGraphics(splashOne);
        
        splashTwo = enhanceGraphics(splashTwo);
 
                
  
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
                    grid(i+differenceY,j+differenceX) = imgPlayerOne(i,j);
                elseif (flag == 2)
                    grid(i+differenceY,j+differenceX) = imgPlayerTwo(i,j);
                elseif (flag == 3)
                    grid(i+differenceY,j+differenceX) = splashOne(i,j);
                elseif (flag == 4)
                    grid(i+differenceY,j+differenceX) = splashTwo(i,j);
                    
                end
            end
        end
        
        
%        grid(startingY:1:finalY,startingX:1:finalX,:) = imageCross(1:1:95,1:1:95,:);
        
        
 end