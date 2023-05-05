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
        uiwait(helpdlg({'This program can display statistics and generate plots based on imported data.'; ''; 'You can import a N × 3 matrix data file that contains numerical values in the following columns:'; ''; '"​​Temperature", "Growth rate", and "Bacteria Type"'}, 'Introduction'));
    
    case 'AbortLoadData'
        uiwait(helpdlg({'You have selected to abort importing data!'}, 'Abort importing data'));
        
    case 'LoadedData'
        uiwait(helpdlg({'The program is now ready to display statistics or generate plots!'; ''; 'You can choose to';'';' - work with the imported dataset';'';' - filter the dataset'}, 'User Information'));
        
    case 'MissingData'
        uiwait(errordlg({'No data available!';''; 'You need to import some data.'}, 'Invalid menu'));
        
    case 'NoMeanHotCold'
        uiwait(errordlg({'Due to filter settings there are no valid data for this calculation.'}, 'Data filter applied'));
       
    case 'QuitProgram'
        uiwait(helpdlg({'The program has been terminated!'}, 'Program terminated'));
        
    case 'QuitProgramLoadErrors'
        uiwait(helpdlg({'The program has been terminated!';''; 'The file LoadErrors.txt can be found inside the current folder!'}, 'Program terminated'));

end

