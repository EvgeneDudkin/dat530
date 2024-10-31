function [] = tTester2_post(transition)

disp(['Tester2 has finished testing at time = ', num2str(current_time)]);

% release all resources used by transition
release();

end