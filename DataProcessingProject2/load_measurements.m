% DATALOAD Validate and import data file
%
% Usage: data = load(filename)
% Validate and import the user selected data file
% Displays a status
%
% Author: Johnnie Hundrup, s203983
%
% Co-authors: Erlend André Hall, s202055
%             Ekaterina Wyss Storm, s163627
%

function [tvec, data] = load_measurements(filename, fmode) %[tvec, data] = load_measurements(filename)
handleFmode = find(strcmp(["forward fill"; "backward fill"; "drop"], fmode));

% Change all NaN value to -1000 (value outside import settings)
importDataFile = readtable(filename);
RawData = table2array(importDataFile);

% 
WorkData = RawData;
Lines = size(WorkData, 1);

% Create a vector for line numbers to delete or to change
DeletedLines = [];
ChangedLines = [];

% Check and change fmode setting if there are corrupted measurements in the first or the last row
if (handleFmode == 1) && ((RawData(1,7) == -1) || (RawData(1,8) == -1) || (RawData(1,9) == -1) || (RawData(1,10) == -1))% First row contrains a corrupted measurement -> fmode changes from 'forward fill' to 'drop'
    handleFmode = 3;
    fprintf(2, '<strong>One or more corrupted measurements in the first line.\n\nThe handling of corrupted measurements has been changed from "forward fill" to "drop"!</strong>\n\n');
    uiwait(msgbox(sprintf('The handling of corrupted measurements has been changed from "forward fill" to "drop"!'), 'Fmode change!', 'error'));
    clc
elseif (handleFmode == 2) && ((RawData(Lines,7) == -1) || (RawData(Lines,8) == -1) || (RawData(Lines,9) == -1) || (RawData(Lines,10) == -1))% Last row contrains a corrupted measurement -> fmode changes from 'backward fill' to 'drop'
    handleFmode = 3;
    fprintf(2, '<strong>One or more corrupted measurements in the last line.\n\nThe handling of corrupted measurements has been changed from "backward fill" to "drop"!</strong>\n\n');
    uiwait(msgbox(sprintf('The handling of corrupted measurements has been changed from "backward fill" to "drop"!'), 'Fmode change!', 'error'));
    clc
end

% Creates a latest value for Zone1, Zone2, Zone3 and Zone4 which will not be used, but changed by the values with the first (or last) imported row depending on Fmode 'forward fill' or 'backward fill'
latestZone1 = 0;
latestZone2 = 0;
latestZone3 = 0;
latestZone4 = 0;

% Create a file for saving loaded corrupt measurements
fid = fopen('CorruptMeasurements.txt','wt');

%% Runs thru all lines in WorkData checking and corrupt measurements
% The program checks what fmode is set either by user or by program (if
% there are corrupted measurements in the first or the last row)
% If fmode is 'backward fill' the program check the loaded file backward
% to be able to change corrupted measurements with next valid measurement
% If fmode is 'forward fill the program check the loaded file from first line
% and up to be able to change corrupted measurements with latest valid measurement
% If fmode is 'drop' the program check the loaded file from first line and
% up to be able to change corrupted measurements with latest valid measurement

if handleFmode == 2 % If 'backward fill' then for loop counts down from highest linenumber to first line, and checking each zone
    for n = (Lines):-1:1
        
        % Backward fill checking for corrupt measurements in Zone1
        if (WorkData(n,7) == -1)
            fprintf(fid, 'Error in line %0d: %f value in Zone1 is a corrupt measurement. Value has been replaced with %f!\n', n, WorkData(n,7), latestZone1); % write line to CorruptMeasurements.txt
            WorkData(n,7) = latestZone1;
            ChangedLines = [ChangedLines, n]; % Adding line number to ChangedLines vector
        else
            % Mark Zone1 value a next valid measurement
            latestZone1 = WorkData(n,7);
        end
        
        % Backward fill checking for and displaying corrupt measurements in Zone2
        if (WorkData(n,8) == -1)
            fprintf(fid, 'Error in line %0d: %f value in Zone2 is a corrupt measurement. Value has been replaced with %f!\n', n, WorkData(n,8), latestZone2); % write line to CorruptMeasurements.txt
            WorkData(n,8) = latestZone2;
            ChangedLines = [ChangedLines, n]; % Adding line number to ChangedLines vector
        else
            % Mark Zone2 value a next valid measurement
            latestZone2 = WorkData(n,8);
        end
        
        % Backward fill checking for and displaying corrupt measurements in Zone3
        if (WorkData(n,9) == -1)
            fprintf(fid, 'Error in line %0d: %f value in Zone3 is a corrupt measurement. Value has been replaced with %f!\n', n, WorkData(n,9), latestZone3); % write line to CorruptMeasurements.txt
            WorkData(n,9) = latestZone3;
            ChangedLines = [ChangedLines, n]; % Adding line number to ChangedLines vector
        else
            % Mark Zone3 value a next valid measurement
            latestZone3 = WorkData(n,9);
        end
        
        % Backward fill checking for and displaying corrupt measurements in Zone4
        if (WorkData(n,10) == -1)
            fprintf(fid, 'Error in line %0d: %f value in Zone4 is a corrupt measurement. Value has been replaced with %f!\n', n, WorkData(n,10), latestZone4); % write line to CorruptMeasurements.txt
            WorkData(n,10) = latestZone4;
            ChangedLines = [ChangedLines, n]; % Adding line number to ChangedLines vector
        else
            % Mark Zone4 value a next valid measurement
            latestZone4 = WorkData(n,10);
        end
    end
