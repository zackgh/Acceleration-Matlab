%% File name main_script.m
% ENGR 104
% April 19, 2018
% Zack Ghalayini, Gavin Andrew, Sean Gainey, Sam Herseg

close all
clear
clc

%% Outline
% The purpose of this script is to integrate acceleration data on the x,y,z
% axis into velocity and positon vectors and subplot acc,vel,pos with
% respective x,y,z data against time in Figure(1). Figure(2) will be a 3d
% animation plot of position. Figure(3) will be a plot of the vector sum of
% velocity in the x,y,z position. Figure(4) will be a static 3d plot of
% position.

%% Requirments
% Data must be in .csv format and not have headers. Time, AccX,AccX,AccZ
% should be same length. This script acceses the functions get_speed() and
% get_INT().


%% Presentation Data

%%% Galaxy Phone Still %%%
% data = csvread('Still_test_galaxy_still.csv');

%%% iphone still %%%
% data = csvread('Still_test_iphone.csv');

%%% X Y Z Long Board on Ramp test %%%
data = csvread('X_buttonsBack_screenUP.csv');
% data = csvread('Y_foreward.csv');
% data = csvread('Z_screenFW.csv');

%%% Bike drop %%%
% data = csvread('Bike_drop.csv');

%%% Backflip %%%
% data = csvread('Backflip.csv');
%% Plot Acceleration

%  clean up data

data = smoothdata(data);

t = data(:,1);
ax = data(:,2);
ay = data(:,3);
az = data(:,4);

N = 5;
Wn = .01;
[B,A] = butter(N,Wn,'high');
ax = filter(B,A,ax);
ay = filter(B,A,ay);
az = filter(B,A,az);

% Manage line width
l = .75;

% Plot Acceleration
figure(1)
clf
subplot(3,1,1)
hold on
box on

plot(t,ax,'k','LineWidth',l);
plot(t,ay,'r','LineWidth',l);
plot(t,az,'g','LineWidth',l);
xlim([0 t(end)])

title('Acceleration vs time')
legend('Acceleration X','Acceleration Y','Acceleration Z')
xlabel('Time in seconds')
xlim([0 t(end)])
ylim('auto')

%% Plot Velocity

vx = get_INT(t,ax);
vy = get_INT(t,ay);
vz = get_INT(t,az);
t(end) = []; % makes t same size as other vector

speed = get_speed(vx,vy,vz);

subplot(3,1,2)
hold on
box on

plot(t,vx,'k','LineWidth',l);
plot(t,vy,'r','LineWidth',l);
plot(t,vz,'g','LineWidth',l);
xlim([0 t(end)])

title('Velocity vs time')
legend('Velocity X','Velocity Y','Velocity Z')
xlabel('Time in seconds')
ylim('auto')

%% Plot Position

px = get_INT(t,vx);
py = get_INT(t,vy);
pz = get_INT(t,vz);
t(end) = []; % makes t same size as other vector

subplot(3,1,3)
hold on
box on

plot(t,px,'k','LineWidth',l);
plot(t,py,'r','LineWidth',l);
plot(t,pz,'g','LineWidth',l);
xlim([0 t(end)])

title('Position vs time')
legend('Position X','Position Y','Position Z')
xlabel('Time in seconds')
ylim('auto')

%%% Cool Animation of Position 3d graph %%%
figure(2)
clf
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 1:length(t)                             %
    plot3(px(i),py(i),pz(i),'O','LineWidth',2); %
    hold on                                     %
    pause(.05)                                  %
end                                             %
title('Posistion')                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Plot Speed
figure(3)
clf
hold on
box on
plot(speed);
title('Speed')

% Plot postiion
figure(4)
clf
hold on
grid on

plot3(px,py,pz)
xlabel('X axis')
ylabel('Y axis')
zlabel('Z axis')
