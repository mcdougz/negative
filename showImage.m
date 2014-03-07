function showImage()
% displays the image and updates colour histograms
% splitting matrix from stackoverflow question,
% "How do I display the red channel of an image in Matlab?"
global IMG;
axes(findobj(gcf,'Tag','axes1'));

%apply filters here instead of replacing IMG
brightness = get(findobj('Tag','sliderBrightness'),'Value');

imshow(IMG * brightness);

%fix stuff
set(gca,'Tag','axes1');

%set click event
%set(gca,'HitTest','off');
%set(gca,'ButtonDownFcn',@imgClick);
%set(gca,'HitTest','on');

pan off;

axes(findobj(gcf,'Tag','axes2')); imhist(IMG(:,:,1));
set(gca,'Tag','axes2');
axes(findobj(gcf,'Tag','axes3')); imhist(IMG(:,:,2));
set(gca,'Tag','axes3');
axes(findobj(gcf,'Tag','axes4')); imhist(IMG(:,:,3));
set(gca,'Tag','axes4');
axes(findobj(gcf,'Tag','axes5')); imhist(rgb2gray(IMG));
set(gca,'Tag','axes5');
