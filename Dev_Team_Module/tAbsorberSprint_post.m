function [transition] = tAbsorberSprint_post(transition)
global global_info;
% set/reset statistical data
global_info.done_task_counter = ntokens('pDone');
global_info.code_review_fail_counter = 0;
global_info.found_bugs_counter = 0;
global_info.last_sprint_time = current_time;

% display the time of the completion of the planning
disp(['Sprint Planning has finished at time = ', num2str(current_time)]);
end
