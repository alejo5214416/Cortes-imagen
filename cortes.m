function varargout = cortes(varargin)
% CORTES MATLAB code for cortes.fig
%      CORTES, by itself, creates a new CORTES or raises the existing
%      singleton*.
%
%      H = CORTES returns the handle to a new CORTES or the handle to
%      the existing singleton*.
%
%      CORTES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CORTES.M with the given input arguments.
%
%      CORTES('Property','Value',...) creates a new CORTES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before cortes_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to cortes_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help cortes

% Last Modified by GUIDE v2.5 22-May-2018 23:16:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @cortes_OpeningFcn, ...
                   'gui_OutputFcn',  @cortes_OutputFcn, ...
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


% --- Executes just before cortes is made visible.
function cortes_OpeningFcn(hObject, eventdata, handles, varargin)
clc
%open 'manual.txt'
global  valorz valory valorx
 valorz = get(handles.slider3,'Value');
set(handles.text11,'String',num2str(round(valorz)));

valory = get(handles.slider2,'Value');
set(handles.text10,'String',num2str(round(valory)));

valorx = get(handles.slider1,'Value');
set(handles.text9,'String',num2str(round(valorx)));

% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to cortes (see VARARGIN)

% Choose default command line output for cortes
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes cortes wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = cortes_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
set(handles.slider1, 'SliderStep', [1/512,10/512]);
global valorx 
valorx = round(get(handles.slider1,'Value'));
set(handles.text9,'String',num2str(round(valorx)));
ax=handles.filename;
axial(:,:)=ax.img(round(valorx),:,:);

