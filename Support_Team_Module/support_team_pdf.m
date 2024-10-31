% PDF for Support Team Module
function [png] = support_team_pdf()
png.PN_name = 'Support'; % Name of the Module
png.set_of_Ps = {'pMTBuffer', 'pResponses'}; % set of places
png.set_of_Ts = {'tMaintenanceTasksGenerator', 'tSTeamOut', 'tSTeamIn'}; % set of transitions

%set of arcs
png.set_of_As = {'tMaintenanceTasksGenerator', 'pMTBuffer', 1, 'pMTBuffer', 'tSTeamOut', 1, ...
    'tSTeamIn', 'pResponses', 1};

% input/output ports
png.set_of_Ports = {'tSTeamIn', 'tSTeamOut'};
end