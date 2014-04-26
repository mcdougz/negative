function validateNumToSlider(hObject,oSlider,defaultVal)
%validates a textbox and matches the relevant slider
if strfind('0123456789',eventdata.Character)==0
    %if it's not a number, remove it straight away
    s = get(hObject,'String');
    set(hObject,'String',s(1:end-1));
end
try
    %see if the new contents is a number
    num = str2double(get(hObject,'String'));
    if num>=get(oSlider,'Min')
        %set slider to match the edited textbox
        if get(oSlider,'Max') < num
            set(oSlider,'Max',get(oSlider,'Max'));
        end
        set(oSlider,'Value',num);
        set(hObject,'BackgroundColor',[1,1,1]);
    else
        set(oSlider,'Value',defaultVal);
        set(hObject,'BackgroundColor',[1,.7,.7]);
    end
catch
    set(handles.slider2,'Value',defaultVal);
    set(hObject,'BackgroundColor',[1,.7,.7]);
end
