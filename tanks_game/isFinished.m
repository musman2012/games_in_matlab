function [ result ] = isFinished( counter )
%Returns 1 if counter has reached 1000 or 0 otherwise.
    result = 0;
    if counter == 45
        result = 1;
    end
end

