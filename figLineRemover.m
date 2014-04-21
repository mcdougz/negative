function varargout = figLineRemover(varargin)
% FIGLINEREMOVER MATLAB code for figLineRemover.fig
%      FIGLINEREMOVER, by itself, creates a new FIGLINEREMOVER or raises the existing
%      singleton*.
%
%      H = FIGLINEREMOVER returns the handle to a new FIGLINEREMOVER or the handle to
%      the existing singleton*.
%
%      FIGLINEREMOVER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FIGLINEREMOVER.M with the given input arguments.
%
%      FIGLINEREMOVER('Property','Value',...) creates a new FIGLINEREMOVER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before figLineRemover_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to figLineRemover_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help figLineRemover

% Last Modified by GUIDE v2.5 21-Apr-2014 12:44:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @figLineRemover_OpeningFcn, ...
                   'gui_OutputFcn',  @figLineRemover_OutputFcn, ...
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


% --- Executes just before figLineRemover is made visible.
function figLineRemover_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to figLineRemover (see VARARGIN)

% Choose default command line output for figLineRemover
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes figLineRemover wait for user response (see UIRESUME)
% uiwait(handles.figure1);

set (gcf, 'WindowButtonMotionFcn', @mouseMove);

%load image on left side
global IMG;
%IMG = imread('photo/2.jpg');
axes(handles.axes1);
imshow(IMG);
set(gca,'Tag','axes1');
%clear right side
axes(handles.axes2);
imshow([]);
set(gca,'Tag','axes2');
%create impoly
global objPoly;
objPoly = impoly(handles.axes1,'Closed',false);

% --- Outputs from this function are returned to the command line.
function varargout = figLineRemover_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
%varargout{1} = handles.output;


