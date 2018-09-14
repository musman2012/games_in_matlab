function [ flag ] = isPlanFinished( plan )
%ISPLANFINISHED Summary of this function goes here
%   Detailed explanation goes here
    temp = find(plan == -99);
    if size(temp) == size(plan)
        flag = 1;
    else
        flag = 0;
    end

end

