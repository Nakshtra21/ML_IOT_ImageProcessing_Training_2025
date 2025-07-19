function varargout = untitled2(varargin)
% UNTITLED2 MATLAB code for untitled2.fig
%      This GUI loads an image, allows brightness adjustment via slider, and displays results.

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled2_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled2_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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

% --- Executes just before untitled2 is made visible.
function untitled2_OpeningFcn(hObject, eventdata, handles, varargin)
% Choose default command line output for untitled2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = untitled2_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

% --- Executes on button press in pushbutton1 (load image button).
function pushbutton1_Callback(hObject, eventdata, handles)
% Let the user pick an image file
[filename, pathname] = uigetfile({'*.jpg;*.png;*.bmp','Image Files (*.jpg, *.png, *.bmp)'}, ...
                                 'Pick an image file');
if isequal(filename,0)
    disp('User cancelled image selection');
else
    % Read and display the image in axes1
    a = imread(fullfile(pathname, filename));
    axes(handles.axes1);
    imshow(a);
    
    % Save image to handles for later use
    handles.a = a;

end
    guidata(hObject, handles);  % Update handles
% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% Get current slider value
Val = get(hObject, 'Value');

% Display the slider value in edit1
set(handles.edit1, 'String', num2str(Val));

% Check if image is loaded
if isfield(handles, 'a') && ~isempty(handles.a)
    a = handles.a;
    
    % Add brightness value (Val) to image
    % Convert to double for calculation to avoid overflow/underflow
    b = imadd(a, Val);  
    
    % Show result in axes2
    axes(handles.axes2);
    imshow(b, []);
else
    disp('Please load an image first using the button.');
end

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% Set slider background color
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% Set edit box background color
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on text change in edit1.
function edit1_Callback(hObject, eventdata, handles)
% Nothing required here for now (slider controls edit1)