% --- Executes on button press in btnClone.
function btnClone_Callback(hObject, eventdata, handles)
% hObject    handle to btnClone (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
distFromLine = str2num(get(handles.editDistance,'String'));
brushRadius = str2num(get(handles.editSize,'String'));

global objPoly;
vertices = getPosition(objPoly);
global IMG;
img2 = lineClone(IMG,vertices, distFromLine, brushRadius);
axes(handles.axes2);
imshow(img2);
set(gca,'Tag','axes2');

function y = lineClone(img,vertices, distFromLine, brushRadius)
[numPoints,~] = size(vertices);

prev = vertices(1,:);
for i=2:numPoints
    cur = vertices(i,:);
    
    dx = cur(1)-prev(1);
    dy = cur(2)-prev(2);
    [xs,ys] = bresenham(prev(1),prev(2),cur(1),cur(2));
    numPixels = size(xs);
    for i=1:numPixels
        %get section
        %todo: see if this can be sped up
        curX = xs(i);
        curY = ys(i);
        cloneFrom = [curX,curY] + fix(getPerpendicularVector(dx,dy).*distFromLine);
        img = cloneImageSection(img,curX,curY,cloneFrom(1),cloneFrom(2),brushRadius);
    end
    %store previous iteration for speed
    prev = cur;
end
y = img;

function vNormalized = getPerpendicularVector(x,y)
%returns the normalized perpedicular vector

%gradient = y/x;
%orthgradient = -1/gradient;
v = [-y,x];
largest = max(sign(v).*v);
vNormalized = largest./v;

function y = cloneImageSection(img,x1,y1,x2,y2,brushSize)
%copies an area from x2,y2 to x1,y1
lowX1 = fix(x1-brushSize/2);
lowY1 = fix(y1-brushSize/2);
highX1 = lowX1 + brushSize;
highY1 = lowY1 + brushSize;

%check bounds
[sizeY,sizeX] = size(img);
if lowX1 < 1
    lowX1 = 1;
end
if highX1 > sizeX
    highX1 = sizeX;
end
if lowY1 < 1
    lowY1 = 1;
end
if highY1 > sizeY
    highY1 = sizeY;
end

img(lowY1:highY1,lowX1:highX1,:) = getAreaAroundPixel(img,x2,y2,brushSize);
y = img;

function a = getAreaAroundPixel(img,x,y,brushSize)
%using x and y as the center, returns a section of the image img
%with radius brushSize.

%get center
lowX = fix(x-brushSize/2);
lowY = fix(y-brushSize/2);
highX = lowX + brushSize;
highY = lowY + brushSize;

%check bounds
[sizeY,sizeX] = size(img);
if lowX < 1
    lowX = 1;
end
if highX > sizeX
    highX = sizeX;
end
if lowY < 1
    lowY = 1;
end
if highY > sizeY
    highY = sizeY;
end

a = img(lowY:highY,lowX:highX,:);

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(handles.editDistance,'String',num2str(fix(get(hObject,'Value'))));

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(handles.editSize,'String',num2str(fix(get(hObject,'Value'))));

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global IMG;
IMG = getimage(findobj('Tag','axes2'));
close;
showImage();


function editDistance_Callback(hObject, eventdata, handles)
% hObject    handle to editDistance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editDistance as text
%        str2double(get(hObject,'String')) returns contents of editDistance as a double

% --- Executes during object creation, after setting all properties.
function editDistance_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editDistance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editSize_Callback(hObject, eventdata, handles)
% hObject    handle to editSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editSize as text
%        str2double(get(hObject,'String')) returns contents of editSize as a double
try
    %see if the new contents is a number
    num = fix(str2double(get(hObject,'String')));
    if num>=get(handles.slider2,'Min')
        %set slider to match the edited textbox
        if get(handles.slider2,'Max') < num
            set(handles.slider2,'Max',get(handles.slider2,'Max'));
        end
    else
        set(handles.slider2,'Value',15);
        set(hObject,'Value',15);
    end
catch
    set(handles.slider2,'Value',15);
    set(hObject,'Value',15);
end

% --- Executes during object creation, after setting all properties.
function editSize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnRedraw.
function btnRedraw_Callback(hObject, eventdata, handles)
% hObject    handle to btnRedraw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global objPoly;
delete(objPoly);
objPoly =  impoly(handles.axes1,'Closed',false);


% --- Executes on key press with focus on editDistance and none of its controls.
function editDistance_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to editDistance (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
if strfind('0123456789',eventdata.Character)==0
    %if it's not a number, remove it straight away
    s = get(hObject,'String');
    set(hObject,'String',s(1:end-1));
end
try
    %see if the new contents is a number
    num = fix(str2double(get(hObject,'String')));
    if num>=get(handles.slider1,'Min')
        %set slider to match the edited textbox
        if get(handles.slider1,'Max') < num
            set(handles.slider1,'Max',get(handles.slider1,'Max'));
        end
        set(handles.slider1,'Value',num);
        set(hObject,'BackgroundColor',[1,1,1]);
    else
        set(handles.slider1,'Value',15);
        set(hObject,'BackgroundColor',[1,.7,.7]);
    end
catch
    set(handles.slider1,'Value',15);
    set(hObject,'BackgroundColor',[1,.7,.7]);
end


% --- Executes on key press with focus on editSize and none of its controls.
function editSize_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to editSize (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
if strfind('0123456789',eventdata.Character)==0
    %if it's not a number, remove it straight away
    s = get(hObject,'String');
    set(hObject,'String',s(1:end-1));
end
try
    %see if the new contents is a number
    num = fix(str2double(get(hObject,'String')));
    if num>=get(handles.slider2,'Min')
        %set slider to match the edited textbox
        if get(handles.slider2,'Max') < num
            set(handles.slider2,'Max',get(handles.slider2,'Max'));
        end
        set(handles.slider2,'Value',num);
        set(hObject,'BackgroundColor',[1,1,1]);
    else
        set(handles.slider2,'Value',15);
        set(hObject,'BackgroundColor',[1,.7,.7]);
    end
catch
    set(handles.slider2,'Value',15);
    set(hObject,'BackgroundColor',[1,.7,.7]);
end
