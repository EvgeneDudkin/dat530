function [fire, transition] = tAbsorberSprint_pre(transition)
global global_info;
% get tasks with 'Done' state
numberOfDoneTasks = ntokens('pDone');
numberOfDoneSprintTasks = numberOfDoneTasks - global_info.done_task_counter;

doneSprintTasksTag = append('Done tasks in the prev. sprint = ', num2str(numberOfDoneSprintTasks));
failedCodeReviewsTag = append('Failed code reviews in the prev. sprint = ', num2str(global_info.code_review_fail_counter));
foundBugsTag = append('Found bugs by QA during testing in the prev. sprint = ', num2str(global_info.found_bugs_counter));

% get delays & hardness of the completed tasks in the sprint
delaysTag = 'Delays of the done tasks =';
[set_of_tokID, nr_token_av] = tokenArrivedBetween('pDone', numberOfDoneTasks, global_info.last_sprint_time, current_time);
hardnessMap = containers.Map(); % container for completed tasks difficulty statistics
for i = 1:nr_token_av
    tokenId = set_of_tokID(i);
    colors = get_color('pDone', tokenId); % get the colors of the selected token
    daysOfWork = str2num(colors{4}); % convert spent days
    plannedDaysOfWork = str2num(colors{3}); % convert days of planned work
    delaysTag = append(delaysTag, ' ', num2str(daysOfWork-plannedDaysOfWork));

    % fill hardnessMap
    key = append(colors{1}, '|', colors{2});
    if (isKey(hardnessMap,key))
        hardnessMap(key) = hardnessMap(key) + 1;
    else
        hardnessMap(key) = 1;
    end
end

% get hardness tag
hardnessTag = 'Hardness of the done tasks =';
k = keys(hardnessMap);
val = values(hardnessMap);
for i = 1:length(hardnessMap)
    hardnessTag = append(hardnessTag, ' ', k{i}, ':', num2str(val{i}));
end

transition.new_color = {'Sprint Planning Completed', doneSprintTasksTag, failedCodeReviewsTag, foundBugsTag, delaysTag, hardnessTag};
transition.override = 1;
fire = 1;
end