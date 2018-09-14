function bool = isWin(board, turn)
    
    bool = 0;

    player = find(board == turn);
    
    player = length(player);
    other = 64 - (player + 2);          % Two boxes would be occupied by the characters of each player.
    
    if other < player
        bool = 64;
    elseif other == player
        bool = 32;
    else
        bool = -64;
    end

end