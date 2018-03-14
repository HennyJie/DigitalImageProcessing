function varargout = a2_gui(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @a2_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @a2_gui_OutputFcn, ...
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

% --- Executes just before a2_gui is made visible.
function a2_gui_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

global path;
path = 'Q_2_3.tif';
img = imread(path);
set(handles.text4, 'String', 'Q_2_3.tif');
axes(handles.axes2);
imshow(img)

% --- Outputs from this function are returned to the command line.
function varargout = a2_gui_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
global path;
img = imread(path);
axes(handles.axes2);
LEN = get(handles.slider2,'value');
if LEN < 1
    LEN = 1
end
THETA = 135;
PSF = fspecial('motion', LEN, THETA);
NSR = get(handles.slider1,'value');
set(handles.edit1, 'String', LEN);
set(handles.edit2,'String',  NSR);
res = deconvwnr(img, PSF, NSR);
imshow(res)

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on key press with focus on slider1 and none of its controls.
function slider1_KeyPressFcn(hObject, eventdata, handles)

% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
global path;
img = imread(path);
axes(handles.axes2);
LEN = get(handles.slider2,'value');
if LEN < 1
    LEN = 1
end
THETA = 135;
PSF = fspecial('motion', LEN, THETA);
NSR = get(handles.slider1,'value');
res = deconvwnr(img, PSF, NSR);
set(handles.edit1, 'String', LEN);
set(handles.edit2,'String',  NSR);
imshow(res)

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double

% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
global path;
img = imread(path);
axes(handles.axes2);
LEN = str2double(get(handles.edit1,'string'));
if LEN < 1
    LEN = 1
end
THETA = 135;
PSF = fspecial('motion', LEN, THETA);
NSR = str2double(get(handles.edit2,'string'));
res = deconvwnr(img, PSF, NSR);
if NSR < 0
    NSR = 0;
end
if NSR > 0.1
    NSR = 0.1;
end
if LEN < 0
    LEN = 0;
end
if LEN > 110
    LEN = 110;
end
set(handles.slider1, 'value', NSR);
set(handles.slider2,'value',  LEN);
set(handles.edit1, 'String', LEN);
set(handles.edit2,'String',  NSR);
imshow(res)

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename1,filepath1]=uigetfile({'*.tif','All Files'},...
  'Select Data File 1');
global path;
if filename1~=0
    path = filename1;
    set(handles.text4, 'String', filename1)
    set(handles.slider1, 'value', 0);
    set(handles.slider2,'value',  0);
    set(handles.edit1, 'String', 0);
    set(handles.edit2,'String', '0.00');
    img = imread(path);
    axes(handles.axes2);
    imshow(img)
end
