function [fire, transition] = tDevTestOut_pre(transition)

% select earliest task that ready for QA team
tokenId = tokenArrivedEarly('pReadyForTest', 1);
if(tokenId)
    colors = get_color('pReadyForTest', tokenId);
    transition.new_color = {colors{1}, colors{2}, colors{3}, colors{4}}; % developer, hardness, days, spent days
    transition.override = 1;
end
transition.selected_tokens = tokenId;
fire = tokenId;
end