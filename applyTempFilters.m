function out = applyTempFilters(img)
%Applies temporary filters such as brightness and contrast,
%to be used just before outputting on screen.
if nargin < 1
    global IMG;
    img = IMG;
end
%brightness
brightness = str2double(get(findobj('Tag','editBrightness'),'String'));
img = img * brightness;

out=img;
end