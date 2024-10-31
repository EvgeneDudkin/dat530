% This function initializes the simulation environment for the Agile Development system
% It sets up the global variables, the Petri net structure and the initial dynamics of the system.
% It then runs the simulation and plots the results

clear all; % clears all variables in the workspace
clc; % clears the command window
global global_info % declares a global variable

addpath("QA_Team_Module\"); % add QA Team Module
addpath("PM_Team_Module\"); % add PM Team Module
addpath("Support_Team_Module\") % add Support Team Module
addpath("Dev_Team_Module\") % add Development Team Module
addpath("Dev_Team_FeatureDevelopment_SubModule"); % add Development Team Feature Development Sub. Module
addpath("Dev_Team_TaskCompletion_SubModule"); % add Development Team Task Completion Sub. Module
addpath("IMC\") % add IMC

% initializes the global variables
global_info.STOP_AT = 50; % 10 weeks
global_info.sprint_firing_times = [0 15 30 45]; % 3 weeks sprint (15 working days)

global_info.jun_available_capacity = 15; % 15 days initially available for Junior Developer
global_info.jun_codereview_fail_p = 0.45; % probability of failed code review for Junior Developer
global_info.jun_bug_p = 0.5; % probability of bug existence in the Junior Developer's code
global_info.mid_available_capacity = 15; % 15 days initially available for Middle Developer
global_info.mid_codereview_fail_p = 0.3; % probability of failed code review for Middle Developer
global_info.mid_bug_p = 0.3; % probability of bug existence in the Middle Developer's code
global_info.is_consultant_available = 1; % flag to define whether Consultant Developer is part of the team
global_info.consultant_available_capacity = 15; % 15 days initially available for Consultant Developer
global_info.consultant_codereview_fail_p = 0.25; % probability of failed code review for Consultant Developer
global_info.consultant_bug_p = 0.25; % probability of bug existence in the Consultant Developer's code
global_info.tl_available_capacity = 7; % 7 of 15 days initially available for Tech Lead
global_info.tl_bug_p = 0.25; % probability of bug existence in the Tech Lead's code

% statistical data
global_info.done_task_counter = 0; % Number of 'Done' tasks
global_info.code_review_fail_counter = 0; % Number of failed code reviews during sprint
global_info.found_bugs_counter = 0; % Number of found bugs during sprint
global_info.last_sprint_time = 0; % Finish time of the last spring

% global_info.DELTA_TIME = 1;
% creates the Petri net structure
pns = pnstruct({'dev_team_pdf', 'dev_team_fd_submodule_pdf', 'dev_team_tc_submodule_pdf', ...
    'support_team_pdf', 'project_management_team_pdf', 'qa_team_pdf', 'imc_pdf'});

% sets the initial dynamics of the system
% 10 + 2*randn(1) | normally distributed with mean 10 and standard deviation 2
dynamic.m0 = {'pBacklog', 100, 'pSideTaskAssignments', 1};
dynamic.ft = { 'tJuniorWork', 1, 'tMiddleWork', 1, 'tConsultantWork', 1,  'tTechLeadWork', 1, ...
    'tJuniorCodeFix', 1/2, 'tMiddleCodeFix', 1/4, 'tConsultantCodeFix', 1/8, 'tTechLeadCodeFix', 1/8, ...
    'tJuniorBugFix', 1, 'tMiddleBugFix', 1/2, 'tConsultantBugFix', 1/4, 'tTechLeadBugFix', 1/4, ...
    'tCodeReview', 1/10, ...
    'tMaintenanceTasksGenerator', '2 + 0.5*randn(1)', 'tMTProcessor', '1 + 0.25*randn(1)', ...
    'tTester1', '0.5 + 0.25*randn(1)', 'tTester2', '1 + 0.5*randn(1)', ...
    'allothers', 1/100};
dynamic.ip = { 'tTasksAssignment', 1, 'tToCommittedState', 1, 'tSideTasksAssignment', 1, ...
    'tJuniorCodeFix', 1, 'tMiddleCodeFix', 1, 'tConsultantCodeFix', 1, 'tTechLeadCodeFix', 1, ...
    'tJuniorBugFix', 2, 'tMiddleBugFix', 2, 'tConsultantBugFix', 2, 'tTechLeadBugFix', 2, ...
    'tMTProcessor', 3};
dynamic.re = {'JuniorDeveloper', 1, inf, 'MiddleDeveloper', 1, inf, ...
    'TeamLeadDeveloper', 1, inf, 'TechLeadDeveloper', 1, inf, 'ConsultantDeveloper', 1, inf, ...
    'Tester1', 1, inf, 'Tester2', 1, inf};

% initializes the dynamics of the Petri net
pni = initialdynamics(pns, dynamic);

% runs the simulation
sim = gpensim(pni);

% Create a 2 x1 tiled layout
tiledlayout (2,1);

%prnss(sim); % print the simulation results
% Plot Dev. Team places
nexttile;
plotp(sim, {'pDone'});

% Plot Support Team places
nexttile;
plotp(sim, {'pResponses'});

% plots the Gantt Chart, showing how the resources were used
plotGC(sim);

% prints the final colors of the Petri net
prnfinalcolors(sim);