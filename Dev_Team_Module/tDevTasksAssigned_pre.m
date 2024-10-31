function [fire, transition] = tDevTasksAssigned_pre(transition)

% Has to be done because colors may change order
tokenId = tokenArrivedEarly('pToBeDone', 1);
colors = get_color('pToBeDone', tokenId);
transition.new_color = colors;
transition.selected_tokens = tokenId;
transition.override = 1;
fire = tokenId;
end