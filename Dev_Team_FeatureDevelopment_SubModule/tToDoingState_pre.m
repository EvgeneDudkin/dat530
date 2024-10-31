function [fire, transition] = tToDoingState_pre(transition)
% function for placing taks from 'To Be Done' to 'Doing' state
set = {'Junior', 'Middle', 'Consultant', 'TechLead'};
for i = 1:length(set)
    doingTokenId = tokenAnyColor('pDoing', 1, set{i}); % select a 'Doing' task of Developer
    if not(doingTokenId) && not(is_firing(append('t', set{i}, 'Work'))) % there is no 'Doing' task for Developer
        toBeDoneTokenId = tokenAnyColor('pTasksBuffer', 1, set{i}); % select a 'To Be Done' task of a Developer
        if not(toBeDoneTokenId)
            continue
        end
        colors = get_color('pTasksBuffer', toBeDoneTokenId);
        colors(end + 1) = {'0'}; % assigned to, hardness, daysOfWork, days spent on this item
        transition.new_color = colors;
        transition.override = 1;
        transition.selected_tokens = toBeDoneTokenId;
        fire = 1;
        disp(['Task ', num2str(toBeDoneTokenId), ' moved to <doing> state for ' , set{i}]);
        return
    end
end

fire = 0;
end
