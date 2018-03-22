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

% Last Modified by GUIDE v2.5 22-Mar-2018 02:50:38

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



function edit_y1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_y1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_y1 as text
%        str2double(get(hObject,'String')) returns contents of edit_y1 as a double


% --- Executes during object creation, after setting all properties.
function edit_y1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_y1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_y3_Callback(hObject, eventdata, handles)
% hObject    handle to edit_y3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_y3 as text
%        str2double(get(hObject,'String')) returns contents of edit_y3 as a double


% --- Executes during object creation, after setting all properties.
function edit_y3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_y3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
m=str2num(char(get(handles.edit_m,'String')));
J=str2num(char(get(handles.edit_j,'String')));
Y1=str2num(char(get(handles.edit_y1,'String')));
Y3=str2num(char(get(handles.edit_y3,'String')));
f=FLTTR(m,J,Y3,Y1);

figure;
plot(f(:,3),f(:,1),'.-')
grid on
xlabel('teta')
ylabel('Y')
title('–≈ÿ≈Õ»ﬂ «¿ƒ¿◊» Œ  ŒÀ≈¡¿Õ»ﬂ’ œÀ¿—“»Õ »');
