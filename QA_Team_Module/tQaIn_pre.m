function [ fire , transition ] = tQaIn_pre(transition)
% Has to be done because colors may change order
tokenId = tokenArrivedEarly('pToTestBuffer', 1);
colors = get_color('pToTestBuffer', tokenId);
transition.new_color = colors;
transition.selected_tokens = tokenId;
transition.override = 1;
fire = 1;
end