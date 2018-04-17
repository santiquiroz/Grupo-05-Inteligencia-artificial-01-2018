function varargout = reactor(varargin)
% REACTOR MATLAB code for reactor.fig
%      REACTOR, by itself, creates a new REACTOR or raises the existing
%      singleton*.
%
%      H = REACTOR returns the handle to a new REACTOR or the handle to
%      the existing singleton*.
%
%      REACTOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REACTOR.M with the given input arguments.
%
%      REACTOR('Property','Value',...) creates a new REACTOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before reactor_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to reactor_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help reactor

% Last Modified by GUIDE v2.5 16-Apr-2018 14:03:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @reactor_OpeningFcn, ...
                   'gui_OutputFcn',  @reactor_OutputFcn, ...
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


% --- Executes just before reactor is made visible.
function reactor_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to reactor (see VARARGIN)

% Choose default command line output for reactor
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes reactor wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = reactor_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
%executes the traditional reactor simulation 
sim('.\Simulink_2-pid\cstr_pid.slx')


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% executes the fuzzy oriented simulation
sim('.\Simulink_3-fuzzy\cstr_pid.slx')


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% executes the learning based method
sim('.\Simulink_1-sim\cstr_pid.slx')

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% shows a txt file with a readme
winopen('.\readme.txt')
% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
%cierra la aplicacion
close(handles.output);
