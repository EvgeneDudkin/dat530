% PDF for QA Team Module
function [png] = qa_team_pdf()
png.PN_name = 'QA'; % Name of the Module
png.set_of_Ps = {'pToBeTested', 'pTested'}; % set of places
png.set_of_Ts = {'tTester1', 'tTester2', 'tQaIn', 'tQaOut'}; % set of transitions

%set of arcs
png.set_of_As = {'tQaIn', 'pToBeTested', 1, 'pToBeTested', 'tTester1', 1, ...
    'pToBeTested', 'tTester2', 1, 'tTester1', 'pTested', 1, 'tTester2', 'pTested', 1, ...
    'pTested', 'tQaOut', 1};

% input/output ports
png.set_of_Ports = {'tQaIn', 'tQaOut'};
end