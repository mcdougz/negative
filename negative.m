function varargout = negative(varargin)
% NEGATIVE MATLAB code for negative.fig
%      NEGATIVE, by itself, creates a new NEGATIVE or raises the existing
%      singleton*.
%
%      H = NEGATIVE returns the handle to a new NEGATIVE or the handle to
%      the existing singleton*.
%
%      NEGATIVE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEGATIVE.M with the given input arguments.
%
%      NEGATIVE('Property','Value',...) creates a new NEGATIVE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before negative_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to negative_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help negative

% Last Modified by GUIDE v2.5 26-Apr-2014 17:08:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @negative_OpeningFcn, ...
                   'gui_OutputFcn',  @negative_OutputFcn, ...
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

% --- Executes just before negative is made visible.
function negative_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to negative (see VARARGIN)

%####################################################

%all global variables (don't need to be set beforehand)
%global IMG;
%global plotX;
%global plotY;
%global rectangle; %can probably remove global rectangle
%global selectMask;

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


% Choose default command line output for negative
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes negative wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = negative_OutputFcn(hObject, eventdata, handles) 
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
function sliderContrast_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderContrast (see GCBO)
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
delete(rectangle);
rectangle = imrect(findobj(gcf,'Tag','axes1'),[5,5,sizey/3-10,sizex-10]);

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
IMG = imread(get(hObject,'String'));

% put image dimensions on the right
imgsize = strcat('[',num2str(size(IMG,2)),',',num2str(size(IMG,1)),']');
set(findobj(gcf,'-depth',1,'Tag','txtCoords'),'String',imgsize);

%invert image
IMG = 255-IMG;

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

%todo: check if rectangle exists
global rectangle;
delete(rectangle);
rectangle = imrect(handles.axes1);


% --------------------------------------------------------------------
function btnPushContrast_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to btnPushContrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global IMG;

IMG = imadjust(IMG,[0 0.8],[0 1]);
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

%brightness is applied in the showImage() function
showImage();

% --------------------------------------------------------------------
function menuCrop_Callback(hObject, eventdata, handles)
% hObject    handle to menuCrop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global rectangle;
global IMG;
try
    pos = getPosition(rectangle);
    IMG = imcrop(IMG,pos);
    delete(rectangle);
    showImage();
catch
    msgbox({'A rectangle was needed but could not be found.'...
        'Redrawing rectangle, try again.'},'Rectangle Missing','warn');
end

%new rect
[sizex,sizey] = size(IMG);
rectangle = imrect(findobj(gcf,'Tag','axes1'),[5,5,sizey/3-10,sizex-10]);

% --------------------------------------------------------------------
function menuRepairStain_Callback(hObject, eventdata, handles)
% hObject    handle to menuRepairStain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
figStainRemoval();

% --------------------------------------------------------------------
function menuRepairLine_Callback(hObject, eventdata, handles)
% hObject    handle to menuRepairLine (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
figLineRemover();

% --------------------------------------------------------------------
function menuCastBlack_Callback(hObject, eventdata, handles)
% hObject    handle to menuCastBlack (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%TODO: check that plotX, plotY has been selected
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

% --------------------------------------------------------------------
function menuCastGray_Callback(hObject, eventdata, handles)
% hObject    handle to menuCastGray (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%sets the selected colour to grey
global IMG;
global plotX;
global plotY;
showLoading();

R = IMG(plotY,plotX,1);
G = IMG(plotY,plotX,2);
B = IMG(plotY,plotX,3);

grey = mean([R G B]);
cast = [R G B] - grey;
IMG = IMG-cast(1)-cast(2)-cast(3);
showImage();

% --------------------------------------------------------------------
function menuCastMaxrgb_Callback(hObject, eventdata, handles)
% hObject    handle to menuCastMaxrgb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global IMG;
maxR = 255-max(IMG(:,:,1));
maxG = 255-max(IMG(:,:,2));
maxB = 255-max(IMG(:,:,3));
IMG(:,:,1) = IMG(:,:,1)+(255-maxR);
IMG(:,:,2) = IMG(:,:,2)+(255-maxG);
IMG(:,:,3) = IMG(:,:,3)+(255-maxB);

% --------------------------------------------------------------------
function menuCastGrayworld_Callback(hObject, eventdata, handles)
% hObject    handle to menuCastGrayworld (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global IMG;
IMG = grayWorld(IMG);
showImage();

% --------------------------------------------------------------------
function menuCastDetectFilm_Callback(hObject, eventdata, handles)
% hObject    handle to menuCastDetectFilm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%quite bad, assumes the film is exposed 10 pixels above the bottom edge,
% and ignores holes in film.
%TODO: improve this
global IMG;
[sizey,sizex] = size(IMG);
cast = median(IMG(sizey-10,:,:));
IMG = removeCast(IMG,cast(1),cast(2),cast(3));
showImage();

% --------------------------------------------------------------------
function menuFileSave_Callback(hObject, eventdata, handles)
% hObject    handle to menuFileSave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

imgSave();

% --------------------------------------------------------------------
function menuFileExit_Callback(hObject, eventdata, handles)
% hObject    handle to menuFileExit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Construct a questdlg with three options
choice = questdlg('Save before closing?', ...
	'Quit?', ...
	'Save','Don''t Save','Cancel','Save');
% Handle response
switch choice
    case 'Save'
        uiwait(imgSave());
    case 'Cancel'
        return;
end
close all;

% --------------------------------------------------------------------
function uipushtoolSave_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtoolSave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imgSave();

% --------------------------------------------------------------------
function menuEnhanceUnsharp_Callback(hObject, eventdata, handles)
% hObject    handle to menuEnhanceUnsharp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
figSharpen();

% --------------------------------------------------------------------
function menuEnhanceHisteq_Callback(hObject, eventdata, handles)
% hObject    handle to menuEnhanceHisteq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global IMG;
s = size(IMG);
for i=1:s(3)
    IMG(:,:,i) = histeq(IMG(:,:,i));
end

% --------------------------------------------------------------------
function menuAutoCrop_Callback(hObject, eventdata, handles)
% hObject    handle to menuAutoCrop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%automatically crop
global IMG;
r = regionprops(~im2bw(IMG,0.8),'Area','BoundingBox');
biggest = 1;
for i = 1:length(r)
    if r(i).Area > r(biggest).Area
        biggest = i;
    end
end

IMG = imcrop(IMG,r(biggest).BoundingBox);
showImage();
[sizex,sizey] = size(IMG);
imrect(findobj(gcf,'Tag','axes1'),[5,5,sizey/3-10,sizex-10]);



function editBrightness_Callback(hObject, eventdata, handles)
% hObject    handle to editBrightness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editBrightness as text
%        str2double(get(hObject,'String')) returns contents of editBrightness as a double


% --- Executes during object creation, after setting all properties.
function editBrightness_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editBrightness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editContrast_Callback(hObject, eventdata, handles)
% hObject    handle to editContrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editContrast as text
%        str2double(get(hObject,'String')) returns contents of editContrast as a double


% --- Executes during object creation, after setting all properties.
function editContrast_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editContrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function menuAutoContrast_Callback(hObject, eventdata, handles)
% hObject    handle to menuAutoContrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global IMG;
IMG = rgbStretchlim(IMG);
showImage();

% --------------------------------------------------------------------
function menuEnhanceFlipH_Callback(hObject, eventdata, handles)
% hObject    handle to menuEnhanceFlipH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global IMG;
IMG = fliplr(IMG);
showImage();

% --------------------------------------------------------------------
function menuEnhanceFlipV_Callback(hObject, eventdata, handles)
% hObject    handle to menuEnhanceFlipV (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global IMG;
IMG = flipud(IMG);
showImage();

% --------------------------------------------------------------------
function menuEnhanceRotate_Callback(hObject, eventdata, handles)
% hObject    handle to menuEnhanceRotate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global IMG;
IMG = rot90(IMG);
showImage();


% --------------------------------------------------------------------
function menuAdv_Callback(hObject, eventdata, handles)
% hObject    handle to menuAdv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menuAdvBatchSplit_Callback(hObject, eventdata, handles)
% hObject    handle to menuAdvBatchSplit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%find the main part of the filename
fileName = get(findobj('Tag','txtImgPath'),'String');
fileName = strsplit(fileName,'/');
fileName = fileName(end);
fileName = strsplit(fileName,'.');
fileName = fileName(1);

%pick a directory to save the split images
pathName = uigetdir(pwd,'Select a directory to save multiple images');

%split + save the images
global IMG;
IMGs = splitSameImg(IMG,0.2);
for i=1:size(IMGs)
    imwrite(IMGs{i},[fileName '_' num2str(i) '.jpg']);
end

% --------------------------------------------------------------------
function menuAdvBatchCast_Callback(hObject, eventdata, handles)
% hObject    handle to menuAdvBatchCast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%TODO
%select a folder
%for each image in that folder
%apply colour cast
pathName = uigetdir(pwd,'Select a directory to save multiple images');
%based on http://mathworks.co.uk/matlabcentral/answers/385-how-to-read-images-in-a-folder#answer_526
images = dir('.jpg');
nfiles = length(imagefiles);
for i=1:nfiles
   currentfilename = imagefiles(i).name;
   currentimage = imread(currentfilename);
   %TODO: max RGB here
end

% --------------------------------------------------------------------
function menuAdvInvert_Callback(hObject, eventdata, handles)
% hObject    handle to menuAdvInvert (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global IMG;
IMG = 255-IMG;
showImage();


% --- Executes on slider movement.
function sliderGamma_Callback(hObject, eventdata, handles)
% hObject    handle to sliderGamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function sliderGamma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderGamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function editGamma_Callback(hObject, eventdata, handles)
% hObject    handle to editGamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editGamma as text
%        str2double(get(hObject,'String')) returns contents of editGamma as a double


% --- Executes during object creation, after setting all properties.
function editGamma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editGamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function sliderSaturation_Callback(hObject, eventdata, handles)
% hObject    handle to sliderSaturation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function sliderSaturation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderSaturation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function editSaturation_Callback(hObject, eventdata, handles)
% hObject    handle to editSaturation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editSaturation as text
%        str2double(get(hObject,'String')) returns contents of editSaturation as a double


% --- Executes during object creation, after setting all properties.
function editSaturation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editSaturation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function sliderContrast_Callback(hObject, eventdata, handles)
% hObject    handle to sliderContrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
