function feq4p
%FEQ4P Summary of this function goes here
%   Detailed explanation goes here
    f = figure('Visible', 'off', 'rend','painters','pos',[500 80 550 600], 'Name', 'Non-Linear Equation For Pendulum');
            afun2d = axes('Units', 'Pixels', 'Position', [30,300,500,200]);
            omegavalpha3d = axes('Units', 'Pixels', 'Position', [30,30,500,200]);
            startbtn = uicontrol('Style', 'pushbutton', 'String', 'Start', 'Callback', @startbtn_Callback, 'Position', [215,550,100,30]);
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
    
    jc = javacomponent(jObj.getComponent, [250,220,80,55], gcf);
    jObj.setPaintsWhenStopped(true);
    
    startbtn.Visible='off';
    
    nleq4p(jObj);
    
    delete(jc);
    startbtn.Visible='on';
    end

end

