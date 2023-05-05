% MAINSCRIPT 
%
% "Bacteria Data Analyses" program description: 
% The purpose of this program is to help a user to load, filter, calculate statistics, 
% generate plots for the data related to different types of bacteria, it’s growth rate and 
% temperature.  
% 
% Sub-program files needed to run this program:
% - displayMenu (function) 1st Main menu (no data) - needs the variable 'menuItems' from MainScript
% - displayMenuData (function) 2nd Main menu (Data, no filter) - needs the variable 'menuItems' from MainScript
% - displayMenuDataFilter (function) 3rd Main menu (Data, active filter) - needs the variable 'menuItems' from MainScript
% - inputNumber (function) needs the variable 'choice' from displayMenu function
% - slider (function) ...
% - slider (figure) ...
% - dialogBoxes (function) needs a switch-case value
% - dataLoad (function) needs the variables 'path' and 'filename'
% - dataStatistics (function) needs the variables 'data' and 'statistic'
% - dataPlot (function) needs the variable 'data'
% 
% Output A LoadErrors.txt file is created if there is import errors, so the
%        user can look thru those import errors after running the program.
%
% Author: Johnnie Hundrup, s203983
%
% Co-authors: Erlend André Hall, s202055
%             Ekaterina Wyss Storm, s163627
%
% Originally author: Mikkel N. Schmidt, 2015
% 

%% Clear Command Window, and that old files isn't in folder
clear all
if isfile('LoadErrors.txt') 
    delete 'LoadErrors.txt'
end
if isfile('RestoreData.mat')
    delete 'RestoreData.mat'
end
if isfile('FilteredData.mat')
    delete 'FilteredData.mat'
end
if isfile('ImportFilter.mat')
    delete 'ImportFilter.mat'
end
if isfile('ActivatedFilters.mat')
    delete 'ActivatedFilters.mat'
end
clc

% Define and display menu items
menuItems = {'Load data', 'Filter data', 'Display statistics', 'Generate plots', 'Quit'};

% Define empty filename variable
filename = '';

% Set WorkedData to be false
WorkedData = 0;

% Set ActiveFilter to be false and create importFilter.mat and ActivatedFilter.mat with import value settings 
ActiveFilter = 0;
importFilter = [10 60 0 1;0 0 0 0];
ActiveFilters = importFilter;
save ImportFilter importFilter
save ActivatedFilters importFilter

%% Creating and controlling menu selection
while true
    
%Display welcome and help
if ~isfile('RestoreData.mat')
    dialogBoxes('Introduction');
elseif WorkedData == 0
    dialogBoxes('LoadedData');
end

% Display menu options and ask user to choose a menu item
fprintf('<strong>       MAIN MENU</strong>\n')
fprintf('<strong>-----------------------</strong>\n')
if ~isfile('RestoreData.mat')
        choice = displayMenu(menuItems);
else
    if ActiveFilter == 0
        choice = displayMenuData(menuItems);
    else
        choice = displayMenuDataFilter(menuItems);
    end
end

% ------------------------------------------------------------------
    % Menu item 1. Load data
    if choice == 1
        %Clear Command Window
        clc
        
        %Open Windows 'open file'-window
        [filename,path] = uigetfile('*.*');
        
        if isequal(filename,0)
            %Display AbortLoadData message
            dialogBoxes('AbortLoadData');
        else
            %Clear Command Window and import selected data file
            clc
            data = dataLoad(fullfile(path,filename));
            
            %Set variabel restoreData to validated loaded data
            save RestoreData data;
        end     

% ------------------------------------------------------------------
    % Menu item 2. Filter data
    elseif choice == 2
        %Clear Command Window
        clc
        
        % No data loaded?
        if strcmp(filename, '')
            % Display NoData message
            dialogBoxes('MissingData');
        else
            %Set WorkedData to be true
            WorkedData = 1;
            
            % Filtering data
            slider;
            
            % Load ActivatedFilters to compaire ActiveFilters and importFilters to verify if there is an active filter (if false)
            load('ActivatedFilters');
            if isequaln(ActiveFilters,importFilter)
                 %Setting data to restored data
                 data = cell2mat(struct2cell(load('RestoreData')));
                 
                 %Set ActiveFilter to be false
                 ActiveFilter = 0;
            else
                 %Setting data to filtered data
                 data = cell2mat(struct2cell(load('FilteredData')));
                 
                 %Set ActiveFilter to be true
                 ActiveFilter = 1;
            end
        end
            
