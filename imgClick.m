function imgClick(object, eventdata)
%called when mouse clicking on the main image
%todo: click and drag?
%todo: only need to use this event when clicking the main axes
C = get (gca, 'CurrentPoint');
global plotX;
global plotY;
plotX = fix(C(1,1));
plotY = fix(C(1,2));

coords = strcat('(',num2str(plotX),', ',num2str(plotY),')');
%coords = strcat('(',num2str(C(1,1)),', ',num2str(C(1,2)),')');
set(findobj(gcf,'Tag','txtCoords'),'String',coords);
%msgbox(coords);

%set viewfinder
global IMG;
viewfinderRect = [plotX-25,plotY-25,50,50];
viewfinder = imcrop(IMG,viewfinderRect);
set(gcf, 'currentaxes', findobj(gcf,'Tag','axesViewfinder2'));
imshow(viewfinder);
set(gca,'Tag','axesViewfinder2');

r = IMG(plotY,plotX,1);
g = IMG(plotY,plotX,2);
b = IMG(plotY,plotX,3);
[h,s,v] = ColourSpaces.RGBtoHSV(r,g,b);
set(findobj(gcf,'Tag','txtR2'),'String',num2str(r));
set(findobj(gcf,'Tag','txtG2'),'String',num2str(g));
set(findobj(gcf,'Tag','txtB2'),'String',num2str(b));
set(findobj(gcf,'Tag','txtH2'),'String',num2str(h));
set(findobj(gcf,'Tag','txtS2'),'String',num2str(s));
set(findobj(gcf,'Tag','txtV2'),'String',num2str(v));