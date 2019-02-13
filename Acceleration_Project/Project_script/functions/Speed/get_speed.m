function [speed] = get_speed(vx,vy,vz)
%GET_SPEED Inputs the veocity of x,y,z anfd outputs the vector sum
%   Input velocity of x,y,z 
% output a vector of the calculated spered 


for i = 1:length(vx)
    speed(i) = sqrt(vx(i).^2 + vy(i).^2 + vz(i).^2);
end

