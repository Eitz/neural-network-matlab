function varargout = tela(varargin)
    % TELA MATLAB code for tela.fig
    %      TELA, by itself, creates a new TELA or raises the existing
    %      singleton*.
    %
    %      H = TELA returns the handle to a new TELA or the handle to
    %      the existing singleton*.
    %
    %      TELA('CALLBACK',hObject,eventData,handles,...) calls the local
    %      function named CALLBACK in TELA.M with the given input arguments.
    %
    %      TELA('Property','Value',...) creates a new TELA or raises
    %      the existing singleton*.  Starting from the left, property value pairs are
    %      applied to the GUI before tela_OpeningFcn gets called.  An
    %      unrecognized property name or invalid value makes property application
    %      stop.  All inputs are passed to tela_OpeningFcn via varargin.
    %
    %      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
    %      instance to run (singleton)".
    %
    % See also: GUIDE, GUIDATA, GUIHANDLES

    % Edit the above text to modify the response to help tela

    % Last Modified by GUIDE v2.5 26-Oct-2016 19:56:03

    % Begin initialization code - DO NOT EDIT
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
                       'gui_Singleton',  gui_Singleton, ...
                       'gui_OpeningFcn', @tela_OpeningFcn, ...
                       'gui_OutputFcn',  @tela_OutputFcn, ...
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
end

% --- Executes just before tela is made visible.
function tela_OpeningFcn(hObject, eventdata, handles, varargin)
    % This function has no output args, see OutputFcn.
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    % varargin   command line arguments to tela (see VARARGIN)

    % Choose default command line output for tela
    handles.output = hObject;

    % Update handles structure
    guidata(hObject, handles);

    initialize_gui(hObject, handles, false);

    % UIWAIT makes tela wait for user response (see UIRESUME)
    % uiwait(handles.figure1);
end


% --- Outputs from this function are returned to the command line.
function varargout = tela_OutputFcn(hObject, eventdata, handles)
    % varargout  cell array for returning output args (see VARARGOUT);
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Get default command line output from handles structure
    varargout{1} = handles.output;
end


