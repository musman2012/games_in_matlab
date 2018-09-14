function [children] = generateChildren(board, tankID)
 [tankX, tankY] = find(board == tankID);
 children = zeros(size(board,1), size(board,2), NoC(board, tankX, tankY) + 3);
 initRank = mod(tankID,5);
 count = 1;
 
 for i = initRank : 5 : initRank + 15
    if i ~= tankID
         children(:,:,count) = board;
         children(tankX,tankY,count) = i;
         count = count + 1;
    end
 end
 if( tankX-1 > 0 && board(tankX-1,tankY) == 0 )
        children(:,:,count) = board;
        children(tankX,tankY,count) = 123;
        children(tankX-1,tankY,count) = tankID;
        count = count + 1;
 end
 if ( tankX+1 <= size(board,1) && board(tankX+1,tankY) == 0 )
            children(:,:,count) = board;
            children(tankX,tankY,count) = 123;
            children(tankX+1,tankY,count) = tankID;
            count = count + 1;
 end
 if ( tankY+1 <= size(board,2) && board(tankX,tankY+1) == 0 )
            children(:,:,count) = board;
            children(tankX,tankY,count) = 123;
            children(tankX,tankY+1,count) = tankID;
            count = count + 1;
 end
 if ( tankY-1 > 0 && board(tankX,tankY-1) == 0 )
            children(:,:,count) = board;
            children(tankX,tankY,count) = 123;
            children(tankX,tankY-1,count) = tankID;
            count = count + 1;
 end
end