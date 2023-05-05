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

% Display menu options
for i = 1:length(options)
    fprintf('<strong> %d. %s </strong>\n', i, options{i});
end

% Get a valid menu choice
choice = 0;
while ~any(choice == 1:length(options))
    fprintf('\nSTATUS:\n');
    fprintf(2,'Data has not been imported!\n');
    choice = inputNumber('\n<strong>Please choose a menu item:</strong> ');
end