function [fire, trans] = MOD_Support_PRE(trans)
% Modular pre processor of the Support Team Module

switch trans.name
    case 'tMaintenanceTasksGenerator'
        disp(['Support team has started generating a ticket for the Dev. Team at ', num2str(current_time)]);
    otherwise
        % just display time and name of enabled transition
        disp([trans.name ' is starting to fire at ', num2str(current_time)]);
end
fire = 1;
end