% --- Executes during object creation, after setting all properties.
function createFcn(hObject, eventdata, handles)
    % hObject    handle to comprimento_petala (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: popupmenu controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end

function comprimento_petala_Callback(hObject, eventdata, handles)
    % hObject    handle to comprimento_petala (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of comprimento_petala as text
    %        str2double(get(hObject,'String')) returns contents of comprimento_petala as a double
    value = str2double(get(hObject, 'String'));
    if isnan(value)
        set(hObject, 'String', 0);
        errordlg('Input must be a number','Error');
    end

    % Save the new comprimento_petala value
    handles.metricdata.comprimento_petala = value;
    guidata(hObject,handles)
end

function largura_petala_Callback(hObject, eventdata, handles)
    % hObject    handle to comprimento_petala (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of comprimento_petala as text
    %        str2double(get(hObject,'String')) returns contents of comprimento_petala as a double
    value = str2double(get(hObject, 'String'));
    if isnan(value)
        set(hObject, 'String', 0);
        errordlg('Input must be a number','Error');
    end

    % Save the new comprimento_petala value
    handles.metricdata.largura_petala = value;
    guidata(hObject,handles)
end

function comprimento_sepala_Callback(hObject, eventdata, handles)
    % hObject    handle to comprimento_petala (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of comprimento_petala as text
    %        str2double(get(hObject,'String')) returns contents of comprimento_petala as a double
    value = str2double(get(hObject, 'String'));
    if isnan(value)
        set(hObject, 'String', 0);
        errordlg('Input must be a number','Error');
    end
    % Save the new comprimento_petala value
    handles.metricdata.comprimento_sepala = value;
    guidata(hObject,handles)
end

function largura_sepala_Callback(hObject, eventdata, handles)
    % hObject    handle to comprimento_petala (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of comprimento_petala as text
    %        str2double(get(hObject,'String')) returns contents of comprimento_petala as a double
    value = str2double(get(hObject, 'String'));
    if isnan(value)
        set(hObject, 'String', 0);
        errordlg('Input must be a number','Error');
    end

    % Save the new comprimento_petala value
    handles.metricdata.largura_sepala = value;
    guidata(hObject,handles)
end

% --- Executes on button press in calculate.
function calculate_Callback(hObject, eventdata, handles)
    % hObject    handle to calculate (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    [X] = nnLis([handles.metricdata.comprimento_petala;handles.metricdata.largura_petala;handles.metricdata.comprimento_sepala;handles.metricdata.largura_sepala]);
    
    set(handles.especie_setosa, 'Enable', 'off');
    set(handles.especie_versicolor, 'Enable', 'off');
    set(handles.especie_virginia, 'Enable', 'off');
    % Setando inputs selecionados ou n�o
    if X(1) > 0.5
        set(handles.especie_setosa, 'Value', 1);
        set(handles.especie_setosa, 'Enable', 'on');
    else
        set(handles.especie_setosa, 'Value', 0);
    end
    
    if X(2) > 0.5
        set(handles.especie_versicolor, 'Value', 1);
        set(handles.especie_versicolor, 'Enable', 'on');
    else
        set(handles.especie_versicolor, 'Value', 0);
    end
    
    if X(3) > 0.5
        set(handles.especie_virginia, 'Value', 1);
        set(handles.especie_virginia, 'Enable', 'on');
    else
        set(handles.especie_virginia, 'Value', 0);
    end
    
    % Setando texto lateral
    if X(1) > 0.001
        set(handles.especie_setosa, 'String', strcat('Setosa (',num2str(X(1),3),')'));
    else
        if X(1) == 0
            set(handles.especie_setosa, 'String', 'Setosa (0)');
        else
            set(handles.especie_setosa, 'String', strcat('Setosa (','<0.001',')'));
        end
    end
    
    if X(2) > 0.001
        set(handles.especie_versicolor, 'String', strcat('Versicolor (',num2str(X(2),3),')'));
    else
        if X(1) == 0
            set(handles.especie_versicolor, 'String', 'Versicolor (0)');
        else
            set(handles.especie_versicolor, 'String', strcat('Versicolor (','<0.001',')'));
        end
    end
    
    if X(3) > 0.001
        set(handles.especie_virginia, 'String', strcat('Virg�nia (',num2str(X(3),3),')'));
    else
        if X(1) == 0
            set(handles.especie_virginia, 'String', 'Virg�nia (0)');
        else
            set(handles.especie_virginia, 'String', strcat('Virg�nia (','<0.001',')'));
        end
        
    end
    
    
end

% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
    % hObject    handle to reset (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    initialize_gui(gcbf, handles, true);
end

% --------------------------------------------------------------------
function initialize_gui(fig_handle, handles, isreset)
    % If the metricdata field is present and the reset flag is false, it means
    % we are we are just re-initializing a GUI by calling it from the cmd line
    % while it is up. So, bail out as we dont want to reset the data.
    if isfield(handles, 'metricdata') && ~isreset
        return;
    end

    handles.metricdata.comprimento_petala = 0;
    handles.metricdata.comprimento_sepala = 0;
    handles.metricdata.largura_petala = 0;
    handles.metricdata.largura_sepala = 0;

    set(handles.comprimento_petala, 'String', handles.metricdata.comprimento_petala);
    set(handles.comprimento_sepala,  'String', handles.metricdata.comprimento_sepala);
    set(handles.largura_petala, 'String', handles.metricdata.largura_petala);
    set(handles.largura_sepala, 'String', handles.metricdata.largura_sepala);
    
    
    set(handles.especie_setosa, 'Enable', 'off');
    set(handles.especie_setosa, 'Enable', 'off');
    set(handles.especie_setosa, 'Enable', 'off');
    set(handles.especie_setosa, 'Value', 0);
    set(handles.especie_versicolor, 'Value', 0);
    set(handles.especie_virginia, 'Value', 0);
    set(handles.especie_setosa, 'String', 'Setosa');
    set(handles.especie_versicolor, 'String', 'Versicolor');
    set(handles.especie_virginia, 'String', 'Virg�nia');

    % Update handles structure
    guidata(handles.figure1, handles);
end

function [Y,Xf,Af] = nnLis(X,~,~)
%nnLis neural network simulation function.
%
% Generated by Neural Network Toolbox function genFunction, 26-Oct-2016 14:53:17.
%
% [Y] = nnLis(X,~,~) takes these arguments:
%
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 4xQ matrix, input #1 at timestep ts.
%
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 3xQ matrix, output #1 at timestep ts.
%
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [4.3;2;1;0.1];
x1_step1.gain = [0.555555555555555;0.833333333333333;0.338983050847458;0.833333333333333];
x1_step1.ymin = -1;

% Layer 1
b1 = [-2.3008286579353023349;-2.0041805394821992081;-1.5217252659655720048;-2.4277784937609476756;-0.47646481999377326977;-0.68556995158930522649;1.2828599904544804033;-0.58809631781606419576;-1.5208615405524827935;-2.1975423370060944706];
IW1_1 = [0.67124265613789013685 -2.0229517356574731046 -1.3719814671648999926 0.20994814222381355528;0.20876340702321818932 -0.92139659314629773768 1.5341129111881863789 -1.616228122061800887;0.40244089882022793248 0.06900431572024873228 -2.2696981134123803692 -1.9544975350032296468;-0.1482804589014738994 -1.253477740935217799 2.5891812256696891126 3.6857015872083831454;1.0763073991072735769 1.4260674616863522335 -0.065093090205108797286 -1.7027928780206535997;0.38394900688064981242 1.6223847271317108909 1.3159306168153062089 -1.7046674120764306881;1.7376008482004650091 1.0814144598029011846 0.38108135428786638066 1.3129169957937176783;-1.7903493190390797896 1.6786271517254534036 -1.2000623984235345709 -1.8375260285112091641;-1.7880356180340393202 1.9531779522170156227 0.31230303521174856973 -0.55252202622059498616;-1.3683082010236962134 -1.1345696167240082453 1.5888147379649819602 1.4619392211687007865];

% Layer 2
b2 = [1.089954121952789956;0.089121236686015098405;0.598077907889522975];
LW2_1 = [-0.20546434600974450291 0.098284593935585959357 1.9284796212998722709 -1.9932127737549099056 0.57967990487634590835 1.4201468085358470717 -1.2201448736004900653 3.4791833860098102527 0.71519230556000634724 0.32374726208344001277;0.51847957333773375677 0.25357639503902207334 -2.4616502167812179813 -3.1955488896516230923 0.081424890321908457991 0.31188042113931857546 -1.1176439060293836825 -1.4051315742800609687 -0.56387995915458144491 -0.80807779431623216748;-0.33246370736433811244 0.30767643239662240129 -0.9173394033176003326 4.76685247638419618 -0.2433540769966877626 -0.78318722909665072773 2.0347718992370347202 -0.9394986839459180672 0.73550755084991614741 1.0805070854856089202];

% ===== SIMULATION ========

% Format Input Arguments
isCellX = iscell(X);
if ~isCellX, X = {X}; end;

% Dimensions
TS = size(X,2); % timesteps
if ~isempty(X)
    Q = size(X{1},2); % samples/series
else
    Q = 0;
end

% Allocate Outputs
Y = cell(1,TS);

% Time loop
for ts=1:TS
    
    % Input 1
    Xp1 = mapminmax_apply(X{1,ts},x1_step1);
    
    % Layer 1
    a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*Xp1);
    
    % Layer 2
    a2 = softmax_apply(repmat(b2,1,Q) + LW2_1*a1);
    
    % Output 1
    Y{1,ts} = a2;
end

% Final Delay States
Xf = cell(1,0);
Af = cell(2,0);

% Format Output Arguments
if ~isCellX, Y = cell2mat(Y); end
end
% ===== MODULE FUNCTIONS ========
% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings)
y = bsxfun(@minus,x,settings.xoffset);
y = bsxfun(@times,y,settings.gain);
y = bsxfun(@plus,y,settings.ymin);
end
% Competitive Soft Transfer Function
function a = softmax_apply(n,~)
if isa(n,'gpuArray')
    a = iSoftmaxApplyGPU(n);
else
    a = iSoftmaxApplyCPU(n);
end
end
function a = iSoftmaxApplyCPU(n)
nmax = max(n,[],1);
n = bsxfun(@minus,n,nmax);
numerator = exp(n);
denominator = sum(numerator,1);
denominator(denominator == 0) = 1;
a = bsxfun(@rdivide,numerator,denominator);
end
function a = iSoftmaxApplyGPU(n)
nmax = max(n,[],1);
numerator = arrayfun(@iSoftmaxApplyGPUHelper1,n,nmax);
denominator = sum(numerator,1);
a = arrayfun(@iSoftmaxApplyGPUHelper2,numerator,denominator);
end
function numerator = iSoftmaxApplyGPUHelper1(n,nmax)
numerator = exp(n - nmax);
end
function a = iSoftmaxApplyGPUHelper2(numerator,denominator)
if (denominator == 0)
    a = numerator;
else
    a = numerator ./ denominator;
end
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n,~)
a = 2 ./ (1 + exp(-2*n)) - 1;
end
