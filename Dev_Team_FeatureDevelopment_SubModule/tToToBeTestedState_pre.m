function [fire, transition] = tToToBeTestedState_pre(transition)

% select any successful reviewed task
tokenId = tokenAnyColor('pCodeReviewDone', 1, {'SuccessfulReview'});
if(tokenId)
    colors = get_color('pCodeReviewDone', tokenId);
    transition.new_color = colors;
    transition.override = 1;
end
transition.selected_tokens = tokenId;
fire = tokenId;
end
