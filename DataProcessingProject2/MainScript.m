% MAINSCRIPT 
% 
% This program code runs the main script (main menu) for analysis of
% household electricity consumption.
% The program code generates a main menu with 5 menu items (using two
% functions: displayMenu and inputNumber).
% Before the program can analyse household electricity consumption, a data
% file must be imported (using function: load_measurements). Each line of
% the data file must consist of 10 columns is this order: Year, Month, Day,
% Hour, Minute, Seconds, Zone1, Zone2, Zone3, Zone4.
% During import of data the program will handle corrupted measurements
% according to user input, and affected rows will be save in
% CorruptMeasurements.txt in program folder.
% The valid imported measurements will be split up into two matrices:
% - An N × 6 matrix where each row is a time vector.
% - An N × 4 matrix where each row is a set of measurements.
%
% Sub-program files needed to run this program:
% - displayMenu (function) needs the variable 'menuItems' from MainScript
% - inputNumber (function) needs the variable 'choice' from displayMenu function
% - load_measurements (function) needs the variables 'path' and 'filename'
% - 
% - 
% -
% - 
% - dialogBoxes (function) needs a switch-case value
%
% Files created while running the program code:
% - Data.mat ()
% - CorrupMeasurements.txt ()
%
% Varibles created and used while running the program code:
% - menuItems
% - choice
% - filename
% - path
% - listFmode
% - figFmode
% - fmode
% - tvec
% - data
%
% Author: Johnnie Hundrup, s203983
%
% Co-authors: Erlend André Hall, s202055
%             Ekaterina Wyss Storm, s163627
%
% Originally author: Mikkel N. Schmidt, 2015
% 

%% Clear Workspace and Command Window
clear all
if isfile('CorruptMeasurements.txt') 
    delete 'CorruptMeasurements.txt'
end
clc

% Delete old program files
if isfile('Data.mat')
    delete Data.mat
end

% Define and display menu items
menuItems = {'Load data', 'Aggregate data', 'Display statistics', 'Visualize electricity consumption', 'Quit'};

% Define empty filename variable
filename = '';

% Define status of aggregation
global AggregateData
AggregateData = 0;

%% Creating and controlling menu selection
while true
%Clear Command Window
clc
    
%Display welcome and help
if ~isfile('Data.mat')
    dialogBoxes('Introduction');
%else
%    dialogBoxes('LoadedData');
end

% Display menu options and ask user to choose a menu item
fprintf('<strong>ANALYSIS OF HOUSEHOLD ELECTRICITY CONSUMPTION</strong>\n\n')
fprintf('<strong>       MAIN MENU</strong>\n')
fprintf('<strong>-----------------------</strong>\n')
choice = displayMenu(menuItems);

% ------------------------------------------------------------------
% Menu item 1. Load data
if choice == 1
    
    %Clear Command Window
    clc
    
    %Open Windows 'open file'-window
    [filename,path] = uigetfile('*.csv');
    
    if (isequal(filename,0))
        %Display AbortLoadData message
        dialogBoxes('AbortLoadData');
    elseif size(table2array(readtable(filename)),2)~=10
        dialogBoxes('WrongDimension')
            
    else
        
        %Clear Command Window and import selected data file
        clc

        %Dialogmenu for selecting fmode
        listFmode = {'Forward fill','Backward fill','Drop'};
        figFmode = listdlg('PromptString',{'Choose how to handle corrupted measurements:',''...
            'Forward fill',...
            'Replaces corrupted measurements with lastest valid measurement.',...
            'If the first row contains a corrupted measurement then Forward fill is changed to Drop!',''...
            'Backward fill',...
            'Replaces corrupted measurements with next valid measurement.',...
            'If the last row contains a corrupted measurement then Backward fill is changed to Drop!',''...
            'Drop',...
            'Deletes corrupted measurements',''}...
            ,'SelectionMode','single','ListSize',[500,150],'ListString',listFmode, 'Name','Handling corrupted measurements');
        if figFmode == 1
            fmode = 'forward fill';
        elseif figFmode == 2
            fmode = 'backward fill';
        elseif figFmode == 3
            fmode = 'drop';
        else
            fmode = 0;
        end
        
        if fmode == 0
            %Display MissingFmode message
            dialogBoxes('MissingFmode')
        else
            [tvec, data] = load_measurements(fullfile(path,filename), fmode);
            
            %Create a 'No aggregation' tvec and data matrices
            period = 'Consumption per minute (no aggregation)';
            timescale = 'minutes';
            global TimeScale
            TimeScale = timescale;
            tvec_a = tvec;
            data_a = data;
                        
            %Create a file 'Data.mat' which contain the validated loaded data in Zone1-4
            save Data data;     
        end
    end

