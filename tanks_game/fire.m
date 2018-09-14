function [ board ] = fire( board, tankID )
    [srcX, srcY] = find(board == tankID);
    if tankID < 5
        track = board(srcX,1 : srcY);
        track(track ~= -999 & track ~= 0 & track ~= tankID) = -99;
        board(srcX,1:srcY) = track;
    end
    if tankID > 5 && tankID < 10
        track = board(srcX,srcY:size(board,1));
        track(track ~= -999 & track ~= 0 & track ~= tankID) = -99;
        board(srcX,srcY:size(board,1)) = track;
    end
    if tankID > 10 && tankID < 15
        track = board(1:srcX,srcY);
        track(track ~= -999 & track ~= 0 & track ~= tankID) = -99;
        board(1:srcX,srcY) = track;
    end
    if tankID > 15 && tankID < 20
        track = board(srcX:size(board,2),srcY);
        track(track ~= -999 & track ~= 0 & track ~= tankID) = -99;
        board(srcX:size(board,2),srcY) = track;
    end
end