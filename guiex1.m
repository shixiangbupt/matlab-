function varargout = guiex1(varargin)
% GUIEX1 MATLAB code for guiex1.fig
%      GUIEX1, by itself, creates a new GUIEX1 or raises the existing
%      singleton*.
%
%      H = GUIEX1 returns the handle to a new GUIEX1 or the handle to
%      the existing singleton*.
%
%      GUIEX1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIEX1.M with the given input arguments.
%
%      GUIEX1('Property','Value',...) creates a new GUIEX1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guiex1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guiex1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guiex1

% Last Modified by GUIDE v2.5 19-Apr-2020 15:14:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guiex1_OpeningFcn, ...
                   'gui_OutputFcn',  @guiex1_OutputFcn, ...
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


% --- Executes just before guiex1 is made visible.
function guiex1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guiex1 (see VARARGIN)

% Choose default command line output for guiex1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes guiex1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = guiex1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO) 存储事件触发的源控件
% eventdata  reserved - to be defined in a future version of MATLAB 存储事件数据
% handles    structure with handles and user data (see GUIDATA)
% 存储用户界面中所有对象的句柄
% handles.text1.String='Hello, World';
 handles.mydata='This is an example.';
  guidata(hObject, handles);

 


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
  handles.text1.String=handles.mydata;