else % If 'forward fill' or 'drop' then for loop counts up from first line to highest linenumber, and checking each zone
    for n = 1:Lines
        
        % Forward fill or drop checking for corrupt measurements in Zone1
        if (WorkData(n,7) == -1)
            if handleFmode == 1 % Forward fill checking
                fprintf(fid, 'Error in line %0d: %f value in Zone1 is a corrupt measurement. Value has been replaced with %f!\n', n, WorkData(n,7), latestZone1); % write line to CorruptMeasurements.txt
                WorkData(n,7) = latestZone1;
                ChangedLines = [ChangedLines, n]; % Adding line number to ChangedLines vector
            else % drop checking
                fprintf(fid,'Error in line %0d: value in Zone1 is a corrupt measurement. Value has been deleted!\n', n); % write line to CorruptMeasurements.txt
                DeletedLines = [DeletedLines, n]; % Adding line number to DeletedLines vector
            end
        else
        % Mark Zone1 value a latest valid measurement
        latestZone1 = WorkData(n,7);
        end
        
        % Forward fill or drop checking for corrupt measurements in Zone2
        if (WorkData(n,8) == -1)
            if handleFmode == 1 % Forward fill checking
                fprintf(fid, 'Error in line %0d: %f value in Zone2 is a corrupt measurement. Value has been replaced with %f!\n', n, WorkData(n,8), latestZone2); % write line to CorruptMeasurements.txt
                WorkData(n,8) = latestZone2;
                ChangedLines = [ChangedLines, n]; % Adding line number to ChangedLines vector
            else % drop checking
                fprintf(fid,'Error in line %0d: value in Zone2 is a corrupt measurement. Value has been deleted!\n', n); % write line to CorruptMeasurements.txt
                DeletedLines = [DeletedLines, n]; % Adding line number to DeletedLines vector
            end
        else
        % Mark Zone2 value a latest valid measurement
        latestZone2 = WorkData(n,8);
        end
        
        % Forward fill or drop checking for corrupt measurements in Zone3
        if (WorkData(n,9) == -1)
            if handleFmode == 1 % Forward fill checking
                fprintf(fid, 'Error in line %0d: %f value in Zone3 is a corrupt measurement. Value has been replaced with %f!\n', n, WorkData(n,9), latestZone3); % write line to CorruptMeasurements.txt
                WorkData(n,9) = latestZone3;
                ChangedLines = [ChangedLines, n]; % Adding line number to ChangedLines vector
            else % drop checking
                fprintf(fid,'Error in line %0d: value in Zone3 is a corrupt measurement. Value has been deleted!\n', n); % write line to CorruptMeasurements.txt
                DeletedLines = [DeletedLines, n]; % Adding line number to DeletedLines vector
            end
        else
        % Mark Zone3 value a latest valid measurement
        latestZone3 = WorkData(n,9);
        end
        
        % Forward fill or drop checking for corrupt measurements in Zone4
        if (WorkData(n,10) == -1)
            if handleFmode == 1 % Forward fill checking
                fprintf(fid, 'Error in line %0d: %f value in Zone4 is a corrupt measurement. Value has been replaced with %f!\n', n, WorkData(n,10), latestZone4); % write line to CorruptMeasurements.txt
                WorkData(n,10) = latestZone4;
                ChangedLines = [ChangedLines, n]; % Adding line number to ChangedLines vector
            else % drop checking
                fprintf(fid,'Error in line %0d: value in Zone4 is a corrupt measurement. Value has been deleted!\n', n); % write line to CorruptMeasurements.txt
                DeletedLines = [DeletedLines, n]; % Adding line number to DeletedLines vector
            end
        else
        % Mark Zone4 value a latest valid measurement
        latestZone4 = WorkData(n,10);
        end
    end
end

%Closing file for saving loading errors
fclose(fid);

%%Selecting valid data and create the tvec and data variables
if handleFmode == 3
    WorkData(DeletedLines,:) = [];
end
tvec = WorkData(:,1:6);
data = WorkData(:,7:10);

%%Status on importing data and change/delete of lines with corrupted measurements

% Setting ValidImportedRows to a global variable which is used to inform
% the user about number of valid rows
global ValidImportedRows
ValidImportedRows = (size(WorkData, 1));

% Count deleted or changed lines
[non, Deleted] = size(DeletedLines);
[non, Changed] = size(ChangedLines);
global DeletedRows
global ChangedRows
DeletedRows = Deleted;
ChangedRows = Changed;

