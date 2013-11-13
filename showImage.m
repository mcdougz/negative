function showImage(handles)
% splitting matrix from stackoverflow question,
% "How do I display the red channel of an image in Matlab?"
global IMG;
axes(handles.axes1); imshow(IMG);
axes(handles.axes2); imhist(IMG(:,:,1));
axes(handles.axes3); imhist(IMG(:,:,2));
axes(handles.axes4); imhist(IMG(:,:,3));
axes(handles.axes5); imhist(rgb2gray(IMG));
