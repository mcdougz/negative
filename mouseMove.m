function mouseMove (object, eventdata)
    C = get (gca, 'CurrentPoint');
    x = floor(num2str(C(1,1)));
    y = floor(num2str(C(1,2)));
    coords = strcat('(', x, ', ', y, ')');
    set(findobj(gcf,'-depth',1,'Tag','txtCoords'),'String',coords);
    global IMG;
    rgbinfo = strcat('[',size(IMG,1),',',size(IMG,2),']');
    rgbinfo = strcat(rgbinfo,' (',x,',',y,')');
    rgbinfo = strcat(rgbinfo,' R:',num2str(IMG(x,y,1)));
    rgbinfo = strcat(rgbinfo,' G:',num2str(IMG(x,y,2)));
    rgbinfo = strcat(rgbinfo,' B:',num2str(IMG(x,y,3)));
    set(findobj(gcf,'Tag','txtBottom'),'String',rgbinfo);