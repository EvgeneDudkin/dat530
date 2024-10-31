function [fire, transition] = tMTAnswered_pre(transition)

% select a support request, which answer is ready for Support Team
tokenId = tokenAnyColor('pMTProcessed', 1, {'AnswerGenerated'});
if(tokenId)
    colors = get_color('pMTProcessed', tokenId);
    transition.new_color = {'TicketAnswer'};
    transition.override = 1;
end
transition.selected_tokens = tokenId;
fire = tokenId;

end