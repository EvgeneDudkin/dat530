function [] = tJuniorWork_post(transition)

% increase capacity
% global global_info;
% if global_info.jun_available_capacity < 12
%     global_info.jun_available_capacity = jun_available_capacity + 1;
% end
% release all resources used by transition
release();
end