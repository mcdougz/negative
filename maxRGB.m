function out = maxRGB(img)
%max RGB / white patch algorithm for colour correction
%assumes the brighest pixel to be white

%split channels
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

%find brightest in each channel
maxR = max(max(R));
maxG = max(max(G));
maxB = max(max(B));

%apply and output
newImg(:,:,1) = imadjust(R,[0 ColourSpaces.normalize(maxR)]);
newImg(:,:,2) = imadjust(G,[0 ColourSpaces.normalize(maxG)]);
newImg(:,:,3) = imadjust(B,[0 ColourSpaces.normalize(maxB)]);
out = newImg;
