function showMask()
global selectMask;
axes(findobj(gcf,'Tag','axesSelect')); imshow(selectMask);
set(gca,'Tag','axesSelect');

axes(findobj(gcf,'Tag','axesHist')); imhist(selectMask);
set(gca,'Tag','axesHist');

[size1,size2,size3] = size(selectMask);
txt = strcat(num2str(size1),',',num2str(size2),',',num2str(size3));
set(findobj(gcf,'Tag','text1'),'String',txt);