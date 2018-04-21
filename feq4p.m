function feq4p
%FEQ4P Summary of this function goes here
%   Detailed explanation goes here
    f = figure('Visible', 'off', 'rend','painters','pos',[500 80 550 600], 'Name', 'Non-Linear Equation For Pendulum');
            afun2d = axes('Units', 'Pixels', 'Position', [30,300,500,200]);
            omegavalpha3d = axes('Units', 'Pixels', 'Position', [30,30,500,200]);
            startbtn = uicontrol('Style', 'pushbutton', 'String', 'Start', 'Callback', @startbtn_Callback, 'Position', [210,540,100,30]);
            f.Units='normalized';

    f.Visible='on';

    
    function startbtn_Callback(hObject, eventdata)
    % hObject    handle to submit (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    %global args;
    startbtn.Visible='off';
    nleq4p();
    startbtn.Visible='on';
    end

end
