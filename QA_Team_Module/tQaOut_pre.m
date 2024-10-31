function [fire, transition] = tQaOut_pre(transition)
% Has to be done because colors may change order
tokenId = tokenArrivedEarly('pTested', 1);
colors = get_color('pTested', tokenId);
transition.new_color = colors;
transition.selected_tokens = tokenId;
transition.override = 1;
fire = 1;
end