% Selecciono la primera imagen que voy a actualizar
axes(handles.axes1);
imshow(axial');
 

% imshow(handles.axes1,imagen(:,:,round(valorx)));
 
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
set(handles.slider2, 'SliderStep', [1/512,10/512]);
global valory 


valory = round(get(handles.slider2,'Value'));
set(handles.text10,'String',num2str(valory));
sag=handles.filename;
sagital(:,:)=sag.img(:,valory,:);

% Selecciono la primera imagen que voy a actualizar
axes(handles.axes2);
imshow(sagital);
 
 
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
set(handles.slider3, 'SliderStep', [1/272,10/272]);
global valorz
valorz = round(get(handles.slider3,'Value'));
set(handles.text11,'String',num2str(valorz));
cor=handles.filename;
coronal(:,:)=cor.img(:,:,valorz);
% Selecciono la primera imagen que voy a actualizar
axes(handles.axes3);
imshow(coronal);

% 
% v = load_nii('archivo.nii');
% imagen= v.img(:,:,valorz);
% 
% axes(handles.axes3);
% imshow(imagen);
 
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
filename = uigetfile('*.nii')
file=load_nii(filename)
handles.filename=file
guidata(hObject,handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on slider1 and none of its controls.
function slider1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global y z valorx x
x=0;
x(1)=valorx;
[y(1),z(1)]=ginput(1);
punto=handles.filename;
while punto.img(round(x(1)),round(y(1)),round(z(1)))~=255
    [y(1),z(1)]=ginput(1);
end
x(1)=round(valorx);
y(1)=round(y(1));
z(1)=round(z(1));
set(handles.text12,'String',num2str(y(1)))
set(handles.text15,'String',num2str(z(1)))

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
global valorx y z x
x(2)=round(valorx);
punto=handles.filename;
[y(2),z(2)]=ginput(1);
while punto.img(round(x(2)),round(y(2)),round(z(2)))~=255
    [y(2),z(2)]=ginput(1);
end
x(2)=valorx;
y(2)=round(y(2));
z(2)=round(z(2));
set(handles.text16,'String',num2str(y(2)))
set(handles.text17,'String',num2str(z(2)))
p_final=[x(2) y(2) z(2)];
dist_ant=sqrt((x(2)-x(1))^2+(y(2)-y(1))^2+(z(2)-z(1))^2)
co_ant=[x(1) y(1) z(1)]
matriz=co_ant;
pause(5)
while(dist_ant>1)
    i=1;
while i<27
    switch i
        case 1
            co_ant=[x(1)-1 y(1) z(1)];
        case 2
            co_ant=[x(1)+1 y(1) z(1)];
        case 3
            co_ant=[x(1) y(1)-1 z(1)];
        case 4
            co_ant=[x(1)+1 y(1)+1 z(1)];
        case 5
            co_ant=[x(1)+1 y(1) z(1)-1];
        case 6
            co_ant=[x(1)+1 y(1) z(1)+1];
        case 7
            co_ant=[x(1)-1 y(1)-1 z(1)];
        case 8
            co_ant=[x(1)+1 y(1)-1 z(1)];
        case 9
            co_ant=[x(1)-1 y(1)+1 z(1)];
        case 10
            co_ant=[x(1)+1 y(1)+1 z(1)];
        case 11
            co_ant=[x(1)-1 y(1) z(1)-1];
        case 12
            co_ant=[x(1)+1 y(1) z(1)-1];
        case 13
            co_ant=[x(1)-1 y(1) z(1)+1];
        case 14
            co_ant=[x(1)+1 y(1) z(1)+1];
        case 15
            co_ant=[x(1) y(1)-1 z(1)-1];
        case 16
            co_ant=[x(1) y(1)+1 z(1)-1];
        case 17
            co_ant=[x(1) y(1)-1 z(1)+1];
        case 18
            co_ant=[x(1) y(1)+1 z(1)+1];
        case 19
            co_ant=[x(1)-1 y(1)-1 z(1)-1];
        case 20
            co_ant=[x(1)+1 y(1)-1 z(1)-1];
        case 21
            co_ant=[x(1)-1 y(1)+1 z(1)-1];
        case 22
            co_ant=[x(1)-1 y(1)-1 z(1)+1];
        case 23
            co_ant=[x(1)+1 y(1)+1 z(1)-1];
        case 24
            co_ant=[x(1)+1 y(1)-1 z(1)+1];
        case 25
            co_ant=[x(1)-1 y(1)+1 z(1)+1];
        case 26
            co_ant=[x(1)+1 y(1)+1 z(1)+1];
    end %switch
     co_act=co_ant;
%     matriz(end,1:end)
%     co_act~=matriz(end,1:end)
    dist_act=sqrt((p_final(1)-co_act(1))^2+(p_final(2)-co_act(2))^2+(p_final(3)-co_act(3))^2);
    color=punto.img(round(co_act(1)),round(co_act(2)),round(co_act(3)));
    if dist_act<dist_ant&&color==255
        dist_ant=dist_act;
        co_ant=co_act;
        matriz= [matriz;co_ant]
        i=27;
        
    else
        dist_act=dist_ant;
        i=i+1;
    end
end %while

end %while

%       x     y       z  ----->>> Actual

% ---->> Vecinos
%      x-1    y       z     1
%      x+1    y       z     2
%       x    y-1      z     3
%       x    y+1      z     4
%       x     y      z-1    5
%       x     y      z+1    6

%      x-1   y-1      z     7
%      x+1   y-1      z     8
%      x-1   y+1      z     9
%      x+1   y+1      z     10
%      x-1    y      z-1    11
%      x+1    y      z-1    12
%      x-1    y      z+1    13
%      x+1    y      z+1    14
%       x    y-1     z-1    15
%       x    y+1     z-1    16
%       x    y-1     z+1    17
%       x    y+1     z+1    18

%      x-1   y-1     z-1    19
%      x+1   y-1     z-1    20
%      x-1   y+1     z-1    21
%      x-1   y-1     z+1    22
%      x+1   y+1     z-1    23
%      x+1   y-1     z+1    24
%      x-1   y+1     z+1    25
%      x+1   y+1     z+1    26



% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function text100_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text100 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object deletion, before destroying properties.
function text100_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to text100 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
