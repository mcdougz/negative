function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 05-Mar-2014 11:35:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_untitledfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

%####################################################

%all global variables (don't need to be set beforehand)
%global IMG;
%global plotX;
%global plotY;
%global rectangle; %can probably remove global rectangle
%global selectMask;
global advancedMode;
advancedMode = 0; %TODO: make this changeable

%temp: make viewfinders not show ugly empty axes
axes(handles.axesViewfinder);
imshow([]);
set(gca,'Tag','axesViewfinder');
axes(handles.axesViewfinder2);
imshow([]);
set(gca,'Tag','axesViewfinder2');

%event listeners
set (gcf, 'WindowButtonMotionFcn', @mouseMove);
set (gcf, 'WindowButtonDownFcn', @imgClick);

%load image from txtImgPath
txtImgPath_Callback(handles.txtImgPath, eventdata, handles);



%####################################################


% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes during object creation, after setting all properties.
function txtImgPath_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtImgPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function txtH_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function txtS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function txtV_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtV (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function txtR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function txtG_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function txtB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function sliderBrightness_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderBrightness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function txtH2_Callback(hObject, eventdata, handles)
% hObject    handle to txtH2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtH2 as text
%        str2double(get(hObject,'String')) returns contents of txtH2 as a double


% --- Executes during object creation, after setting all properties.
function txtH2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtH2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtS2_Callback(hObject, eventdata, handles)
% hObject    handle to txtS2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtS2 as text
%        str2double(get(hObject,'String')) returns contents of txtS2 as a double


% --- Executes during object creation, after setting all properties.
function txtS2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtS2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtV2_Callback(hObject, eventdata, handles)
% hObject    handle to txtV2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtV2 as text
%        str2double(get(hObject,'String')) returns contents of txtV2 as a double


% --- Executes during object creation, after setting all properties.
function txtV2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtV2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtR2_Callback(hObject, eventdata, handles)
% hObject    handle to txtR2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtR2 as text
%        str2double(get(hObject,'String')) returns contents of txtR2 as a double


% --- Executes during object creation, after setting all properties.
function txtR2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtR2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtG2_Callback(hObject, eventdata, handles)
% hObject    handle to txtG2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtG2 as text
%        str2double(get(hObject,'String')) returns contents of txtG2 as a double


% --- Executes during object creation, after setting all properties.
function txtG2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtG2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtB2_Callback(hObject, eventdata, handles)
% hObject    handle to txtB2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtB2 as text
%        str2double(get(hObject,'String')) returns contents of txtB2 as a double


% --- Executes during object creation, after setting all properties.
function txtB2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtB2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end















% --------------------------------------------------------------------
function showLoading()
a = findobj(gcf,'Tag','axes1');
axes(a);
imshow(imread('res/loading.png'));
set(a,'Tag','axes1'); % tags get lost after imshow
drawnow;

function toolbarInvertImage(hObject, eventdata, handles)
% hObject    handle to toolbarInvert (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% from stackoverflow question,
% "How do I display the red channel of an image in Matlab?"
showLoading();

% Note: this function is called by more than just the GUI,
% so be careful if code is added that uses the function args
global IMG;
IMG = invertimage(IMG); %
showImage();


% --------------------------------------------------------------------
function btnPushCrop_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to btnPushCrop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global rectangle;
global IMG;
pos = getPosition(rectangle);
IMG = imcrop(IMG,pos);
showImage();

%new rect
[sizex,sizey] = size(IMG);
v = imrect(findobj(gcf,'Tag','axes1'),[5,5,sizey/3-10,sizex-10]);
rectangle = v;

% --------------------------------------------------------------------
function toolbarHisteq_OnCallback(hObject, eventdata, handles)
% hObject    handle to toolbarHisteq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global IMG;
%TODO: using backups like this is bad, see OffCallback fn
global backupIMG;
backupIMG = IMG;
%TODO: loop this through channels instead of assuming three
IMG(:,:,1) = adapthisteq(IMG(:,:,1));
IMG(:,:,2) = adapthisteq(IMG(:,:,2));
IMG(:,:,3) = adapthisteq(IMG(:,:,3));
showImage();

% --------------------------------------------------------------------
function toolbarHisteq_OffCallback(hObject, eventdata, handles)
% hObject    handle to toolbarHisteq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%TODO: Any changes made in between turning it on and off will be lost, find
%a way to fix it (maybe have a history of changes made?)
global IMG;
global backupIMG;
IMG = backupIMG;
showImage();



function txtImgPath_Callback(hObject, eventdata, handles)
% hObject    handle to txtImgPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtImgPath as text
%        str2double(get(hObject,'String')) returns contents of txtImgPath as a double
global IMG;
global advancedMode;

% get image path from textbox on the gui
IMG = imread(get(hObject,'String'));

% put image dimensions on the right
imgsize = strcat('[',num2str(size(IMG,2)),',',num2str(size(IMG,1)),']');
set(findobj(gcf,'-depth',1,'Tag','txtCoords'),'String',imgsize);

%invert image
toolbarInvertImage(handles.toolbarInvert,eventdata,handles);

%create an imrect and select only the 'useful' area
r = regionprops(~im2bw(IMG,0.8),'Area','BoundingBox');
biggest = 1;
for i = 1:length(r)
    if r(i).Area > r(biggest).Area
        biggest = i;
    end
end
if advancedMode == 1
    v = imrect(handles.axes1,r(biggest).BoundingBox);
else
    %automatically crop
    IMG = imcrop(IMG,r(biggest).BoundingBox);
    showImage();
    [sizex,sizey] = size(IMG);
    v = imrect(findobj(gcf,'Tag','axes1'),[5,5,sizey/3-10,sizex-10]);
end

%todo: take a little more off the sides to remove borders
%todo: the reel will probably be near this border
set(v,'Tag','rectangle');
rectangle = v;

showImage();
%todo: reset adjustments to off

% --------------------------------------------------------------------
function btnPushOne_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to btnPushOne (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%'One': removecast -> invert
global IMG;
showLoading();
IMG = imread('photo/2.jpg');
%cast for 2.jpg
IMG = removeCast(IMG,200-255,210-255,183-255);
IMG = invertimage(IMG);
showImage();


% --------------------------------------------------------------------
function btnPushTwo_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to btnPushTwo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%'Two': adapthisteq -> removecast -> invert
global IMG;
showLoading();
IMG = imread('photo/2.jpg');
IMG(:,:,1) = adapthisteq(IMG(:,:,1));
IMG(:,:,2) = adapthisteq(IMG(:,:,2));
IMG(:,:,3) = adapthisteq(IMG(:,:,3));
%cast for 2.jpg
IMG = removeCast(IMG,207-255,211-255,190-255);
IMG = invertimage(IMG);

showImage();


% --------------------------------------------------------------------
function btnPushThree_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to btnPushThree (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%'Three': removecast -> invert -> adapthisteq
global IMG;
showLoading();
IMG = imread('photo/2.jpg');
%cast for 2.jpg
IMG = removeCast(IMG,200-255,210-255,183-255);
IMG = invertimage(IMG);
IMG(:,:,1) = adapthisteq(IMG(:,:,1));
IMG(:,:,2) = adapthisteq(IMG(:,:,2));
IMG(:,:,3) = adapthisteq(IMG(:,:,3));
showImage();


% --------------------------------------------------------------------
function btnPushRect_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to btnPushRect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function btnPushContrast_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to btnPushContrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global IMG;

IMG = imadjust(IMG,[0 0.8],[0 1]);
showImage();


% --------------------------------------------------------------------
function btnPushCastWhite_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to btnPushCastWhite (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global IMG;
global plotX;
global plotY;
showLoading();

R = IMG(plotY,plotX,1);
G = IMG(plotY,plotX,2);
B = IMG(plotY,plotX,3);
%todo: make it so it knows if the image is inverted or not.
IMG = removeCast(IMG,R,G,B);
showImage();


function testremovecast2()
%calls the new removeCast2 instead to see if its a better algorithm
global IMG;
global plotX;
global plotY;
showLoading();

R = IMG(plotY,plotX,1);
G = IMG(plotY,plotX,2);
B = IMG(plotY,plotX,3);
%todo: make it so it knows if the image is inverted or not.
IMG = removeCast2(IMG,R,G,B);
showImage();


% ---EXPERIMENT Toolbar button----------------------------------------
function uipushtoolExperiment_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtoolExperiment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global selectMask;
figSelect();
showMask();


% --- Executes on slider movement.
function sliderBrightness_Callback(hObject, eventdata, handles)
% hObject    handle to sliderBrightness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
showImage();
