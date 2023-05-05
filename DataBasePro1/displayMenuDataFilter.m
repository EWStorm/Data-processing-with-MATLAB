% DISPLAYMENUDATAFILTER Displays a menu of options,
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

function choice = displayMenuDataFilter(options)
%Values for PROGRAMSTATUS
global ValidFilteredRows
ActiveFilter = cell2mat(struct2cell(load('ActivatedFilters.mat')));
%minTemp = ActiveFilter(1,1);
%maxTemp = ActiveFilter(1,2);

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
    fprintf(2, 'Data filter is applied:\n');
    fprintf(2, '   - Temperature range is set to %g - %g\n', ActiveFilter(1,1), ActiveFilter(1,2));
    fprintf(2, '   - Growth rate range is set to %g - %g\n', ActiveFilter(1,3), ActiveFilter(1,4));
    fprintf(2, '   - One or more bacteria types has been chosen.');
    fprintf(2, '%g data rows will be included in the calculation of statistics and generation of plots.\n', ValidFilteredRows);
    fprintf('You can reset the data filter by selecting menu 2. Filter data.\n');
    
    choice = inputNumber('\n<strong>Please choose a menu item:</strong> ');
end