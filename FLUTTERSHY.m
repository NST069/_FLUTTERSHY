function varargout = FLUTTERSHY(varargin)
% FLUTTERSHY MATLAB code for FLUTTERSHY.fig
%      FLUTTERSHY, by itself, creates a new FLUTTERSHY or raises the existing
%      singleton*.
%
%      H = FLUTTERSHY returns the handle to a new FLUTTERSHY or the handle to
%      the existing singleton*.
%
%      FLUTTERSHY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FLUTTERSHY.M with the given input arguments.
%
%      FLUTTERSHY('Property','Value',...) creates a new FLUTTERSHY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FLUTTERSHY_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FLUTTERSHY_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FLUTTERSHY

% Last Modified by GUIDE v2.5 20-Apr-2018 21:05:38



% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FLUTTERSHY_OpeningFcn, ...
                   'gui_OutputFcn',  @FLUTTERSHY_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT




% --- Executes just before FLUTTERSHY is made visible.
function FLUTTERSHY_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FLUTTERSHY (see VARARGIN)

% Choose default command line output for FLUTTERSHY
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FLUTTERSHY wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FLUTTERSHY_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit_m_Callback(hObject, eventdata, handles)
% hObject    handle to edit_m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_m as text
%        str2double(get(hObject,'String')) returns contents of edit_m as a double
%global args;
%args.m=str2double(char(get(handles.edit_m,'String')));


% --- Executes during object creation, after setting all properties.
function edit_m_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_j_Callback(hObject, eventdata, handles)
% hObject    handle to edit_j (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_j as text
%        str2double(get(hObject,'String')) returns contents of edit_j as a double
%global args;
%args.J=str2double(char(get(handles.edit_j,'String')));

% --- Executes during object creation, after setting all properties.
function edit_j_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_j (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in submit.
function submit_Callback(hObject, eventdata, handles)
% hObject    handle to submit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%global args;
result.Visible='off';
mm=str2double(get(handles.edit_m,'String'));
JJ=str2double(get(handles.edit_j,'String'));
if(mm==0 || isnan(mm)) m=5; handles.edit_m.String=m; else m=mm; end
if(JJ==0 || isnan(JJ)) J=5; handles.edit_j.String=J; else J=JJ; end
[Y3, Y1]=setInitCond();
%L=handles.length_picker.Value;
switch handles.length_picker.Value
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
%Y3=.51;
%Y1=.23;
%msgbox(sprintf('%d , %d , %d , %d', m,J,Y3,Y1));
f=FLTTR(m,J,Y3,Y1, L);
%f=FLTTR(args);

%figure;
result.Visible='on';
axes(handles.result)
plot(f(:,3),f(:,1),'.-')
grid on
xlabel('teta')
ylabel('Y')
title('Solution Of The Plate Oscillation Problem');


% --- Executes on selection change in length_picker.
function length_picker_Callback(hObject, eventdata, handles)
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


% --- Executes during object creation, after setting all properties.
function length_picker_CreateFcn(hObject, eventdata, handles)
% hObject    handle to length_picker (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    lpckr=sprintf('%f\n%f\n%f\n%f', 5, 8, 10.5, 12);
    hObject.String = lpckr;
    

% --- Executes on selection change in programSelector.
function programSelector_Callback(hObject, eventdata, handles)
% hObject    handle to programSelector (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns programSelector contents as cell array
%        contents{get(hObject,'Value')} returns selected item from programSelector

    contents = get(hObject,'Value');
    switch contents
      case 1
        set(handles.pop, 'Visible', 'on');
        set(handles.eq4p, 'Visible', 'off');
      case 2
        set(handles.pop, 'Visible', 'off');
        set(handles.eq4p, 'Visible', 'on');
        nleq4p();
        otherwise
    end

% --- Executes during object creation, after setting all properties.
function programSelector_CreateFcn(hObject, eventdata, handles)
% hObject    handle to programSelector (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function eq4p_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eq4p (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
