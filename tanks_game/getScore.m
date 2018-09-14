function [ s ] = getScore( board )
    s = zeros(1,4);
    
    s(1,1) = length(find(board==21));
    s(1,2) = length(find(board==22));
    s(1,3) = length(find(board==23));
    s(1,4) = length(find(board==24));
end

