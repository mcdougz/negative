function varargout = figSharpen(varargin)
% FIGSHARPEN MATLAB code for figSharpen.fig
%      FIGSHARPEN, by itself, creates a new FIGSHARPEN or raises the existing
%      singleton*.
%
%      H = FIGSHARPEN returns the handle to a new FIGSHARPEN or the handle to
%      the existing singleton*.
%
%      FIGSHARPEN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FIGSHARPEN.M with the given input arguments.
%
%      FIGSHARPEN('Property','Value',...) creates a new FIGSHARPEN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before figSharpen_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to figSharpen_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help figSharpen

% Last Modified by GUIDE v2.5 26-Apr-2014 17:18:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @figSharpen_OpeningFcn, ...
                   'gui_OutputFcn',  @figSharpen_OutputFcn, ...
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


% --- Executes just before figSharpen is made visible.
function figSharpen_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to figSharpen (see VARARGIN)

% Choose default command line output for figSharpen
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes figSharpen wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%show image on left
global IMG;

%debug
IMG = imread('photo/14.jpg');

axes(handles.axes1);
imshow(IMG);
set(gca,'Tag','axes1');
%clear axes on right
axes(handles.axes2);
imshow([]);
set(gca,'Tag','axes2');

% --- Outputs from this function are returned to the command line.
function varargout = figSharpen_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function editRadius_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editRadius (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function sliderRadius_Callback(hObject, eventdata, handles)
% hObject    handle to sliderRadius (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

%set text box to slider value
set(handles.editRadius,'String',num2str(get(hObject,'Value')));


% --- Executes during object creation, after setting all properties.
function sliderRadius_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderRadius (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



% --- Executes during object creation, after setting all properties.
function editAmount_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editAmount (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function sliderAmount_Callback(hObject, eventdata, handles)
% hObject    handle to sliderAmount (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

%set text box to slider value
set(handles.editAmount,'String',num2str(get(hObject,'Value')));

% --- Executes during object creation, after setting all properties.
function sliderAmount_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderAmount (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes during object creation, after setting all properties.
function editThreshold_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editThreshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function sliderThreshold_Callback(hObject, eventdata, handles)
% hObject    handle to sliderThreshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

%set text box to slider value
set(handles.editThreshold,'String',num2str(get(hObject,'Value')));

% --- Executes during object creation, after setting all properties.
function sliderThreshold_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderThreshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in btnSave.
function btnSave_Callback(hObject, eventdata, handles)
% hObject    handle to btnSave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global IMG;
IMG = getimage(findobj('Tag','axes2'));
close;
set(0, 'currentfigure', findobj('type','figure','Name','negative'));
showImage();

% --- Executes on button press in btnSharpen.
function btnSharpen_Callback(hObject, eventdata, handles)
% hObject    handle to btnSharpen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global IMG;
axes(handles.axes2);
imshow('res/loading.png');drawnow;
sharpened = imsharpen(IMG,...
    'Radius',get(findobj('Tag','sliderRadius'),'Value'),...
    'Amount',get(findobj('Tag','sliderAmount'),'Value'),...
    'Threshold',get(findobj('Tag','sliderThreshold'),'Value'));
imshow(sharpened);
set(gca,'Tag','axes2');


% --- Executes on key press with focus on editRadius and none of its controls.
function editRadius_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to editRadius (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
validateNumToSlider(hObject,handles.sliderRadius,2);


% --- Executes on key press with focus on editAmount and none of its controls.
function editAmount_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to editAmount (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
validateNumToSlider(hObject,handles.sliderAmount,2);


% --- Executes on key press with focus on editThreshold and none of its controls.
function editThreshold_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to editThreshold (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
validateNumToSlider(hObject,handles.sliderThreshold,2);