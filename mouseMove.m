function mouseMove (object, eventdata)
    C = get (gca, 'CurrentPoint');
    coords = strcat('(', num2str(C(1,1)), ', ',num2str(C(1,2)), ')');
    set(findobj(gcf,'-depth',1,'Tag','txtCoords'),'String',coords);