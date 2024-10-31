function [fire, transition] = tReadyForTest_pre(transition)

% Has to be done because colors may change order
tokenId = tokenArrivedEarly('pRTBuffer', 1);
colors = get_color('pRTBuffer', tokenId);
transition.new_color = colors;
transition.selected_tokens = tokenId;
transition.override = 1;
fire = tokenId;
end