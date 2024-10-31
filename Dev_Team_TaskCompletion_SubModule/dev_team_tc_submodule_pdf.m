% PDF for Development Team Tasks Completion Sub. Module
function [png] = dev_team_tc_submodule_pdf()

% Name of the Module
png.PN_name = 'DevSubModule2';

% set of places
png.set_of_Ps = {'pTaskTested', 'pDone', 'pReadyForTest'};

% set of transitions
png.set_of_Ts = {'tJuniorBugFix', 'tMiddleBugFix', 'tConsultantBugFix', 'tTechLeadBugFix', 'tToDoneState', ...
    'tDevTestIn', 'tDevTestOut', 'tReadyForTest'};

%set of arcs
png.set_of_As = {'tReadyForTest', 'pReadyForTest', 1, 'pReadyForTest', 'tDevTestOut', 1, ...
    'pTaskTested', 'tJuniorBugFix', 1, 'tJuniorBugFix', 'pReadyForTest', 1, ...
    'pTaskTested', 'tMiddleBugFix', 1, 'tMiddleBugFix', 'pReadyForTest', 1, ...
    'pTaskTested', 'tConsultantBugFix', 1, 'tConsultantBugFix', 'pReadyForTest', 1, ...
    'pTaskTested', 'tTechLeadBugFix', 1, 'tTechLeadBugFix', 'pReadyForTest', 1, ...
    'tDevTestIn', 'pTaskTested', 1, 'pTaskTested', 'tToDoneState', 1, 'tToDoneState', 'pDone', 1 };

% input/output ports
png.set_of_Ports = {'tDevTestIn', 'tDevTestOut', 'tReadyForTest'};
end

