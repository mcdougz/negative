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

% Last Modified by GUIDE v2.5 27-Apr-2014 20:10:14

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
axes(handles.axesMask);
imshow([]);
set(gca,'Tag','axesMask');

% --- Outputs from this function are returned to the command line.
function varargout = figStainRemoval_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%#####################################################################
% CreateFcns for correct colouring
%#####################################################################

function sliderGreen_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function sliderBlue_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function sliderThreshold_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function editThreshold_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editGreen_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editPosY_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editPosX_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editRed_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function sliderRed_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function editBlue_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%#####################################################################
% Slider/Edit synch
%#####################################################################

function sliderRed_Callback(hObject, eventdata, handles)
set(findobj('Tag','editRed'),'String',get(hObject,'Value'));

function sliderGreen_Callback(hObject, eventdata, handles)
set(findobj('Tag','editGreen'),'String',get(hObject,'Value'));

function sliderBlue_Callback(hObject, eventdata, handles)
set(findobj('Tag','editBlue'),'String',get(hObject,'Value'));

function sliderThreshold_Callback(hObject, eventdata, handles)
set(findobj('Tag','editThreshold'),'String',get(hObject,'Value'));

function editRed_Callback(hObject, eventdata, handles)
validateNumToSlider(hObject,handles.sliderRed,0);

function editGreen_Callback(hObject, eventdata, handles)
validateNumToSlider(hObject,handles.sliderGreen,0);

function editBlue_Callback(hObject, eventdata, handles)
validateNumToSlider(hObject,handles.sliderBlue,0);

function editThreshold_KeyPressFcn(hObject, eventdata, handles)
validateNumToSlider(hObject,handles.sliderThreshold,0.1);

function editRed_KeyPressFcn(hObject, eventdata, handles)
validateNumToSlider(hObject,handles.sliderRed,0);

function editGreen_KeyPressFcn(hObject, eventdata, handles)
validateNumToSlider(hObject,handles.sliderGreen,0);

function editBlue_KeyPressFcn(hObject, eventdata, handles)
validateNumToSlider(hObject,handles.sliderTBlue,0);

%######################################################################
% Callbacks and other stuff
%######################################################################

function stainClick(object, eventdata)
C = get (gca, 'CurrentPoint');
Xpos = fix(C(1,1));
Ypos = fix(C(1,2));

%if current axes is not axes1
if strcmp(get(gca, 'Tag'),'axes1')==0
    return;
end
%if the coordinates are negative
if C(1,1) < 0 || C(1,2) < 0
    return;
end

set(findobj('Tag','editPosX'),'String',Xpos);
set(findobj('Tag','editPosY'),'String',Ypos);

%TODO: show mask in axesMask
axes(findobj(gcf,'Tag','axesMask'));
global selectMask;
global IMG;
tol = fix(str2double(get(findobj('Tag','editThreshold'),'String')));
selectMask = magicwand2(IMG,tol,Ypos,Xpos);
imshow(selectMask);
set(gca,'Tag','axesMask');

% --- Executes on button press in btnStain.
function btnStain_Callback(hObject, eventdata, handles)
% hObject    handle to btnStain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global IMG;
global selectMask;
%try
    mask = selectMask;
    r = round(str2double(get(findobj(gcf,'Tag','editRed'),'String')));
    g = round(str2double(get(findobj(gcf,'Tag','editGreen'),'String')));
    b = round(str2double(get(findobj(gcf,'Tag','editBlue'),'String')));

    newImg = IMG;
    newImg(:,:,1) = IMG(:,:,1) + fix(r*mask);
    newImg(:,:,2) = IMG(:,:,2) + fix(g*mask);
    newImg(:,:,3) = IMG(:,:,3) + fix(b*mask);
    axes(handles.axes2);
    imshow(newImg);
    set(gca,'Tag','axes2');
%catch
%    errordlg('Error, try to click on the stain first',...
%        'Error adjusting stain');
%end

% --- Executes on button press in btnSave.
function btnSave_Callback(hObject, eventdata, handles)
% hObject    handle to btnSave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global IMG;
IMG = getImage(findobj(gcf,'Tag','axes2'));
close;
set(0, 'currentfigure', findobj('Type','Figure','Name','negative'));
showImage();
