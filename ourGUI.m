function varargout = ourGUI(varargin)
% OURGUI MATLAB code for ourGUI.fig
%      OURGUI, by itself, creates a new OURGUI or raises the existing
%      singleton*.
%
%      H = OURGUI returns the handle to a new OURGUI or the handle to
%      the existing singleton*.
%
%      OURGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OURGUI.M with the given input arguments.
%
%      OURGUI('Property','Value',...) creates a new OURGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ourGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ourGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ourGUI

% Last Modified by GUIDE v2.5 20-Jun-2014 22:06:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ourGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @ourGUI_OutputFcn, ...
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


% --- Executes just before ourGUI is made visible.
function ourGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ourGUI (see VARARGIN)

% Choose default command line output for ourGUI
handles.output = hObject;
%% 参数初始设置
set(handles.dongbeifeng,'Value',1);%默认设置：风向为东北风
handles.fx=5;%默认设置：东北风对应值为5
set(handles.fspeed,'string','5');%默认设置：风速为5
handles.Wind_level=5;%默认设置：风速为5
set(handles.qingqing,'Value',1);%默认设置：天气为晴-晴
handles.tq=1;%默认设置：天气为晴-晴
set(handles.liangdian,'string','[1,1,1,1]');
handles.Warea=[1,1;1,1];
set(handles.gaoxinqu,'Value',1);handles.gxq=1;set(handles.humgaoxinqu,'string','1000');handles.hgxq=1000;
set(handles.jingkaiqu,'Value',0);handles.jkq=0;set(handles.humjingkaiqu,'string','0');handles.hjkq=0;
set(handles.xiaozhai,'Value',0);handles.xz=0;set(handles.humxiaozhai,'string','0');handles.hxz=0;
set(handles.xingqing,'Value',0);handles.xq=0;set(handles.humxingqing,'string','0');handles.hxq=0;
set(handles.guangyuntan,'Value',0);handles.gyt=0;set(handles.humguangyuntan,'string','0');handles.hgyt=0;
set(handles.qujiang,'Value',0);handles.qj=0;set(handles.humqujiang,'string','0');handles.hqj=0;
set(handles.lintong,'Value',0);handles.lt=0;set(handles.humlintong,'string','0');handles.hlt=0;
set(handles.mea1,'Value',0);handles.M1=0;
set(handles.mea2,'Value',0);handles.M2=0;
set(handles.mea3,'Value',0);handles.M3=0;
set(handles.inlevel,'string','0');handles.inle=0;
set(handles.outlevel,'string','0');
set(handles.prate,'string','0');
%% 坐标系初始设置
set(handles.axes1,'XGrid','on');set(handles.axes1,'XLim',[1 180]);
set(handles.axes1,'YGrid','on');set(handles.axes1,'YLim',[1 500]);
hold on
source=[1,0,0,0,0,0,0];
XY0=[8 40;32 110;35 40;58 60;80 95;56,25;160 220]; 
Loc={'高新','经开区','小寨','兴庆','广运潭','曲江','临潼'};
[num_source,~]=size(XY0);
for i=1:num_source
    if (source(i)==1)
        plot(XY0(i,1),XY0(i,2),'-dr','LineWidth',3);
    else
        plot(XY0(i,1),XY0(i,2),'-db','LineWidth',3);   
    end
    text(XY0(i,1),XY0(i,2)+10,Loc(i));
end
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ourGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ourGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function fspeed_Callback(hObject, eventdata, handles)
% hObject    handle to fspeed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Wind_level=str2num(get(handles.fspeed,'string'));
handles.Wind_level=Wind_level;
guidata(hObject, handles);


% Hints: get(hObject,'String') returns contents of fspeed as text
%        str2double(get(hObject,'String')) returns contents of fspeed as a double


% --- Executes during object creation, after setting all properties.
function fspeed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fspeed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function outeavl_Callback(hObject, eventdata, handles)
% hObject    handle to outeavl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of outeavl as text
%        str2double(get(hObject,'String')) returns contents of outeavl as a double


