function [fire, transition] = tMTProcessor_pre(transition)

tokenId = tokenAny('pMaintenanceTasks', 1); % select a task
granted = requestSR({'TechLeadDeveloper', 1}); % request TechLead as a resource

if not(granted)
    fire = 0; % cannot start working
    return;
end

p = unifrnd(0,1); % random number between 0 and 1 to calculate probability of placing task to backlog
taskStatus = p > 0.5;

strStatus = 'AnswerGenerated';
if ( not(taskStatus) )
    strStatus = 'TaskForBackLog';
end
transition.selected_tokens = tokenId;
transition.new_color = {strStatus}; % status
transition.override = 1;
fire = 1; % fire only if resource acquired
end

