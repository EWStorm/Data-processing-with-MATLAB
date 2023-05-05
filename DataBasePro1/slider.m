% SLIDER
%The slider is a filtering function that is made using MATLABs GUIDE
%function. This Function is combined with the slider.fig which is the ui
%for this function. Some of the code is autogenerated by GUIDE, and our
%coding starts at line 100. And is marked with a line of percentages
%"%%%" at start and end of own code.
%
% Author: Erlend André Hall, s202055
%
% Co-authors: Johnnie Hundrup, s203983
%             Ekaterina Wyss Storm, s163627
%


function varargout = slider(varargin)
% SLIDER MATLAB code for slider.fig
%      SLIDER, by itself, creates a new SLIDER or raises the existing
%      singleton*.
%
%      H = SLIDER returns the handle to a new SLIDER or the handle to
%      the existing singleton*.
%
%      SLIDER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SLIDER.M with the given input arguments.
%
%      SLIDER('Property','Value',...) creates a new SLIDER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before slider_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to slider_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help slider

% Last Modified by GUIDE v2.5 14-Apr-2021 16:37:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @slider_OpeningFcn, ...
                   'gui_OutputFcn',  @slider_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before slider is made visible.
function slider_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to slider (see VARARGIN)

% Choose default command line output for slider
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes slider wait for user response (see UIRESUME)
% figHandle = uifigure(hObject.figslider); % or you can create another object, etc.
% uiwait(figHandle); % when end button pressed, put delete to this button's callback and delete figHandle
%(or close figure inside this callback), so your code will continue after deletion.
% you can apply it any other objects not only figures

% --- Outputs from this function are returned to the command line.
function varargout = slider_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
uiwait(handles.figslider);


% --- Executes on slider movement.
function maxtemp_Callback(hObject, eventdata, handles)
% hObject    handle to maxtemp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




%%% OWN CODE START %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Turning all values into whole numbers
newmax = floor(get(hObject,'Value'));
 set(hObject,'Value',newmax);
%Makes sure that min temperature is not higher than max
if get(handles.mintemp,'value')>=get(handles.maxtemp,'value')
    set(handles.mintemp,'value',get(handles.maxtemp,'value'));
