function [fire, transition] = tDeveloperCodeFixCommonPre(devEntity, transition, delay)

tokenId = tokenAllColor('pCodeReviewDone', 1, {devEntity, 'FailedReview'}); % select a task that needs to be fixed
granted = requestSR({append(devEntity, 'Developer'), 1}); % request Developer as a resource

if not(tokenId) || not(granted)
    fire = 0; % cannot start working
    return;
end

colors = get_color('pCodeReviewDone', tokenId); % get the colors of the selected token
daysOfWork = str2num(colors{4}); % convert spent days
transition.selected_tokens = tokenId;
transition.new_color = {colors{1}, colors{2}, colors{3}, num2str(daysOfWork+delay)}; % assigned to, hardness, daysOfWork, days spent on this item
transition.override = 1;
disp(['Developer: ',  colors{1}, ' fixed the code']);
fire = 1; % fire only if resource acquired
end