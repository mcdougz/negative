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

% Last Modified by GUIDE v2.5 12-Feb-2014 16:41:15

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
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT
global IMG;
global plotX;
global plotY;
global rectangle;

% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

%####################################################

global IMG;
%image path from gui textbox
IMG = imread(get(handles.edit1,'String'));
%todo: invert image here?
showImage();

%event listeners
set (gcf, 'WindowButtonMotionFcn', @mouseMove);
set (gcf, 'WindowButtonDownFcn', @imgClick);

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
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
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

global IMG;
IMG = invertimage(IMG); %
showImage();


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



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
global IMG;

% get image path from textbox on the gui
IMG = imread(get(hObject,'String'));

% put image dimensions on the right
imgsize = strcat('[',num2str(size(IMG,2)),',',num2str(size(IMG,1)),']');
set(findobj(gcf,'-depth',1,'Tag','txtCoords'),'String',imgsize);

%todo: invert image here?

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
global rectangle;
v = imrect(handles.axes1);
set(v,'Tag','rectangle');
rectangle = v;


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


% ---EXPERIMENT Toolbar button----------------------------------------
function uipushtoolExperiment_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtoolExperiment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global IMG;
IMG = testStretchlim(IMG);
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
