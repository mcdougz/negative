function y = rgbStretchlim(img)
%uses stretchlim across all three RGB layers.
%method shown in http://stackoverflow.com/a/10878180
y = img;
rstretch = stretchlim(y(:,:,1));
gstretch = stretchlim(y(:,:,2));
bstretch = stretchlim(y(:,:,3));

low = max([rstretch(1),gstretch(1),bstretch(1)]);
high = min([rstretch(2),gstretch(2),bstretch(2)]);

y(:,:,1) = imadjust(y(:,:,1),[low high],[]);
y(:,:,2) = imadjust(y(:,:,2),[low high],[]);
y(:,:,3) = imadjust(y(:,:,3),[low high],[]);