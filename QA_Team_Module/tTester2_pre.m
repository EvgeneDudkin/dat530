function [fire, transition] = tTester2_pre(transition)

tokenId = tokenAny('pToBeTested', 1); % select a task
granted = requestSR({'Tester2', 1}); % request Tester2 as a resource

if not(tokenId) || not(granted)
    fire = 0; % cannot start working
    return;
end

colors = get_color('pToBeTested', tokenId); % get the colors of the selected token
dev = colors{1}; % get developer, which code is under testing
testingResult = getTestingResult(dev);
colors{end+1} = testingResult;
transition.selected_tokens = tokenId;
transition.new_color = colors;
transition.override = 1;
fire = 1; % fire only if resource acquired
end

