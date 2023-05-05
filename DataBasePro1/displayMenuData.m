% DISPLAYMENUDATA Displays a menu of options,
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

function choice = displayMenuData(options)
global ValidImportedRows

% Display menu options
for i = 1:length(options)
    fprintf('<strong> %d. %s </strong>\n', i, options{i});
end

% Get a valid menu choice
choice = 0;
while ~any(choice == 1:length(options))
    fprintf('\nSTATUS:\n');
    if isfile('LoadErrors.txt')
        fprintf(2, 'Data has been importered, and deleteted rows are saved in the file LoadErrors.txt.\n');
    else
        fprintf('Data has been importered without errors.\n');
    end
    fprintf('No data filter is applied.\n');
    fprintf('All %g imported data rows to be included in the calculation of statistics and generation of plots.\n', ValidImportedRows);
    choice = inputNumber('\n<strong>Please choose a menu item:</strong> ');
end