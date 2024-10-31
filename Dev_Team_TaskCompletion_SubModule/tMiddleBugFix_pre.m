function [fire, transition] = tMiddleBugFix_pre(transition)

% extract developer type from the transition (t<type>BugFix)
developer = transition.name(2:length(transition.name) - 6);
[fire, transition] = tDeveloperBugFixCommonPre(developer, transition, 1/2);
end