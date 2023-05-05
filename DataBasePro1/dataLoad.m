% DATALOAD Validate and import data file
%
% Usage: data = dataLoad(filename)
% Validate and import the user selected data file
% Displays a status
%
% Author: Johnnie Hundrup, s203983
%
% Co-authors: Erlend André Hall, s202055
%             Ekaterina Wyss Storm, s163627
%

function data = dataLoad(filename)

% Change all NaN value to -1000 (value outside import settings)
importDataFile = readtable(filename); 
RawData = table2array(importDataFile);

% 
data = RawData;
Lines = size(RawData, 1);

% Create a vector for line numbers to delete, and set load errors to 0
DeleteLines = [];
LoadErrors = 0;

% Create a file for saving loading errors
fid=fopen('LoadErrors.txt','wt');

% Runs thru all lines in RawData checking and displaying errors
for n = 1:Lines
    
    % Checking for and displaying temperature errors
    if isnan(RawData(n,1))
        fprintf(2, 'Error in line %0d: Temperature value not a number!\n', n) % Temperature error message
        fprintf(fid,'Error in line %0d: Temperature value not a number!\n', n);
        DeleteLines = [DeleteLines, n]; % Adding line number to DeleteLines vector
        LoadErrors = 1;
    end
    if ~isnan(RawData(n,1)) && (RawData(n,1) < 10)
        fprintf(2, 'Error in line %0d: %f temperature is below limit!\n', n, RawData(n,1)) % Temperature error message
        fprintf(fid, 'Error in line %0d: %f temperature is below limit!\n', n, RawData(n,1));
        DeleteLines = [DeleteLines, n]; % Adding line number to DeleteLines vector
        LoadErrors = 1;
    end
    if ~isnan(RawData(n,1)) && (RawData(n,1) > 60)
        fprintf(2, 'Error in line %0d: %f temperature is above limit!\n', n, RawData(n,1)) % Temperature error message
        fprintf(fid, 'Error in line %0d: %f temperature is above limit!\n', n, RawData(n,1));
        DeleteLines = [DeleteLines, n]; % Adding line number to DeleteLines vector
        LoadErrors = 1;
    end

    % Checking for and displaying growth rate errors
    if isnan(RawData(n,2))
        fprintf(2, 'Error in line %0d: Growth rate value not a number!\n', n) % Temperature error message
        fprintf(fid, 'Error in line %0d: Growth rate value not a number!\n', n);
        DeleteLines = [DeleteLines, n]; % Adding line number to DeleteLines vector
        LoadErrors = 1;
    end
    if ~isnan(RawData(n,2)) && (RawData(n,2) < 0)
        fprintf(2, 'Error in line %0d: %f is an invalid growth rate!\n', n, RawData(n,2)) % Growth rate error message
        fprintf(fid, 'Error in line %0d: %f is an invalid growth rate!\n', n, RawData(n,2));
        DeleteLines = [DeleteLines, n]; % Adding line number to DeleteLines vector
        LoadErrors = 1;
    end
    
    % Checking for and displaying bacteria type errors
    if isnan(RawData(n,3))
        fprintf(2, 'Error in line %0d: Bacteria type value not a number!\n', n) % Temperature error message
        fprintf(fid, 'Error in line %0d: Bacteria type value not a number!\n', n);
        DeleteLines = [DeleteLines, n]; % Adding line number to DeleteLines vector
        LoadErrors = 1;
    end
    if ~isnan(RawData(n,3)) && (RawData(n,3) ~= 1) && (RawData(n,3) ~= 2) && (RawData(n,3) ~= 3) && (RawData(n,3) ~= 4)
        fprintf(2, 'Error in line %0d: %f is an invalid type of bacteria!\n', n, RawData(n,3)) % Bacteria error message
        fprintf(fid, 'Error in line %0d: %f is an invalid type of bacteria!\n', n, RawData(n,3));
        DeleteLines = [DeleteLines, n]; % Adding line number to DeleteLines vector
        LoadErrors = 1;
    end
end

%Closing file for saving loading errors
fclose(fid);

%Selecting valid data
data(DeleteLines,:) = [];
global ValidImportedRows
ValidImportedRows = (size(data, 1));

%Set variabel restoreData to validated loaded data
%restoreData = data;

%Status on importing data and deleting of faulty lines 
if LoadErrors == 0
    uiwait(msgbox(sprintf('The data file has been imported without errors, and consists of %g rows', ValidImportedRows), 'Status on imported data', 'warn'))
    delete 'LoadErrors.txt'
else
    fprintf('\nThe data file has been imported, but the following faulty lines as listed above have been deleted: \n')
    DeleteLines = unique(DeleteLines);
    disp(DeleteLines)
    uiwait(msgbox(sprintf('The data file has been imported, and the specified lines\nhas been deleted due to errors printed in the Command Window.\n\nEach line number and error are saved to LoadErrors.txt file!\n\nThe validated and imported data consists of %g rows', ValidImportedRows), 'Status on imported data', 'error'));
end

clc


