function y = removeCast(img,r,g,b)
%removes a colour cast from an image, given the RGB of a black.
% r = red
% g = green
% b = blue
[h,s,v] = ColourSpaces.RGBtoHSV(r,g,b);
newImg = zeros(size(img));

newImg(:,:,1) = img(:,:,1) - r;
newImg(:,:,2) = img(:,:,2) - g;
newImg(:,:,3) = img(:,:,3) - b;

newImg = rgbStretchlim(newImg);

y = newImg;

function removeCast_imadjust(img,r,g,b)
%retired function, slightly broken
if (v<0.8)
    % if the pixel is light set it to white
    newR = imadjust(img(:,:,1),[0 ColourSpaces.normalize(r)]);
    newG = imadjust(img(:,:,2),[0 ColourSpaces.normalize(g)]);
    newB = imadjust(img(:,:,3),[0 ColourSpaces.normalize(b)]);
else
    % if the pixel is dark set it to black
    newR = imadjust(img(:,:,1),[ColourSpaces.normalize(r) 1]);
    newG = imadjust(img(:,:,2),[ColourSpaces.normalize(g) 1]);
    newB = imadjust(img(:,:,3),[ColourSpaces.normalize(b) 1]);
end

newImg(:,:,1) = newR;
newImg(:,:,2) = newG;
newImg(:,:,3) = newB;