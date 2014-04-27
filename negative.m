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
%      *See GUI Options on GUIDE's Tools menuAutoSamplePhoto.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help negative

% Last Modified by GUIDE v2.5 27-Apr-2014 18:11:17

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

%######################################################################
% Start of OpeningFcn
%######################################################################

%all global variables (don't need to be set beforehand)
%global IMG;
%global plotX;
%global plotY;
%global rectangle;
%global selectMask;

%show loading image, and clear viewfinders
axes(handles.axes1);
imshow(imread('res/loading.png'));
set(gca,'Tag','axes1');
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

%######################################################################
% End of OpeningFcn
%######################################################################


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


%######################################################################
% CreateFcns generated automatically to set correct colour on controls
%######################################################################

function txtImgPath_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit4_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function txtH_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function txtS_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function txtV_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function txtR_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function txtG_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function txtB_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function sliderBrightness_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function sliderContrast_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider4_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function sliderGamma_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function editGamma_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function sliderSaturation_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function editSaturation_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function txtH2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function txtS2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function txtV2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function txtR2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function txtG2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function txtB2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editBrightness_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editContrast_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%####################################################################
%Slider/editbox synch
%####################################################################

%brightness/contrast/gamma/saturation is applied in applyTempFilters(),
%which is called within the showImage() function

function sliderGamma_Callback(hObject, eventdata, handles)
set(findobj('Tag','editGamma'),'String',num2str(get(hObject,'Value')));
showImage();

function sliderSaturation_Callback(hObject, eventdata, handles)
set(findobj('Tag','editSaturation'),'String',num2str(get(hObject,'Value')));
showImage();

function sliderContrast_Callback(hObject, eventdata, handles)
set(findobj('Tag','editContrast'),'String',num2str(get(hObject,'Value')));
showImage();

function sliderBrightness_Callback(hObject, eventdata, handles)
set(findobj('Tag','editBrightness'),'String',num2str(get(hObject,'Value')));
showImage();

function editBrightness_KeyPressFcn(hObject, eventdata, handles)
validateNumToSlider(hObject,findobj('Tag','sliderBrightness'),1);

function editContrast_KeyPressFcn(hObject, eventdata, handles)
validateNumToSlider(hObject,findobj('Tag','sliderContrast'),1);

function editGamma_KeyPressFcn(hObject, eventdata, handles)
validateNumToSlider(hObject,findobj('Tag','sliderGamma'),1);

function editSaturation_KeyPressFcn(hObject, eventdata, handles)
validateNumToSlider(hObject,findobj('Tag','sliderSaturation'),1);

function editBrightness_Callback(hObject, eventdata, handles)
validateNumToSlider(hObject,findobj('Tag','sliderBrightness'),1);
showImage();

function editContrast_Callback(hObject, eventdata, handles)
validateNumToSlider(hObject,findobj('Tag','sliderContrast'),1);
showImage();

function editGamma_Callback(hObject, eventdata, handles)
validateNumToSlider(hObject,findobj('Tag','sliderGamma'),1);
showImage();

function editSaturation_Callback(hObject, eventdata, handles)
validateNumToSlider(hObject,findobj('Tag','sliderSaturation'),1);
showImage();











%######################################################################
% Callbacks and other functions
%######################################################################

function showLoading()
a = findobj(gcf,'Tag','axes1');
axes(a);
imshow(imread('res/loading.png'));
set(a,'Tag','axes1'); % tags get lost after imshow
drawnow;

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
function txtImgPath_Callback(hObject, eventdata, handles)
% hObject    handle to txtImgPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtImgPath as text
%        str2double(get(hObject,'String')) returns contents of txtImgPath as a double

global IMG;
IMG = imread(get(findobj('Tag','txtImgPath'),'String'));

% put image dimensions on the right
imgsize = strcat('[',num2str(size(IMG,2)),',',num2str(size(IMG,1)),']');
set(findobj(gcf,'-depth',1,'Tag','txtCoords'),'String',imgsize);

%invert image
IMG = 255-IMG;

%reset sliders/editboxes
set(gcf,findobj('Tag','sliderBrightness'),'Value',1);
set(gcf,findobj('Tag','editBrightness'),'String',1);
set(gcf,findobj('Tag','sliderContrast'),'Value',1);
set(gcf,findobj('Tag','editContrast'),'String',1);
set(gcf,findobj('Tag','sliderGamma'),'Value',1);
set(gcf,findobj('Tag','editGamma'),'String',1);
set(gcf,findobj('Tag','sliderSaturation'),'Value',1);
set(gcf,findobj('Tag','editSaturation'),'String',1);

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

% ---EXPERIMENT Toolbar button----------------------------------------
function uipushtoolExperiment_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtoolExperiment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%figSelect();
%showMask();




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
newImg(:,:,1) = IMG(:,:,1) - cast(1);
newImg(:,:,2) = IMG(:,:,2) - cast(2);
newImg(:,:,3) = IMG(:,:,3) - cast(3);

IMG = newImg;
showImage();

% --------------------------------------------------------------------
function menuCastMaxrgb_Callback(hObject, eventdata, handles)
% hObject    handle to menuCastMaxrgb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global IMG;
IMG = maxRGB(IMG);
showImage();

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
%TODO: improve this, it can easily fail
global IMG;
[sizey,sizex] = size(IMG);
cast = median(IMG(sizey-25,:,:));
IMG = removeCast(IMG,cast(1),cast(2),cast(3));
%crop a bit off the bottom
IMG = IMG(1:(end-40),:,:);
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
global rectangle;
r = regionprops(~im2bw(IMG,0.8),'Area','BoundingBox');
biggest = 1;
for i = 1:length(r)
    if r(i).Area > r(biggest).Area
        biggest = i;
    end
end

IMG = imcrop(IMG,r(biggest).BoundingBox);
showImage();
[sizey,sizex] = size(IMG);
rectangle = imrect(findobj(gcf,'Tag','axes1'),[5,5,sizex/3-10,sizey-10]);

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
IMG(:,:,1) = fliplr(IMG(:,:,1));
IMG(:,:,2) = fliplr(IMG(:,:,2));
IMG(:,:,3) = fliplr(IMG(:,:,3));
showImage();

% --------------------------------------------------------------------
function menuEnhanceFlipV_Callback(hObject, eventdata, handles)
% hObject    handle to menuEnhanceFlipV (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global IMG;
IMG(:,:,1) = flipud(IMG(:,:,1));
IMG(:,:,2) = flipud(IMG(:,:,2));
IMG(:,:,3) = flipud(IMG(:,:,3));
showImage();

% --------------------------------------------------------------------
function menuEnhanceRotate_Callback(hObject, eventdata, handles)
% hObject    handle to menuEnhanceRotate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global IMG;
newImg(:,:,1) = rot90(IMG(:,:,1));
newImg(:,:,2) = rot90(IMG(:,:,2));
newImg(:,:,3) = rot90(IMG(:,:,3));
IMG = newImg;
showImage();


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
    imwrite(IMGs{i},[pathName '\' fileName '_' num2str(i) '.jpg']);
end

% --------------------------------------------------------------------
function menuAdvBatchCast_Callback(hObject, eventdata, handles)
% hObject    handle to menuAdvBatchCast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%applies grayworld to all images in a directory
pathName = uigetdir(pwd,'Select a directory to save multiple images');

%based on http://mathworks.co.uk/matlabcentral/answers/385-how-to-read-images-in-a-folder#answer_526
imagefiles = dir([pathName '\*.jpg']);
nfiles = length(imagefiles);
for i=1:nfiles
   currentfilename = imagefiles(i).name;
   currentimage = imread(currentfilename);
   currentimage = grayWorld(currentimage);
   imwrite(currentimage,currentfilename);
end

% --------------------------------------------------------------------
function menuAdvInvert_Callback(hObject, eventdata, handles)
% hObject    handle to menuAdvInvert (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global IMG;
IMG = 255-IMG;
showImage();


% --------------------------------------------------------------------
function menuAutoSamplePhoto_Callback(hObject, eventdata, handles)
% hObject    handle to menuAutoSamplePhoto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(gcf,findobj('Tag','sliderBrightness'),'Value',1.1);
set(gcf,findobj('Tag','editBrightness'),'String',1.1);
set(gcf,findobj('Tag','sliderContrast'),'Value',1.3);
set(gcf,findobj('Tag','editContrast'),'String',1.3);
menuAutoCrop_Callback(hObject,eventdata,handles);
menuCastDetectFilm_Callback(hObject,eventdata,handles);
%TODO: possibly detect rotated images?
