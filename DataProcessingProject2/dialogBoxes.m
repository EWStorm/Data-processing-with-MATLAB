% DIALOGBOXES Control and show all dialogboxes
%
% Usage: dialogBoxes(whichBox)
% 
%
% Author: Johnnie Hundrup, s203983
%
% Co-authors: Erlend André Hall, s202055
%             Ekaterina Wyss Storm, s163627
%

function dialogBoxes(whichBox)
% opts.Interpreter = 'tex';
switch whichBox

    case 'Introduction'
        uiwait(helpdlg({'This program can aggregate, display statistics and visualize electricity consumption based on imported data.'; ''; 'You can import a N × 10 matrix data file that contains numerical values in the following columns:'; ''; '"​​Year", "Month", "Day", "Hour", "Minutes", "Seconds", "Zone1", "Zone2", "Zone3" and "Zone4"'}, 'Introduction'));
    
    case 'AbortLoadData'
        uiwait(helpdlg({'You have selected to abort importing data!'}, 'Abort importing data'));
        
    case 'WrongDimension'
        uiwait(helpdlg({'You have selected data with wrong number of input parameters (columns)!'}, 'Wrong dimensions'));
        
    case 'MissingFmode'
        uiwait(errordlg({'Corrupted measurements can not be handled!';''; 'You have not selected how the program shall handle corrupted measurements, so the selected data file will not be imported.'}, 'Invalid menu'));
        
    %case 'LoadedData'
    %    uiwait(helpdlg({'The program is now ready to aggregate data, display statistics or visualize electricity consumption!'}, 'User Information'));
        
    case 'MissingData'
        uiwait(errordlg({'No data available!';''; 'You need to import some data.'}, 'Invalid menu'));
    
    case 'DisplayStatistics'
        uiwait(helpdlg({'The statistics has been printed in the Command Window, and when you close this dialogbox the Command Window will be deleted!'}, 'Display Statistics'));
    
    case 'QuitProgram'
        uiwait(helpdlg({'The program has been terminated!'}, 'Program terminated'));
        
    %case 'QuitProgramLoadErrors'
    %    uiwait(helpdlg({'The program has been terminated!';''; 'The file LoadErrors.txt can be found inside the current folder!'}, 'Program terminated'));

end

