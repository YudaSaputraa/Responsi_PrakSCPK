function varargout = Nomor1_WP_123210181(varargin)
% NOMOR1_WP_123210181 MATLAB code for Nomor1_WP_123210181.fig
%      NOMOR1_WP_123210181, by itself, creates a new NOMOR1_WP_123210181 or raises the existing
%      singleton*.
%
%      H = NOMOR1_WP_123210181 returns the handle to a new NOMOR1_WP_123210181 or the handle to
%      the existing singleton*.
%
%      NOMOR1_WP_123210181('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NOMOR1_WP_123210181.M with the given input arguments.
%
%      NOMOR1_WP_123210181('Property','Value',...) creates a new NOMOR1_WP_123210181 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Nomor1_WP_123210181_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Nomor1_WP_123210181_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Nomor1_WP_123210181

% Last Modified by GUIDE v2.5 30-May-2023 23:05:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Nomor1_WP_123210181_OpeningFcn, ...
                   'gui_OutputFcn',  @Nomor1_WP_123210181_OutputFcn, ...
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


% --- Executes just before Nomor1_WP_123210181 is made visible.
function Nomor1_WP_123210181_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Nomor1_WP_123210181 (see VARARGIN)

% Choose default command line output for Nomor1_WP_123210181
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Nomor1_WP_123210181 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Nomor1_WP_123210181_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in readButton_181.
function readButton_181_Callback(hObject, eventdata, handles)
% hObject    handle to readButton_181 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = readtable('DatasetHostelJepang.xlsx', 'Range','B2:P51');
cellData = table2cell(data);
set(handles.table_181, 'data', cellData);



function result_181_Callback(hObject, eventdata, handles)
% hObject    handle to result_181 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of result_181 as text
%        str2double(get(hObject,'String')) returns contents of result_181 as a double



% --- Executes during object creation, after setting all properties.
function result_181_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result_181 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in classify_181.
function classify_181_Callback(hObject, eventdata, handles)
% hObject    handle to classify_181 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data1 = readmatrix('DatasetHostelJepang.xlsx', 'Range','D2:E51');
data2 = readmatrix('DatasetHostelJepang.xlsx', 'Range','I2:I51');
data3 = readmatrix('DatasetHostelJepang.xlsx', 'Range','N2:N51');
alternatif = readtable('DatasetHostelJepang.xlsx', 'Range','B2:B51');
cellAlternatif = table2cell (alternatif);
namaAlternatif = string(cellAlternatif);

dataGabung = [data1 data2 data3];
classify = [0 0 1 0];

w = [1 4 2 3];

norm_w = normalisasi(w);

[m n] = size(dataGabung);
    for j = 1 : n
        if classify(j) == 0, norm_w(j)=-1*norm_w(j);
        end
    end
    
    for i = 1:m
        vektorS(i) = prod(dataGabung(i,:).^norm_w);
    end
 vektorV = vektorS/sum(vektorS);
 [highScore, index] = max(vektorV);
    pemenang = namaAlternatif(index);
    set(handles.result_181, 'String', pemenang);
 
    function hasilNormalisasi = normalisasi(m)
        sM = sum(m);
        hasilNormalisasi = m./sM;
