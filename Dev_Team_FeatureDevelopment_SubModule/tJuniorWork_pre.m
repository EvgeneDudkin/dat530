function [fire, transition] = tJuniorWork_pre(transition)

% extract developer type from the transition (t<type>Work)
developer = transition.name(2:length(transition.name) - 4);
[fire, transition] = tDeveloperWorkCommonPre(developer, transition);
end