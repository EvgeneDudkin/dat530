function [result] = getTestingResult(devEntity)
global global_info;

p = unifrnd(0, 1); % random number between 0 and 1 to calculate probability of a bug
testsPassed = 1;

if (strcmp(devEntity,'Junior'))
    testsPassed = p > global_info.jun_bug_p;
elseif (strcmp(devEntity,'Middle'))
    testsPassed = p > global_info.mid_bug_p;
elseif (strcmp(devEntity,'Consultant'))
    testsPassed = p > global_info.consultant_bug_p;
elseif (strcmp(devEntity,'TechLead'))
    testsPassed = p > global_info.tl_bug_p;
end

strStatus = 'NoBugsFound';
if ( not(testsPassed) )
    strStatus = 'BugFixNeeded';
end
result = strStatus;
end