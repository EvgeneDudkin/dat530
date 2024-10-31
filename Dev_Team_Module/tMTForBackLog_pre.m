function [fire, transition] = tMTForBackLog_pre(transition)
% select taks, which needs to be placed in BackLog
tokenId = tokenAnyColor('pMTProcessed', 1, {'TaskForBackLog'});
if(tokenId)
    colors = get_color('pMTProcessed', tokenId);
    transition.new_color = {'SupportTicket Ref.'};
    transition.override = 1;
end
transition.selected_tokens = tokenId;
fire = tokenId;
end