function turn = changeTurn(agentTurn)
    turn = mod(agentTurn,2) + 1;
end