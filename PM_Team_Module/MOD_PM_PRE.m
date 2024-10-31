function [fire, trans] = MOD_PM_PRE(trans)
% Modular pre processor of the Project Management Team Module
global global_info;
switch trans.name
    case 'tInitSprint'

        % if the variable "sprint_firing_times" is empty, then all the firings are done; no more firing
        if isempty(global_info.sprint_firing_times)
            fire = 0;
            return
        end

        time_to_generate_token = global_info.sprint_firing_times(1);
        ctime = current_time();
        % too early to fire?
        if lt(ctime, time_to_generate_token)  % it is not the time to fire
            fire = 0; return
        end

        % time to fire
        if ge(length(global_info.sprint_firing_times),2)
            global_info.sprint_firing_times = global_info.sprint_firing_times(2:end);
        else
            global_info.sprint_firing_times = [];
        end

    otherwise
        % just display time and name of enabled transition
        disp([trans.name ' is starting to fire at ', num2str(current_time)]);
end
fire = 1;
end