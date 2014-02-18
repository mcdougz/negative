function imgClick(object, eventdata)
%called when mouse clicking on the main image
%todo: click and drag?
C = get (gca, 'CurrentPoint');
global plotX;
global plotY;
plotX = fix(C(1,1));
plotY = fix(C(1,2));

coords = strcat('(',num2str(plotX),', ',num2str(plotY),')');
%coords = strcat('(',num2str(C(1,1)),', ',num2str(C(1,2)),')');
set(findobj(gcf,'Tag','txtCoords'),'String',coords);
%msgbox(coords);

global IMG;
viewfinderRect = [x-25,y-25,50,50];
viewfinder = imcrop(IMG,viewfinderRect);
set(gcf, 'currentaxes', findobj(gcf,'Tag','axesViewfinder2'));
imshow(viewfinder);
set(gca,'Tag','axesViewfinder');
%todo: load color info