% --- Executes during object creation, after setting all properties.
function outeavl_CreateFcn(hObject, eventdata, handles)
% hObject    handle to outeavl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function weatherset_CreateFcn(hObject, eventdata, handles)
% hObject    handle to weatherset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in runbutton.
function runbutton_Callback(hObject, eventdata, handles)
% hObject    handle to runbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str1='运行中请稍后.......';
set(handles.runstate,'string',str1);
pause(1);
gradhum(handles);
str2='运行结束';
guidata(hObject, handles);
set(handles.runstate,'string',str2);
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function fengxiangset_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fengxiangset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function dongfeng_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dongfeng (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes when selected object is changed in fengxiangset.
function fengxiangset_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in fengxiangset 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
df=get(handles.dongfeng,'Value');
xf=get(handles.xifeng,'Value');
nf=get(handles.nanfeng,'Value');
bf=get(handles.beifeng,'Value');
dbf=get(handles.dongbeifeng,'Value');
dnf=get(handles.dongnanfeng,'Value');
xbf=get(handles.xibeifeng,'Value');
xnf=get(handles.xinanfeng,'Value');
[~,fx]=find([df,xf,nf,bf,dbf,dnf,xbf,xnf]==1);
handles.fx=fx;
guidata(hObject, handles);



% --- Executes when selected object is changed in weatherset.
function weatherset_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in weatherset 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
qq=get(handles.qingqing,'Value');
yq=get(handles.yinqing,'Value');
yy=get(handles.yinyin,'Value');
yyu=get(handles.yinyu,'Value');
yuyu=get(handles.yuyu,'Value');
[~,tq]=find([qq,yq,yy,yyu,yuyu]==1);
handles.tq=tq;
guidata(hObject, handles);



function runstate_Callback(hObject, eventdata, handles)
% hObject    handle to runstate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global str1
set(handles.runstate,'string',str1);
% Hints: get(hObject,'String') returns contents of runstate as text
%        str2double(get(hObject,'String')) returns contents of runstate as a double


% --- Executes during object creation, after setting all properties.
function runstate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to runstate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes when selected object is changed in fxset.
function fxset_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in fxset 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in radiobutton63.
function radiobutton63_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton63 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton63


% --- Executes on button press in radiobutton64.
function radiobutton64_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton64 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton64


% --- Executes on button press in radiobutton65.
function radiobutton65_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton65 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton65


% --- Executes on button press in dongbeifeng.
function dongbeifeng_Callback(hObject, eventdata, handles)
% hObject    handle to dongbeifeng (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of dongbeifeng


% --- Executes on button press in radiobutton67.
function radiobutton67_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton67 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton67


% --- Executes on button press in radiobutton68.
function radiobutton68_Callback(~, eventdata, handles)
% hObject    handle to radiobutton68 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton68


% --- Executes on button press in radiobutton69.
function radiobutton69_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton69 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton69


% --- Executes on button press in dongfeng.
function dongfeng_Callback(hObject, eventdata, handles)
% hObject    handle to dongfeng (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of dongfeng



function liangdian_Callback(hObject, eventdata, handles)
% hObject    handle to liangdian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str1=get(handles.liangdian,'string');
i=2;
while(str1(i)~=',')
     i=i+1;
end
x1=str2num(str1(2:i));
i=i+1;
st=i;
while(str1(i)~=',')
     i=i+1;
end
y1=str2num(str1(st:i));
i=i+1;
st=i;
while(str1(i)~=',')
     i=i+1;
end
x2=str2num(str1(st:i));
i=i+1;
y2=str2num(str1(i:end-1));
Warea=[x1,y1;x2,y2]
handles.Warea=Warea;
guidata(hObject, handles);

% Hints: get(hObject,'String') returns contents of liangdian as text
%        str2double(get(hObject,'String')) returns contents of liangdian as a double


% --- Executes during object creation, after setting all properties.
function liangdian_CreateFcn(hObject, eventdata, handles)
% hObject    handle to liangdian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in gaoxinqu.
function gaoxinqu_Callback(hObject, eventdata, handles)
% hObject    handle to gaoxinqu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gxq=get(handles.gaoxinqu,'Value');
handles.gxq=gxq;
guidata(hObject, handles);
% Hint: get(hObject,'Value') returns toggle state of gaoxinqu



function humgaoxinqu_Callback(hObject, eventdata, handles)
% hObject    handle to humgaoxinqu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hgxq=str2num(get(handles.humgaoxinqu,'string'));
handles.hgxq=hgxq;
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of humgaoxinqu as text
%        str2double(get(hObject,'String')) returns contents of humgaoxinqu as a double


% --- Executes during object creation, after setting all properties.
function humgaoxinqu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to humgaoxinqu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in jingkaiqu.
function jingkaiqu_Callback(hObject, eventdata, handles)
% hObject    handle to jingkaiqu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
jkq=get(handles.jingkaiqu,'Value');
handles.jkq=jkq;
guidata(hObject, handles);
% Hint: get(hObject,'Value') returns toggle state of jingkaiqu



function humjingkaiqu_Callback(hObject, eventdata, handles)
% hObject    handle to humjingkaiqu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hjkq=str2num(get(handles.humjingkaiqu,'string'));
handles.hjkq=hjkq;
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of humjingkaiqu as text
%        str2double(get(hObject,'String')) returns contents of humjingkaiqu as a double


% --- Executes during object creation, after setting all properties.
function humjingkaiqu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to humjingkaiqu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function humxingqing_Callback(hObject, eventdata, handles)
% hObject    handle to humxingqing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hxq=str2num(get(handles.humxingqing,'string'));
handles.hxq=hxq;
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of humxingqing as text
%        str2double(get(hObject,'String')) returns contents of humxingqing as a double


% --- Executes during object creation, after setting all properties.
function humxingqing_CreateFcn(hObject, eventdata, handles)
% hObject    handle to humxingqing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in xingqing.
function xingqing_Callback(hObject, eventdata, handles)
% hObject    handle to xingqing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
xq=get(handles.xingqing,'Value');
handles.xq=xq;
guidata(hObject, handles);
% Hint: get(hObject,'Value') returns toggle state of xingqing


% --- Executes on button press in xiaozhai.
function xiaozhai_Callback(hObject, eventdata, handles)
% hObject    handle to xiaozhai (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
xz=get(handles.xiaozhai,'Value');
handles.xz=xz;
guidata(hObject, handles);
% Hint: get(hObject,'Value') returns toggle state of xiaozhai



function humxiaozhai_Callback(hObject, eventdata, handles)
% hObject    handle to humxiaozhai (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hxz=str2num(get(handles.humxiaozhai,'string'));
handles.hxz=hxz;
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of humxiaozhai as text
%        str2double(get(hObject,'String')) returns contents of humxiaozhai as a double


% --- Executes during object creation, after setting all properties.
function humxiaozhai_CreateFcn(hObject, eventdata, handles)
% hObject    handle to humxiaozhai (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in lintong.
function lintong_Callback(hObject, eventdata, handles)
% hObject    handle to lintong (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
lt=get(handles.lintong,'Value');
handles.lt=lt;
guidata(hObject, handles);
% Hint: get(hObject,'Value') returns toggle state of lintong



function humlintong_Callback(hObject, eventdata, handles)
% hObject    handle to humlintong (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hlt=str2num(get(handles.humlintong,'string'));
handles.hlt=hlt;
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of humlintong as text
%        str2double(get(hObject,'String')) returns contents of humlintong as a double


% --- Executes during object creation, after setting all properties.
function humlintong_CreateFcn(hObject, eventdata, handles)
% hObject    handle to humlintong (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in qujiang.
function qujiang_Callback(hObject, eventdata, handles)
% hObject    handle to qujiang (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
qj=get(handles.qujiang,'Value');
handles.qj=qj;
guidata(hObject, handles);
% Hint: get(hObject,'Value') returns toggle state of qujiang



function humqujiang_Callback(hObject, eventdata, handles)
% hObject    handle to humqujiang (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hqj=str2num(get(handles.humqujiang,'string'));
handles.hqj=hqj;
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of humqujiang as text
%        str2double(get(hObject,'String')) returns contents of humqujiang as a double


% --- Executes during object creation, after setting all properties.
function humqujiang_CreateFcn(hObject, eventdata, handles)
% hObject    handle to humqujiang (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in guangyuntan.
function guangyuntan_Callback(hObject, eventdata, handles)
% hObject    handle to guangyuntan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gyt=get(handles.guangyuntan,'Value');
handles.gyt=gyt;
guidata(hObject, handles);
% Hint: get(hObject,'Value') returns toggle state of guangyuntan



function humguangyuntan_Callback(hObject, eventdata, handles)
% hObject    handle to humguangyuntan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hgyt=str2num(get(handles.humguangyuntan,'string'));
handles.hgyt=hgyt;
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of humguangyuntan as text
%        str2double(get(hObject,'String')) returns contents of humguangyuntan as a double


% --- Executes during object creation, after setting all properties.
function humguangyuntan_CreateFcn(hObject, eventdata, handles)
% hObject    handle to humguangyuntan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in mea1.
function mea1_Callback(hObject, eventdata, handles)
% hObject    handle to mea1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
M1=get(handles.mea1,'Value');
handles.M1=M1;
guidata(hObject, handles);
% Hint: get(hObject,'Value') returns toggle state of mea1


% --- Executes on button press in mea2.
function mea2_Callback(hObject, eventdata, handles)
% hObject    handle to mea2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
M2=get(handles.mea2,'Value');
handles.M2=M2;
guidata(hObject, handles);
% Hint: get(hObject,'Value') returns toggle state of mea2


% --- Executes on button press in mea3.
function mea3_Callback(hObject, eventdata, handles)
% hObject    handle to mea3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
M3=get(handles.mea3,'Value');
handles.M3=M3;
guidata(hObject, handles);
% Hint: get(hObject,'Value') returns toggle state of mea3



function inlevel_Callback(hObject, eventdata, handles)
% hObject    handle to inlevel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
inle=str2num(get(handles.inlevel,'string'));
handles.inle=inle;
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of inlevel as text
%        str2double(get(hObject,'String')) returns contents of inlevel as a double



% --- Executes during object creation, after setting all properties.
function inlevel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inlevel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
