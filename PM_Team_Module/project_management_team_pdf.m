% PDF for Project Management Team Module
function [png] = project_management_team_pdf()
png.PN_name = 'PM'; % Name of the Module
png.set_of_Ps = {'pPO_PlanSprint', 'pPO_SprintResult'}; % set of places
png.set_of_Ts = {'tInitSprint', 'tPMOut', 'tPMIn'}; % set of transitions

%set of arcs
png.set_of_As = {'tInitSprint', 'pPO_PlanSprint', 1, 'pPO_PlanSprint', 'tPMOut', 1, ...
    'tPMIn', 'pPO_SprintResult', 1};

% input/output ports
png.set_of_Ports = {'tPMIn', 'tPMOut'};
end