% ------------------------------------------------------------------
% Menu item 2. Aggregate data
elseif choice == 2

    %Clear Command Window
    clc
        
    % No data loaded
    if ~isfile('Data.mat')
        
        % Display NoData message
        dialogBoxes('MissingData');
    else
        listAggregateData = {'Consumption per minute (no aggregation)','Consumption per hour','Consumption per day','Consumption per month','Hour-of-day consumption (hourly average)'};
        figAggregateData = listdlg('PromptString',{'Choose how to aggregate data:',''...
            'Consumption per minute (no aggregation)',...
            'shows all the EL consumtion each minute (Original file).',''...
            'Consumption per hour',...
            'shows the average EL consumtion each hour.',''...
            'Consumption per day',...
            'shows all the EL consumtion each day.',''...
            'Consumption per month',...
            'shows all the EL consumtion each month.',''...
            'Hour-of-day consumption (hourly average)',...
            'shows the average EL time-of-day consumption (hourly).',''}...
            ,'SelectionMode','single','ListSize',[500,150],'ListString',listAggregateData, 'Name','Data aggregation method');
           
        if figAggregateData == 2
            period = 'Consumption per hour';
            timescale = 'hourly';
        elseif figAggregateData == 3
            period = 'Consumption per day';
            timescale = 'daily';
        elseif figAggregateData == 4
            period = 'Consumption per month';
            timescale = 'monthly';
        elseif figAggregateData == 5
            period = 'Hour-of-day consumption (hourly average)';
            timescale = 'hourly average';
        elseif figAggregateData == 1
            period = 'Consumption per minute (no aggregation)';
            timescale = 'minutes';
        else
            figAggregateData = 0
        end

        if figAggregateData == 0
            closereq();
        else            
            % Set AggregateData to be true
            AggregateData = 1;
            
            % Call function to aggregate measurements
            [tvec_a, data_a] = aggregate_measurements(tvec, data, period);
            
            %
            global TimeScale
            TimeScale = timescale;
            global AggregateRows
            AggregateRows = size(data_a,1);
        end
    end
            
% ------------------------------------------------------------------
% Menu item 3. Display statistics
elseif choice == 3
    
    %Clear Command Window
    clc
        
    % No data loaded
    if ~isfile('Data.mat')
        
        % Display NoData message
        dialogBoxes('MissingData');
    else          
        % Display statistics
        print_statistics(tvec, data);
        
        %Display statistics message
        dialogBoxes('DisplayStatistics');
        
    end

% ------------------------------------------------------------------
% Menu item 4. Generate plots
elseif choice == 4
    
    %Clear Command Window
    clc
        
    % No data loaded?
    if ~isfile('Data.mat')
        
        % Display NoData message
        dialogBoxes('MissingData');
    else
        % Visualize electricity consumption
        listPlot = {'Combined plot','Consumption measured per zone'};
        figPlot = listdlg('PromptString',{'Choose how to visualise your data:',''...
            'Combined plot',...
            'Plot electricity consumption for all 4 zones in a single plot.',''...
            'Consumption per zone plot',...
            'Plot electricity consumption for each zone separately.',''}...
            ,'SelectionMode','single','ListSize',[500,150],'ListString',listPlot, 'Name','Visualize household electricity consumption');
        if figPlot==1 %combined plot
            if size(data_a,1) < 25
                   barPlot(data_a, timescale);
            else
                CombPlot(tvec_a, data_a, timescale);
            end 
        elseif figPlot==2 %per zone plot
               if size(data_a,1) < 25
                   barPlot_perZone(data_a, timescale);
               else
                   consumptionZonePlot(tvec_a, data_a, timescale);
               end            
        else
            closereq();          
        end
            
        % Display Plots message
        dialogBoxes('Plots');
    end

% ------------------------------------------------------------------
% Menu item 5. Quit
elseif choice == 5
    
    % Clear Workspace, Command Window and plot figures
    %close all %Close all figures and boxes
    %clear all %Clear Workspace (delete all varibles)
    %clc %Clear Command Window
    %if isfile('Data.mat')
    %    delete Data.mat
    %end
    
    %Display QuitProgram message
    dialogBoxes('QuitProgram');
        
    break
end
end
    