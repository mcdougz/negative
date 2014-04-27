function varargout = figStainRemoval(varargin)
% FIGSTAINREMOVAL MATLAB code for figStainRemoval.fig
%      FIGSTAINREMOVAL, by itself, creates a new FIGSTAINREMOVAL or raises the existing
%      singleton*.
%
%      H = FIGSTAINREMOVAL returns the handle to a new FIGSTAINREMOVAL or the handle to
%      the existing singleton*.
%
%      FIGSTAINREMOVAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FIGSTAINREMOVAL.M with the given input arguments.
%
%      FIGSTAINREMOVAL('Property','Value',...) creates a new FIGSTAINREMOVAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before figStainRemoval_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to figStainRemoval_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help figStainRemoval

% Last Modified by GUIDE v2.5 27-Apr-2014 12:17:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @figStainRemoval_OpeningFcn, ...
                   'gui_OutputFcn',  @figStainRemoval_OutputFcn, ...
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


% --- Executes just before figStainRemoval is made visible.
function figStainRemoval_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to figStainRemoval (see VARARGIN)

% Choose default command line output for figStainRemoval
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes figStainRemoval wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set (gcf, 'WindowButtonDownFcn', @stainClick);

%show the image and empty the other two axes
global IMG;
axes(handles.axes1);
imshow(IMG);
set(gca,'Tag','axes1');
axes(handles.axes2);
imshow([]);
set(gca,'Tag','axes2');
axes(handles.axes3);
imshow([]);
set(gca,'Tag','axes3');

% --- Outputs from this function are returned to the command line.
function varargout = figStainRemoval_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function stainClick(object, eventdata)
C = get (gca, 'CurrentPoint');

%if current axes is not axes1
if strcmp(get(gca, 'Tag'),'axes1')==0
    return;
end
%if the coordinates are negative
if C(1,1) < 0 || C(1,2) < 0
    return;
end

set(findobj('Tag','editPosX'),'String',C(1,1));
set(findobj('Tag','editPosY'),'String',C(1,2));

%TODO: show mask in axes3
axes(findobj('Tag','axes3'));
global selectMask;
global IMG;
selectMask = magicwand2(IMG,50,C(1,2),C(1,1));
imshow(selectMask);


% --- Executes on slider movement.
function sliderRed_Callback(hObject, eventdata, handles)
% hObject    handle to sliderRed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(findobj('Tag','editRed'),'String',get(hObject,'Value'));

% --- Executes during object creation, after setting all properties.
function sliderRed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderRed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderGreen_Callback(hObject, eventdata, handles)
% hObject    handle to sliderGreen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(findobj('Tag','editRedGreen'),'String',get(hObject,'Value'));

% --- Executes during object creation, after setting all properties.
function sliderGreen_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderGreen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderBlue_Callback(hObject, eventdata, handles)
% hObject    handle to sliderBlue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(findobj('Tag','editBlue'),'String',get(hObject,'Value'));

% --- Executes during object creation, after setting all properties.
function sliderBlue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderBlue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderThreshold_Callback(hObject, eventdata, handles)
% hObject    handle to sliderThreshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(findobj('Tag','editThreshold'),'String',get(hObject,'Value'));

% --- Executes during object creation, after setting all properties.
function sliderThreshold_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderThreshold (see GCBO)
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



function editRed_Callback(hObject, eventdata, handles)
% hObject    handle to editRed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editRed as text
%        str2double(get(hObject,'String')) returns contents of editRed as a double


% --- Executes during object creation, after setting all properties.
function editRed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editRed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editGreen_Callback(hObject, eventdata, handles)
% hObject    handle to editGreen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editGreen as text
%        str2double(get(hObject,'String')) returns contents of editGreen as a double


% --- Executes during object creation, after setting all properties.
function editGreen_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editGreen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editBlue_Callback(hObject, eventdata, handles)
% hObject    handle to editBlue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editBlue as text
%        str2double(get(hObject,'String')) returns contents of editBlue as a double
validateNumToSlider(hObject,handles.sliderBlue,0);

% --- Executes during object creation, after setting all properties.
function editBlue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editBlue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnStain.
function btnStain_Callback(hObject, eventdata, handles)
% hObject    handle to btnStain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global IMG;
try
    mask = getImage(findobj('Tag','axes3'));
    r = str2double(get(findobj('Tag','editRed'),'String'));
    g = str2double(get(findobj('Tag','editGreen'),'String'));
    b = str2double(get(findobj('Tag','editBlue'),'String'));

    newImg = zeros(size(IMG));
    newImg(:,:,1) = img(:,:,1) + (r*mask);
    newImg(:,:,2) = img(:,:,2) + (g*mask);
    newImg(:,:,3) = img(:,:,3) + (b*mask);
    axes(handles.axes2);
    imshow(newImg);
    set(gca,'Tag','axes2');
catch
    errordlg('Error, try to click on the stain first',...
        'Error adjusting stain');
end

% --- Executes on button press in btnSave.
function btnSave_Callback(hObject, eventdata, handles)
% hObject    handle to btnSave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global IMG;
IMG = getImage(findobj('Tag','axes2'));

% --- Executes on key press with focus on editThreshold and none of its controls.
function editThreshold_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to editThreshold (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

validateNumToSlider(hObject,handles.sliderThreshold,0.1);


% --- Executes on key press with focus on editRed and none of its controls.
function editRed_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to editRed (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
validateNumToSlider(hObject,handles.sliderRed,0);


% --- Executes on key press with focus on editGreen and none of its controls.
function editGreen_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to editGreen (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
validateNumToSlider(hObject,handles.sliderGreen,0);


% --- Executes on key press with focus on editBlue and none of its controls.
function editBlue_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to editBlue (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
validateNumToSlider(hObject,handles.sliderTBlue,0);

% --- Executes during object creation, after setting all properties.
function editPosY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editPosY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function editPosX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editPosX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
