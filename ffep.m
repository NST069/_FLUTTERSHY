function ffep()
    f = figure('Visible', 'off', 'rend','painters','pos',[200 80 1000 450], 'Name', 'Equilibrium Points');
            %graph = axes('Units', 'Pixels', 'Position', [30,30,400,400]);
            %bifur = axes('Units', 'Pixels', 'Position', [480,30,400,400]);
            startbtn = uicontrol('Style', 'pushbutton', 'String', 'Start', 'Callback', @startbtn_Callback, 'Position', [900,400,100,30]);
            edit_r = uicontrol('Style', 'edit', 'String', '5', 'Position', [900,350,40,25]);
            edit_c = uicontrol('Style', 'edit', 'String', '10', 'Position', [950,350,40,25]);
            rstr = uicontrol('Style', 'text', 'String', 'R', 'Position', [900,300,40,25]);
            cstr = uicontrol('Style', 'text', 'String', 'C', 'Position', [950,300,40,25]);
            
            f.Units='normalized';

    f.Visible='on';

    try
        % R2010a and newer
        iconsClassName = 'com.mathworks.widgets.BusyAffordance$AffordanceSize';
        iconsSizeEnums = javaMethod('values',iconsClassName);
        jObj = com.mathworks.widgets.BusyAffordance(iconsSizeEnums(1), 'calculating...');  % icon, label
    catch
        % R2009b and earlier
        redColor   = java.awt.Color(1,0,0);
        blackColor = java.awt.Color(0,0,0);
        jObj = com.mathworks.widgets.BusyAffordance(redColor, blackColor);
    end
    
    function startbtn_Callback(hObject, eventdata)
    % hObject    handle to submit (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    %global args;
        
    startbtn.Visible='off';
    edit_r.Visible='off';
    edit_c.Visible='off';
    rstr.Visible='off';
    cstr.Visible='off';
    
    rr=str2double(get(edit_r,'String'));
    cc=str2double(get(edit_c,'String'));
    if(rr==0 || isnan(rr)) r=5; edit_r.String=r; else r=rr; end
    if(isnan(cc)) c=0; edit_c.String=c; else c=cc; end
    EQUILIBRIUM(r, c);
    
    startbtn.Visible='on';
    edit_r.Visible='on';
    edit_c.Visible='on';
    rstr.Visible='on';
    cstr.Visible='on';
    end 
end

