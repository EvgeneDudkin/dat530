function [fire, transition] = tDevTestIn_pre(transition)
global global_info;
% Has to be done because colors may change order
tokenId = tokenArrivedEarly('pTestedBuffer', 1);
colors = get_color('pTestedBuffer', tokenId);

if (strcmp(colors{5},'BugFixNeeded'))
    global_info.found_bugs_counter = global_info.found_bugs_counter + 1;
end

transition.new_color = colors;
transition.selected_tokens = tokenId;
transition.override = 1;
fire = 1;
end