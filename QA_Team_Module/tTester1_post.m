function [] = tTester1_post(transition)

disp(['Tester1 has finished testing at time = ', num2str(current_time)]);

% release all resources used by transition
release();

end