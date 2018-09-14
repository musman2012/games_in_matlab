function [ oppRow, oppCol ] = getOpponent( myTankID, FoV )
%GETOPPONENT Summary of this function goes here
%   This function will return the indices of the opponent in FoV
    [oppRow, oppCol] = find (FoV ~= -999 & FoV ~= 0 & FoV ~= myTankID);

end
