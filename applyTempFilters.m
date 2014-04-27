function out = applyTempFilters(img)
%Applies temporary filters such as brightness and contrast,
%to be used just before outputting the image on screen.

if nargin < 1
    global IMG;
    img = IMG;
end

%saturation
%TODO: speed up, this takes much longer than the others
Vsaturation = str2double(get(findobj('Tag','editSaturation'),'String'));
if Vsaturation ~= 1.0
    try
        hsv = rgb2hsv(img);
        hsv(:,:,2) = hsv(:,:,2)*Vsaturation;
        img = hsv2rgb(hsv);
    end
end

%contrast, gamma
Vcontrast = str2double(get(findobj('Tag','editContrast'),'String'));
Vgamma = str2double(get(findobj('Tag','editGamma'),'String'));

if Vcontrast~=1 || Vgamma ~= 1.0
    if Vcontrast>=1
        %Vcontrast  | contrast out
        %5          | [0.25 0.75]
        %10         | [0.5 0.5]
        contrastIn = [Vcontrast/20 1-Vcontrast/20];
        img = imadjust(img,contrastIn,[0 1],Vgamma);
    else
        %Vcontrast  | contrast out
        %0.9        | [0.05 0.95]
        %0.8        | [0.1  0.9]
        %0.7        | [0.15 0.85]
        %0.n        | [(1-n)/2 1-((1-n)/2)]
        contrastOut = [(1-Vcontrast)/2 1-((1-Vcontrast)/2)];
        img = imadjust(img,[0 1],contrastOut,Vgamma);
    end
end

%brightness at the end because of higher potential loss of image quality
Vbrightness = str2double(get(findobj('Tag','editBrightness'),'String'));
if Vbrightness ~= 1.0
    img = img * Vbrightness; 
end

%setMatrixMaxValue(m,255); %prevent going above 255
%setMatrixMinValue(m,0); %prevent going below 0
out=img;

function out = setMatrixMaxValue(m,maxVal)
%any values in m which are above the maximum maxVal get set to the maximum.

%n is a binary matrix of any values which are too high
n = m > maxVal;
out = m - mod(n.*m,maxVal);

function out = setMatrixMinValue(m,minVal)
%any values in m which are below the minimum minVal get set to the minimum.

%n is a binary matrix of any values which are too low
n = m < minVal;
out = m - n.*m;