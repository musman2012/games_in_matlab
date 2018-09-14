function turn = changeTurn(agentTurn)
    turn = mod(agentTurn,4) + 1;
end