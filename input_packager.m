% This script creates an input structure for the function
% "bridge_plot_buddy", which is meant to expedite the process of parameter
% entry.

% Andrew Schanck - 10/12/2016 - Pjt 1332/1414

input_package = struct;

%Copy the path to the .dat file of the given test
input_package.Datafile = ...
    'C:\Users\andrew.schanck\Desktop\Waltham\two-side-by-side_2.dat';

%Type the names of the desired sensors as strings separated by commas
input_package.Sensors = {'B3058','B3057'};

% Copy the list of sensors, in the order in which they appear in the .dat
% file
input_package.Sensor_List = {'B3058','B3057','B3056','B3055','B3071',...
    'B3072','B3060','B3059','B3061','B3069','B3074','B3073','B3065',...
    'B3064','B3063','B3062','LV4521','B3076','B3075','B3811','LV4523',...
    'B3068','B3067','B3066'};

% Indicate the desired typy of analysis to perform. Type as a string "zero"
% to use zeroed data, or "linear" for data that uses linearization
% assumptions
input_package.Analysis = 'linear';

% Copy the sensor layout as a cell array of strings. Spots without sensors
% recieve an empty cell (e.g. "[]"). The order is (Arranged from girder 1 
% to 5): 

% Column 1: Left Hand Bottom Sensors
% Column 2: Mid-Span Bottom Sensors
% Column 3: Mid-Span Middle Sensors
% Column 4: Mid-Span Top Sensors
% Column 5: Right Hand Bottom Sensors
% Column 6: Right Hand Middle Sensors
% Column 7: Right Hand Top Sensors
input_package.Sensor_Layout = {...
    'B3071','B3057','B3056','B3055','B3066',[],'B3067';...
    'B3059','B3060',[],'B3058','B3062',[],[];...
    'B3073','B3074',[],'B3072','B3076','B3075','B3811';...
    [],'B3062','B3061','B3069',[],[],[];...
    [],'B3065','B3064','B3063',[],[],[]};

% Type the bridge number
input_package.Bridge_Number = 3238;

% Type the number of trucks used in the test
input_package.Trucks = 2;

% Type the number of lanes used in the test
input_package.Lanes = 2;

% Type the test number (1,2,...)
input_package.Test = 1;

% Type the time indices of test events (0.5d, 1.0d, Max Moment, etc.)
input_package.Marked_Times = [1000,2000];

% Type the names of the test events
input_package.Test_Events = {'0.5d','1.0d'};