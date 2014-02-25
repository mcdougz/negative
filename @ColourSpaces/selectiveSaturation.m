function y=selectiveSaturation(img,hueStart,hueEnd,amount)
%saturate all pixels which are within the specified hues
%based loosely from http://mathworks.co.uk/matlabcentral/answers/48053#answer_58766
%todo: multiple channels for secondary colours

%todo: check if there's a chance hue will be negative
if max(hueStart,hueEnd) > 1
    hueStart = hueStart/255;
    hueEnd = hueEnd/255;
end

y = rgb2hsv(img);
%find indexes of pixels to saturate
[a,b] = find(y(:,:,1)>hueStart & y(:,:,1)<hueEnd);
%saturate them by amount
for j=1:length(A),
    y(a,b,2) = y(a,b,2) + amount;
end
y = hsv2rgb(img);