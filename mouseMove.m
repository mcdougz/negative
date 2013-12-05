function mouseMove (object, eventdata)
    % from "How to make a figure current? How to make an axes current?"
    % set(gcf, 'currentaxes', findobj(gcf,'Tag','axes1'));
    % axes(handles.axes1);
    C = get (gca, 'CurrentPoint');
    x = fix(C(1,1));
    y = fix(C(1,2));
    coords = strcat('(', num2str(x), ', ', num2str(y), ')');
    global IMG;
    rgbinfo = '';
    try
        rgbinfo = strcat(rgbinfo,coords);
        rgbinfo = strcat(rgbinfo,' R:',num2str(IMG(y,x,1)));
        rgbinfo = strcat(rgbinfo,' G:',num2str(IMG(y,x,2)));
        rgbinfo = strcat(rgbinfo,' B:',num2str(IMG(y,x,3)));
    catch
        rgbinfo = strcat(rgbinfo,' Click inside the image first!');
    end %try
    set(findobj(gcf,'Tag','txtBottom'),'String',rgbinfo);