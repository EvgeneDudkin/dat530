function [fire, transition] = tMiddleCodeFix_pre(transition)

% extract developer type from the transition (t<type>CodeFix)
developer = transition.name(2:length(transition.name) - 7);
[fire, transition] = tDeveloperCodeFixCommonPre(developer, transition, 1/4);
end