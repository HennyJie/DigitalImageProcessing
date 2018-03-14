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

p = 200;
[x,y] = meshgrid(-p:4:p,-p:4:p) ;
value = get(handles.slider1,'value');
sigma = 100*value;
axes(handles.axes1);

gaussianPlot(x,y,sigma);


% --- Outputs from this function are returned to the command line.
function varargout = a2_gui_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)

p = 200;
[x,y] = meshgrid(-p:4:p,-p:4:p) ;
value = get(handles.slider1,'value');
sigma = 100*value;
axes(handles.axes1);

gaussianPlot(x,y,sigma);



% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on key press with focus on slider1 and none of its controls.
function slider1_KeyPressFcn(hObject, eventdata, handles)