end
%Making the values in the slider show in the box
maxtemp = get(handles.maxtemp,'value');
maxtemp1 = num2str(maxtemp);
temp1 = set(handles.temp1,'string',maxtemp1);
%Updating the min temp in case of min>max
mintemp = get(handles.mintemp,'value');
mintemp1 = num2str(mintemp);
temp2 = set(handles.temp2,'string',mintemp1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% --- Executes during object creation, after setting all properties.
function maxtemp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to maxtemp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function mintemp_Callback(hObject, eventdata, handles)
% hObject    handle to mintemp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Turning all values into whole numbers
newmin = floor(get(hObject,'Value'));
set(hObject,'Value',newmin);
%Makes sure that min temperature is not higher than max
if get(handles.mintemp,'value')>=get(handles.maxtemp,'value')
    set(handles.mintemp,'value',get(handles.maxtemp,'value'));
end
%Making the values in the slider show in the box
mintemp = get(handles.mintemp,'value');
mintemp1 = num2str(mintemp);
temp2 = set(handles.temp2,'string',mintemp1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes during object creation, after setting all properties.
function mintemp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mintemp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function maxrate_Callback(hObject, eventdata, handles)
% hObject    handle to maxrate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%get(hObject,'Min') and get(hObject,'Max') to determine range of slider
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Turning all values into numbers with 3 decimals
A = cell2mat(struct2cell(load('RestoreData')));
set(hObject,'Max',max(max(A(:,2)),1));
newmax1 = round(get(hObject,'Value'),3);
 set(hObject,'Value',newmax1);
%Makes sure that min growth rate is not higher than max
if get(handles.minrate,'value')>=get(handles.maxrate,'value')
    set(handles.minrate,'value',get(handles.maxrate,'value'));
end
%Making the values in the slider show in the box
maxrate = get(handles.maxrate,'value');
maxrate1 = num2str(maxrate);
rate1 = set(handles.rate1,'string',maxrate1);
%Updating the min growth rate in case of min>max
minrate = get(handles.minrate,'value');
minrate2 = num2str(minrate);
rate2 = set(handles.rate2,'string',minrate2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% --- Executes during object creation, after setting all properties.
function maxrate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to maxrate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function minrate_Callback(hObject, eventdata, handles)
% hObject    handle to minrate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Turning all values into numbers with 3 decimals
newmin1 = round(get(hObject,'Value'),3);
 set(hObject,'Value',newmin1);
%Makes sure that min growth rate is not higher than max
if get(handles.minrate,'value')>=get(handles.maxrate,'value')
    set(handles.minrate,'value',get(handles.maxrate,'value'));
end
%Making the values in the slider show in the box
minrate = get(handles.minrate,'value');
minrate2 = num2str(minrate);
rate2 = set(handles.rate2,'string',minrate2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes during object creation, after setting all properties.
function minrate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to minrate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function temp1_Callback(hObject, eventdata, handles)
% hObject    handle to temp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of temp1 as text
%        str2double(get(hObject,'String')) returns contents of temp1 as a double


% --- Executes during object creation, after setting all properties.
function temp1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to temp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function temp2_Callback(hObject, eventdata, handles)
% hObject    handle to temp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of temp2 as text
%        str2double(get(hObject,'String')) returns contents of temp2 as a double


% --- Executes during object creation, after setting all properties.
function temp2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to temp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rate1_Callback(hObject, eventdata, handles)
% hObject    handle to rate1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rate1 as text
%        str2double(get(hObject,'String')) returns contents of rate1 as a double


% --- Executes during object creation, after setting all properties.
function rate1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rate1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rate2_Callback(hObject, eventdata, handles)
% hObject    handle to rate2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rate2 as text
%        str2double(get(hObject,'String')) returns contents of rate2 as a double


% --- Executes during object creation, after setting all properties.
function rate2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rate2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on filter press in bac1.
function bac1_Callback(hObject, eventdata, handles)
% hObject    handle to bac1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of bac1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

get(handles.bac1,'Value');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on filter press in bac2.
function bac2_Callback(hObject, eventdata, handles)
% hObject    handle to bac2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%If bacteria 2 is checked, turns value into correct bacteria number
get(handles.bac2,'Value');
if get(handles.bac2,'Value')==1
    set(handles.bac2,'Value',2);
end
   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on filter press in bac4.
function bac4_Callback(hObject, eventdata, handles)
% hObject    handle to bac4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%If bacteria 4 is checked, turns value into correct bacteria number
get(handles.bac4,'Value');
if get(handles.bac4,'Value')==1
    set(handles.bac4,'Value',4);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on filter press in bac3.
function bac3_Callback(hObject, eventdata, handles)
% hObject    handle to bac3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%If bacteria 3 is checked, turns value into correct bacteria number
get(handles.bac3,'Value');
if get(handles.bac3,'Value')==1
    set(handles.bac3,'Value',3);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% --- Executes on filter press in original_data.
function original_data_Callback(hObject, eventdata, handles)
% hObject    handle to original_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of original_data

% --- Executes on filter press in filter.
function filter_Callback(hObject, eventdata, handles)
% hObject    handle to filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FilterData = cell2mat(struct2cell(load('RestoreData')));

Lines2Filter = size(FilterData, 1);

% Create a vector for line numbers to filter
FilterLines = [];

%Filter Temperature
minTemperature = get(handles.mintemp,'value');
maxTemperature = get(handles.maxtemp,'value');

%Filter Growth rate
minGrowth = get(handles.minrate,'value');
maxGrowth = get(handles.maxrate,'value');

%Filter Bacteria type
BacteriaType = [get(handles.bac1,'value') get(handles.bac2,'value') get(handles.bac3,'value') get(handles.bac4,'value')];
BacteriaType(BacteriaType==0)=[];

for n = 1:Lines2Filter

    % Filtering temperature settings
    if (FilterData(n,1) > maxTemperature) || (FilterData(n,1) < minTemperature)
        %fprintf(2, 'Error in line %0d: %f is an invalid temperature!\n', n, RawData(n,1)) % Temperature error message
        FilterLines = [FilterLines, n]; % Adding line number to FilterLines vector
    end

    % Filtering growth rate settings
    if (FilterData(n,2) > maxGrowth) || (FilterData(n,2) < minGrowth)
        %fprintf(2, 'Error in line %0d: %f is an invalid growth rate!\n', n, RawData(n,2)) % Growth rate error message
        FilterLines = [FilterLines, n]; % Adding line number to FilterLines vector
    end
    
    % Filtering bacteria type settings
    if length(BacteriaType) == 1
        if (FilterData(n,3) ~= BacteriaType)
        %fprintf(2, 'Error in line %0d: %f is an invalid type of bacteria!\n', n, RawData(n,3)) % Bacteria error message
        FilterLines = [FilterLines, n]; % Adding line number to FilterLines vector
        end
    elseif length(BacteriaType) == 2
       if (FilterData(n,3) ~= BacteriaType(1,1)) && (FilterData(n,3) ~= BacteriaType(1,2))
        %fprintf(2, 'Error in line %0d: %f is an invalid type of bacteria!\n', n, RawData(n,3)) % Bacteria error message
        FilterLines = [FilterLines, n]; % Adding line number to FilterLines vector
        end
    elseif length(BacteriaType) == 3
        if (FilterData(n,3) ~= BacteriaType(1,1)) && (FilterData(n,3) ~= BacteriaType(1,2)) && (FilterData(n,3) ~= BacteriaType(1,3))
        %fprintf(2, 'Error in line %0d: %f is an invalid type of bacteria!\n', n, RawData(n,3)) % Bacteria error message
        FilterLines = [FilterLines, n]; % Adding line number to FilterLines vector
        end
    end
end
ActiveFilters = [get(handles.mintemp,'value') get(handles.maxtemp,'value') get(handles.minrate,'value') get(handles.maxrate,'value');get(handles.bac1,'value') get(handles.bac2,'value') get(handles.bac3,'value') get(handles.bac4,'value')];
save ActivatedFilters ActiveFilters;
%Select valid data
FilterData(FilterLines,:) = [];
global ValidFilteredRows
ValidFilteredRows = (size(FilterData, 1));
save FilteredData FilterData;
%fprintf('The filtered file now consists of %d rows. \n\n', ValidRows); % Valid data file message
closereq();


% --- Executes on button press in reload.
function reload_Callback(hObject, eventdata, handles)
% hObject    handle to reload (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
FilterData = cell2mat(struct2cell(load('RestoreData')));
global ValidFilteredRows
ValidFilteredRows = (size(FilterData, 1));
%save FilteredData = size(FilterData, 1);
ActiveFilters = [10 60 0 1;0 0 0 0];
save ActivatedFilters ActiveFilters;
save FilteredData FilterData;
%fprintf('The  file now consists of the original %d rows. \n\n', ValidRows); % Valid data file message
closereq();


% --- Executes on button press in back.
function back_Callback(hObject, eventdata, handles)
% hObject    handle to back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


closereq();
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%