function [ count ] = NoC( board, X, Y )
    count = 0;
    if( X-1 > 0 & board(X-1,Y) == 0 )
        count = count + 1;
    end
    if ( X+1 <= size(board,1) & board(X+1,Y) == 0 )
            count = count + 1;
    end
    if ( Y+1 <= size(board,2) & board(X,Y+1) == 0 )
            count = count + 1;
    end
    if ( Y-1 > 0 & board(X,Y-1) == 0 )
            count = count + 1;
    end
end

