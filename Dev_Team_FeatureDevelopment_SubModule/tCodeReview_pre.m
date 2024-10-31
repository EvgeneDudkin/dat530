function [fire, transition] = tCodeReview_pre(transition)
global global_info;

granted = requestSR({'TechLeadDeveloper', 1, 'TeamLeadDeveloper', 1}); % request TechLead & TeamLead as a resources
tokenId = tokenAny('pCommitted', 1);
if not(tokenId) || not(granted)
    fire = 0; % cannot start code review
    return;
end

colors = get_color('pCommitted', tokenId); % get the colors of the selected token
dev = colors{1}; % get developer, which code is under review
p = unifrnd(0,1); % random number between 0 and 1 to calculate probability of error
codeReviewStatus = 1;
if (strcmp(dev,'Junior'))
    codeReviewStatus = p > global_info.jun_codereview_fail_p;
elseif (strcmp(dev,'Middle'))
    codeReviewStatus = p > global_info.mid_codereview_fail_p;
elseif (strcmp(dev,'Consultant'))
    codeReviewStatus = p > global_info.consultant_codereview_fail_p;
end

codeReviewStrStatus = 'SuccessfulReview';
if ( not(codeReviewStatus) )
    codeReviewStrStatus = 'FailedReview';
    global_info.code_review_fail_counter = global_info.code_review_fail_counter + 1; % increase counter
end
transition.selected_tokens = tokenId;
disp(['Code review for ', colors{1}, ' has been completed with status ' , codeReviewStrStatus]);
% assigned to, hardness, daysOfWork, daysSpent, codeReviewStatus
transition.new_color = {colors{1}, colors{2}, colors{3}, colors{4}, codeReviewStrStatus };
transition.override = 1;
fire = granted;
end
