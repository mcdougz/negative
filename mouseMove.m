function mouseMove (object, eventdata)
    % when hovering the mouse over the main image. shows pixel info
    % from "How to make a figure current? How to make an axes current?"
    
    %todo: this doesnt need to be a shared file
    if gcf ~= findobj('type','figure','Name','negative')
       return 
    end
    
    set(gcf, 'currentaxes', findobj(gcf,'Tag','axes1'));
    % axes(handles.axes1);
    C = get (gca, 'CurrentPoint');
    x = fix(C(1,1));
    y = fix(C(1,2));
    coords = strcat('(', num2str(x), ', ', num2str(y), ')');
    global IMG;
    rgbinfo = '';
    try
        r = IMG(y,x,1);
        g = IMG(y,x,2);
        b = IMG(y,x,3);
        [h,s,v] = ColourSpaces.RGBtoHSV(r,g,b);
        rgbinfo = strcat(rgbinfo,coords);
        %rgbinfo = strcat(rgbinfo,' R:',num2str(r));
        %rgbinfo = strcat(rgbinfo,' G:',num2str(g));
        %rgbinfo = strcat(rgbinfo,' B:',num2str(b));
        %rgbinfo = strcat(rgbinfo,'  H:',num2str(floor(h)));
        %rgbinfo = strcat(rgbinfo,' S:',num2str(floor(s)));
        %rgbinfo = strcat(rgbinfo,' V:',num2str(floor(v)));
        set(findobj(gcf,'Tag','txtR'),'String',num2str(r));
        set(findobj(gcf,'Tag','txtG'),'String',num2str(g));
        set(findobj(gcf,'Tag','txtB'),'String',num2str(b));
        set(findobj(gcf,'Tag','txtH'),'String',num2str(h));
        set(findobj(gcf,'Tag','txtS'),'String',num2str(s));
        set(findobj(gcf,'Tag','txtV'),'String',num2str(v));
    catch
        rgbinfo = '';
    end %try
    set(findobj(gcf,'Tag','txtBottom'),'String',rgbinfo);
    
    %viewfinder
    viewfinderRect = [x-25,y-25,50,50];
    viewfinder = imcrop(IMG,viewfinderRect);
    %set(findobj(gcf,'Tag','axesViewfinder'),'UserData',viewfinder);
    set(gcf, 'currentaxes', findobj(gcf,'Tag','axesViewfinder'));
    imshow(viewfinder);
    set(gca,'Tag','axesViewfinder');
    %todo: load color info