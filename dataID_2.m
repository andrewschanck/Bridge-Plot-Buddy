function data = dataID_2(datafile)
% function data = dataID_2(datafile)

% This function takes the path to data recorded during a bridge test
% (datafile), extracts strain data, and "zeros" it. This is accomplished by
% shifting the entire data series up or down such that the first value is 
% zero, and then by shifting each value by a linear factor such that the
% last data entry also is zero. 

% Andrew Schanck - 10/12/2016 - Pjt 1332/1414

%%
% Open the file and initialize contorl flags
fid = fopen(datafile);
stopper = 'not yet';
ii = 1;

%Copy the datafile from its beginning to end 
while ischar(stopper)
    stopper = fgetl(fid);
    if ischar(stopper)
        datfile{ii,1} = stopper;
    end
    ii = ii+1;
end

% Initialize more control parameters
stillgood = 1;
ii = 22;
data = [];

% Copy the actual data (Numerical values starting at row 22)
while stillgood == 1
    c = textscan(datfile{ii,1},'%f','Delimiter',',');
    if ~isempty(c{1,1})
        data = [data,c{1}];
    else
        stillgood = 0;
    end
    ii = ii+1;
end

%%
% Rearange data
data = data';

% Copy the first and last lines of data
zeroer = data(1,:);
ender = data(end,:);

% Zero the data
for ii = 1:size(data,1)
        data(ii,:) = data(ii,:)-zeroer-(ender-zeroer)*(ii-1)...
            /((size(data,1)-1));
end