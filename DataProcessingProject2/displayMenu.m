% DISPLAYMENU Displays a menu of options,
% ask the user to choose an item and returns the number of the menu item chosen.
%
% Usage: choice = displayMenu(options)
%
% Input options Menu options (cell array of strings)
% Output choice Chosen option (integer)
% 
% Author: Johnnie Hundrup, s203983
%
% Co-authors: Erlend André Hall, s202055
%             Ekaterina Wyss Storm, s163627
%
% Originally author: Mikkel N. Schmidt, 2015
%

function choice = displayMenu(options)
%call global variables
global ValidImportedRows
global DeletedRows
global ChangedRows
global AggregateData
global TimeScale
global AggregateRows

% Display menu options
for i = 1:length(options)
    fprintf('<strong> %d. %s </strong>\n', i, options{i});
end

% Get a valid menu choice
choice = 0;
while ~any(choice == 1:length(options))
    if isfile('Data.mat')
        fprintf('\nSTATUS:\n');
        if isfile('CorruptMeasurements.txt')
            if DeletedRows ~= 0
                fprintf(2, 'Data has been importered, and information on %g deleted lines with corrupted measurements are saved in CorruptMeasurements.txt file.\n', DeletedRows);
            else
                fprintf(2, 'Data has been importered, and information on %g changed lines with corrupted measurements are saved in CorruptMeasurements.txt file.\n', ChangedRows);
            end
        else
            fprintf('Data has been importered without corrupted measurements.\n');
        end
                
        fprintf('%g imported lines to be included for aggregating the data, calculation of statistics and visualization of electricity consumption.\n', ValidImportedRows);
        
        if AggregateData == 1
            fprintf(2, 'Data has been aggregated. Timescale is now %s and aggregated data consist of %g lines.\n', TimeScale, AggregateRows);
        else
            fprintf('Data has not been aggregated, so current timescale is minutes.\n');
        end
    else
        fprintf('\nSTATUS:\n');
        fprintf(2,'Data has not been imported!\n');
    end
    
    choice = inputNumber('\n<strong>Please choose a menu item:</strong> ');
end