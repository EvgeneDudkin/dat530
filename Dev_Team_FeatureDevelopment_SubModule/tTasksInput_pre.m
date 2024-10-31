function [fire, transition] = tTasksInput_pre(transition)

% Has to be done because colors may change order
tokenId = tokenArrivedEarly('pTBuff', 1);
colors = get_color('pTBuff', tokenId);
transition.new_color = colors;
transition.selected_tokens = tokenId;
transition.override = 1;
fire = tokenId;
end