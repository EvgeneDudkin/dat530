function [] = MOD_Support_POST(trans)
% Modular post processor of the Support Team Module

switch trans.name
    case 'tMaintenanceTasksGenerator'
        disp(['Support team has created a ticket for the Dev. Team at ', num2str(current_time)]);
    otherwise
        % just display completion time and transition name
        disp([trans.name ' completed firing at ', num2str(current_time)]);
end

