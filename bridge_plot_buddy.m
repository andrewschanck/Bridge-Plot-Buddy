function bridge_plot_buddy(input_package)

% This function is meant to aid in the expediant creation of plots for the
% 2016 Maine DOT Slab-On_Girder test data. To use this function, complete
% the creation of an input package (by filling out and running the
% accompanying script, "input_packager") and use it as this function's 
% input argument. This function may be changes to include any further
% analysis steps.

% Andrew Schanck - 10/12/2016 - Pjt 1332/1414

%%
% Unpack the input package
datafile = input_package.Datafile;
sensors = input_package.Sensors;
sensorlist = input_package.Sensor_List;
analysis = input_package.Analysis;
sensorlayout = input_package.Sensor_Layout;
bnum = input_package.Bridge_Number;
tnum = input_package.Trucks;
lnum = input_package.Lanes;
tstnum = input_package.Test;
t_desired = input_package.Marked_Times;
events = input_package.Test_Events;

%%
% Zero the data
data = dataID_2(datafile);

%Perform a linear simplification on the data if it is called for
if strcmp(analysis,'zero')
elseif strcmp(analysis,'linear')
%     data = linear_aprx_2(sensorlist,data,sensorlayout);
end

%%
% Create a time vector the length of the data (e.g. with a sampling
% interval of 0.1s)
t = 1:size(data,1);

% Open a figure and initialize plotting parameters
figure
hold on
maxval = 0;
minval = 0;
titlestr = '';
leg = {};
% For each sensor specified to investigate
for ii = 1:length(sensors)
%     Find the data that matches the sensor
    ind = find(strcmp(sensors{ii},sensorlist));
%     Insert the name of the sensor into the title and legend
    titlestr = [titlestr, sensors{ii} ' '];
    leg = [leg,sensors{ii}];
%     Mark to maximum and minimum points of the data is they are higer or
%     lower than the previous maximum and minimum respectively
    if max(data(:,ind)) > maxval
        maxval = max(data(:,ind));
    end
    if min(data(:,ind)) < minval
        minval = min(data(:,ind));
    end
%     Plot the sensor data
    plot(t,data(:,ind))
end
% Finialize the title's text
tstring = sprintf(...
    'Strain History: Bridge %i, %i Trucks, %i Lane, Test %i, Sensor %s',...
    bnum,tnum,lnum,tstnum,titlestr);
% If marking data events (e.g. 0.5d, 1.0d, Max Moment, etc.)
if ~isempty(t_desired)
    for ii = 1:length(t_desired)
%         Draw a pseudo-vertical line on the plot
        t = t_desired(ii)*[1,1.00000000000001];
        y = [minval,maxval];
        plot(t,y,'k- ')
%         Label the event
        text(t_desired(ii),minval-3,events(ii))
    end
end
% Make the plot usable
title(tstring)
xlabel('Time  (s*10^-^1)')
ylabel('Microstrain')
legend(leg)
hold off