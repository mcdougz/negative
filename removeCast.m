function y = removeCast(img,r,g,b)
%removes a colour cast from an image, given the RGB of a white.
% r = red
% g = green
% b = blue
y=255-img;
[h,s,v] = ColourSpaces.RGBtoHSV(r,g,b);

rChange=r;
gChange=g;
bChange=b;

%work in progress:
% trying to set light things to white
if (v>0.5)
    rChange=-r;
    gChange=-g;
    bChange=-b;
end

%for i=1:size(img,1)
%    for j=1:size(img,2)
%        y(i,j) = y(i,j) + [rChange gChange bChange];
%    end
%end

y(:,:,1) = y(:,:,1)+rChange;
y(:,:,2) = y(:,:,2)+gChange;
y(:,:,3) = y(:,:,3)+bChange;


y=255-y;
%y = testStretchlim(y);

function y = testStretchlim(img)
%method shown in http://stackoverflow.com/a/10878180
y = img;
rstretch = stretchlim(y(:,:,1));
gstretch = stretchlim(y(:,:,2));
bstretch = stretchlim(y(:,:,3));

y(:,:,1) = imadjust(y(:,:,1),rstretch,[]);
y(:,:,2) = imadjust(y(:,:,2),gstretch,[]);
y(:,:,3) = imadjust(y(:,:,3),bstretch,[]);