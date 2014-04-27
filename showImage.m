function showImage()
% displays the image and updates colour histograms
global IMG;
axes(findobj(findobj(0,'Type','figure','Name','negative'),'Tag','axes1'));

%apply filters here instead of editing IMG, to conserve quality
imshow(applyTempFilters(IMG));

%prevent tag being lost when axes changes into an image
set(gca,'Tag','axes1');

%set click event
%set(gca,'HitTest','off');
%set(gca,'ButtonDownFcn',@imgClick);
%set(gca,'HitTest','on');

pan off;

%histograms
axes(findobj(gcf,'Tag','axes2')); imhist(applyTempFilters(IMG(:,:,1)));
set(gca,'Tag','axes2');
axes(findobj(gcf,'Tag','axes3')); imhist(applyTempFilters(IMG(:,:,2)));
set(gca,'Tag','axes3');
axes(findobj(gcf,'Tag','axes4')); imhist(applyTempFilters(IMG(:,:,3)));
set(gca,'Tag','axes4');
axes(findobj(gcf,'Tag','axes5')); imhist(applyTempFilters(rgb2gray(IMG)));
set(gca,'Tag','axes5');
