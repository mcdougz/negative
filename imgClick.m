function imgClick(object, eventdata)
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