function fpop
%FPOP Summary of this function goes here
%   Detailed explanation goes here
    f = figure('Visible', 'off', 'rend','painters','pos',[500 80 500 350],'Name', 'Plate Oscillation Problem');
            edit_m = uicontrol('Style', 'edit', 'String', '5', 'Position', [345,220,70,25]);
            edit_j = uicontrol('Style', 'edit', 'String', '5', 'Position', [425,220,70,25]);
            mstr = uicontrol('Style', 'text', 'String', 'M', 'Position', [345,190,70,25]);
            jstr = uicontrol('Style', 'text', 'String', 'J', 'Position', [425,190,70,25]);
            tspan_selector = uicontrol('Style', 'slider', 'Min', 100, 'Max', 1100, 'Callback', @slider_value, 'SliderStep', [.1 .1], 'Value', 100, 'Position', [345,310,120,25]);
            tspan_value = uicontrol('Style', 'text', 'String', tspan_selector.Value, 'Position', [470,310,30,25]);
            lpckr=sprintf('%f\n%f\n%f\n%f', 5, 8, 10.5, 12);
            length_picker = uicontrol('Style', 'popupmenu', 'String', lpckr, 'Callback', @length_picker_Callback, 'Position', [345,250,150,25]);
            llpp = uicontrol('Style', 'text', 'String', 'Length', 'Position', [345,280,150,15]);
            submit = uicontrol('Style', 'pushbutton', 'String', 'Set Initial Conditions', 'Callback', @submit_Callback, 'Position', [345,150,150,25]);
            result = axes('Units', 'Pixels', 'Position', [30,30,300,300])
                grid on
                xlabel('teta')
                ylabel('Y')
                title('Solution Of The Plate Oscillation Problem');

            f.Units='normalized';

    f.Visible='on';


    % --- Executes on button press in submit.
    function submit_Callback(hObject, eventdata)
    % hObject    handle to submit (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    %global args;
    axes(result) 
    cla reset;
    result.Visible='off';
    mm=str2double(get(edit_m,'String'));
    JJ=str2double(get(edit_j,'String'));
    if(mm==0 || isnan(mm)) m=5; edit_m.String=m; else m=mm; end
    if(JJ==0 || isnan(JJ)) J=5; edit_J.String=J; else J=JJ; end
    [Y3, Y1]=setInitCond();
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
    %msgbox(sprintf('%d , %d , %d , %d', m,J,Y3,Y1));
    f=FLTTR(m,J,Y3,Y1, L, step);

    result.Visible='on';
    axes(result)
    plot(f(:,3),f(:,1),'.-')
    grid on
    xlabel('teta')
    ylabel('Y')
    title('Solution Of The Plate Oscillation Problem');
    end

    function slider_value(hObject,eventdata)
    val = tspan_selector.Value;
    tspan_value.String=num2str(round(val));
    end

    % --- Executes on selection change in length_picker.
    function length_picker_Callback(hObject, eventdata)
    % hObject    handle to length_picker (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: contents = cellstr(get(hObject,'String')) returns length_picker contents as cell array
    %        contents{get(hObject,'Value')} returns selected item from length_picker

        contents = get(hObject,'Value');
        switch contents
          case 1
            L=5;
          case 2
            L=8;
          case 3
            L=10.5;
          case 4
            L=12;
            otherwise
        end 
    end
end
