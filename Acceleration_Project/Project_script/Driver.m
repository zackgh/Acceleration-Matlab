%% Speed function driver
% Test file for function get_speed
% Zack Ghalayini 
% March 28, 2018 

clear 
clc
% Driver script for get_speed() function 

% Test 
ax = (1:100);
ay = (1:100);
az = (1:100);
y = get_speed(ax,ay,az)

figure(1)
clf
plot(length(ax),y)

%% Integrel function driver
% Zack Ghalayini 
% ENGR 104
% March 26, 2018 

clear 
clc 

% Used to test integral function 
% get_INT(t,y)  
% both have same lengths 


% test integral function
x = linspace(-10,10);
y = ones(size(x)); %x.^2



figure(2)
clf
grid on 
box on 
hold on 
plot(x,y,'b-')

int1 = get_INT(x,y)

% % % figure(1)
% % % clf
% % % grid on 
% % % hold on 

x(end) = [];
plot(x,int1,'r-')
sum(int1)
