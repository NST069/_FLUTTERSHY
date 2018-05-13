function ffep()
    f = figure('Visible', 'off', 'rend','painters','pos',[200 80 1000 450], 'Name', 'Equilibrium Points');
            graph = axes('Units', 'Pixels', 'Position', [30,30,400,400]);
            bifur = axes('Units', 'Pixels', 'Position', [480,30,400,400]);
            startbtn = uicontrol('Style', 'pushbutton', 'String', 'Start', 'Callback', @startbtn_Callback, 'Position', [900,400,100,30]);
            modebtn = uicontrol('Style', 'togglebutton','String', 'Manual', 'Position', [900,350,100,30]);
            
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
    
    if(modebtn.Value==0)
        %jc = javacomponent(jObj.getComponent, [250,220,80,55], gcf);
    end
        
    startbtn.Visible='off';
    modebtn.Visible='off';
    EQUILIBRIUM(1.5);
    
    if(modebtn.Value==0)
        %delete(jc);
    end
    startbtn.Visible='on';
    modebtn.Visible='on';
    end 
end

