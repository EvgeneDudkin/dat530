function [fire, transition] = tTasksForTest_pre(transition)

% Has to be done because colors may change order
tokenId = tokenArrivedEarly('pResult', 1);
colors = get_color('pResult', tokenId);
transition.new_color = colors;
transition.selected_tokens = tokenId;
transition.override = 1;
fire = tokenId;
end