% ------------------------------------------------------------------
    % Menu item 3. Display statistics
    elseif choice == 3
        %Clear Command Window
        clc
        
        % No data loaded?
        if strcmp(filename, '')
            % Display NoData message
            dialogBoxes('MissingData');
        else
            %Set WorkedData to be true
            WorkedData = 1;
            
            %Create a menu to choose statistics to be calculated and displayed
            if min(data(:,1)) < 20 && max(data(:,1)) <= 50
                statMenu = menu('Choose a statistics:','Mean Temperature','Mean Growth rate','Std Temperature','Std Growth rate','Rows','Mean Cold Growth rate','Mean Hot Groth rate - NO DATA', 'Main menu');
            elseif min(data(:,1)) >= 20 && max(data(:,1)) <= 50
                statMenu = menu('Choose a statistics:','Mean Temperature','Mean Growth rate','Std Temperature','Std Growth rate','Rows','Mean Cold Growth rate - NO DATA','Mean Hot Growth rate - NO DATA', 'Main menu');
            elseif min(data(:,1)) >= 20 && max(data(:,1)) > 50
                statMenu = menu('Choose a statistics:','Mean Temperature','Mean Growth rate','Std Temperature','Std Growth rate','Rows','Mean Cold Growth rate - NO DATA','Mean Hot Growth rate', 'Main menu');
            else
                statMenu = menu('Choose a statistics:','Mean Temperature','Mean Growth rate','Std Temperature','Std Growth rate','Rows','Mean Cold Growth rate','Mean Hot Growth rate', 'Main menu');
            end
            if statMenu == 1
                result = dataStatistics(data, 'Mean Temperature');
            elseif statMenu == 2
                result = dataStatistics(data, 'Mean Growth rate');
            elseif statMenu == 3
                result = dataStatistics(data, 'Std Temperature');
            elseif statMenu == 4
                result = dataStatistics(data, 'Std Growth rate');
            elseif statMenu == 5
                result = dataStatistics(data, 'Rows');
            elseif statMenu == 6
                if min(data(:,1)) < 20
                    result = dataStatistics(data, 'Mean Cold Growth rate');
                else
                    dialogBoxes('NoMeanHotCold');
                end
            elseif statMenu == 7
                if max(data(:,1)) > 50
                    result = dataStatistics(data, 'Mean Hot Growth rate');
                else
                    dialogBoxes('NoMeanHotCold');
                end
            elseif statMenu == 8
            end
        end

% ------------------------------------------------------------------
    % Menu item 4. Generate plots
    elseif choice == 4
        %Clear Command Window
        clc
        
        % No data loaded?
        if strcmp(filename, '')
            % Display NoData message
            dialogBoxes('MissingData');
        else
            %Set WorkedData to be true
            WorkedData = 1;
            
            % Generate plots
            dataPlot(data);
            
            % Display Plots message
            dialogBoxes('Plots');
        end

% ------------------------------------------------------------------
    % Menu item 5. Quit
    elseif choice == 5
        % Clear Workspace, Command Window, plot figures and saved files
        close all
        clear all %Clear Workspace (delete all varibles)
        clc %Clear Command Window
        if isfile('RestoreData.mat')
            delete 'RestoreData.mat'
        end
        if isfile('FilteredData.mat')
            delete 'FilteredData.mat'
        end
        if isfile('ImportFilter.mat')
            delete 'ImportFilter.mat'
        end
        if isfile('ActivatedFilters.mat')
            delete 'ActivatedFilters.mat'
        end
        %Display QuitProgram message
        if isfile('LoadErrors.txt')
            dialogBoxes('QuitProgramLoadErrors');
        else
            dialogBoxes('QuitProgram');
        end
        break
    end
end