function [taskDifficulty, daysOfWork] = getNextTaskDifficulty(capacity)
index = 3;
difficultySet = {'Easy', 'Moderate', 'Difficult'};
daysOfWorkSet = [1 3 5];
problemsHardnessMap = containers.Map(difficultySet, daysOfWorkSet);
% pick the max. difficulty for the problem based on developer's capacity
if capacity < problemsHardnessMap('Moderate')
    index = 1;
elseif capacity < problemsHardnessMap('Difficult')
    index = 2;
end

% pick random available difficulty for the task
randomIndex = randi([1 index], 1, 1);
taskDifficulty = difficultySet{randomIndex};
daysOfWork = problemsHardnessMap(taskDifficulty);
end