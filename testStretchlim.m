function y = testStretchlim(img)
%method shown in http://stackoverflow.com/a/10878180
y = img;
y = imadjust(stretchlim(y),[]);
%rstretch = stretchlim(y(:,:,1));
%gstretch = stretchlim(y(:,:,2));
%bstretch = stretchlim(y(:,:,3));

%y(:,:,1) = imadjust(y(:,:,1),rstretch,[]);
%y(:,:,2) = imadjust(y(:,:,2),gstretch,[]);
%y(:,:,3) = imadjust(y(:,:,3),bstretch,[]);