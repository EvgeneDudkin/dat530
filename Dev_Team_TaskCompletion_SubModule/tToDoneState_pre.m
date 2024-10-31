function [fire, transition] = tToDoneState_pre(transition)
global global_info;

tokenId = tokenAnyColor('pTaskTested', 1, {'NoBugsFound'}); % select a successfully tested task
if not(tokenId)
    fire = 0; % cannot start working
    return;
end

colors = get_color('pTaskTested', tokenId); % get the colors of the selected token
devEntity = colors{1};
plannedDaysOfWork = str2num(colors{3});
disp(['Developer: ', devEntity, ' successfully completed ', colors{2}, ' task']);

% increase capacity for developer when task is done
if (strcmp(devEntity,'Junior'))
    global_info.jun_available_capacity = global_info.jun_available_capacity + plannedDaysOfWork;
elseif (strcmp(devEntity,'Middle'))
    global_info.mid_available_capacity = global_info.mid_available_capacity + plannedDaysOfWork;
elseif (strcmp(devEntity,'Consultant'))
    global_info.consultant_available_capacity = global_info.consultant_available_capacity + plannedDaysOfWork;
elseif (strcmp(devEntity,'TechLead'))
    global_info.tl_available_capacity = global_info.tl_available_capacity + plannedDaysOfWork;
end

transition.new_color = colors;
transition.override = 1;
transition.selected_tokens = tokenId;
fire = tokenId;
end