DeletedLines = unique(DeletedLines);
ChangedLines = unique(ChangedLines);

if handleFmode == 1 % Forward fill status 
    if Changed == 0 % If no rows have been changed, the program delete CorruptMeasurements.txt, and the user isnt informed about that file
        uiwait(msgbox(sprintf('The data file has been imported without errors, and consists of %g rows', ValidImportedRows), 'Status on imported data', 'warn'))
        delete 'CorruptMeasurements.txt'
    elseif Changed < 25 % If there is less than 25 'forward fill' changed rows, these are displayed in the command window (and save in the CorruptMeasurements.txt' file
        fprintf(2, 'The data file has been imported, but the corrupted measurement in the listed lines has been replaced with latest valid measurement (forward fill): \n')
        disp(ChangedLines)
        uiwait(msgbox(sprintf('The data file has been imported, and in the lines listed in the Command Window, corrupted measurement has been replaced with latest valid measurement (forward fill).\n\nEvery new value and line number are saved to CorruptMeasurements.txt file located in the current folder!\n\nThe imported and validated data consists of %g rows.', ValidImportedRows), 'Status on imported data', 'error'));
    else % If there is 25 or more 'forward fill' changed rows, these are NOT displayed in the command window (only save in the CorruptMeasurements.txt' file
        fprintf(2, 'The data file has been imported, but in %g lines one or more corrupted measurements have been replaced with latest valid measurement (forward fill)!\n', ChangedRows)
        uiwait(msgbox(sprintf('The data file has been imported, but in %g lines corrupted measurements have been replaced with latest valid measurement (forward fill)!\n\nEvery new value and line number are saved to CorruptMeasurements.txt file.', ChangedRows), 'Status on imported data', 'error'));
    end
elseif handleFmode == 2 % Backward fill status
    if Changed == 0 % If no rows have been changed, the program delete CorruptMeasurements.txt, and the user isnt informed about that file
        uiwait(msgbox(sprintf('The data file has been imported without errors, and consists of %g rows', ValidImportedRows), 'Status on imported data', 'warn'))
        delete 'CorruptMeasurements.txt'
    elseif Changed < 25 % If there is less than 25 'backward fill' changed rows, these are displayed in the command window (and save in the CorruptMeasurements.txt' file
        fprintf(2, 'The data file has been imported, but the corrupted measurement in the listed lines has been replaced with next valid measurement (backward fill): \n')
        disp(ChangedLines)
        uiwait(msgbox(sprintf('The data file has been imported, and in the lines listed in the Command Window corrupted measurement has been replaced with next valid measurement (backward fill).\n\nEvery new value and line number are saved to CorruptMeasurements.txt file located in the current folder!\n\nThe imported and validated data consists of %g rows.', ValidImportedRows), 'Status on imported data', 'error'));
    else % If there is 25 or more 'backward fill' changed rows, these are NOT displayed in the command window (only save in the CorruptMeasurements.txt' file
        fprintf(2, 'The data file has been imported, but in %g lines one or more corrupted measurements have been replaced with next valid measurement (backward fill)!\n', ChangedRows)
        uiwait(msgbox(sprintf('The data file has been imported, but in %g lines corrupted measurements have been replaced with next valid measurement (backward fill)!\n\nEvery new value and line number are saved to CorruptMeasurements.txt file.', ChangedRows), 'Status on imported data', 'error'));
    end
elseif handleFmode == 3 % Drop status
    if Deleted == 0 % If no rows have been deleted, the program delete CorruptMeasurements.txt, and the user isnt informed about that file
        uiwait(msgbox(sprintf('The data file has been imported without errors, and consists of %g rows.', ValidImportedRows), 'Status on imported data', 'warn'))
        delete 'CorruptMeasurements.txt'
    elseif Deleted < 25 % If there are less than 25 'drop' deleted rows, these are displayed in the command window (and save in the CorruptMeasurements.txt' file
        fprintf(2, 'The data file has been imported, but the following lines have been deleted due to one or more corrupted measurements (drop): \n')
        disp(DeletedLines)
        uiwait(msgbox(sprintf('The data file has been imported, and the listed lines the Command Window has been deleted!\n\nEvery deleted line number are saved to CorruptMeasurements.txt file located in the current folder!\n\nThe imported and validated data consists of %g rows', ValidImportedRows), 'Status on imported data', 'error'));
    else % If there is 25 or more 'drop' deleted rows, these are NOT displayed in the command window (only save in the CorruptMeasurements.txt' file
        fprintf(2, 'The data file has been imported, but %g lines have been deleted due to one or more corrupted measurements (drop)!\n', DeletedRows)
        uiwait(msgbox(sprintf('The data file has been imported, but %g lines have been deleted due corrupted measurements (drop)!\n\nEvery deleted line number are saved to CorruptMeasurements.txt file.', DeletedRows), 'Status on imported data', 'error'));
    end
end

clc
end