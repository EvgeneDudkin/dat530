function [fire, transition] = tTasksAssignment_pre(transition)
global global_info;

granted = requestSR({'TeamLeadDeveloper', 1}); % request TeamLead as a resource
% check whether developers have capacity for the tasks
if (global_info.jun_available_capacity <= 0 && global_info.tl_available_capacity <= 0 && ...
        global_info.mid_available_capacity <= 0 && ...
        (not(global_info.is_consultant_available) || global_info.consultant_available_capacity <= 0)) || not(granted)
    fire = 0; % cannot assign more tasks
    return
end

% assign a task
if global_info.jun_available_capacity > 0
    [taskDifficulty, daysOfWork] = getNextTaskDifficulty(global_info.jun_available_capacity );
    transition.new_color = {'Junior', taskDifficulty, num2str(daysOfWork)}; % assigned to, hardness, daysOfWork
    global_info.jun_available_capacity = global_info.jun_available_capacity - daysOfWork; % reduce capacity
elseif global_info.mid_available_capacity > 0
    [taskDifficulty, daysOfWork] = getNextTaskDifficulty(global_info.mid_available_capacity );
    transition.new_color = {'Middle', taskDifficulty, num2str(daysOfWork)}; % assigned to, hardness, daysOfWork
    global_info.mid_available_capacity = global_info.mid_available_capacity - daysOfWork; % reduce capacity
elseif global_info.is_consultant_available && global_info.consultant_available_capacity > 0
    [taskDifficulty, daysOfWork] = getNextTaskDifficulty(global_info.consultant_available_capacity );
    transition.new_color = {'Consultant', taskDifficulty, num2str(daysOfWork)}; % assigned to, hardness, daysOfWork
    global_info.consultant_available_capacity = global_info.consultant_available_capacity - daysOfWork; % reduce capacity
elseif global_info.tl_available_capacity > 0
    [taskDifficulty, daysOfWork] = getNextTaskDifficulty(global_info.tl_available_capacity );
    transition.new_color = {'TechLead', taskDifficulty, num2str(daysOfWork)}; % assigned to, hardness, daysOfWork
    global_info.tl_available_capacity = global_info.tl_available_capacity - daysOfWork; % reduce capacity
end

transition.override = 1;
fire = 1;
end