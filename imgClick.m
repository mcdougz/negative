function imgClick(object, eventdata)
C = get (gca, 'CurrentPoint');
global plotX;
global plotY;
plotX = num2str(C(1,1));
plotY = num2str(C(1,2));
coords = strcat('(',plotX,', ',plotY,')');
%coords = strcat('(',num2str(C(1,1)),', ',num2str(C(1,2)),')');
set(findobj(gcf,'Tag','txtBottom'),'String',coords);