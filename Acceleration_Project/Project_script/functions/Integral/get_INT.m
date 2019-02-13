function [f_int] = get_INT(t,f)
%INTEGRAL Return total Area under the curve and array of each delta t 

%   Takes t input time and f input as f(t) 
% outputs the area under the curve of f(t) 


A_sum = 0;
for i = 1:length(t)-1 
    f_int(i) = A_sum + (f(i) + f(i+1))/2*(t(i+1) - t(i));
    A_sum = f_int(i);
end
end


