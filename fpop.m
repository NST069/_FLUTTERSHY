function fpop
%FPOP Summary of this function goes here
%   Detailed explanation goes here
    f = figure('Visible', 'off', 'rend','painters','pos',[500 80 500 350],'Name', 'Plate Oscillation Problem');
            edit_m = uicontrol('Style', 'edit', 'String', '10', 'Position', [345,220,45,25]);
            edit_j = uicontrol('Style', 'edit', 'String', '10', 'Position', [395,220,45,25]);
            edit_k = uicontrol('Style', 'edit', 'String', '.5', 'Position', [445,220,45,25]);
            mstr = uicontrol('Style', 'text', 'String', 'M', 'Position', [345,190,45,25]);
            jstr = uicontrol('Style', 'text', 'String', 'J', 'Position', [395,190,45,25]);
            kstr = uicontrol('Style', 'text', 'String', 'K', 'Position', [445,190,45,25]);
            tspan_selector = uicontrol('Style', 'slider', 'Min', 100, 'Max', 1100, 'Callback', @slider_value, 'SliderStep', [.1 .1], 'Value', 100, 'Position', [345,310,120,25]);
            tspan_value = uicontrol('Style', 'text', 'String', tspan_selector.Value, 'Position', [470,310,30,25]);
            lpckr=sprintf('%f\n%f\n%f\n%f', 5, 8, 10.5, 12);
            length_picker = uicontrol('Style', 'popupmenu', 'String', lpckr, 'Position', [345,250,150,25]);
            rstr = uicontrol('Style', 'text', 'String', 'r=', 'Position', [345,170,30,25]);
            rpckr=sprintf('%f\n%f\n%f\n%f\n%f\n%f\n%f', 10,5,2,0,-1,-2,-6);
            r_picker = uicontrol('Style', 'popupmenu', 'String', rpckr, 'Position', [380,175,110,25]);
            llpp = uicontrol('Style', 'text', 'String', 'Length', 'Position', [345,280,150,15]);
            submit = uicontrol('Style', 'pushbutton', 'String', 'Set Initial Conditions', 'Callback', @submit_Callback, 'Position', [345,150,150,25]);
            stblty = uicontrol('Style', 'text', 'String', '', 'Position', [345,100,150,25]);
            result = axes('Units', 'Pixels', 'Position', [30,30,300,300])
                grid on
                xlabel('teta')
                ylabel('Y')
                title('Solution Of The Plate Oscillation Problem');

            f.Units='normalized';

    f.Visible='on';

    try
        % R2010a and newer
        iconsClassName = 'com.mathworks.widgets.BusyAffordance$AffordanceSize';
        iconsSizeEnums = javaMethod('values',iconsClassName);
        jObj = com.mathworks.widgets.BusyAffordance(iconsSizeEnums(2), '');  % icon, label
    catch
        % R2009b and earlier
        redColor   = java.awt.Color(1,0,0);
        blackColor = java.awt.Color(0,0,0);
        jObj = com.mathworks.widgets.BusyAffordance(redColor, blackColor);
    end

    % --- Executes on button press in submit.
    function submit_Callback(hObject, eventdata)
    % hObject    handle to submit (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    %global args;
    
    axes(result) 
    cla reset;
    result.Visible='off';
    stblty.String='';
    
    jc = javacomponent(jObj.getComponent, [10,10,80,80], gcf);
    
    mm=str2double(get(edit_m,'String'));
    JJ=str2double(get(edit_j,'String'));
    kk=str2double(get(edit_k,'String'));
    if(mm==0 || isnan(mm)) m=10; edit_m.String=m; else m=mm; end
    if(JJ==0 || isnan(JJ)) J=10; edit_j.String=J; else J=JJ; end
    if(kk==0 || isnan(kk)) k=.5; edit_k.String=k; else k=kk; end
    %L=length_picker.String;
    step = round(tspan_selector.Value);
    switch length_picker.Value
          case 1
            L=5.0;
          case 2
            L=8.0;
          case 3
            L=10.5;
          case 4
            L=12.0;
    end
    switch r_picker.Value
        case 1
            R=10;
        case 2
            R=5;
        case 3
            R=2;
        case 4
            R=0;
        case 5
            R=-1
        case 6
            R=-2
        case 7
            R=-6
    end
    
    s=sprintf('Stability Rgn');
    jObj.setBusyText(s);
    jObj.start;
    pause(.1);
    [c,V,isStable]=stability(R, m, J, k);
    if(isStable==1) stblty.String='Position Stable';
    else stblty.String='Position Unstable';
    end
    jObj.stop;
    [Y3, Y1]=setInitCond();
    
    jObj.start;
    jObj.setBusyText('calculating...');
    flttr=FLTTR(m,J,c,V,k,Y3,Y1, L, step);
    jObj.stop;
    
    delete(jc);
    
    result.Visible='on';
    axes(result)
    plot(flttr(:,3),flttr(:,1),'.-')
    grid on
    xlabel('teta')
    ylabel('Y')
    title('Solution Of The Plate Oscillation Problem');
    end

    function slider_value(hObject,eventdata)
        val = tspan_selector.Value;
        tspan_value.String=num2str(round(val));
    end
end

