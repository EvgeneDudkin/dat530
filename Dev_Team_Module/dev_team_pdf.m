% PDF for Development Team Module
function [png] = dev_team_pdf()

% Name of the Module
png.PN_name = 'DevTeam';

% set of places
png.set_of_Ps = { 'pMaintenanceTasks', 'pMTProcessed', 'pMTAnswerBuffer', 'pBacklog', ...
    'pSprintBuffer', 'pSprintPlanComplete',  ...
    'pSideTaskAssignments', 'pToBeDone'};

% set of transitions
png.set_of_Ts = {'tMTProcessor','tMTForBackLog', 'tMTAnswered', ...
    'tTasksAssignment', 'tAbsorberSprint', 'tSideTasksAssignment', ...
    'tDevRequests', 'tDevResponses', 'tDevInitSprint', 'tDevOutSprint', 'tDevTasksAssigned'};

%set of arcs
png.set_of_As = {
    'tDevRequests', 'pMaintenanceTasks', 1, 'pMaintenanceTasks', 'tMTProcessor', 1, 'tMTProcessor', 'pMTProcessed', 1, ...
    'pMTProcessed', 'tMTForBackLog', 1, 'tMTForBackLog', 'pBacklog', 1, 'tMTForBackLog', 'pMTAnswerBuffer', 1, ...
    'pMTProcessed', 'tMTAnswered', 1, 'tMTAnswered', 'pMTAnswerBuffer', 1, 'pMTAnswerBuffer', 'tDevResponses', 1, ...
    'tDevInitSprint', 'pSprintBuffer', 1,'pSprintBuffer', 'tAbsorberSprint', 1, ...
    'tAbsorberSprint', 'pSprintPlanComplete', 1, 'pSprintPlanComplete', 'tDevOutSprint', 1, ...
    'pSprintBuffer', 'tTasksAssignment', 1, 'tTasksAssignment', 'pSprintBuffer', 1, ...
    'pBacklog', 'tTasksAssignment', 1, 'tTasksAssignment', 'pToBeDone', 1, ...
    'pSideTaskAssignments', 'tSideTasksAssignment', 1, 'tSideTasksAssignment', 'pSideTaskAssignments', 1, ...
    'pBacklog', 'tSideTasksAssignment', 1, 'tSideTasksAssignment', 'pToBeDone', 1, ...
    'pToBeDone', 'tDevTasksAssigned', 1 };

% input/output ports
png.set_of_Ports = {'tDevRequests', 'tDevResponses', 'tDevInitSprint', 'tDevOutSprint', 'tDevTasksAssigned'};
end
