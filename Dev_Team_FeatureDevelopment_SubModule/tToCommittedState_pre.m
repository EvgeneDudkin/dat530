function [fire, transition] = tToCommittedState_pre(transition)

% get tasks with 'Doing' state
numberOfDoingTasks = ntokens('pDoing');
[set_of_tokID, nr_token_av] = tokenAny('pDoing', numberOfDoingTasks);
for i = 1:nr_token_av
    tokenId = set_of_tokID(i);
    colors = get_color('pDoing', tokenId); % get the colors of a token
    % check that it can be committed (days spent equals days of planned work)
    daysOfWork = str2num(colors{4}); % convert spent days
    plannedDaysOfWork = str2num(colors{3}); % convert days of planned work
    if (daysOfWork >= plannedDaysOfWork)
        transition.selected_tokens = tokenId;
        transition.new_color = colors;
        transition.override = 1;
        fire = 1;
        disp(['Task ', num2str(tokenId), ' was committed by ' , colors{1}]);
        return
    end
end
fire = 0;
end
