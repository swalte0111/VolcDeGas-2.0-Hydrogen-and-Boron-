function varargout = VolcDeGas(varargin)             %initialization of the GUI
% VOLCDEGAS MATLAB code for VolcDeGas.fig
%      VOLCDEGAS, by itself, creates a new VOLCDEGAS or raises the existing
%      singleton*.
%
%      H = VOLCDEGAS returns the handle to a new VOLCDEGAS or the handle to
%      the existing singleton*.
%       637265617465642062793a2053656261737469616e204361726c2057616c7465722c204d61696e7a 
%      VOLCDEGAS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VOLCDEGAS.M with the given input arguments.
%
%      VOLCDEGAS('Property','Value',...) creates a new VOLCDEGAS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before VolcDeGas_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to VolcDeGas_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help VolcDeGas

% Last Modified by GUIDE v2.5 05-Oct-2022 17:14:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @VolcDeGas_OpeningFcn, ...
                   'gui_OutputFcn',  @VolcDeGas_OutputFcn, ...
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


% --- Executes just before VolcDeGas is made visible.
function VolcDeGas_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to VolcDeGas (see VARARGIN)
movegui('west')
% Choose default command line output for VolcDeGas

handles.output = hObject;


HoldONbuttonif=false;
assignin('base','HoldONbuttonif',HoldONbuttonif);                                       %assignin: saving variable into workspace

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes VolcDeGas wait for user response (see UIRESUME)
% uiwait(handles.GUImain);


% --- Outputs from this function are returned to the command line.
function varargout = VolcDeGas_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
VolcDeGasOption
% Get default command line output from handles structure
varargout{1} = handles.output;

    %start of GUI (buttons, fields )                                                                  
%________________________________________________________________________________________________________________________________
%________________________________________________________________________
%description of open degassing system starts here, other buttons (closed,batched),are described the same way as in this example if not stated otherwise

%
%
% --- Executes on button press in Startopen.
function Startopen_Callback(hObject, eventdata, handles)                    %on buttonclick, this function is excecuted; open-degassing calculation with constant step size and  initial water and dD values gets adjusted on each step to the calculated values from the step before


ExistTinC1=evalin( 'base', 'exist(''TinC1'',''var'') == 1' );               %evalin excecutes an expression in the workspace. By excecuting the exist call (exist) and == 1 command, MatLab evaluates if a variable exists and outputs a logical 1 (by ==). The logical result is saved as a variable into this function. The objective for this code line is, that it checks if the user forgot to set a required variable in the GUI
Existwaterini=evalin( 'base', 'exist(''waterini'',''var'') == 1' );
Existwater1=evalin( 'base', 'exist(''water1'',''var'') == 1' );
Existwater2=evalin( 'base', 'exist(''water2'',''var'') == 1' );
Existwater3=evalin( 'base', 'exist(''water3'',''var'') == 1' );
ExistDinitial1=evalin( 'base', 'exist(''Dinitial1'',''var'') == 1' );
ExistDinitial2=evalin( 'base', 'exist(''Dinitial2'',''var'') == 1' );
ExistDinitial3=evalin( 'base', 'exist(''Dinitial3'',''var'') == 1' );
Existminxax=evalin( 'base', 'exist(''minxax'',''var'') == 1' );
Existmaxxax=evalin( 'base', 'exist(''maxxax'',''var'') == 1' );
Existminyax=evalin( 'base', 'exist(''minyax'',''var'') == 1' );
Existmaxyax=evalin( 'base', 'exist(''maxyax'',''var'') == 1' );
Existalphaself=evalin( 'base', 'exist(''alphaself'',''var'') == 1' );

if ExistTinC1 && Existwaterini && Existwater1 && Existwater2 && ...         %if the defined variables are true (logical 1), the follwoing code is excecuted. As a result of the exist line before, if any of the neeeded variables is not set an error message is displayed (see else line at the end of this function)
   Existwater3 && ExistDinitial1 && ExistDinitial2 && ExistDinitial3 ...
   && Existminxax && Existmaxxax && Existminyax && Existmaxyax    


    

TinC1=evalin('base','TinC1');                                               %evalin excecutes an expression in the workspace. By excecuting the saved variable TinC1 in the workspace, it can be saved into this function
waterini=evalin('base','waterini');
water1=evalin('base','water1'); 
water2=evalin('base','water2'); 
water3=evalin('base','water3'); 
Dinitial1=evalin('base','Dinitial1'); 
Dinitial2=evalin('base','Dinitial2');
Dinitial3=evalin('base','Dinitial3'); 
minxax=evalin('base','minxax');
maxxax=evalin('base','maxxax');
minyax=evalin('base','minyax');
maxyax=evalin('base','maxyax');
alphaH20=0.9896;                                                            %alpha molecular water fractionation factor  (rust et al. 2004) 
alphaOH=1.0415;                                                             %alhpa hydroxyl group  fractionation factor  (rust et al. 2004)   
%%%


if Dinitial1>Dinitial3                                                     %if Dinitial1 is smaller than Dinitial3 the following code is excecuted. The reason for the if loop here is, that if the user set values in the wrong order, it will be indicated 
    errordlg(strcat('First', 32, char(hex2dec('03B4')),'D field requires a lower value than third  '),'Error');                                     % displays an error dialoge box, with the name Error and the message Set all variables
return                                                                     %returns control to invoking function or command prompt
end

if water1>water3
     errordlg('First water field requires a lower value than third field','Error'); 
    return
end



if minxax>maxxax
     errordlg('First x-axis field requires a lower value than second field','Error'); 
    return
end

if minyax>maxyax
     errordlg('First  y-axis field requires a lower value than second field','Error'); 
    return
end



waterinitial=waterini;                                                      %renaming watervalues to not overwrite them    
waterfinal=water3:-water2:water1;                                           %listing all water values into one variable for later calculation
Dinitial=Dinitial1:Dinitial2:Dinitial3   ;                                  %listing all dD values into one variable for later calculation
Dfinal=zeros(length(waterfinal),length(Dinitial));                          %preallocation for faster speed with the fitting size of the variable
%%%
assignin('base','Dinitial',Dinitial);                                       %assignin: saving variable into workspace
assignin('base','waterfinal',waterfinal);

if ~Existalphaself 

alpha=zeros(length(waterfinal),1);                                          %preallocation for faster speed with the fitting size of the variable
SiO2peroxygen=30.0421;                                                      %value of anhydrous mineral on a single oxygen basis
TinK=TinC1+273.15;                                                          %translating °C in K
%%%

K=exp(1.89-3120/TinK);                                                      %K=exp(1.89-3120/TinK); stolper 99   K=6.53*exp(3100/-TinK);  Zhang 99 both close values 

%%%%
m=1;                                                                        %setting m starting value => place of number (index) 
for waterfinalloop=waterfinal                                               %starting of the loop with before described waterfinal values

Xbulk=(waterfinalloop/18.015)/((waterfinalloop/18.015)+(100-waterfinalloop)/SiO2peroxygen);     %bulkwater mole fraction calculation (Stolper, Silver 1985) ideal mixing model


    
 

XOHm=(1/2-(1/4-((K-4)/K)*(Xbulk-Xbulk^2))^0.5)/((K-4)/(2*K));               %hydroxyl group in melt mole fraction calculation (stolper, silver 1985) ideal mixing model

XH2Om=Xbulk-0.5*XOHm;                                                       %molecular water mole fraction calculation




XH20mfraction=2*XH2Om/(2*XH2Om+XOHm);                                       %mole fraction into atomic fraction calculation

alpha(m,1)=exp(XH20mfraction*log(alphaH20)+(1-XH20mfraction)*log(alphaOH)); %calculation of  bulk water fractionation factor (alpha) in rhyolitic melts which is saved on each iteration as alpha at position (m,1)which is row m column 1  
m=m+1;                                                                      %changing m for next iteration so alpha  can be saved at the next position
end
%%%%

assignin('base','alpha',alpha);                                             %saving variable into workspace

else
    alpha=evalin('base','alphaself'); 
assignin('base','alpha',alpha);
end

waterinitial1=zeros(1,length(waterfinal)+1);                                %preallocation of waterinitial1 with the fitting size of the variable

nn=1;                                                                       %setting starting column
for Dinitialloop=Dinitial                                                   %outerloop calculations saved into column
  Dinitialloop1=Dinitialloop;                                               %
    n=1;                                                                    %setting starting row
    waterinitial1(1)=waterinitial;                                          %need initial value  for each first run of the inner loop
for waterfinalloop=waterfinal                                               %inner loop calculations saved into row
    

waterinitial1(n+1)=waterfinalloop;                                          %setting last used water value as initial water value for the next iteration of the loop
Dfinal(n,nn)=(Dinitialloop1+1000)*((waterfinalloop/waterinitial1(n))^(alpha(n,1)-1))-1000;  %dD value calculation for open system degassing (Taylor 1991).  Dfinal(n,nn) calculates Dfinal into row n and column nn,  alpha(n,1) calls value of the variable alpha at row n and column 1    
Dinitialloop1=Dfinal(n,nn);
n=n+1;                                                                      %changing n for next iteration so every variable value can be saved at the next row 

end                                                                         %inner loop end

nn=nn+1;                                                                    %changing m for next iteration so every variable value can be saved at the next column 
end                                                                         %outer loop end

assignin('base','Dfinal',Dfinal);                                           % save Dfinal into workspace


F1=figure(1);set(F1,'name','Open-system degassing 2D-plot main figure','numbertitle','off');  %calling (opening) and naming of a figure
plot(waterfinal,Dfinal)                                                    %plotting of a figure (waterfinal as x value and Dfinal as y value)
ylabel('\deltaD in ‰');                                                         %setting y label
xlabel('Bulk water content in wt%');                                        %setting x label
axis([minxax maxxax minyax maxyax]);                                        %defining x and y axis with the imput from the user
grid on;                                                                    %setting a grid

F21=figure(21);set(F21,'name','Open-system degassing 2D-plot for comparing','numbertitle','off');   %same description as above
plot(waterfinal,Dfinal)
ylabel('\deltaD in ‰');
xlabel('Bulk water content in wt%');
axis([minxax maxxax minyax maxyax]);
grid on;

F2=figure(2);set(F2,'name','Open-system degassing 3D-plot','numbertitle','off');
surf(Dinitial,waterfinal,Dfinal)                                            %3d plot
zlabel('\deltaD in ‰ ');
ylabel('Bulk water content in wt%');
xlabel('initial \deltaD in ‰');
grid on;

F3=figure(3);set(F3,'name','Open-system degassing 3D-plot cleaned for visibility','numbertitle','off');
surf(Dinitial,waterfinal,Dfinal,'LineStyle','none')
zlabel('\deltaD in ‰');
ylabel('Bulk water content in wt%');
xlabel('initial \deltaD in ‰');
grid on;
assignin('base','F1',F1);                                                   %saving figure into workspace to delete later by pressing delete plot button
assignin('base','F21',F21);
assignin('base','F2',F2);
assignin('base','F3',F3);

else                                                                       % follow up of if loop. If one of the variables is not true (logical 0) then the next code line is excecuted
    
errordlg('Set all variables','Error');                                     % displays an error dialoge box, with the name Error and the message Set all variables

end                                                                        % end of if loop

%_________________________________________________________________________________________________________________
% end of examplary description of open system degassing button, closed and
% batched buttons are described the same way like here except the
% formular of dD calculaion changes.







% hObject    handle to Startopen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%_____________________________________________________________________________________________
%examplary for all fields where the user inputs a value of a variable
function DeltaDinitial1_Callback(hObject, eventdata, handles)               %field call (where the user inputs variables on the GUI)

Dinitial1=str2double(get(hObject,'String'));                                %get(hObject),'String') grabs the still in string format value the user put in the field, str2double translates the string value into a real number value for the program to use                            
assignin('base','Dinitial1',Dinitial1);                                     %saving the varaible into the workspace                        
% hObject    handle to DeltaDinitial1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of DeltaDinitial1 as text
%        str2double(get(hObject,'String')) returns contents of DeltaDinitial1 as a double
%__________________________________________________________________________________________________
%end of examplary description




% --- Executes during object creation, after setting all properties.
function DeltaDinitial1_CreateFcn(hObject, eventdata, handles)              %


% hObject    handle to DeltaDinitial1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Water_initial1_Callback(hObject, eventdata, handles)

water1=str2double(get(hObject,'String'));

if water1==0
    water1=0.00001;
end
assignin('base','water1',water1);

% hObject    handle to Water_initial1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Water_initial1 as text
%        str2double(get(hObject,'String')) returns contents of Water_initial1 as a double


% --- Executes during object creation, after setting all properties.
function Water_initial1_CreateFcn(hObject, eventdata, handles)

% hObject    handle to Water_initial1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Deltainitial2_Callback(hObject, eventdata, handles)
Dinitial2=str2double(get(hObject,'String'));
assignin('base','Dinitial2',Dinitial2);
% hObject    handle to Deltainitial2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Deltainitial2 as text
%        str2double(get(hObject,'String')) returns contents of Deltainitial2 as a double


% --- Executes during object creation, after setting all properties.
function Deltainitial2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Deltainitial2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Deltainitial3_Callback(hObject, eventdata, handles)
Dinitial3=str2double(get(hObject,'String'));
assignin('base','Dinitial3',Dinitial3);
% hObject    handle to Deltainitial3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Deltainitial3 as text
%        str2double(get(hObject,'String')) returns contents of Deltainitial3 as a double


% --- Executes during object creation, after setting all properties.
function Deltainitial3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Deltainitial3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Water_initial2_Callback(hObject, eventdata, handles)
water2=str2double(get(hObject,'String'));
assignin('base','water2',water2);
% hObject    handle to Water_initial2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Water_initial2 as text
%        str2double(get(hObject,'String')) returns contents of Water_initial2 as a double


% --- Executes during object creation, after setting all properties.
function Water_initial2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Water_initial2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Water_initial3_Callback(hObject, eventdata, handles)
water3=str2double(get(hObject,'String'));
waterini=water3;
assignin('base','waterini',waterini);
assignin('base','water3',water3);
% hObject    handle to Water_initial3 (see GCBO)

% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Water_initial3 as text
%        str2double(get(hObject,'String')) returns contents of Water_initial3 as a double


% --- Executes during object creation, after setting all properties.
function Water_initial3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Water_initial3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
evalin('base','clearvars -except GUIdataofexcel HoldONbuttonif'); 

% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --- Executes during object creation, after setting all properties.
function initial_water_CreateFcn(hObject, eventdata, handles)

% hObject    handle to initial_water (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function TinC_Callback(hObject, eventdata, handles)
TinC1=str2double(get(hObject,'String'));
assignin('base','TinC1',TinC1);
% hObject    handle to TinC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TinC as text
%        str2double(get(hObject,'String')) returns contents of TinC as a double


% --- Executes during object creation, after setting all properties.
function TinC_CreateFcn(hObject, eventdata, handles)

% hObject    handle to TinC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in buttonforexcel.
function buttonforexcel_Callback(hObject, eventdata, handles)
VolcDeGasOption
% hObject    handle to buttonforexcel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in startclosed.
function startclosed_Callback(hObject, eventdata, handles)                  %closed-system degassing see open-system degassign for description, all degassing steps are constant and independant of the previous step. one constant iniitial water and dD value, for code explanation look above

ExistTinC1=evalin( 'base', 'exist(''TinC1'',''var'') == 1' );
Existwaterini=evalin( 'base', 'exist(''waterini'',''var'') == 1' );
Existwater1=evalin( 'base', 'exist(''water1'',''var'') == 1' );
Existwater2=evalin( 'base', 'exist(''water2'',''var'') == 1' );
Existwater3=evalin( 'base', 'exist(''water3'',''var'') == 1' );
ExistDinitial1=evalin( 'base', 'exist(''Dinitial1'',''var'') == 1' );
ExistDinitial2=evalin( 'base', 'exist(''Dinitial2'',''var'') == 1' );
ExistDinitial3=evalin( 'base', 'exist(''Dinitial3'',''var'') == 1' );
Existminxax=evalin( 'base', 'exist(''minxax'',''var'') == 1' );
Existmaxxax=evalin( 'base', 'exist(''maxxax'',''var'') == 1' );
Existminyax=evalin( 'base', 'exist(''minyax'',''var'') == 1' );
Existmaxyax=evalin( 'base', 'exist(''maxyax'',''var'') == 1' );
Existalphaself=evalin( 'base', 'exist(''alphaself'',''var'') == 1' );




if ExistTinC1 && Existwaterini && Existwater1 && Existwater2 && ... 
   Existwater3 && ExistDinitial1 && ExistDinitial2 && ExistDinitial3 ...
   && Existminxax && Existmaxxax && Existminyax && Existmaxyax    



TinC1=evalin('base','TinC1');
waterini=evalin('base','waterini');
water1=evalin('base','water1'); 
water2=evalin('base','water2'); 
water3=evalin('base','water3'); 
Dinitial1=evalin('base','Dinitial1'); 
Dinitial2=evalin('base','Dinitial2');
Dinitial3=evalin('base','Dinitial3'); 
minxax=evalin('base','minxax');
maxxax=evalin('base','maxxax');
minyax=evalin('base','minyax');
maxyax=evalin('base','maxyax');
alphaH20=0.9896;    %
alphaOH=1.0415;
%%%


if Dinitial1>Dinitial3
    errordlg(strcat('First', 32, char(hex2dec('03B4')),'D field requires a lower value than third  '),'Error');                                      
return
end

if water1>water3
     errordlg('First water field requires a lower value than third field','Error'); 
    return
end



if minxax>maxxax
     errordlg('First x-axis field requires a lower value than second field','Error'); 
    return
end

if minyax>maxyax
     errordlg('First  y-axis field requires a lower value than second field','Error'); 
    return
end




waterinitial=waterini;
waterfinal=water3:-water2:water1;
Dinitial=Dinitial1:Dinitial2:Dinitial3   ; 
Dfinal=zeros(length(waterfinal),length(Dinitial));
assignin('base','Dinitial',Dinitial);
assignin('base','waterfinal',waterfinal);
%%%
if ~Existalphaself 
    
alpha=zeros(length(waterfinal),1);
SiO2peroxygen=30.0421;
TinK=TinC1+273.15;
%%%

K=exp(1.89-3120/TinK);


%%%%
m=1;
for waterfinalloop=waterfinal

Xbulk=(waterfinalloop/18.015)/((waterfinalloop/18.015)+(100-waterfinalloop)/SiO2peroxygen);  




XOHm=(1/2-(1/4-((K-4)/K)*(Xbulk-Xbulk^2))^0.5)/((K-4)/(2*K));

XH2Om=Xbulk-0.5*XOHm;

XH20mfraction=2*XH2Om/(2*XH2Om+XOHm);

alpha(m,1)=exp(XH20mfraction*log(alphaH20)+(1-XH20mfraction)*log(alphaOH));  
m=m+1;

end
%%%%

assignin('base','alpha',alpha);
    
    
 else
    alpha=evalin('base','alphaself'); 
assignin('base','alpha',alpha);
end

nn=1;
for Dinitialloop=Dinitial
    n=1;
for waterfinalloop=waterfinal

Dfinal(n,nn)=Dinitialloop-((1-(waterfinalloop/waterinitial))*10^3)*log(alpha(n,1));     %closed system degassing (Taylor 1983)

n=n+1;

end 

nn=nn+1;
end 

assignin('base','Dfinal',Dfinal);


F1=figure(1);set(F1,'name','Closed-system degassing 2D-plot main figure','numbertitle','off');
plot(waterfinal,Dfinal)
ylabel('\deltaD in ‰');
xlabel('Bulk water content in wt%');
axis([minxax maxxax minyax maxyax]);
grid on;

F22=figure(22);set(F22,'name','Closed-system degassing 2D-plot for comparing','numbertitle','off');
plot(waterfinal,Dfinal)
ylabel('\deltaD in ‰');
xlabel('Bulk water content in wt%');
axis([minxax maxxax minyax maxyax]);
grid on;

F2=figure(2);set(F2,'name','Closed-system degassing 3D-plot','numbertitle','off');
surf(Dinitial,waterfinal,Dfinal)
zlabel('\deltaD in ‰');
ylabel('Bulk water content in wt%');
xlabel('initial \deltaD in ‰');
grid on;

F3=figure(3);set(F3,'name','Closed-system degassing 3D-plot cleaned for visibility','numbertitle','off');
surf(Dinitial,waterfinal,Dfinal,'LineStyle','none')
zlabel('\deltaD in ‰');
ylabel('Bulk water content in wt%');
xlabel('initial \deltaD in ‰');
grid on;

assignin('base','F1',F1);
assignin('base','F22',F22);
assignin('base','F2',F2);
assignin('base','F3',F3);

else 
    
errordlg('Set all variables','Error');

end

    
% hObject    handle to startclosed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function minxax_Callback(hObject, eventdata, handles)
minxax=str2double(get(hObject,'String'));
assignin('base','minxax',minxax);
% hObject    handle to minxax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of minxax as text
%        str2double(get(hObject,'String')) returns contents of minxax as a double


% --- Executes during object creation, after setting all properties.
function minxax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to minxax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function maxxax_Callback(hObject, eventdata, handles)
% hObject    handle to maxxax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
maxxax=str2double(get(hObject,'String'));
assignin('base','maxxax',maxxax);
% Hints: get(hObject,'String') returns contents of maxxax as text
%        str2double(get(hObject,'String')) returns contents of maxxax as a double


% --- Executes during object creation, after setting all properties.
function maxxax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to maxxax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function minyax_Callback(hObject, eventdata, handles)
% hObject    handle to minyax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
minyax=str2double(get(hObject,'String'));
assignin('base','minyax',minyax);
% Hints: get(hObject,'String') returns contents of minyax as text
%        str2double(get(hObject,'String')) returns contents of minyax as a double


% --- Executes during object creation, after setting all properties.
function minyax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to minyax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function maxyax_Callback(hObject, eventdata, handles)
% hObject    handle to maxyax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
maxyax=str2double(get(hObject,'String'));
assignin('base','maxyax',maxyax);
% Hints: get(hObject,'String') returns contents of maxyax as text
%        str2double(get(hObject,'String')) returns contents of maxyax as a double


% --- Executes during object creation, after setting all properties.
function maxyax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to maxyax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in startbatched.
function startbatched_Callback(hObject, eventdata, handles)                 %batched-system degassing (Taylor 1991) but with constant step size closed system formular with adjusting initial values of water and dD, for code explanation look above
% hObject    handle to startbatched (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ExistTinC1=evalin( 'base', 'exist(''TinC1'',''var'') == 1' );
Existwaterini=evalin( 'base', 'exist(''waterini'',''var'') == 1' );
Existwater1=evalin( 'base', 'exist(''water1'',''var'') == 1' );
Existwater2=evalin( 'base', 'exist(''water2'',''var'') == 1' );
Existwater3=evalin( 'base', 'exist(''water3'',''var'') == 1' );
ExistDinitial1=evalin( 'base', 'exist(''Dinitial1'',''var'') == 1' );
ExistDinitial2=evalin( 'base', 'exist(''Dinitial2'',''var'') == 1' );
ExistDinitial3=evalin( 'base', 'exist(''Dinitial3'',''var'') == 1' );
Existminxax=evalin( 'base', 'exist(''minxax'',''var'') == 1' );
Existmaxxax=evalin( 'base', 'exist(''maxxax'',''var'') == 1' );
Existminyax=evalin( 'base', 'exist(''minyax'',''var'') == 1' );
Existmaxyax=evalin( 'base', 'exist(''maxyax'',''var'') == 1' );
Existalphaself=evalin( 'base', 'exist(''alphaself'',''var'') == 1' );




if ExistTinC1 && Existwaterini && Existwater1 && Existwater2 && ... 
   Existwater3 && ExistDinitial1 && ExistDinitial2 && ExistDinitial3 ...
   && Existminxax && Existmaxxax && Existminyax && Existmaxyax    




TinC1=evalin('base','TinC1');
waterini=evalin('base','waterini');
water1=evalin('base','water1'); 
water2=evalin('base','water2'); 
water3=evalin('base','water3'); 
Dinitial1=evalin('base','Dinitial1'); 
Dinitial2=evalin('base','Dinitial2');
Dinitial3=evalin('base','Dinitial3'); 
minxax=evalin('base','minxax');
maxxax=evalin('base','maxxax');
minyax=evalin('base','minyax');
maxyax=evalin('base','maxyax');
alphaH20=0.9896;  
alphaOH=1.0415;
%%%



if Dinitial1>Dinitial3
    errordlg(strcat('First', 32, char(hex2dec('03B4')),'D field requires a lower value than third  '),'Error');                                      
return
end

if water1>water3
     errordlg('First water field requires a lower value than third field','Error'); 
    return
end



if minxax>maxxax
     errordlg('First x-axis field requires a lower value than second field','Error'); 
    return
end

if minyax>maxyax
     errordlg('First  y-axis field requires a lower value than second field','Error'); 
    return
end



waterinitial=waterini;
waterfinal=water3:-water2:water1;
Dinitial=Dinitial1:Dinitial2:Dinitial3   ; 
Dfinal=zeros(length(waterfinal),length(Dinitial));
assignin('base','Dinitial',Dinitial);
assignin('base','waterfinal',waterfinal);
%%%
if ~Existalphaself 

alpha=zeros(length(waterfinal),1);
SiO2peroxygen=30.0421;
TinK=TinC1+273.15;
%%%



K=exp(1.89-3120/TinK);
%%%%
m=1;
for waterfinalloop=waterfinal

Xbulk=(waterfinalloop/18.015)/((waterfinalloop/18.015)+(100-waterfinalloop)/SiO2peroxygen);  




XOHm=(1/2-(1/4-((K-4)/K)*(Xbulk-Xbulk^2))^0.5)/((K-4)/(2*K));

XH2Om=Xbulk-0.5*XOHm;


XH20mfraction=2*XH2Om/(2*XH2Om+XOHm);



alpha(m,1)=exp(XH20mfraction*log(alphaH20)+(1-XH20mfraction)*log(alphaOH));   
m=m+1;
end
%%%%

assignin('base','alpha',alpha);

else
    alpha=evalin('base','alphaself'); 
assignin('base','alpha',alpha);
end



waterinitial1=zeros(1,length(waterfinal)+1);

nn=1;
for Dinitialloop=Dinitial
  Dinitialloop1=Dinitialloop; 
    n=1;
    waterinitial1(1)=waterinitial;  
for waterfinalloop=waterfinal

    
waterinitial1(n+1)=waterfinalloop;
Dfinal(n,nn)=Dinitialloop1-((1-(waterfinalloop/waterinitial1(n)))*10^3)*log(alpha(n,1));
Dinitialloop1=Dfinal(n,nn);
n=n+1;

end  

nn=nn+1;
end  

assignin('base','Dfinal',Dfinal); 


F1=figure(1);set(F1,'name','Batched-system degassing 2D-plot main figure','numbertitle','off');
plot(waterfinal,Dfinal)
ylabel('\deltaD in ‰');
xlabel('Bulk water content in wt%');
axis([minxax maxxax minyax maxyax]);
grid on;

F23=figure(23);set(F23,'name','Batched-system degassing 2D-plot for comparing','numbertitle','off');
plot(waterfinal,Dfinal)
ylabel('\deltaD in ‰');
xlabel('Bulk water content in wt%');
axis([minxax maxxax minyax maxyax]);
grid on;

F2=figure(2);set(F2,'name','Batched-system degassing 3D-plot','numbertitle','off');
surf(Dinitial,waterfinal,Dfinal)
zlabel('\deltaD in ‰');
ylabel('Bulk water content in wt%');
xlabel('initial \deltaD in ‰');
grid on;

F3=figure(3);set(F3,'name','Batched-system degassing 3D-plot cleaned for visibility','numbertitle','off');
surf(Dinitial,waterfinal,Dfinal,'LineStyle','none')
zlabel('\deltaD in ‰');
ylabel('Bulk water content in wt%');
xlabel('initial \deltaD in ‰');
grid on;
assignin('base','F1',F1);
assignin('base','F23',F23);
assignin('base','F2',F2);
assignin('base','F3',F3);

else 
    
errordlg('Set all variables','Error');

end

% --- Executes on button press in startbatchedaftertaylor.
function startbatchedaftertaylor_Callback(hObject, eventdata, handles) %batched-system degassing (Taylor 1991) adjusting initial water and dD values , 50% water loss on each step changes are commented, else look above for code explanation
% hObject    handle to startbatchedaftertaylor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



ExistTinC1=evalin( 'base', 'exist(''TinC1'',''var'') == 1' );
Existwaterini=evalin( 'base', 'exist(''waterini'',''var'') == 1' );
Existwater1=evalin( 'base', 'exist(''water1'',''var'') == 1' );
Existwater2=evalin( 'base', 'exist(''water2'',''var'') == 1' );
Existwater3=evalin( 'base', 'exist(''water3'',''var'') == 1' );
ExistDinitial1=evalin( 'base', 'exist(''Dinitial1'',''var'') == 1' );
ExistDinitial2=evalin( 'base', 'exist(''Dinitial2'',''var'') == 1' );
ExistDinitial3=evalin( 'base', 'exist(''Dinitial3'',''var'') == 1' );
Existminxax=evalin( 'base', 'exist(''minxax'',''var'') == 1' );
Existmaxxax=evalin( 'base', 'exist(''maxxax'',''var'') == 1' );
Existminyax=evalin( 'base', 'exist(''minyax'',''var'') == 1' );
Existmaxyax=evalin( 'base', 'exist(''maxyax'',''var'') == 1' );
Existalphaself=evalin( 'base', 'exist(''alphaself'',''var'') == 1' );

if ExistTinC1 && Existwaterini && Existwater1 && Existwater2 && ... 
   Existwater3 && ExistDinitial1 && ExistDinitial2 && ExistDinitial3 ...
   && Existminxax && Existmaxxax && Existminyax && Existmaxyax    


TinC1=evalin('base','TinC1');
waterini=evalin('base','waterini');
water1=evalin('base','water1'); 
water3=evalin('base','water3'); 
Dinitial1=evalin('base','Dinitial1'); 
Dinitial2=evalin('base','Dinitial2');
Dinitial3=evalin('base','Dinitial3'); 
minxax=evalin('base','minxax');
maxxax=evalin('base','maxxax');
minyax=evalin('base','minyax');
maxyax=evalin('base','maxyax');
alphaH20=0.9896;   
alphaOH=1.0415;
%%%


if Dinitial1>Dinitial3
    errordlg(strcat('First', 32, char(hex2dec('03B4')),'D field requires a lower value than third  '),'Error');                                      
return
end

if water1>water3
     errordlg('First water field requires a lower value than third field','Error'); 
    return
end



if minxax>maxxax
     errordlg('First x-axis field requires a lower value than second field','Error'); 
    return
end

if minyax>maxyax
     errordlg('First  y-axis field requires a lower value than second field','Error'); 
    return
end







Percentwaterlossvarneva=evalin( 'base', 'exist(''Percentwaterlossvar'',''var'') == 1' );
if Percentwaterlossvarneva
    Percentwaterlossvar=evalin('base','Percentwaterlossvar'); 
else
    Percentwaterlossvar=50;
end
Percentwaterlossvarfin=1-Percentwaterlossvar/100;

waterinitial=waterini;



mm=1;                                                                       %as no constant step size, water values need to be newly calculated starting from highest watercontent value
waterfinal(mm)=water3;                                                      %mm set to one => highest watercontent value is  first watercontent data point in new calculated model
mm=2;                                                                       %mm set to 2 to not overwrite  existing watercontent value
while waterfinal > water1                                                   %while loop, loop runs as long as waterfinal values are bigger then  water1 value (lowest vater value)
    
    waterfinal(mm)=waterfinal(mm-1)*Percentwaterlossvarfin;                                      %50 % water loss on each step is calculated here (/2).(mm-1) to calculated from first value and newtocalcwater(mm) to save those values starting at 2nd position, as the first position has the original, highest watercontent value 
    mm=mm+1;                                                                %counting up for next iteration => watercontent value is saved into new position
    
end

waterfinal=sort(waterfinal,'descend');

Dinitial=Dinitial1:Dinitial2:Dinitial3   ; 
Dfinal=zeros(length(waterfinal),length(Dinitial));
%%%





alpha=zeros(length(waterfinal),1);
SiO2peroxygen=30.0421;
TinK=TinC1+273.15;
%%%
assignin('base','Dinitial',Dinitial);
assignin('base','waterfinal',waterfinal);

if Existalphaself

    testyspec=evalin('base','testyspec'); 



totalwatwt=testyspec(:,1);                                                  %saving first excel column as totalwatwt (here bulk water content)
H2Omolwt=testyspec(:,2);                                                    %saving second  excel column as H2Omolwt (here speciation of H2O molecular)
OHwt=totalwatwt-H2Omolwt;                                                   %calculating OH value

waterforpolyfit(1:length(H2Omolwt)+2000000,1)=0;                            %creating many points at 0 so that the polynomial function is forced trough this point in the next line 
polyfitdataspecforpolyfit(1:length(H2Omolwt)+2000000,1)=0;                  %adding these created points to the user data




totalwatwtforfitfull=vertcat(totalwatwt,waterforpolyfit);                   %concentrating values vertical

H2Omolforfitfull=vertcat(H2Omolwt,polyfitdataspecforpolyfit);
OHforfitfull=vertcat(OHwt,polyfitdataspecforpolyfit);


polyfitdataspecH2O=polyfit(totalwatwtforfitfull,H2Omolforfitfull,2);        %calculation and saving of the polifit factor (polynomial function coefficients ) polynomial curve fitting with selected polynomial degree
polyfitdataspecOH=polyfit(totalwatwtforfitfull,OHforfitfull,2);                                                   



fspecH2O = polyval(polyfitdataspecH2O,waterfinal);                          %evaluation and calculation of calculated polynomial factor of polyfit based on each data point (x axis) in form fspecH2O = polyfitdataspecH2O(1)*waterfinal.^2+polyfitdataspecH2O(2)*waterfinal+polyfitdataspecH2O(3); 
fspecOH = polyval(polyfitdataspecOH,waterfinal);   

H2Owtfractionpoly=fspecH2O/100;                                             %calculalating of wt fraction from wt%
OHwtfractionpoly=fspecOH/100;


alpha=zeros(length(waterfinal),1);                                          %preallocation for faster speed with the fitting size of the variable
%%%%
m=1;                                                                        %setting m starting value => place of number (index) 
for H2Owtfractionpolyloop=1:length(waterfinal)                                              %starting of the loop with before described waterfinal values

H2Owtfractionpolyfull=H2Owtfractionpoly(m)/(H2Owtfractionpoly(m)+OHwtfractionpoly(m));  % calculating wt fraction of H2Om in relation to total water content     
OHwtfractionpolyfull=OHwtfractionpoly(m)/(H2Owtfractionpoly(m)+OHwtfractionpoly(m));    % calculating wt fraction of OH in relation to total water content  

alpha(m,1)=H2Owtfractionpolyfull*alphaH20+(OHwtfractionpolyfull)*alphaOH;   %calculation of  bulk water fractionation factor (alpha) in rhyolitic melts which is saved on each iteration as alpha at position (m,1)which is row m column 1  
m=m+1;                                                                      %changing m for next iteration so alpha  can be saved at the next position

end

    
else
K=exp(1.89-3120/TinK);
%%%%
m=1;
for waterfinalloop=waterfinal

Xbulk=(waterfinalloop/18.015)/((waterfinalloop/18.015)+(100-waterfinalloop)/SiO2peroxygen);  





XOHm=(1/2-(1/4-((K-4)/K)*(Xbulk-Xbulk^2))^0.5)/((K-4)/(2*K));

XH2Om=Xbulk-0.5*XOHm;

XH20mfraction=2*XH2Om/(2*XH2Om+XOHm);





alpha(m,1)=exp(XH20mfraction*log(alphaH20)+(1-XH20mfraction)*log(alphaOH));  
m=m+1;
end
%%%%
end


assignin('base','alpha',alpha);
waterinitial1=zeros(1,length(waterfinal)+1);

nn=1;
for Dinitialloop=Dinitial
  Dinitialloop1=Dinitialloop; 
    n=1;
    waterinitial1(1)=waterinitial;  
for waterfinalloop=waterfinal

    
waterinitial1(n+1)=waterfinalloop;
Dfinal(n,nn)=Dinitialloop1-((1-(waterfinalloop/waterinitial1(n)))*10^3)*log(alpha(n,1));
Dinitialloop1=Dfinal(n,nn);
n=n+1;

end  

nn=nn+1;

end  

assignin('base','Dfinal',Dfinal); 


F1=figure(1);set(F1,'name','Batched-system degassing (variable % water loss) 2D-plot main figure','numbertitle','off');
plot(waterfinal,Dfinal)
ylabel('\deltaD in ‰');
xlabel('Bulk water content in wt%');
axis([minxax maxxax minyax maxyax]);
grid on;

F24=figure(24);set(F24,'name','Batched-system degassing (variable % water loss) 2D-plot for comparing','numbertitle','off');
plot(waterfinal,Dfinal)
ylabel('\deltaD in ‰');
xlabel('Bulk water content in wt%');
axis([minxax maxxax minyax maxyax]);
grid on;

F2=figure(2);set(F2,'name','Batched-system degassing (variable % water loss) 3D-plot','numbertitle','off');
surf(Dinitial,waterfinal,Dfinal)
zlabel('\deltaD in ‰');
ylabel('Bulk water content in wt%');
xlabel('initial \deltaD in ‰');
grid on;

F3=figure(3);set(F3,'name','Batched-system degassing (variable % water loss) 3D-plot cleaned for visibility','numbertitle','off');
surf(Dinitial,waterfinal,Dfinal,'LineStyle','none')
zlabel('\deltaD in ‰');
ylabel('Bulk water content in wt%');
xlabel('initial \deltaD in ‰');
grid on;
assignin('base','F1',F1);
assignin('base','F24',F24);
assignin('base','F2',F2);
assignin('base','F3',F3);

else 
    
errordlg('Set all variables','Error');

end


function percentwaterloss_Callback(hObject, eventdata, handles)
% hObject    handle to percentwaterloss (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Percentwaterlossvar=str2double(get(hObject,'String'));                                                            
assignin('base','Percentwaterlossvar',Percentwaterlossvar);      
% Hints: get(hObject,'String') returns contents of percentwaterloss as text
%        str2double(get(hObject,'String')) returns contents of percentwaterloss as a double


% --- Executes during object creation, after setting all properties.
function percentwaterloss_CreateFcn(hObject, eventdata, handles)
% hObject    handle to percentwaterloss (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in speciationcalc.
function speciationcalc_Callback(hObject, eventdata, handles)
% hObject    handle to speciationcalc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


Existwater1=evalin( 'base', 'exist(''water1'',''var'') == 1' );
Existwater2=evalin( 'base', 'exist(''water2'',''var'') == 1' );
Existwater3=evalin( 'base', 'exist(''water3'',''var'') == 1' );

if Existwater1 && Existwater2 && Existwater3


water1=evalin('base','water1'); 
water2=evalin('base','water2'); 
water3=evalin('base','water3'); 
waterfinal=water3:-water2:water1;                                           

if water1>water3
     errordlg('First water field requires a lower value than third field','Error'); 
    return
end


alphaH20=0.9896;                                                            %alpha molecular water fractionation factor  (rust et al. 2004) 
alphaOH=1.0415;                                                             %alhpa hydroxyl group  fractionation factor  (rust et al. 2004)   




                                    



[filenamespec, pathnamespec] = ...                                          %saving filename and pathname together of
     uigetfile({'*.*'},'File Selector');                                    %selected file of all formats ({'*.*'})which are selected from the opened window named File selector( file selection dialog box) /(uigetfile({'*.*'},'File Selector')
fullpathspec=strcat(pathnamespec,filenamespec);                             %saving filename and selected path as actual usable variable
testyspec=xlsread(fullpathspec);                                            %reading excel data from user selected file                                                        
if filenamespec==0

  return
end

assignin('base','testyspec',testyspec);


totalwatwt=testyspec(:,1);                                                  %saving first excel column as totalwatwt (here bulk water content)
H2Omolwt=testyspec(:,2);                                                    %saving second  excel column as H2Omolwt (here speciation of H2O molecular)
OHwt=totalwatwt-H2Omolwt;                                                   %calculating OH value

waterforpolyfit(1:length(H2Omolwt)+2000000,1)=0;                            %creating many points at 0 so that the polynomial function is forced trough this point in the next line 
polyfitdataspecforpolyfit(1:length(H2Omolwt)+2000000,1)=0;                  %adding these created points to the user data




totalwatwtforfitfull=vertcat(totalwatwt,waterforpolyfit);                   %concentrating values vertical

H2Omolforfitfull=vertcat(H2Omolwt,polyfitdataspecforpolyfit);
OHforfitfull=vertcat(OHwt,polyfitdataspecforpolyfit);


polyfitdataspecH2O=polyfit(totalwatwtforfitfull,H2Omolforfitfull,2);        %calculation and saving of the polifit factor (polynomial function coefficients ) polynomial curve fitting with selected polynomial degree
polyfitdataspecOH=polyfit(totalwatwtforfitfull,OHforfitfull,2);                                                   



fspecH2O = polyval(polyfitdataspecH2O,waterfinal);                          %evaluation and calculation of calculated polynomial factor of polyfit based on each data point (x axis) in form fspecH2O = polyfitdataspecH2O(1)*waterfinal.^2+polyfitdataspecH2O(2)*waterfinal+polyfitdataspecH2O(3); 
fspecOH = polyval(polyfitdataspecOH,waterfinal);   

H2Owtfractionpoly=fspecH2O/100;                                             %calculalating of wt fraction from wt%
OHwtfractionpoly=fspecOH/100;


alpha=zeros(length(waterfinal),1);                                          %preallocation for faster speed with the fitting size of the variable
%%%%
m=1;                                                                        %setting m starting value => place of number (index) 

for H2Owtfractionpolyloop=1:length(waterfinal)                              %starting of the loop with before described waterfinal values

H2Owtfractionpolyfull=H2Owtfractionpoly(m)/(H2Owtfractionpoly(m)+OHwtfractionpoly(m));  % calculating wt fraction of H2Om in relation to total water content     
OHwtfractionpolyfull=OHwtfractionpoly(m)/(H2Owtfractionpoly(m)+OHwtfractionpoly(m));    % calculating wt fraction of OH in relation to total water content  

alpha(m,1)=H2Owtfractionpolyfull*alphaH20+(OHwtfractionpolyfull)*alphaOH;   %calculation of  bulk water fractionation factor (alpha) in rhyolitic melts which is saved on each iteration as alpha at position (m,1)which is row m column 1  
m=m+1;                                                                      %changing m for next iteration so alpha  can be saved at the next position

end


F57789=figure(57789);set(F57789,'name','Speciation values and alpha factor','numbertitle','off','unit','normalized','Position', [.2 0.2 0.6 0.5]);
sub111 = subplot(1,2,1);
pp1=plot(waterfinal,fspecH2O,'b','DisplayName','Extrapolated H_{2}O_{m} values');
hold on
pp2=plot(waterfinal,fspecOH,'r','DisplayName','Extrapolated OH values');
hold on
pp3=plot(totalwatwt,H2Omolwt,'.b','DisplayName','User data H_{2}O_{m}');
hold on
pp4=plot(totalwatwt,OHwt,'.r','DisplayName','User data OH');
ylabel('Wt% of H_{2}O as H_{2}O_{m} and OH');
xlabel('Bulk water content in wt%');
legend([pp1,pp2,pp3,pp4],'Location','northwest')
hold off
pbaspect([1 1 1])
sub212 = subplot(1,2,2);
plot(waterfinal,alpha)
ylabel('Alpha (as a function of speciation)');
xlabel('Bulk water content in wt%');
pbaspect([1 1 1])
hold off



assignin('base','F57789',F57789);

assignin('base','sub212',sub212);

assignin('base','sub111',sub111);

under0findalpha=find(alpha<=1, 1);

if ~isempty(under0findalpha)
      errordlg('Check speciation data in relation to untrusted values','Alpha factor under 1 error'); 
      
else
    
    
alphaself=alpha;
assignin('base','alphaself',alphaself);
end

else
  errordlg('Set all variables first','Error'); 
end








% --- Executes on button press in automaticcalculation.
function automaticcalculation_Callback(hObject, eventdata, handles)
% hObject    handle to automaticcalculation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename2, pathname2] = ...                                                  %saving filename and pathname together of
     uigetfile({'*.*'},'Input measured data by formatted excel sheet (first column water content, second column dD value)');                                    %selected file of all formats ({'*.*'})which are selected from the opened window named File selector( file selection dialog box) /(uigetfile({'*.*'},'File Selector')
fullpath2=strcat(pathname2,filename2);                                         %saving filename and selected path as actual usable variable
assignin('base','fullpath2',fullpath2);                                       %saving variable to workspace
if filename2==0

  return
end
excelauto=xlsread(fullpath2); 

tic
autofuncionused=1;


assignin('base','autofuncionused',autofuncionused);   






ExistTinC1=evalin( 'base', 'exist(''TinC1'',''var'') == 1' );
Existwaterini=evalin( 'base', 'exist(''waterini'',''var'') == 1' );
Existwater1=evalin( 'base', 'exist(''water1'',''var'') == 1' );
Existwater2=evalin( 'base', 'exist(''water2'',''var'') == 1' );
Existwater3=evalin( 'base', 'exist(''water3'',''var'') == 1' );
ExistDinitial1=evalin( 'base', 'exist(''Dinitial1'',''var'') == 1' );
ExistDinitial2=evalin( 'base', 'exist(''Dinitial2'',''var'') == 1' );
ExistDinitial3=evalin( 'base', 'exist(''Dinitial3'',''var'') == 1' );
Existminxax=evalin( 'base', 'exist(''minxax'',''var'') == 1' );
Existmaxxax=evalin( 'base', 'exist(''maxxax'',''var'') == 1' );
Existminyax=evalin( 'base', 'exist(''minyax'',''var'') == 1' );
Existmaxyax=evalin( 'base', 'exist(''maxyax'',''var'') == 1' );
Existalphaself=evalin( 'base', 'exist(''alphaself'',''var'') == 1' );
Existsettransitionauto=evalin( 'base', 'exist(''settransitionauto'',''var'') == 1' );




if ExistTinC1 && Existwaterini && Existwater1 && Existwater2 && ... 
   Existwater3 && ExistDinitial1 && ExistDinitial2 && ExistDinitial3 ...
   && Existminxax && Existmaxxax && Existminyax && Existmaxyax    




TinC1=evalin('base','TinC1');
waterini=evalin('base','waterini');
water1=evalin('base','water1'); 
water2=evalin('base','water2'); 
water3=evalin('base','water3'); 
Dinitial1=evalin('base','Dinitial1'); 
Dinitial2=evalin('base','Dinitial2');
Dinitial3=evalin('base','Dinitial3'); 
minxax=evalin('base','minxax');
maxxax=evalin('base','maxxax');
minyax=evalin('base','minyax');
maxyax=evalin('base','maxyax');
alphaH20=0.9896;  
alphaOH=1.0415;
%%%

if Existsettransitionauto
    settransitionauto=evalin('base','settransitionauto');
    
else
    
settransitionauto=0.6;   
end


if Dinitial1>Dinitial3
    errordlg(strcat('First', 32, char(hex2dec('03B4')),'D field requires a lower value than third  '),'Error');                                      
return
end

if water1>water3
     errordlg('First water field requires a lower value than third field','Error'); 
    return
end



if minxax>maxxax
     errordlg('First x-axis field requires a lower value than second field','Error'); 
    return
end

if minyax>maxyax
     errordlg('First  y-axis field requires a lower value than second field','Error'); 
    return
end

waitbarauto = waitbar(0,'Calculating open-system...','Name','Best-fit calculations');                                               %creating progress bar
frames = java.awt.Frame.getFrames();
frames(end).setAlwaysOnTop(1); 



waterinitial=waterini;
waterfinal=water3:-water2:water1;
Dinitial=Dinitial1:Dinitial2:Dinitial3   ; 

assignin('base','Dinitial',Dinitial);
assignin('base','waterfinal',waterfinal);




if ~Existalphaself 
    

alpha=zeros(length(waterfinal),1);
SiO2peroxygen=30.0421;
TinK=TinC1+273.15;
%%%



K=exp(1.89-3120/TinK);
%%%%
m=1;
for waterfinalloop=waterfinal

Xbulk=(waterfinalloop/18.015)/((waterfinalloop/18.015)+(100-waterfinalloop)/SiO2peroxygen);  




XOHm=(1/2-(1/4-((K-4)/K)*(Xbulk-Xbulk^2))^0.5)/((K-4)/(2*K));

XH2Om=Xbulk-0.5*XOHm;


XH20mfraction=2*XH2Om/(2*XH2Om+XOHm);



alpha(m,1)=exp(XH20mfraction*log(alphaH20)+(1-XH20mfraction)*log(alphaOH));   
m=m+1;
end
%%%%

assignin('base','alpha',alpha);

else
    alpha=evalin('base','alphaself'); 
assignin('base','alpha',alpha);
end





%open system

waterinitial1=zeros(1,length(waterfinal)+1);
Dfinalpureopen=zeros(length(waterfinal),length(Dinitial));      
nn=1;
for Dinitialloop=Dinitial
  Dinitialloop1=Dinitialloop; 
    n=1;
    waterinitial1(1)=waterinitial;  
for waterfinalloop=waterfinal

    
waterinitial1(n+1)=waterfinalloop;
Dfinalpureopen(n,nn)=(Dinitialloop1+1000)*((waterfinalloop/waterinitial1(n))^(alpha(n,1)-1))-1000; 
Dinitialloop1=Dfinalpureopen(n,nn);
n=n+1;

end  

nn=nn+1;
end  

nnn=nn-1;


                                                                              

    fullpath2rounded=round(excelauto(:,1)*1000)/1000;                        % rounding excelauto to round to 3 digits to the right of the decimal point, trick to make program useable with older versions
                                
    
interpolwaterval=(min(fullpath2rounded):0.0001:max(fullpath2rounded))';    %setting the required x values for interpolation






indexforwater=zeros(1,length(fullpath2rounded));

for ismemberreplace=1:length(fullpath2rounded)
[~, indexforwater(ismemberreplace)]=min(abs(interpolwaterval-fullpath2rounded(ismemberreplace)));   %%find minimum difference between searched value and data values ('~' for saving it as the location/place of the data), watercontent always descends, no double value are found
end

indexforwater=indexforwater';






Rfactormopen=zeros(nnn,1);
adjRfactormopen=zeros(nnn,1);
RMSEvalopen=zeros(nnn,1);
%^ global use
%individual use

for rloop=1:nnn


interpolatedvaluesy=interp1(waterfinal,Dfinalpureopen(:,rloop),interpolwaterval);        %interpolation of y values in relation to x values


valuesytocompare=interpolatedvaluesy(indexforwater);


Rfactormopen(rloop,1)=corr(valuesytocompare,excelauto(:,2))^2;                              %calculating Pearson correlation coefficient and ^2 for the coefficient of deteremination from user data y values (testy(:,2)) and the by the program calculated and interpolated y values (valuesytocompare)
adjRfactormopen(rloop,1)=1-(1-Rfactormopen(rloop,1))*((length(valuesytocompare)-1)/(length(valuesytocompare)-1-1));   %calculating the adjusted coefficient of determination
RMSEvalopen(rloop,1)=rms(valuesytocompare-excelauto(:,2));                                     




end
%
[RMSEvalopenmin,RMSEvalopenminindex]=min(RMSEvalopen);                      %

Rfactorm=Rfactormopen(RMSEvalopenminindex);
adjRfactorm=adjRfactormopen(RMSEvalopenminindex);
initialvalue=Dinitial(1,RMSEvalopenminindex);                                 %the different colums of Dfinal/Dinalsearch are calculated using different Diniitial values,they are the same columns as Dinitial columns, searched y value (column) is at the same time also the same columns with its Dinitial value                                                                                                                        

if isnan(Rfactorm)
    rightinterpreter= struct('WindowStyle','modal',...                      %setting the an interpreter (tex) for the following errordlg
              'Interpreter','tex');
    errordlg('For R^{2} the calculated values are required to portray all sample data. Example: With a step size of 0.1 set lowest bulk water content as 0.001 and initial bulk water content as 4.001 instead of 4 ','Error'...
        ,rightinterpreter);                                                 %interpreter to be used. Here ît is required for the line "R^{2}" to be displayed correctly
end

initialvaluestring=num2str(initialvalue);                                    %creating string from a value with num2str
Displaysentence=('Calculated graph with initial \deltaD value of');
permilledisplay=(' ‰');
initialvaluestringdisplay=strcat(Displaysentence, 32,initialvaluestring,permilledisplay); %connecting strings with strcat 

Rsuperstring=('R^{2}   =');                                                 %creating string whereas ^{} is the tex code for superscript
Rfactormtostring=num2str(Rfactorm);
stringRfactorm=strcat(Rsuperstring, 32, Rfactormtostring);                  %concatenate strings whereas  32 is the ASCII code for a blank space

adjRsuBstring=('R^{2}_{adj} =');                                            %creating string whereas ^{} is the tex code for superscript and _{} for subscript
adjRfactormtostring=num2str(adjRfactorm);                                   %converting number to character arrary
stringadjRfactorm=strcat(adjRsuBstring, 32, adjRfactormtostring);

RMSEpurestring=('RMSE =');  
RMSEpurestringtostring=num2str(RMSEvalopenmin);
stringRMSEval=strcat(RMSEpurestring, 32, RMSEpurestringtostring);




F1334=figure(1334);set(F1334,'name','Best fit open-degassing system','numbertitle','off');
movegui(F1334,'southwest');

LINE1334=plot(waterfinal,Dfinalpureopen(:,RMSEvalopenminindex),'DisplayName',initialvaluestringdisplay);
ylabel('\deltaD in ‰');
xlabel('Bulk water content in wt%');
axis([minxax maxxax minyax maxyax]);

hold on
excelautopoints=plot(excelauto(:,1),excelauto(:,2),'r.','MarkerSize',10,'DisplayName','Sample data');                 %plotting all original data points as dots with a marker size of 10 and display name Sample data for the legend

hold on
R2plot=plot(NaN,NaN,'DisplayName',stringRfactorm, 'linestyle', 'none');% the legend requires a plot it relates too, here an empty plot is created (NaN) only containing the stringRfactorm string
 hold on
adjR2plot=plot(NaN,NaN,'DisplayName',stringadjRfactorm, 'linestyle', 'none'); % same as above
 hold on
RMSEvalplot=plot(NaN,NaN,'DisplayName',stringRMSEval, 'linestyle', 'none');
 

legend([LINE1334,excelautopoints,R2plot,adjR2plot,RMSEvalplot],'Location','southeast');   
  grid on;

 hold off

 
 
 
 watercontent=waterfinal';                                                 %changing watervalue data layout to use it for table (one row into one columns "'")
Dfinalopentrans1=num2cell(Dfinalpureopen(:,RMSEvalopenminindex));          %converting array to cell array

watercontent1=num2cell(watercontent);

Dininitialvalue=cell(1,length(watercontent));                              %preallocation with cells. Creates empty cell with desired rows and columns

for Tablepreploop=1:length(watercontent)                                   %simplistic loop which wrties empty cells of type "char" for character cell, instead of cells of type "double", by writing string ''
    Dininitialvalue{Tablepreploop}=num2str('');
end

Dininitialvalueemtpy=Dininitialvalue';                                      %transposing cell
Rfactormstringtable=Dininitialvalueemtpy;
adjRfactormstringtable=Dininitialvalueemtpy;
RMSEvalstringtable=Dininitialvalueemtpy;
Dininitialvalue{1}=strcat(32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,num2str(initialvalue));                                  %setting first cell of char array as a string containing the initial dD value
Dininitialvalue=Dininitialvalue';



Rfactormstringtable{1}=Rfactorm;
adjRfactormstringtable{1}=adjRfactorm;
RMSEvalstringtable{1}=RMSEvalopenmin;

F3312=figure(3312);set(F3312,'name','Best fit open-degassing system', ...
    'numbertitle','off','unit','normalized','Position', [0.2 0.2 0.43 0.5],'visible','off');
deltacode = char(hex2dec('03B4'));                                           %workaround for uitable in next line. Uitable can not read special characters or tex code (\delta), hex2dec translate Unicode into ASCII code which then can be read by char as the special character                                       
Tableopen=uitable('Data',[watercontent1,Dfinalopentrans1,Dininitialvalue,Rfactormstringtable,adjRfactormstringtable,RMSEvalstringtable],'unit','normalized', ...           %creating a table on a new figure window whereas 'Data' considers the variable inside the next [] as the data it should write, which fills the whole figure  ('unit','normalized','Position', [0 0 1 1])       
'Position', [0 0 1 1],'ColumnName',{'Bulk water content in wt%',[' ',deltacode,'D in ‰'],[' Selected graph initial', 032,deltacode,'D in ‰'], ...       %'ColumnsName', sets the next imnput inside the {} as the column names
['R',char(hex2dec('00B2'))],['adjR',char(hex2dec('00B2'))],['RMSE']});   








Dataoftableopen=get(Tableopen,'Data');                                  %gets the current Data ('Data') of active table (Tableclosedtoopen)
Columnheaderopen=get(Tableopen,'ColumnName');                           %gets the current Column names ('ColumnName') of active table



Dataofgraphopen=[Columnheaderopen';Dataoftableopen];




assignin('base','Dataofgraphopen',Dataofgraphopen);
 
 


assignin('base','F1334',F1334);
assignin('base','LINE1334',LINE1334);


%

%










 
%closed system
 waitbar(0.14,waitbarauto,'Calculating closed-system...','Name','Best-fit calculations');   %updating progress bar


Dfinalpureclosed=zeros(length(waterfinal),length(Dinitial));      
nn=1;
for Dinitialloop=Dinitial
  Dinitialloop1=Dinitialloop; 
    n=1;
  
for waterfinalloop=waterfinal

    
Dfinalpureclosed(n,nn)=Dinitialloop1-((1-(waterfinalloop/waterinitial))*10^3)*log(alpha(n,1));

n=n+1;

end  

nn=nn+1;
end  

nnn=nn-1;












Rfactormclosed=zeros(nnn,1);
adjRfactormclosed=zeros(nnn,1);
RMSEvalclosed=zeros(nnn,1);


for rloop=1:nnn


interpolatedvaluesy=interp1(waterfinal,Dfinalpureclosed(:,rloop),interpolwaterval);        


valuesytocompare=interpolatedvaluesy(indexforwater);

Rfactormclosed(rloop,1)=corr(valuesytocompare,excelauto(:,2))^2;                              
adjRfactormclosed(rloop,1)=1-(1-Rfactormclosed(rloop,1))*((length(valuesytocompare)-1)/(length(valuesytocompare)-1-1));   
RMSEvalclosed(rloop,1)=rms(valuesytocompare-excelauto(:,2));                                     




end
%
[RMSEvalclosedmin,RMSEvalclosedinindex]=min(RMSEvalclosed);                      

Rfactorm=Rfactormclosed(RMSEvalclosedinindex);
adjRfactorm=adjRfactormclosed(RMSEvalclosedinindex);
initialvalue=Dinitial(1,RMSEvalclosedinindex);                                                                                                                                                          



initialvaluestring=num2str(initialvalue);                                     
initialvaluestringdisplay=strcat(Displaysentence, 32,initialvaluestring,permilledisplay);  


Rfactormtostring=num2str(Rfactorm);
stringRfactorm=strcat(Rsuperstring, 32, Rfactormtostring);                   

                                            
adjRfactormtostring=num2str(adjRfactorm);                                    
stringadjRfactorm=strcat(adjRsuBstring, 32, adjRfactormtostring);


RMSEpurestringtostring=num2str(RMSEvalclosedmin);
stringRMSEval=strcat(RMSEpurestring, 32, RMSEpurestringtostring);




F1338=figure(1338);set(F1338,'name','Best fit closed-degassing system','numbertitle','off');
movegui(F1338,'south');


LINE1338=plot(waterfinal,Dfinalpureclosed(:,RMSEvalclosedinindex),'DisplayName',initialvaluestringdisplay);
ylabel('\deltaD in ‰');
xlabel('Bulk water content in wt%');
axis([minxax maxxax minyax maxyax]);

hold on
excelautopoints=plot(excelauto(:,1),excelauto(:,2),'r.','MarkerSize',10,'DisplayName','Sample data');                  

hold on
R2plot=plot(NaN,NaN,'DisplayName',stringRfactorm, 'linestyle', 'none'); 
 hold on
adjR2plot=plot(NaN,NaN,'DisplayName',stringadjRfactorm, 'linestyle', 'none'); 
 hold on
RMSEvalplot=plot(NaN,NaN,'DisplayName',stringRMSEval, 'linestyle', 'none');
 

legend([LINE1338,excelautopoints,R2plot,adjR2plot,RMSEvalplot],'Location','southeast');   
  grid on;

 hold off

 
 
 
                                                
    

                      

                                  
Dfinalclosedtrans1=num2cell(Dfinalpureclosed(:,RMSEvalclosedinindex)); 


Dininitialvalue{1}=strcat(32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,num2str(initialvalue));                                   
Rfactormstringtable{1}=Rfactorm;
adjRfactormstringtable{1}=adjRfactorm;
RMSEvalstringtable{1}=RMSEvalclosedmin;

F3213=figure(3313);set(F3213,'name','Best fit closed-degassing system', ...
    'numbertitle','off','unit','normalized','Position', [0.2 0.2 0.43 0.5],'visible','off');
                                                                                   
Tableclosed=uitable('Data',[watercontent1,Dfinalclosedtrans1,Dininitialvalue,Rfactormstringtable,adjRfactormstringtable,RMSEvalstringtable],'unit','normalized', ...                   
'Position', [0 0 1 1],'ColumnName',{'Bulk water content in wt%',[' ',deltacode,'D in ‰'],[' Selected graph initial', 032,deltacode,'D in ‰'], ...        
['R',char(hex2dec('00B2'))],['adjR',char(hex2dec('00B2'))],['RMSE']});   








Dataoftableclosed=get(Tableclosed,'Data');                                   
Columnheaderclosed=get(Tableclosed,'ColumnName');                            



Dataofgraphclosed=[Columnheaderclosed';Dataoftableclosed];




assignin('base','Dataofgraphclosed',Dataofgraphclosed);
 
 


assignin('base','F1338',F1338);
assignin('base','LINE1338',LINE1338);







%batched system

 waitbar(0.28,waitbarauto,'Calculating batched-system...','Name','Best-fit calculations');



waterinitial1=zeros(1,length(waterfinal)+1);
Dfinalpurebatched=zeros(length(waterfinal),length(Dinitial));      
nn=1;
for Dinitialloop=Dinitial
  Dinitialloop1=Dinitialloop; 
    n=1;
      waterinitial1(1)=waterinitial;  

for waterfinalloop=waterfinal

waterinitial1(n+1)=waterfinalloop;
Dfinalpurebatched(n,nn)=Dinitialloop1-((1-(waterfinalloop/waterinitial1(n)))*10^3)*log(alpha(n,1));
Dinitialloop1=Dfinalpurebatched(n,nn);

n=n+1;

end  

nn=nn+1;
end  

nnn=nn-1;









Rfactormbatched=zeros(nnn,1);
adjRfactormbatched=zeros(nnn,1);
RMSEvalbatched=zeros(nnn,1);


for rloop=1:nnn


interpolatedvaluesy=interp1(waterfinal,Dfinalpurebatched(:,rloop),interpolwaterval);        


valuesytocompare=interpolatedvaluesy(indexforwater);


Rfactormbatched(rloop,1)=corr(valuesytocompare,excelauto(:,2))^2;                              
adjRfactormbatched(rloop,1)=1-(1-Rfactormbatched(rloop,1))*((length(valuesytocompare)-1)/(length(valuesytocompare)-1-1));   
RMSEvalbatched(rloop,1)=rms(valuesytocompare-excelauto(:,2));                                     




end
%
[RMSEvalbatchedmin,RMSEvalbatchedinindex]=min(RMSEvalbatched);                      

Rfactorm=Rfactormbatched(RMSEvalbatchedinindex);
adjRfactorm=adjRfactormbatched(RMSEvalbatchedinindex);
initialvalue=Dinitial(1,RMSEvalbatchedinindex);                                                                                                                                                          



initialvaluestring=num2str(initialvalue);                                     
initialvaluestringdisplay=strcat(Displaysentence, 32,initialvaluestring,permilledisplay);  


Rfactormtostring=num2str(Rfactorm);
stringRfactorm=strcat(Rsuperstring, 32, Rfactormtostring);                   

                                            
adjRfactormtostring=num2str(adjRfactorm);                                    
stringadjRfactorm=strcat(adjRsuBstring, 32, adjRfactormtostring);


RMSEpurestringtostring=num2str(RMSEvalbatchedmin);
stringRMSEval=strcat(RMSEpurestring, 32, RMSEpurestringtostring);




F1339=figure(1339);set(F1339,'name','Best fit batched-degassing system','numbertitle','off');
movegui(F1339,'southeast');


LINE1339=plot(waterfinal,Dfinalpurebatched(:,RMSEvalbatchedinindex),'DisplayName',initialvaluestringdisplay);
ylabel('\deltaD in ‰');
xlabel('Bulk water content in wt%');
axis([minxax maxxax minyax maxyax]);

hold on
excelautopoints=plot(excelauto(:,1),excelauto(:,2),'r.','MarkerSize',10,'DisplayName','Sample data');                  

hold on
R2plot=plot(NaN,NaN,'DisplayName',stringRfactorm, 'linestyle', 'none'); 
 hold on
adjR2plot=plot(NaN,NaN,'DisplayName',stringadjRfactorm, 'linestyle', 'none'); 
 hold on
RMSEvalplot=plot(NaN,NaN,'DisplayName',stringRMSEval, 'linestyle', 'none');
 

legend([LINE1339,excelautopoints,R2plot,adjR2plot,RMSEvalplot],'Location','southeast');   
  grid on;

 hold off

 
 
                                  
Dfinalbatchedtrans1=num2cell(Dfinalpurebatched(:,RMSEvalbatchedinindex)); 


Dininitialvalue{1}=strcat(32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,num2str(initialvalue));                                   
Rfactormstringtable{1}=Rfactorm;
adjRfactormstringtable{1}=adjRfactorm;
RMSEvalstringtable{1}=RMSEvalbatchedmin;

F3222=figure(3222);set(F3222,'name','Best fit batched-degassing system', ...
    'numbertitle','off','unit','normalized','Position', [0.2 0.2 0.43 0.5],'visible','off');
                                                                                   
Tablebatched=uitable('Data',[watercontent1,Dfinalbatchedtrans1,Dininitialvalue,Rfactormstringtable,adjRfactormstringtable,RMSEvalstringtable],'unit','normalized', ...                   
'Position', [0 0 1 1],'ColumnName',{'Bulk water content in wt%',[' ',deltacode,'D in ‰'],[' Selected graph initial', 032,deltacode,'D in ‰'], ...        
['R',char(hex2dec('00B2'))],['adjR',char(hex2dec('00B2'))],['RMSE']});   








Dataoftablebatched=get(Tablebatched,'Data');                                   
Columnheaderbatched=get(Tablebatched,'ColumnName');                            



Dataofgraphbatched=[Columnheaderbatched';Dataoftablebatched];




assignin('base','Dataofgraphbatched',Dataofgraphbatched);
 
 

assignin('base','F1339',F1339);
assignin('base','LINE1339',LINE1339);










%batched variable steps 
%%%%%%
%%%
 waitbar(0.42,waitbarauto,'Calculating batched-system (variable step size)...','Name','Best-fit calculations');
















Percentwaterlossvar=[5 10 15 20 25 30 35 40 45 50 55 60 65 70 75 80 85 90 95];


Percentwaterlossvarfin2=[0.95 0.9 0.85 0.8 0.75 0.7 0.65 0.6 0.55 0.5 0.45 0.4 0.35 0.3 0.25 0.2 0.15 0.1 0.05];

waterfinalbatchautobatchauto=zeros(1000,19);                                 %estimated maximum size needed for preallocation. Can not be known before while loop
for iiii=1:19

   mm=1;                                                                 
waterfinalbatchautobatchauto(1,iiii)=water3;                                                    
waterfinalbatchautobatchautostepbefore=water3;
                                                                     
while waterfinalbatchautobatchauto(mm,iiii) > water1                                                    
    

    waterfinalbatchautobatchauto(mm+1,iiii)=waterfinalbatchautobatchautostepbefore*Percentwaterlossvarfin2(iiii);
     
    mm=mm+1 ;                                                                
      waterfinalbatchautobatchautostepbefore=waterfinalbatchautobatchauto(mm,iiii);
    
end



end


waterfinalbatchautobatchauto(waterfinalbatchautobatchauto == 0)=NaN;        %all remaining 0 from the zeros command are replaced by NaN, so that these values are not calculated

waterfinalbatchautoforindexnonnans=waterfinalbatchautobatchauto(:,1);

waterfinalbatchautobatchauto=waterfinalbatchautobatchauto(1:length(waterfinalbatchautoforindexnonnans(~isnan(waterfinalbatchautoforindexnonnans))),:);      %







sizewaterfbatched=size(waterfinalbatchautobatchauto);

alphabatchedtay1=zeros(length(waterfinalbatchautobatchauto),19);
SiO2peroxygen=30.0421;
TinK=TinC1+273.15;
%%%

if Existalphaself
  testyspec=evalin('base','testyspec');

    totalwatwt=testyspec(:,1);                                                  %saving first excel column as totalwatwt (here bulk water content)
H2Omolwt=testyspec(:,2);                                                    %saving second  excel column as H2Omolwt (here speciation of H2O molecular)
OHwt=totalwatwt-H2Omolwt;                                                   %calculating OH value

waterforpolyfit(1:length(H2Omolwt)+2000000,1)=0;                            %creating many points at 0 so that the polynomial function is forced trough this point in the next line 
polyfitdataspecforpolyfit(1:length(H2Omolwt)+2000000,1)=0;                  %adding these created points to the user data




totalwatwtforfitfull=vertcat(totalwatwt,waterforpolyfit);                   %concentrating values vertical

H2Omolforfitfull=vertcat(H2Omolwt,polyfitdataspecforpolyfit);
OHforfitfull=vertcat(OHwt,polyfitdataspecforpolyfit);


polyfitdataspecH2O=polyfit(totalwatwtforfitfull,H2Omolforfitfull,2);        %calculation and saving of the polifit factor (polynomial function coefficients ) polynomial curve fitting with selected polynomial degree
polyfitdataspecOH=polyfit(totalwatwtforfitfull,OHforfitfull,2);                                                   
    


zerospeccyy=zeros(length(waterfinalbatchautobatchauto(:,1)),19);   
fspecH2Obatch1=zerospeccyy;
fspecOHbatch1=zerospeccyy;
H2Owtfractionpolybatch1=zerospeccyy;
OHwtfractionpolybatch1=zerospeccyy;

for allop=1:19

fspecH2Obatch1(:,allop) = polyval(polyfitdataspecH2O,waterfinalbatchautobatchauto(:,allop));                          %evaluation and calculation of calculated polynomial factor of polyfit based on each data point (x axis) in form fspecH2O = polyfitdataspecH2O(1)*waterfinalbatchauto.^2+polyfitdataspecH2O(2)*waterfinalbatchauto+polyfitdataspecH2O(3); 
fspecOHbatch1(:,allop) = polyval(polyfitdataspecOH,waterfinalbatchautobatchauto(:,allop));   

H2Owtfractionpolybatch1(:,allop)=fspecH2Obatch1(:,allop)/100;                                             %calculalating of wt fraction from wt%
OHwtfractionpolybatch1(:,allop)=fspecOHbatch1(:,allop)/100;
end

alphabatchedtay1=zeros(sizewaterfbatched);                                          %preallocation for faster speed with the fitting size of the variable
%%%%



for alphaloop9=1:19

m=1;                                                                        %setting m starting value => place of number (index) 
for H2Owtfractionpolyloop=1:length(waterfinalbatchautobatchauto(:,alphaloop9))                                              %starting of the loop with before described waterfinalbatchauto values

H2Owtfractionpolyfull=H2Owtfractionpolybatch1(m,alphaloop9)/(H2Owtfractionpolybatch1(m,alphaloop9)+OHwtfractionpolybatch1(m,alphaloop9));  % calculating wt fraction of H2Om in relation to total water content     
OHwtfractionpolyfull=OHwtfractionpolybatch1(m,alphaloop9)/(H2Owtfractionpolybatch1(m,alphaloop9)+OHwtfractionpolybatch1(m,alphaloop9));    % calculating wt fraction of OH in relation to total water content  

alphabatchedtay1(m,alphaloop9)=H2Owtfractionpolyfull*alphaH20+(OHwtfractionpolyfull)*alphaOH;   %calculation of  bulk water fractionation factor (alpha) in rhyolitic melts which is saved on each iteration as alpha at position (m,1)which is row m column 1  
m=m+1;                                                                      %changing m for next iteration so alpha  can be saved at the next position

end
end





else
    
K=exp(1.89-3120/TinK);
%%%%


for watloopybatchy=1:19                                                        

m=1;
for waterfinalbatchautoloop=1:length(waterfinalbatchautobatchauto(:,watloopybatchy))
    


Xbulk=(waterfinalbatchautobatchauto(waterfinalbatchautoloop,watloopybatchy)/18.015)/((waterfinalbatchautobatchauto(waterfinalbatchautoloop,watloopybatchy)/18.015)+(100-waterfinalbatchautobatchauto(waterfinalbatchautoloop,watloopybatchy))/SiO2peroxygen) ;





XOHm=(1/2-(1/4-((K-4)/K)*(Xbulk-Xbulk^2))^0.5)/((K-4)/(2*K));

XH2Om=Xbulk-0.5*XOHm;

XH20mfraction=2*XH2Om/(2*XH2Om+XOHm);





alphabatchedtay1(m,watloopybatchy)=exp(XH20mfraction*log(alphaH20)+(1-XH20mfraction)*log(alphaOH));  
m=m+1;
end
%%%%
end
end


Dfinalpurebatchedvariablestep=zeros(length(waterfinalbatchautobatchauto(:,1)),length(Dinitial),19);
waterinitialline(1,1:19)=waterinitial;

waterinitial122=[waterinitialline ; waterfinalbatchautobatchauto];

for batchindwaterloss=1:19
    
nn=1;
for Dinitialloop=Dinitial
  Dinitialloop1=Dinitialloop;
   
for waterfinalloopbatch=1:length(waterfinalbatchautobatchauto(:,batchindwaterloss))

    

Dfinalpurebatchedvariablestep(waterfinalloopbatch,nn,batchindwaterloss)=Dinitialloop1-((1-(waterfinalbatchautobatchauto(waterfinalloopbatch,batchindwaterloss)/waterinitial122(waterfinalloopbatch,batchindwaterloss)))*10^3)*log(alphabatchedtay1(waterfinalloopbatch,batchindwaterloss));
Dinitialloop1=Dfinalpurebatchedvariablestep(waterfinalloopbatch,nn,batchindwaterloss);


end  

nn=nn+1;

end  

end

Dfinalpurebatchedvariablestep(Dfinalpurebatchedvariablestep == 0)= NaN;

nnn=nn-1;



                                                                              






Rfactormbatchedvariable=zeros(nnn,19);
adjRfactormbatchedvariable=zeros(nnn,19);
RMSEvalbatchedvariable=zeros(nnn,19);
waternanslater=zeros(1,19);
for zloop=1:19
    waternans=find(isnan(waterfinalbatchautobatchauto(:,zloop)),1);            %find the first NaN value index

if isempty(waternans)
    waternans=length(waterfinalbatchautobatchauto(:,zloop));
end

waternanslater(zloop)=waternans-1;

for rloop=1:nnn




interpolatedvaluesy=interp1((waterfinalbatchautobatchauto(1:waternans-1,zloop)),Dfinalpurebatchedvariablestep(1:waternans-1,rloop,zloop),interpolwaterval);        


valuesytocompare=interpolatedvaluesy(indexforwater);


Rfactormbatchedvariable(rloop,zloop)=corr(valuesytocompare,excelauto(:,2))^2;                              
adjRfactormbatchedvariable(rloop,zloop)=1-(1-Rfactormbatchedvariable(rloop,zloop))*((length(valuesytocompare)-1)/(length(valuesytocompare)-1-1));   
RMSEvalbatchedvariable(rloop,zloop)=rms(valuesytocompare-excelauto(:,2));                                     



end
end
%
assignin('base','interpolatedvaluesy',interpolatedvaluesy);   %%%%          



[RMSEvalbatchedvariablemin1,RMSEvalbatchedvariableinindex1]=min(min(RMSEvalbatchedvariable,[],1));              %column
[RMSEvalbatchedvariablemin2,RMSEvalbatchedvariableinindex2]=min(min(RMSEvalbatchedvariable,[],2));              %line

Rfactorm=Rfactormbatchedvariable(RMSEvalbatchedvariableinindex2,RMSEvalbatchedvariableinindex1);
adjRfactorm=adjRfactormbatchedvariable(RMSEvalbatchedvariableinindex2,RMSEvalbatchedvariableinindex1);
initialvalue=Dinitial(1,RMSEvalbatchedvariableinindex2);                                                                                                                                                          



assignin('base','Rfactormbatchedvariable',Rfactormbatchedvariable);   %%%%
assignin('base','adjRfactormbatchedvariable',adjRfactormbatchedvariable);   %%%%
assignin('base','RMSEvalbatchedvariable',RMSEvalbatchedvariable);   %%%%




initialvaluestring=num2str(initialvalue);                                     
initialvaluestringdisplay=strcat(Displaysentence, 32,initialvaluestring,permilledisplay);  


Rfactormtostring=num2str(Rfactorm);
stringRfactorm=strcat(Rsuperstring, 32, Rfactormtostring);                   

                                            
adjRfactormtostring=num2str(adjRfactorm);                                    
stringadjRfactorm=strcat(adjRsuBstring, 32, adjRfactormtostring);


RMSEpurestringtostring=num2str(RMSEvalbatchedvariablemin1);
stringRMSEval=strcat(RMSEpurestring, 32, RMSEpurestringtostring);

stringPercentageplotpurestring='Percentage of water loss at each step =';
stringPercentageplotnum2string=num2str(Percentwaterlossvar(RMSEvalbatchedvariableinindex1));
stringPercentageplotsrtring=strcat(stringPercentageplotpurestring, 32, stringPercentageplotnum2string );



F1256=figure(1256);set(F1256,'name','Best fit batched-degassing system (variable step sizes)','numbertitle','off');
movegui(F1256,'northwest');


LINE1256=plot(waterfinalbatchautobatchauto(:,RMSEvalbatchedvariableinindex1),Dfinalpurebatchedvariablestep(:,RMSEvalbatchedvariableinindex2,RMSEvalbatchedvariableinindex1),'DisplayName',initialvaluestringdisplay);
ylabel('\deltaD in ‰');
xlabel('Bulk water content in wt%');
axis([minxax maxxax minyax maxyax]);

hold on
excelautopoints=plot(excelauto(:,1),excelauto(:,2),'r.','MarkerSize',10,'DisplayName','Sample data');                  

hold on
R2plot=plot(NaN,NaN,'DisplayName',stringRfactorm, 'linestyle', 'none'); 
 hold on
adjR2plot=plot(NaN,NaN,'DisplayName',stringadjRfactorm, 'linestyle', 'none'); 
 hold on
RMSEvalplot=plot(NaN,NaN,'DisplayName',stringRMSEval, 'linestyle', 'none');
  hold on
Percentageplotings=plot(NaN,NaN,'DisplayName',stringPercentageplotsrtring, 'linestyle', 'none');

legend([LINE1256,excelautopoints,Percentageplotings,R2plot,adjR2plot,RMSEvalplot],'Location','southeast');   
  grid on;

 hold off

 
 


                                         
    

                      
 
watercontentbatchvari=waterfinalbatchautobatchauto(1:waternanslater(RMSEvalbatchedvariableinindex1),RMSEvalbatchedvariableinindex1);                                                 %changing watervalue data layout to use it for table (one row into one columns "'")
Dfinalbatchvariabletrans1=num2cell(Dfinalpurebatchedvariablestep(1:waternanslater(RMSEvalbatchedvariableinindex1),RMSEvalbatchedvariableinindex2,RMSEvalbatchedvariableinindex1));



watercontent123=num2cell(watercontentbatchvari);
                                  
Dininitialvaluebatchedvar=cell(1,length(watercontentbatchvari));                              %preallocation with cells. Creates empty cell with desired rows and columns

for Tablepreploopbava=1:length(watercontentbatchvari)                                   %simplistic loop which wrties empty cells of type "char" for character cell, instead of cells of type "double", by writing string ''
    Dininitialvaluebatchedvar{Tablepreploopbava}=num2str('');
end

Dininitialvalueemtpybatchedvar=Dininitialvaluebatchedvar';                                      %transposing cell
Rfactormstringtablebatchvar=Dininitialvalueemtpybatchedvar;
adjRfactormstringtablebatchvar=Dininitialvalueemtpybatchedvar;
RMSEvalstringtablebatchvar=Dininitialvalueemtpybatchedvar;
Percentwaterlossatstepbatchedvar=Dininitialvalueemtpybatchedvar;

Dininitialvaluebatchedvar=Dininitialvaluebatchedvar';

Perceentwaterlossvarnumstr=num2str(Percentwaterlossvar(RMSEvalbatchedvariableinindex1));


Dininitialvaluebatchedvar{1}=strcat(32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,num2str(initialvalue));                                   
Rfactormstringtablebatchvar{1}=Rfactorm;
adjRfactormstringtablebatchvar{1}=adjRfactorm;
RMSEvalstringtablebatchvar{1}=RMSEvalbatchedvariablemin1;
Percentwaterlossatstepbatchedvar{1}=strcat(32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,Perceentwaterlossvarnumstr);

F1257=figure(1257);set(F1257,'name','Best fit batched-degassing system (variable step sizes)', ...
    'numbertitle','off','unit','normalized','Position', [0.2 0.2 0.43 0.5],'visible','off');
                                                                                   
Tablebatchedvari=uitable('Data',[watercontent123,Dfinalbatchvariabletrans1,Dininitialvaluebatchedvar,Percentwaterlossatstepbatchedvar,Rfactormstringtablebatchvar,adjRfactormstringtablebatchvar,RMSEvalstringtablebatchvar],'unit','normalized', ...                   
'Position', [0 0 1 1],'ColumnName',{'Bulk water content in wt%',[' ',deltacode,'D in ‰'],[' Selected graph initial', 032,deltacode,'D in ‰'], ...        
'% water loss at each step',['R',char(hex2dec('00B2'))],['adjR',char(hex2dec('00B2'))],['RMSE']});   



Dataoftablebatchedvariable=get(Tablebatchedvari,'Data');                                   
Columnheaderbatchedvariable=get(Tablebatchedvari,'ColumnName');                            



Dataofgraphbatchedvariable=[Columnheaderbatchedvariable';Dataoftablebatchedvariable];


assignin('base','Dataofgraphbatchedvariable',Dataofgraphbatchedvariable);

assignin('base','F1256',F1256);










%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%two-stage  systems
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Closed to ...

 waitbar(0.56,waitbarauto,'Calculating closed-, to open-system...','Name','Best-fit calculations');













higherwatervaluesthantransitionindex=find(fullpath2rounded>=settransitionauto);
higherdDvaluesthantransitfull=excelauto(higherwatervaluesthantransitionindex,2);


interpolwatervalclosex=(min(fullpath2rounded(find(fullpath2rounded>=settransitionauto))):0.0001:max(fullpath2rounded))';





%
fullpath2roundedforloop=fullpath2rounded(find(fullpath2rounded >= settransitionauto));
indexforwaterclosex=zeros(1,length(fullpath2roundedforloop));

for ismemberreplace2=1:length(fullpath2roundedforloop)
indexforwaterclosex(ismemberreplace2)=find(abs(interpolwatervalclosex-fullpath2roundedforloop(ismemberreplace2))<=0.000001);  %%find minimum difference between searched value and data values ('~' for saving it as the location/place of the data), watercontent always descends, no double value are found
end

indexforwaterclosex=indexforwaterclosex';




indexforwaterclosex(indexforwaterclosex==0)=[];




if ~isempty(indexforwaterclosex)




Rfactormclosedautox=zeros(length(Dinitial),1);
adjRfactormclosedautox=zeros(length(Dinitial),1);
RMSEvalclosedautox=zeros(length(Dinitial),1);



for rloop=1:length(Dinitial)


interpolatedvaluesy=interp1(waterfinal,Dfinalpureclosed(:,rloop),interpolwatervalclosex);        


valuesytocompare=interpolatedvaluesy(indexforwaterclosex);

Rfactormclosedautox(rloop,1)=corr(valuesytocompare,higherdDvaluesthantransitfull)^2;                              
adjRfactormclosedautox(rloop,1)=1-(1-Rfactormclosedautox(rloop,1))*((length(valuesytocompare)-1)/(length(valuesytocompare)-1-1));   
RMSEvalclosedautox(rloop,1)=rms(valuesytocompare-higherdDvaluesthantransitfull);                                     




end
%
[RMSEvalclosedtoxmin,RMSEvalclosedtoxinindex]=min(RMSEvalclosedautox);                      

Rfactorm=Rfactormclosedautox(RMSEvalclosedtoxinindex);
adjRfactorm=adjRfactormclosedautox(RMSEvalclosedtoxinindex);
initialvalue=Dinitial(1,RMSEvalclosedtoxinindex);                                                                                                                                                          



%graph for all calculations=

dDbestfitclosedtox=Dfinalpureclosed(:,RMSEvalclosedtoxinindex);
assignin('base','dDbestfitclosedtox',dDbestfitclosedtox);  %%%    


%transitionpoints to calculate
Differenttransitionvalueslower=zeros(20,1);
Differenttransitionvalueslower(1,1)=settransitionauto;

countinglowerwater=settransitionauto;
manman=1;

while countinglowerwater>water1
    
    Differenttransitionvalueslower(manman,1)=countinglowerwater-0.1;
    countinglowerwater=Differenttransitionvalueslower(manman,1);

manman=manman+1;

end

Differenttransitionvalueslower(Differenttransitionvalueslower==0)=[];

Differenttransitionvalueshigher=zeros(10,1);
Differenttransitionvalueshigher(1)=settransitionauto;
countinghigherwater=settransitionauto;

malal=1;

while countinghigherwater<settransitionauto+1 && countinghigherwater<water3

Differenttransitionvalueshigher(malal,1)=countinghigherwater+0.1;
countinghigherwater=Differenttransitionvalueshigher(malal,1);


malal=malal+1;

end


Alltransitionpointstocalc=sort([Differenttransitionvalueshigher; settransitionauto; Differenttransitionvalueslower],'descend');



searchclosestwatertotransindex=zeros(length(Alltransitionpointstocalc),1);
for z=1:length(Alltransitionpointstocalc)
    
[~,searchclosestwatertotransindex(z,1)]= min(abs(waterfinal-Alltransitionpointstocalc(z,1))); 
    

end


watercontentstocalculatenew=nan(length(waterfinal)-searchclosestwatertotransindex(1,1),length(Alltransitionpointstocalc));


for indexyy=1:length(Alltransitionpointstocalc)
    
    
    
 
    
watercontentstocalculatenew(1:length(waterfinal)-searchclosestwatertotransindex(indexyy,1)+1,indexyy)=waterfinal(searchclosestwatertotransindex(indexyy,1):length(waterfinal));


end





watercontentstocalculatenew(watercontentstocalculatenew==0)=NaN;
                             

%closed,- to open-system

Dfinalcloseopenauto=nan(length(waterfinal)-searchclosestwatertotransindex(1,1)+1,length(Alltransitionpointstocalc));
waterinitial1closeopenauto=nan(length(waterfinal)-searchclosestwatertotransindex(1,1),length(Alltransitionpointstocalc));


for indextranswater=1:length(Alltransitionpointstocalc)

    
    
Dchangeforloop=dDbestfitclosedtox(searchclosestwatertotransindex(indextranswater,1));

 waterinitial1closeopenauto(1,indextranswater)=watercontentstocalculatenew(1,indextranswater);
 
n=1;

for waterfinalloop=1:length(waterfinal)-searchclosestwatertotransindex(indextranswater,1)+1                 %as index can not be zero it has to be counted +1

    
waterinitial1closeopenauto(n+1,indextranswater)=watercontentstocalculatenew(waterfinalloop,indextranswater);

Dfinalcloseopenauto(n,indextranswater)=(Dchangeforloop+1000)*((watercontentstocalculatenew(waterfinalloop,indextranswater)/waterinitial1closeopenauto(n,indextranswater))^(alpha(n+searchclosestwatertotransindex(indextranswater,1)-1,1)-1))-1000;
Dchangeforloop=Dfinalcloseopenauto(n,indextranswater);
n=n+1;

end  

end

                           




Dfinalcloseopenauto(Dfinalcloseopenauto==0)=NaN;






dDoldandnewvaluescloseopenauto=zeros(length(waterfinal),length(Alltransitionpointstocalc));

for indexxa=1:length(Alltransitionpointstocalc)
    

    

dDoldandnewvaluescloseopenauto(1:length(waterfinal),indexxa)=[dDbestfitclosedtox(1:searchclosestwatertotransindex(indexxa,1)-1);Dfinalcloseopenauto(~isnan(Dfinalcloseopenauto(:,indexxa)),indexxa)];

  
end




  
  
  
  Rfactormvcloseopenauto=zeros(length(Alltransitionpointstocalc),1);
adjRfactormcloseopenauto=zeros(length(Alltransitionpointstocalc),1);
RMSEvalcloseopenauto=zeros(length(Alltransitionpointstocalc),1);


for rloop=1:length(Alltransitionpointstocalc)


interpolatedvaluesy=interp1(waterfinal,dDoldandnewvaluescloseopenauto(:,rloop),interpolwaterval);        


valuesytocompare=interpolatedvaluesy(indexforwater);


Rfactormvcloseopenauto(rloop,1)=corr(valuesytocompare,excelauto(:,2))^2;                              
adjRfactormcloseopenauto(rloop,1)=1-(1-Rfactormvcloseopenauto(rloop,1))*((length(valuesytocompare)-1)/(length(valuesytocompare)-1-1));   
RMSEvalcloseopenauto(rloop,1)=rms(valuesytocompare-excelauto(:,2));                                     




end
%
  
[RMSEvalclosetoopenautomin,RMSEvalclosetoopenautoinindex]=min(RMSEvalcloseopenauto);                      

Rfactorm=Rfactormvcloseopenauto(RMSEvalclosetoopenautoinindex);
adjRfactorm=adjRfactormcloseopenauto(RMSEvalclosetoopenautoinindex);



  
initialvaluestring=num2str(initialvalue);                                     
initialvaluestringdisplay=strcat(Displaysentence, 32,initialvaluestring,permilledisplay);  


Rfactormtostring=num2str(Rfactorm);
stringRfactorm=strcat(Rsuperstring, 32, Rfactormtostring);                   

                                            
adjRfactormtostring=num2str(adjRfactorm);                                    
stringadjRfactorm=strcat(adjRsuBstring, 32, adjRfactormtostring);


RMSEpurestringtostring=num2str(RMSEvalclosetoopenautomin);
stringRMSEval=strcat(RMSEpurestring, 32, RMSEpurestringtostring);


Transpointstrgxauto=num2str(Alltransitionpointstocalc(RMSEvalclosetoopenautoinindex,1));
Transpointstrgyauto=num2str(dDbestfitclosedtox(searchclosestwatertotransindex(RMSEvalclosetoopenautoinindex,1)));
Transpointstrgpure='Transition point: ';
wtperdisplay=' wt% water, ';
permilldisanddelt=' ‰ \deltaD ' ;
Transpointstring112=strcat(Transpointstrgpure, 32,Transpointstrgxauto,wtperdisplay, 32,Transpointstrgyauto,permilldisanddelt);




F15687=figure(15687);set(F15687,'name','Best fit closed-, to open-dagassing system','numbertitle','off');
movegui(F15687,'north');

LINE15687=plot(waterfinal,dDoldandnewvaluescloseopenauto(:,RMSEvalclosetoopenautoinindex),'DisplayName',initialvaluestringdisplay);
ylabel('\deltaD in ‰');
xlabel('Bulk water content in wt%');
axis([minxax maxxax minyax maxyax]);

hold on
excelautopoints=plot(excelauto(:,1),excelauto(:,2),'r.','MarkerSize',10,'DisplayName','Sample data');                  
hold on
Transpointauto=plot(Alltransitionpointstocalc(RMSEvalclosetoopenautoinindex,1),dDbestfitclosedtox(searchclosestwatertotransindex(RMSEvalclosetoopenautoinindex,1)),'kx','MarkerSize',10,'LineWidth',3,'DisplayName',Transpointstring112);
hold on
R2plot=plot(NaN,NaN,'DisplayName',stringRfactorm, 'linestyle', 'none'); 
 hold on
adjR2plot=plot(NaN,NaN,'DisplayName',stringadjRfactorm, 'linestyle', 'none'); 
 hold on
RMSEvalplot=plot(NaN,NaN,'DisplayName',stringRMSEval, 'linestyle', 'none');
 

legend([LINE15687,excelautopoints,Transpointauto,R2plot,adjR2plot,RMSEvalplot],'Location','southeast');   
  grid on;

 hold off


                      

                                  
Dfinalclosedtoopentrans123=num2cell(dDoldandnewvaluescloseopenauto(:,RMSEvalclosetoopenautoinindex)); 


Dininitialvalue{1}=strcat(32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,num2str(initialvalue));                                   
Rfactormstringtable{1}=Rfactorm;
adjRfactormstringtable{1}=adjRfactorm;
RMSEvalstringtable{1}=RMSEvalclosetoopenautomin;
Transitionpointauto=Dininitialvalueemtpy;

Transitionpointauto{1}=strcat(' TP:', 32, Transpointstrgxauto,' wt%',',',Transpointstrgyauto,' ‰');          
Transitionpointauto{searchclosestwatertotransindex(RMSEvalclosetoopenautoinindex,1)}='   Transition point';


F156887=figure(156887);set(F156887,'name','Best fit closed-, to open-dagassing system', ...
    'numbertitle','off','unit','normalized','Position', [0.2 0.2 0.43 0.5],'visible','off');
                                                                                   
Tableclosedtoopenauto=uitable('Data',[watercontent1,Dfinalclosedtoopentrans123,Dininitialvalue,Transitionpointauto,Rfactormstringtable,adjRfactormstringtable,RMSEvalstringtable],'unit','normalized', ...                   
'Position', [0 0 1 1],'ColumnName',{'Bulk water content in wt%',[' ',deltacode,'D in ‰'],[' Selected graph initial', 032,deltacode,'D in ‰'], ...        
['        Transition point        '],['R',char(hex2dec('00B2'))],['adjR',char(hex2dec('00B2'))],['RMSE']});   








Dataoftableclosedtoopenauto=get(Tableclosedtoopenauto,'Data');                                   
Columnheaderclosedtoopenauto=get(Tableclosedtoopenauto,'ColumnName');                            



Dataofgraphclosedtoopenauto=[Columnheaderclosedtoopenauto';Dataoftableclosedtoopenauto];







 assignin('base','Dataofgraphclosedtoopenauto',Dataofgraphclosedtoopenauto);

 
 assignin('base','F15687',F15687);











%closed,- to batched-system


 waitbar(0.7,waitbarauto,'Calculating closed-, to batched-system...','Name','Best-fit calculations');


Dfinalclosebatchedauto=nan(length(waterfinal)-searchclosestwatertotransindex(1,1)+1,length(Alltransitionpointstocalc));
waterinitial1closebatchedauto=nan(length(waterfinal)-searchclosestwatertotransindex(1,1),length(Alltransitionpointstocalc));


for indextranswater=1:length(Alltransitionpointstocalc)

    
    
Dchangeforloopbatch=dDbestfitclosedtox(searchclosestwatertotransindex(indextranswater,1));

 waterinitial1closebatchedauto(1,indextranswater)=watercontentstocalculatenew(1,indextranswater);
 
n=1;

for waterfinalloop=1:length(waterfinal)-searchclosestwatertotransindex(indextranswater,1)+1                 %as index can not be zero it has to be counted +1

    
waterinitial1closebatchedauto(n+1,indextranswater)=watercontentstocalculatenew(waterfinalloop,indextranswater);

Dfinalclosebatchedauto(n,indextranswater)=Dchangeforloopbatch-((1-(watercontentstocalculatenew(waterfinalloop,indextranswater)/waterinitial1closebatchedauto(n,indextranswater)))*10^3)*log(alpha(n+searchclosestwatertotransindex(indextranswater,1)-1,1));
Dchangeforloopbatch=Dfinalclosebatchedauto(n,indextranswater);
n=n+1;




end  

end

                    




Dfinalclosebatchedauto(Dfinalclosebatchedauto==0)=NaN;





dDoldandnewvaluesclosebatchedauto=zeros(length(waterfinal),length(Alltransitionpointstocalc));

for indexxa=1:length(Alltransitionpointstocalc)
    

    

dDoldandnewvaluesclosebatchedauto(1:length(waterfinal),indexxa)=[dDbestfitclosedtox(1:searchclosestwatertotransindex(indexxa,1)-1);Dfinalclosebatchedauto(~isnan(Dfinalclosebatchedauto(:,indexxa)),indexxa)];

  
end



  
  
  
  Rfactormvclosebatchedauto=zeros(length(Alltransitionpointstocalc),1);
adjRfactormclosebatchedauto=zeros(length(Alltransitionpointstocalc),1);
RMSEvalclosebatchedauto=zeros(length(Alltransitionpointstocalc),1);


for rloop=1:length(Alltransitionpointstocalc)


interpolatedvaluesy=interp1(waterfinal,dDoldandnewvaluesclosebatchedauto(:,rloop),interpolwaterval);        


valuesytocompare=interpolatedvaluesy(indexforwater);


Rfactormvclosebatchedauto(rloop,1)=corr(valuesytocompare,excelauto(:,2))^2;                              
adjRfactormclosebatchedauto(rloop,1)=1-(1-Rfactormvclosebatchedauto(rloop,1))*((length(valuesytocompare)-1)/(length(valuesytocompare)-1-1));   
RMSEvalclosebatchedauto(rloop,1)=rms(valuesytocompare-excelauto(:,2));                                     




end
%
  
[RMSEvalclosetobatchedautomin,RMSEvalclosetobatchedautoinindex]=min(RMSEvalclosebatchedauto);                      

Rfactorm=Rfactormvclosebatchedauto(RMSEvalclosetobatchedautoinindex);
adjRfactorm=adjRfactormclosebatchedauto(RMSEvalclosetobatchedautoinindex);


    assignin('base','Rfactormvclosebatchedauto',Rfactormvclosebatchedauto);  %%%    
  assignin('base','adjRfactormclosebatchedauto',adjRfactormclosebatchedauto);  %%%    
    assignin('base','RMSEvalclosebatchedauto',RMSEvalclosebatchedauto);  %%%    
  
  
initialvaluestring=num2str(initialvalue);                                     
initialvaluestringdisplay=strcat(Displaysentence, 32,initialvaluestring,permilledisplay);  


Rfactormtostring=num2str(Rfactorm);
stringRfactorm=strcat(Rsuperstring, 32, Rfactormtostring);                   

                                            
adjRfactormtostring=num2str(adjRfactorm);                                    
stringadjRfactorm=strcat(adjRsuBstring, 32, adjRfactormtostring);


RMSEpurestringtostring=num2str(RMSEvalclosetobatchedautomin);
stringRMSEval=strcat(RMSEpurestring, 32, RMSEpurestringtostring);


Transpointstrgxauto=num2str(Alltransitionpointstocalc(RMSEvalclosetobatchedautoinindex,1));
Transpointstrgyauto=num2str(dDbestfitclosedtox(searchclosestwatertotransindex(RMSEvalclosetobatchedautoinindex,1)));
Transpointstrgpure='Transition point: ';
wtperdisplay=' wt% water, ';
permilldisanddelt=' ‰ \deltaD ' ;
Transpointstring112=strcat(Transpointstrgpure, 32,Transpointstrgxauto,wtperdisplay, 32,Transpointstrgyauto,permilldisanddelt);




F16687=figure(16687);set(F16687,'name','Best fit closed-, to batched-dagassing system','numbertitle','off');
movegui(F16687,'northeast');

LINE16687=plot(waterfinal,dDoldandnewvaluesclosebatchedauto(:,RMSEvalclosetobatchedautoinindex),'DisplayName',initialvaluestringdisplay);

ylabel('\deltaD in ‰');
xlabel('Bulk water content in wt%');
axis([minxax maxxax minyax maxyax]);

hold on
excelautopoints=plot(excelauto(:,1),excelauto(:,2),'r.','MarkerSize',10,'DisplayName','Sample data');                  
hold on
Transpointauto=plot(Alltransitionpointstocalc(RMSEvalclosetobatchedautoinindex,1),dDbestfitclosedtox(searchclosestwatertotransindex(RMSEvalclosetobatchedautoinindex,1)),'kx','MarkerSize',10,'LineWidth',3,'DisplayName',Transpointstring112);
hold on
R2plot=plot(NaN,NaN,'DisplayName',stringRfactorm, 'linestyle', 'none'); 
 hold on
adjR2plot=plot(NaN,NaN,'DisplayName',stringadjRfactorm, 'linestyle', 'none'); 
 hold on
RMSEvalplot=plot(NaN,NaN,'DisplayName',stringRMSEval, 'linestyle', 'none');
 

legend([LINE16687,excelautopoints,Transpointauto,R2plot,adjR2plot,RMSEvalplot],'Location','southeast');   
  grid on;

 hold off

 

                      

                                  
Dfinalclosedtoopentrans123=num2cell(dDoldandnewvaluesclosebatchedauto(:,RMSEvalclosetobatchedautoinindex)); 


Dininitialvalue{1}=strcat(32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,num2str(initialvalue));                                   
Rfactormstringtable{1}=Rfactorm;
adjRfactormstringtable{1}=adjRfactorm;
RMSEvalstringtable{1}=RMSEvalclosetobatchedautomin;
Transitionpointauto=Dininitialvalueemtpy;

Transitionpointauto{1}=strcat(' TP:', 32, Transpointstrgxauto,' wt%',',',Transpointstrgyauto,' ‰');          
Transitionpointauto{searchclosestwatertotransindex(RMSEvalclosetobatchedautoinindex,1)}='   Transition point';


F16688=figure(16688);set(F16688,'name','Best fit closed-, to batched-dagassing system', ...
    'numbertitle','off','unit','normalized','Position', [0.2 0.2 0.43 0.5],'visible','off');
                                                                                   
Tableclosedtobatchedauto=uitable('Data',[watercontent1,Dfinalclosedtoopentrans123,Dininitialvalue,Transitionpointauto,Rfactormstringtable,adjRfactormstringtable,RMSEvalstringtable],'unit','normalized', ...                   
'Position', [0 0 1 1],'ColumnName',{'Bulk water content in wt%',[' ',deltacode,'D in ‰'],[' Selected graph initial', 032,deltacode,'D in ‰'], ...        
['        Transition point        '],['R',char(hex2dec('00B2'))],['adjR',char(hex2dec('00B2'))],['RMSE']});   








Dataoftableclosedtobatchedauto=get(Tableclosedtobatchedauto,'Data');                                   
Columnheaderclosedtobatchedauto=get(Tableclosedtobatchedauto,'ColumnName');                            



Dataofgraphclosedtobatchedauto=[Columnheaderclosedtobatchedauto';Dataoftableclosedtobatchedauto];




 assignin('base','Dataofgraphclosedtobatchedauto',Dataofgraphclosedtobatchedauto);


 assignin('base','F16687',F16687);



%closed,- to batched-system (variable step size)

 waitbar(0.84,waitbarauto,'Calculating closed-, to batched-system (variable step size)...','Name','Best-fit calculations');




Percentwaterlossvarclosetobatch=[5 10 15 20 25 30 35 40 45 50 55 60 65 70 75 80 85 90 95];


Percentwaterlossvarfin2closetobatch=[0.95 0.9 0.85 0.8 0.75 0.7 0.65 0.6 0.55 0.5 0.45 0.4 0.35 0.3 0.25 0.2 0.15 0.1 0.05];



waterfinalclosetobatchautovar=zeros(500,19,length(Alltransitionpointstocalc));   



for forindex=1:length(Alltransitionpointstocalc)

                              
for iiii=1:19

   mm=1;                                                                 
waterfinalclosetobatchautovar(1,iiii,forindex)=Alltransitionpointstocalc(forindex);                                                    
waterfinalbatchautobatchautostepbefore=Alltransitionpointstocalc(forindex);
                                                                     
while waterfinalclosetobatchautovar(mm,iiii,forindex) > water1                                                    
    

    waterfinalclosetobatchautovar(mm+1,iiii,forindex)=waterfinalbatchautobatchautostepbefore*Percentwaterlossvarfin2closetobatch(iiii);
     
    mm=mm+1 ;                                                                
      waterfinalbatchautobatchautostepbefore=waterfinalclosetobatchautovar(mm,iiii,forindex);
    
end



end

end

waterfinalclosetobatchautovar(waterfinalclosetobatchautovar == 0)=NaN;        %all remaining 0 from the zeros command are replaced by NaN, so that these values are not calculated

waterfinalclosebatchvartoforindexnonnans=waterfinalclosetobatchautovar(:,1,1);

waterfinalclosetobatchautovar=waterfinalclosetobatchautovar(1:length(waterfinalclosebatchvartoforindexnonnans(~isnan(waterfinalclosebatchvartoforindexnonnans))),:,:);      %






sizewaterfclosetobatchedvar=size(waterfinalclosetobatchautovar);


SiO2peroxygen=30.0421;
TinK=TinC1+273.15;
%%%

if Existalphaself
 
    


zerospeccyy=zeros(length(waterfinalclosetobatchautovar(:,1,1)),19,length(Alltransitionpointstocalc));   
fspecH2Oclosebatchvar1=zerospeccyy;
fspecOHclosebatchvar1=zerospeccyy;
H2Owtfractionpolyclosebatchvar1=zerospeccyy;
OHwtfractionpolyclosebatchvar1=zerospeccyy;

for transpointsindex=1:length(Alltransitionpointstocalc)

for allop=1:19

fspecH2Oclosebatchvar1(:,allop,transpointsindex) = polyval(polyfitdataspecH2O,waterfinalclosetobatchautovar(:,allop,transpointsindex));                          %evaluation and calculation of calculated polynomial factor of polyfit based on each data point (x axis) in form fspecH2O = polyfitdataspecH2O(1)*waterfinalbatchauto.^2+polyfitdataspecH2O(2)*waterfinalbatchauto+polyfitdataspecH2O(3); 
fspecOHclosebatchvar1(:,allop,transpointsindex) = polyval(polyfitdataspecOH,waterfinalclosetobatchautovar(:,allop,transpointsindex));   

H2Owtfractionpolyclosebatchvar1(:,allop,transpointsindex)=fspecH2Oclosebatchvar1(:,allop,transpointsindex)/100;                                             %calculalating of wt fraction from wt%
OHwtfractionpolyclosebatchvar1(:,allop,transpointsindex)=fspecOHclosebatchvar1(:,allop,transpointsindex)/100;
end
end



alphaclosetobatchedtay1=zeros(sizewaterfclosetobatchedvar);                                          %preallocation for faster speed with the fitting size of the variable
%%%%

for transpointsindexforalpha=1:length(Alltransitionpointstocalc)


for alphaloop9=1:19

m=1;                                                                        %setting m starting value => place of number (index) 
for H2Owtfractionpolyloop=1:length(waterfinalclosetobatchautovar(:,alphaloop9,transpointsindexforalpha))                                              %starting of the loop with before described waterfinalbatchauto values

H2Owtfractionpolyfull=H2Owtfractionpolyclosebatchvar1(m,alphaloop9,transpointsindexforalpha)/(H2Owtfractionpolyclosebatchvar1(m,alphaloop9,transpointsindexforalpha)+OHwtfractionpolyclosebatchvar1(m,alphaloop9,transpointsindexforalpha));  % calculating wt fraction of H2Om in relation to total water content     
OHwtfractionpolyfull=OHwtfractionpolyclosebatchvar1(m,alphaloop9,transpointsindexforalpha)/(H2Owtfractionpolyclosebatchvar1(m,alphaloop9,transpointsindexforalpha)+OHwtfractionpolyclosebatchvar1(m,alphaloop9,transpointsindexforalpha));    % calculating wt fraction of OH in relation to total water content  

alphaclosetobatchedtay1(m,alphaloop9,transpointsindexforalpha)=H2Owtfractionpolyfull*alphaH20+(OHwtfractionpolyfull)*alphaOH;   %calculation of  bulk water fractionation factor (alpha) in rhyolitic melts which is saved on each iteration as alpha at position (m,1)which is row m column 1  
m=m+1;                                                                      %changing m for next iteration so alpha  can be saved at the next position

end
end
end




else
  
alphaclosetobatchedtay1=zeros(sizewaterfclosetobatchedvar); 
    
K=exp(1.89-3120/TinK);
%%%%

for transpointbulk=1:length(Alltransitionpointstocalc)

for watloopybatchy=1:19                                                        

m=1;
for waterfinalbatchautoloop=1:length(waterfinalclosetobatchautovar(:,watloopybatchy,transpointbulk))
    


Xbulk=(waterfinalclosetobatchautovar(waterfinalbatchautoloop,watloopybatchy,transpointbulk)/18.015)/((waterfinalclosetobatchautovar(waterfinalbatchautoloop,watloopybatchy,transpointbulk)/18.015)+(100-waterfinalclosetobatchautovar(waterfinalbatchautoloop,watloopybatchy,transpointbulk))/SiO2peroxygen) ;




XOHm=(1/2-(1/4-((K-4)/K)*(Xbulk-Xbulk^2))^0.5)/((K-4)/(2*K));

XH2Om=Xbulk-0.5*XOHm;

XH20mfraction=2*XH2Om/(2*XH2Om+XOHm);





alphaclosetobatchedtay1(m,watloopybatchy,transpointbulk)=exp(XH20mfraction*log(alphaH20)+(1-XH20mfraction)*log(alphaOH));  
m=m+1;
end
%%%%
end
end
end






Dfinalclosetobatchedvariablestepnew=nan(sizewaterfclosetobatchedvar);




for indexwatertranspoint=1:length(Alltransitionpointstocalc)                %values transition points
    
for batchindwaterlosstrans=1:19                                             %values percentage water loss
    
Dinitialloopclosebatchvar=dDbestfitclosedtox(searchclosestwatertotransindex(indexwatertranspoint,1));

   waterinitial1223=waterfinalclosetobatchautovar(1,batchindwaterlosstrans,indexwatertranspoint);
   
   
for waterfinalloopbatch=1:length(waterfinalclosetobatchautovar(:,batchindwaterlosstrans,indexwatertranspoint))      %wt% H2O to calc

    

Dfinalclosetobatchedvariablestepnew(waterfinalloopbatch,batchindwaterlosstrans,indexwatertranspoint)=Dinitialloopclosebatchvar-((1-(waterfinalclosetobatchautovar(waterfinalloopbatch,batchindwaterlosstrans,indexwatertranspoint)/waterinitial1223))*10^3)*log(alphaclosetobatchedtay1(waterfinalloopbatch,batchindwaterlosstrans,indexwatertranspoint));
Dinitialloopclosebatchvar=Dfinalclosetobatchedvariablestepnew(waterfinalloopbatch,batchindwaterlosstrans,indexwatertranspoint);
waterinitial1223=waterfinalclosetobatchautovar(waterfinalloopbatch,batchindwaterlosstrans,indexwatertranspoint);

end  



end  

end

Dfinalclosetobatchedvariablestepnew(Dfinalclosetobatchedvariablestepnew == 0)= NaN;

assignin('base','Dfinalclosetobatchedvariablestepnew',Dfinalclosetobatchedvariablestepnew);   %%%%



Dfinalclosetobatchedvariablestepnew1=Dfinalclosetobatchedvariablestepnew;
dDbestfitclosedtox1=dDbestfitclosedtox;

Dfinalclosetobatchedvariablestepnew1(Dfinalclosetobatchedvariablestepnew1==0)=9887775.55124;       %replacing 0 temporary so the artificial 0 values can be cut out later
dDbestfitclosedtox1(dDbestfitclosedtox1==0)=9887775.55124;





waterfinalclosetobatchallvaluesautovar=nan(length(waterfinal),19,length(Alltransitionpointstocalc));
dDoldandnewvaluesclosebatchedautovar=nan(length(waterfinal),19,length(Alltransitionpointstocalc));

for indextranspoint=1:length(Alltransitionpointstocalc)
    
for percentageindexi=1:19
    

dDoldandnewvaluesclosebatchedautovar(1:searchclosestwatertotransindex(indextranspoint,1)-1+length(find(~isnan(Dfinalclosetobatchedvariablestepnew1(:,percentageindexi,indextranspoint)))),percentageindexi,indextranspoint)=[dDbestfitclosedtox1(1:searchclosestwatertotransindex(indextranspoint,1)-1);Dfinalclosetobatchedvariablestepnew1(~isnan(Dfinalclosetobatchedvariablestepnew1(:,percentageindexi,indextranspoint)),percentageindexi,indextranspoint)];
waterfinalclosetobatchallvaluesautovar(1:searchclosestwatertotransindex(indextranspoint,1)-1+length(find(~isnan(waterfinalclosetobatchautovar(:,percentageindexi,indextranspoint)))),percentageindexi,indextranspoint)=[waterfinal(1:searchclosestwatertotransindex(indextranspoint,1)-1)';waterfinalclosetobatchautovar(~isnan(waterfinalclosetobatchautovar(:,percentageindexi,indextranspoint)),percentageindexi,indextranspoint)];
  
end
end





dDoldandnewvaluesclosebatchedautovar(dDoldandnewvaluesclosebatchedautovar==0)=NaN;
waterfinalclosetobatchallvaluesautovar(waterfinalclosetobatchallvaluesautovar ==0)=NaN;

dDoldandnewvaluesclosebatchedautovar(dDoldandnewvaluesclosebatchedautovar==9887775.55124)=0;


dDoldandnewvaluesclosebatchedautovarshorten(1:length(find(~isnan(dDoldandnewvaluesclosebatchedautovar(:,1,length(Alltransitionpointstocalc))))),:,:)=dDoldandnewvaluesclosebatchedautovar(1:length(find(~isnan(dDoldandnewvaluesclosebatchedautovar(:,1,length(Alltransitionpointstocalc))))),:,:);
waterfinalclosetobatchallvaluesautovarshorten(1:length(find(~isnan(waterfinalclosetobatchallvaluesautovar(:,1,length(Alltransitionpointstocalc))))),:,:)=waterfinalclosetobatchallvaluesautovar(1:length(find(~isnan(waterfinalclosetobatchallvaluesautovar(:,1,length(Alltransitionpointstocalc))))),:,:);




  

  
  
  
  
 
  Rfactormvclosebatchedvarauto=zeros(19,length(Alltransitionpointstocalc));
adjRfactormclosebatchevardauto=zeros(19,length(Alltransitionpointstocalc));
RMSEvalclosebatchedvarauto=zeros(19,length(Alltransitionpointstocalc));


for rloop=1:length(Alltransitionpointstocalc)
    
for percentwatindexy=1:19

  
interpolatedvaluesy=interp1(waterfinalclosetobatchallvaluesautovarshorten(1:length(find(~isnan(waterfinalclosetobatchallvaluesautovarshorten(:,percentwatindexy,rloop)))),percentwatindexy,rloop),dDoldandnewvaluesclosebatchedautovarshorten(1:length(find(~isnan(dDoldandnewvaluesclosebatchedautovarshorten(:,percentwatindexy,rloop)))),percentwatindexy,rloop),interpolwaterval);       



valuesytocompare=interpolatedvaluesy(indexforwater);


Rfactormvclosebatchedvarauto(percentwatindexy,rloop)=corr(valuesytocompare,excelauto(:,2))^2;                              
adjRfactormclosebatchevardauto(percentwatindexy,rloop)=1-(1-Rfactormvclosebatchedvarauto(percentwatindexy,rloop))*((length(valuesytocompare)-1)/(length(valuesytocompare)-1-1));   
RMSEvalclosebatchedvarauto(percentwatindexy,rloop)=rms(valuesytocompare-excelauto(:,2));                                     



end
end

 

 

 


[RMSEvalclosetobatchedvariableautomin1,RMSEvalclosetobatchedvariableautoinindex1]=min(min(RMSEvalclosebatchedvarauto,[],1));              %column!!!!!!!!!transition point
[RMSEvalclosetobatchedvariableautomin2,RMSEvalclosetobatchedvariableautoinindex2]=min(min(RMSEvalclosebatchedvarauto,[],2));              %line  !!!!percentage

Rfactorm=Rfactormvclosebatchedvarauto(RMSEvalclosetobatchedvariableautoinindex2,RMSEvalclosetobatchedvariableautoinindex1);
adjRfactorm=adjRfactormclosebatchevardauto(RMSEvalclosetobatchedvariableautoinindex2,RMSEvalclosetobatchedvariableautoinindex1);
                                                                                                                                                


 waitbar(0.9,waitbarauto,'Finishing...','Name','Best-fit calculations');




                                 
initialvaluestringdisplay=strcat(Displaysentence, 32,initialvaluestring,permilledisplay);  


Rfactormtostring=num2str(Rfactorm);
stringRfactorm=strcat(Rsuperstring, 32, Rfactormtostring);                   

                                            
adjRfactormtostring=num2str(adjRfactorm);                                    
stringadjRfactorm=strcat(adjRsuBstring, 32, adjRfactormtostring);


RMSEpurestringtostring=num2str(RMSEvalclosebatchedvarauto(RMSEvalclosetobatchedvariableautoinindex2,RMSEvalclosetobatchedvariableautoinindex1));
stringRMSEval=strcat(RMSEpurestring, 32, RMSEpurestringtostring);

stringPercentageplotpurestring='Percentage of water loss at each step =';
stringPercentageplotnum2string=num2str(Percentwaterlossvar(RMSEvalclosetobatchedvariableautoinindex2));
stringPercentageplotsrtring=strcat(stringPercentageplotpurestring, 32, stringPercentageplotnum2string );


Transpointstrgxauto=num2str(Alltransitionpointstocalc(RMSEvalclosetobatchedvariableautoinindex1,1));
Transpointstrgyauto=num2str(dDbestfitclosedtox(searchclosestwatertotransindex(RMSEvalclosetobatchedvariableautoinindex1,1)));

Transpointstring1121=strcat(Transpointstrgpure, 32,Transpointstrgxauto,wtperdisplay, 32,Transpointstrgyauto,permilldisanddelt);




F11265=figure(11265);set(F11265,'name','Best fit closed-, to batched-degassing system (variable step sizes)','numbertitle','off');
movegui(F11265,'center');

LINE11265=plot(waterfinalclosetobatchallvaluesautovarshorten(:,RMSEvalclosetobatchedvariableautoinindex2,RMSEvalclosetobatchedvariableautoinindex1),dDoldandnewvaluesclosebatchedautovarshorten(:,RMSEvalclosetobatchedvariableautoinindex2,RMSEvalclosetobatchedvariableautoinindex1),'DisplayName',initialvaluestringdisplay);
ylabel('\deltaD in ‰');
xlabel('Bulk water content in wt%');
axis([minxax maxxax minyax maxyax]);

hold on
excelautopoints=plot(excelauto(:,1),excelauto(:,2),'r.','MarkerSize',10,'DisplayName','Sample data');                  

hold on
R2plot=plot(NaN,NaN,'DisplayName',stringRfactorm, 'linestyle', 'none'); 
 hold on
adjR2plot=plot(NaN,NaN,'DisplayName',stringadjRfactorm, 'linestyle', 'none'); 
 hold on
RMSEvalplot=plot(NaN,NaN,'DisplayName',stringRMSEval, 'linestyle', 'none');
  hold on
Percentageplotings=plot(NaN,NaN,'DisplayName',stringPercentageplotsrtring, 'linestyle', 'none');
hold on
Transpointautobatch=plot(Alltransitionpointstocalc(RMSEvalclosetobatchedvariableautoinindex1,1),dDbestfitclosedtox(searchclosestwatertotransindex(RMSEvalclosetobatchedvariableautoinindex1,1)),'kx','MarkerSize',10,'LineWidth',3,'DisplayName',Transpointstring1121);

legend([LINE11265,excelautopoints,Transpointautobatch,Percentageplotings,R2plot,adjR2plot,RMSEvalplot],'Location','southeast');   
  grid on;

 hold off

 
 
     
    

                      
 
watercontentclosebatchvari=waterfinalclosetobatchallvaluesautovarshorten(1:length(find(~isnan(waterfinalclosetobatchallvaluesautovarshorten(:,RMSEvalclosetobatchedvariableautoinindex2,RMSEvalclosetobatchedvariableautoinindex1)))),RMSEvalclosetobatchedvariableautoinindex2,RMSEvalclosetobatchedvariableautoinindex1);                                                 %changing watervalue data layout to use it for table (one row into one columns "'")
Dfinalclosebatchvariabletrans1=num2cell(dDoldandnewvaluesclosebatchedautovarshorten(1:length(find(~isnan(dDoldandnewvaluesclosebatchedautovarshorten(:,RMSEvalclosetobatchedvariableautoinindex2,RMSEvalclosetobatchedvariableautoinindex1)))),RMSEvalclosetobatchedvariableautoinindex2,RMSEvalclosetobatchedvariableautoinindex1));



watercontent1233=num2cell(watercontentclosebatchvari);
                                  
Dininitialvalueclosebatchedvar=cell(1,length(watercontentclosebatchvari));                              %preallocation with cells. Creates empty cell with desired rows and columns

for Tablepreploopbava=1:length(watercontentclosebatchvari)                                   %simplistic loop which wrties empty cells of type "char" for character cell, instead of cells of type "double", by writing string ''
    Dininitialvalueclosebatchedvar{Tablepreploopbava}=num2str('');
end

Dininitialvalueemtpyclosebatchedvar=Dininitialvalueclosebatchedvar';                                      %transposing cell
Rfactormstringtableclosebatchvar=Dininitialvalueemtpyclosebatchedvar;
adjRfactormstringtableclosebatchvar=Dininitialvalueemtpyclosebatchedvar;
RMSEvalstringtableclosebatchvar=Dininitialvalueemtpyclosebatchedvar;
Percentwaterlossatstepclosebatchedvar=Dininitialvalueemtpyclosebatchedvar;


Transpointstrgxauto=num2str(Alltransitionpointstocalc(RMSEvalclosetobatchedvariableautoinindex1,1));
Transpointstrgyauto=num2str(dDbestfitclosedtox(searchclosestwatertotransindex(RMSEvalclosetobatchedvariableautoinindex1,1)));




Transitionpointauto=Dininitialvalueemtpyclosebatchedvar;

Transitionpointauto{1}=strcat(' TP:', 32, Transpointstrgxauto,' wt%',',',Transpointstrgyauto,' ‰');          
Transitionpointauto{searchclosestwatertotransindex(RMSEvalclosetobatchedvariableautoinindex1,1)}='   Transition point';


Dininitialvalueclosebatchedvar=Dininitialvalueclosebatchedvar';

Perceentwaterlossvarnumstr=num2str(Percentwaterlossvar(RMSEvalclosetobatchedvariableautoinindex2));


Dininitialvalueclosebatchedvar{1}=strcat(32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,num2str(initialvalue));                                   
Rfactormstringtableclosebatchvar{1}=Rfactorm;
adjRfactormstringtableclosebatchvar{1}=adjRfactorm;
RMSEvalstringtableclosebatchvar{1}=RMSEvalclosebatchedvarauto(RMSEvalclosetobatchedvariableautoinindex2,RMSEvalclosetobatchedvariableautoinindex1);
Percentwaterlossatstepclosebatchedvar{1}=strcat(32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,Perceentwaterlossvarnumstr);












F11264=figure(11264);set(F11264,'name','Best fit closed-, to batched-degassing system (variable step sizes)', ...
    'numbertitle','off','unit','normalized','Position', [0.2 0.2 0.505 0.5],'visible','off');
                                                                                   
Tableclosebatchedvari=uitable('Data',[watercontent1233,Dfinalclosebatchvariabletrans1,Dininitialvalueclosebatchedvar,Percentwaterlossatstepclosebatchedvar,Transitionpointauto,Rfactormstringtableclosebatchvar,adjRfactormstringtableclosebatchvar,RMSEvalstringtableclosebatchvar],'unit','normalized', ...                   
'Position', [0 0 1 1],'ColumnName',{'Bulk water content in wt%',[' ',deltacode,'D in ‰'],[' Selected graph initial', 032,deltacode,'D in ‰'], ...        
'% water loss at each step',['        Transition point        '],['R',char(hex2dec('00B2'))],['adjR',char(hex2dec('00B2'))],['RMSE']});   



Dataoftableclosebatchedvariable=get(Tableclosebatchedvari,'Data');                                   
Columnheaderclosebatchedvariable=get(Tableclosebatchedvari,'ColumnName');                            



Dataofgraphclosebatchedautovariable=[Columnheaderclosebatchedvariable';Dataoftableclosebatchedvariable];

assignin('base','Dataofgraphclosebatchedautovariable',Dataofgraphclosebatchedautovariable);

 
 assignin('base','F11265',F11265);
                                           
 
 
 
 toc
                       
 waitbar(1,waitbarauto,'Finished','Name','Best-fit calculations');
 
 pause(3)
 
 if ishandle(waitbarauto)                                                   %ishandle checks the existence of a figure. 
close(waitbarauto)
 end









else
 errordlg('The transition point is required to be lower than the highest measured water value','Error');   
    
    
end




else 
    
errordlg('Set all variables','Error');

end






function Transpointtextt_Callback(hObject, eventdata, handles)
% hObject    handle to Transpointtextt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
settransitionauto=str2double(get(hObject,'String'));


assignin('base','settransitionauto',settransitionauto);
% Hints: get(hObject,'String') returns contents of Transpointtextt as text
%        str2double(get(hObject,'String')) returns contents of Transpointtextt as a double


% --- Executes during object creation, after setting all properties.
function Transpointtextt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Transpointtextt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ExistGUIdataofexcel=evalin( 'base', 'exist(''GUIdataofexcel'',''var'') == 1' );


if ~ExistGUIdataofexcel
    VolcDeGasOption
end  

if ~ishandle(VolcDeGasOption) 
    VolcDeGasOption
end  


GUIdataofexcel=evalin('base','GUIdataofexcel');                             %struc (handles of Excel2ndstepadvanced)



selectedone=get(hObject,'Value');




 
 
 if selectedone==1
  set(handles.uipanel22,'Visible','off')                                    %accessing the handle structure to set uipanels to be either visible or not visible dD buttons activate d11B deactivate
  set(handles.uipanel21,'Visible','off')   
  set(handles.uipanel20,'Visible','off')   
  set(handles.uipanel19,'Visible','off') 
  set(handles.uipanel25,'Visible','off')   
  set(handles.uipanel24,'Visible','off')   
  set(GUIdataofexcel.uipanelinputplotd11B,'Visible','off') 
  set(GUIdataofexcel.uipanelcalculd11B,'Visible','off')   
  set(GUIdataofexcel.uipanellastplotexcelset11B,'Visible','off')   
  set(GUIdataofexcel.text2starttextd11B,'Visible','off')   
 

  
  
    set(handles.uipanel15,'Visible','on')   
    set(handles.uipanel14,'Visible','on')   
    set(handles.uipanel13,'Visible','on')   
    set(handles.uipanel12,'Visible','on')   
    set(handles.uipanel4,'Visible','on')   
    set(handles.uipanel3,'Visible','on')   
    set(handles.uipanel17,'Visible','on')   
    set(GUIdataofexcel.uipanelinputplotdD,'Visible','on') 
    set(GUIdataofexcel.uipanelcalculdD,'Visible','on') 
    set(GUIdataofexcel.uipanellastplotexcelsetdD,'Visible','on') 
    set(GUIdataofexcel.text2starttextdD,'Visible','on') 
     
     
    HoldONbuttonif= false;                                                  %for 2nd gui set condition false of HoldONbuttonif 
     
     
 end
 
 if selectedone==2                                                          %dD buttons deactivate d11B activate
 
  set(handles.uipanel22,'Visible','on')   
  set(handles.uipanel21,'Visible','on')   
  set(handles.uipanel20,'Visible','on')   
  set(handles.uipanel19,'Visible','on') 
  set(handles.uipanel25,'Visible','on')   
  set(handles.uipanel24,'Visible','on')   
  set(GUIdataofexcel.uipanelinputplotd11B,'Visible','on') 
  set(GUIdataofexcel.uipanelcalculd11B,'Visible','on')   
  set(GUIdataofexcel.uipanellastplotexcelset11B,'Visible','on')   
   set(GUIdataofexcel.text2starttextd11B,'Visible','on')  
   
   
   
   
    set(handles.uipanel15,'Visible','off')   
    set(handles.uipanel14,'Visible','off')   
    set(handles.uipanel13,'Visible','off')   
    set(handles.uipanel12,'Visible','off')   
    set(handles.uipanel4,'Visible','off')   
    set(handles.uipanel3,'Visible','off')   
    set(handles.uipanel17,'Visible','off')        
    set(GUIdataofexcel.uipanelinputplotdD,'Visible','off') 
    set(GUIdataofexcel.uipanelcalculdD,'Visible','off') 
    set(GUIdataofexcel.uipanellastplotexcelsetdD,'Visible','off')  
    set(GUIdataofexcel.text2starttextdD,'Visible','off') 
    
       HoldONbuttonif= true;                                                  %for 2nd gui set condition true of HoldONbuttonif 
 
    
 end
 
assignin('base','HoldONbuttonif',HoldONbuttonif);


guidata(hObject, handles);




%set(handlesofGUI.speciationcalc,'Visible','off')





%cellstr(get(hObject,'String'))
%contents{get(hObject,'Value')}



% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Bfrom_Callback(hObject, eventdata, handles)
% hObject    handle to Bfrom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
B11from=str2double(get(hObject,'String')) ;


 assignin('base','B11from',B11from);
% Hints: get(hObject,'String') returns contents of Bfrom as text
%        str2double(get(hObject,'String')) returns contents of Bfrom as a double


% --- Executes during object creation, after setting all properties.
function Bfrom_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Bfrom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Binterval_Callback(hObject, eventdata, handles)
% hObject    handle to Binterval (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
B11interval=str2double(get(hObject,'String')) ;


 assignin('base','B11interval',B11interval);
% Hints: get(hObject,'String') returns contents of Binterval as text
%        str2double(get(hObject,'String')) returns contents of Binterval as a double


% --- Executes during object creation, after setting all properties.
function Binterval_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Binterval (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Bto_Callback(hObject, eventdata, handles)
% hObject    handle to Bto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
B11to=str2double(get(hObject,'String')) ;


 assignin('base','B11to',B11to);
% Hints: get(hObject,'String') returns contents of Bto as text
%        str2double(get(hObject,'String')) returns contents of Bto as a double


% --- Executes during object creation, after setting all properties.
function Bto_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Bto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Bppmfrom_Callback(hObject, eventdata, handles)
% hObject    handle to Bppmfrom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Bppmxfrom=str2double(get(hObject,'String')) ;
if Bppmxfrom==0
    Bppmxfrom=0.00001;
end

 assignin('base','Bppmxfrom',Bppmxfrom);

% Hints: get(hObject,'String') returns contents of Bppmfrom as text
%        str2double(get(hObject,'String')) returns contents of Bppmfrom as a double


% --- Executes during object creation, after setting all properties.
function Bppmfrom_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Bppmfrom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Bppminterval_Callback(hObject, eventdata, handles)
% hObject    handle to Bppminterval (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Bppminterval as text
%        str2double(get(hObject,'String')) returns contents of Bppminterval as a double
Bppmxinterval=str2double(get(hObject,'String')) ;


 assignin('base','Bppmxinterval',Bppmxinterval);

% --- Executes during object creation, after setting all properties.
function Bppminterval_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Bppminterval (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Bppmto_Callback(hObject, eventdata, handles)
% hObject    handle to Bppmto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Bppmxto=str2double(get(hObject,'String')) ;


 assignin('base','Bppmxto',Bppmxto);




% Hints: get(hObject,'String') returns contents of Bppmto as text
%        str2double(get(hObject,'String')) returns contents of Bppmto as a double


% --- Executes during object creation, after setting all properties.
function Bppmto_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Bppmto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Byaxmin_Callback(hObject, eventdata, handles)
% hObject    handle to Byaxmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Byaxmin as text
%        str2double(get(hObject,'String')) returns contents of Byaxmin as a double
Byaxesmin=str2double(get(hObject,'String')) ;


 assignin('base','Byaxesmin',Byaxesmin);

% --- Executes during object creation, after setting all properties.
function Byaxmin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Byaxmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Byaxmax_Callback(hObject, eventdata, handles)
% hObject    handle to Byaxmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Byaxesmax=str2double(get(hObject,'String')) ;


 assignin('base','Byaxesmax',Byaxesmax);

% Hints: get(hObject,'String') returns contents of Byaxmax as text
%        str2double(get(hObject,'String')) returns contents of Byaxmax as a double


% --- Executes during object creation, after setting all properties.
function Byaxmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Byaxmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function baxismin_Callback(hObject, eventdata, handles)
% hObject    handle to baxismin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
baxesmin=str2double(get(hObject,'String')) ;


 assignin('base','baxesmin',baxesmin);
% Hints: get(hObject,'String') returns contents of baxismin as text
%        str2double(get(hObject,'String')) returns contents of baxismin as a double


% --- Executes during object creation, after setting all properties.
function baxismin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to baxismin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function baxmax_Callback(hObject, eventdata, handles)
% hObject    handle to baxmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
baxesmax=str2double(get(hObject,'String')) ;


 assignin('base','baxesmax',baxesmax);
% Hints: get(hObject,'String') returns contents of baxmax as text
%        str2double(get(hObject,'String')) returns contents of baxmax as a double


% --- Executes during object creation, after setting all properties.
function baxmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to baxmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Bpureclosed.
function Bpureclosed_Callback(hObject, eventdata, handles)
% hObject    handle to Bpureclosed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ExistTinC1=evalin( 'base', 'exist(''TinC1'',''var'') == 1' ); 
ExistBppmxfrom=evalin( 'base', 'exist(''Bppmxfrom'',''var'') == 1' );
ExistBppmxinterval=evalin( 'base', 'exist(''Bppmxinterval'',''var'') == 1' );
ExistBppmxto=evalin( 'base', 'exist(''Bppmxto'',''var'') == 1' );
ExistB11from=evalin( 'base', 'exist(''B11from'',''var'') == 1' );
ExistB11interval=evalin( 'base', 'exist(''B11interval'',''var'') == 1' );
ExistB11to=evalin( 'base', 'exist(''B11to'',''var'') == 1' );
ExistByaxesmin=evalin( 'base', 'exist(''Byaxesmin'',''var'') == 1' );
ExistByaxesmax=evalin( 'base', 'exist(''Byaxesmax'',''var'') == 1' );
Existbaxesmin=evalin( 'base', 'exist(''baxesmin'',''var'') == 1' );
Existbaxesmax=evalin( 'base', 'exist(''baxesmax'',''var'') == 1' );




if ExistBppmxfrom && ExistBppmxinterval && ExistBppmxto && ... 
   ExistB11from && ExistB11interval && ExistB11to && ExistByaxesmin ...
   && ExistByaxesmax && Existbaxesmax && Existbaxesmin && ExistTinC1   


TinC1=evalin('base','TinC1');                                               
Bppmxfrom=evalin('base','Bppmxfrom'); 
Bppmxinterval=evalin('base','Bppmxinterval'); 
Bppmxto=evalin('base','Bppmxto'); 
B11from=evalin('base','B11from'); 
B11interval=evalin('base','B11interval');
B11to=evalin('base','B11to'); 
Byaxesmin=evalin('base','Byaxesmin');
Byaxesmax=evalin('base','Byaxesmax');
baxesmin=evalin('base','baxesmin');
baxesmax=evalin('base','baxesmax');


TinK=TinC1+273.15;
T1000=1000/TinK;                                                            %Boron alpha factor calculation based on: Maner, J.L., London, D., 2018. Fractionation of the isotopes of boron between granitic melt and aqueous solution at 700 °C and 800 °C (200 MPa). Chemical Geology 489, 16–27. doi:10.1016/j.chemgeo.2018.05.007.

lowBalphaBlog=0.6962*T1000-7.5821;

lowhalphaB=exp(lowBalphaBlog/1000);                                         % 



alphaB=1/lowhalphaB; 



%%%


if B11from>B11to
    errordlg(strcat('First', 32, char(hex2dec('03B4')),'11B in ‰ field requires a lower value than third  '),'Error');                                      
return
end

if Bppmxfrom>Bppmxto
     errordlg('First Boron concentration field requires a lower value than third field','Error'); 
    return
end



if Byaxesmin>Byaxesmax
     errordlg('First x-axis field requires a lower value than second field','Error'); 
    return
end

if baxesmin>baxesmax
     errordlg('First  y-axis field requires a lower value than second field','Error'); 
    return
end




Bppmxinitial=Bppmxto;
Bppmxfinal=Bppmxto:-Bppmxinterval:Bppmxfrom;
B11initial=B11from:B11interval:B11to   ; 
B11final=zeros(length(Bppmxfinal),length(B11initial));
assignin('base','Bppmxfinal',Bppmxfinal);
assignin('base','B11initial',B11initial);
%%%



nn=1;
for B11initialloop=B11initial
    n=1;
for Bppmxfinalloop=Bppmxfinal

B11final(n,nn)=B11initialloop-((1-(Bppmxfinalloop/Bppmxinitial))*10^3)*log(alphaB);     %closed system degassing (Taylor 1983)

n=n+1;

end 

nn=nn+1;
end 




assignin('base','B11final',B11final);


F50=figure(50);set(F50,'name','Closed-system degassing 2D-plot main figure','numbertitle','off');
plot(Bppmxfinal,B11final)
ylabel('\delta11B in ‰');
xlabel('Boron concentration in ppm');
axis([baxesmin baxesmax Byaxesmin Byaxesmax]);
grid on;

F55=figure(55);set(F55,'name','Closed-system degassing 2D-plot for comparing','numbertitle','off');
plot(Bppmxfinal,B11final)
ylabel('\delta11B in ‰');
xlabel('Boron concentration in ppm');
axis([baxesmin baxesmax Byaxesmin Byaxesmax]);
grid on;


F51=figure(51);set(F51,'name','Closed-system degassing 3D-plot','numbertitle','off');
surf(B11initial,Bppmxfinal,B11final)
zlabel('\delta11B in ‰');
ylabel('Boron concentration in ppm');
xlabel('initial \delta11B in ‰');
grid on;

F52=figure(52);set(F52,'name','Closed-system degassing 3D-plot cleaned for visibility','numbertitle','off');
surf(B11initial,Bppmxfinal,B11final,'LineStyle','none')
zlabel('\delta11B in ‰');
ylabel('Boron concentration in ppm');
xlabel('initial \delta11B in ‰');
grid on;

assignin('base','F50',F50);
assignin('base','F55',F55);
assignin('base','F51',F51);
assignin('base','F52',F52);

else 
    
errordlg('Set all variables','Error');

end































% --- Executes on button press in Bpurebatched.
function Bpurebatched_Callback(hObject, eventdata, handles)
% hObject    handle to Bpurebatched (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ExistBppmxfrom=evalin( 'base', 'exist(''Bppmxfrom'',''var'') == 1' );
ExistBppmxinterval=evalin( 'base', 'exist(''Bppmxinterval'',''var'') == 1' );
ExistBppmxto=evalin( 'base', 'exist(''Bppmxto'',''var'') == 1' );
ExistB11from=evalin( 'base', 'exist(''B11from'',''var'') == 1' );
ExistB11interval=evalin( 'base', 'exist(''B11interval'',''var'') == 1' );
ExistB11to=evalin( 'base', 'exist(''B11to'',''var'') == 1' );
ExistByaxesmin=evalin( 'base', 'exist(''Byaxesmin'',''var'') == 1' );
ExistByaxesmax=evalin( 'base', 'exist(''Byaxesmax'',''var'') == 1' );
Existbaxesmin=evalin( 'base', 'exist(''baxesmin'',''var'') == 1' );
Existbaxesmax=evalin( 'base', 'exist(''baxesmax'',''var'') == 1' );
ExistTinC1=evalin( 'base', 'exist(''TinC1'',''var'') == 1' ); 




if ExistBppmxfrom && ExistBppmxinterval && ExistBppmxto && ... 
   ExistB11from && ExistB11interval && ExistB11to && ExistByaxesmin ...
   && ExistByaxesmax && Existbaxesmax && Existbaxesmin && ExistTinC1  


TinC1=evalin('base','TinC1');                                               

Bppmxfrom=evalin('base','Bppmxfrom'); 
Bppmxinterval=evalin('base','Bppmxinterval'); 
Bppmxto=evalin('base','Bppmxto'); 
B11from=evalin('base','B11from'); 
B11interval=evalin('base','B11interval');
B11to=evalin('base','B11to'); 
Byaxesmin=evalin('base','Byaxesmin');
Byaxesmax=evalin('base','Byaxesmax');
baxesmin=evalin('base','baxesmin');
baxesmax=evalin('base','baxesmax');

TinK=TinC1+273.15;
T1000=1000/TinK;                                                            %Boron alpha factor calculation based on: Maner, J.L., London, D., 2018. Fractionation of the isotopes of boron between granitic melt and aqueous solution at 700 °C and 800 °C (200 MPa). Chemical Geology 489, 16–27. doi:10.1016/j.chemgeo.2018.05.007.

lowBalphaBlog=0.6962*T1000-7.5821;

lowhalphaB=exp(lowBalphaBlog/1000);                                         % 



alphaB=1/lowhalphaB; 
%%%


if B11from>B11to
    errordlg(strcat('First', 32, char(hex2dec('03B4')),'11B in ‰ field requires a lower value than third  '),'Error');                                      
return
end

if Bppmxfrom>Bppmxto
     errordlg('First Boron concentration field requires a lower value than third field','Error'); 
    return
end



if Byaxesmin>Byaxesmax
     errordlg('First x-axis field requires a lower value than second field','Error'); 
    return
end

if baxesmin>baxesmax
     errordlg('First  y-axis field requires a lower value than second field','Error'); 
    return
end




Bppmxinitial=Bppmxto;
Bppmxfinal=Bppmxto:-Bppmxinterval:Bppmxfrom;
B11initial=B11from:B11interval:B11to   ; 
B11final=zeros(length(Bppmxfinal),length(B11initial));
assignin('base','Bppmxfinal',Bppmxfinal);
assignin('base','B11initial',B11initial);
%%%


Bppmxinitial1=zeros(1,length(Bppmxfinal)+1);                                %preallocation of waterinitial1 with the fitting size of the variable





nn=1;                                                                       %setting starting column
for Binitialloop=B11initial                                                   %outerloop calculations saved into column
  Binitialloop1=Binitialloop;                                               %
    n=1;                                                                    %setting starting row
    Bppmxinitial1(1)=Bppmxinitial;                                          %need initial value  for each first run of the inner loop
for Bppmxfinalfinalloop=Bppmxfinal                                               %inner loop calculations saved into row
    


Bppmxinitial1(n+1)=Bppmxfinalfinalloop;                                          %setting last used water value as initial water value for the next iteration of the loop
B11final(n,nn)=Binitialloop1-((1-(Bppmxfinalfinalloop/Bppmxinitial1(n)))*10^3)*log(alphaB);  %dD value calculation for open system degassing (Taylor 1991).  Dfinal(n,nn) calculates Dfinal into row n and column nn,  alpha(n,1) calls value of the variable alpha at row n and column 1    
Binitialloop1=B11final(n,nn);
n=n+1;                                                                      %changing n for next iteration so every variable value can be saved at the next row 

end                                                                         %inner loop end

nn=nn+1;                                                                    %changing m for next iteration so every variable value can be saved at the next column 
end                                                                         %outer loop end






assignin('base','B11final',B11final);


F50=figure(50);set(F50,'name','Batched-system degassing 2D-plot main figure','numbertitle','off');
plot(Bppmxfinal,B11final)
ylabel('\delta11B in ‰');
xlabel('Boron concentration in ppm');
axis([baxesmin baxesmax Byaxesmin Byaxesmax]);
grid on;

F57=figure(57);set(F57,'name','Batched-system degassing 2D-plot for comparing','numbertitle','off');
plot(Bppmxfinal,B11final)
ylabel('\delta11B in ‰');
xlabel('Boron concentration in ppm');
axis([baxesmin baxesmax Byaxesmin Byaxesmax]);
grid on;


F51=figure(51);set(F51,'name','Batched-system degassing 3D-plot','numbertitle','off');
surf(B11initial,Bppmxfinal,B11final)
zlabel('\delta11B in ‰');
ylabel('Boron concentration in ppm');
xlabel('initial \delta11B in ‰');
grid on;

F52=figure(52);set(F52,'name','Batched-system degassing 3D-plot cleaned for visibility','numbertitle','off');
surf(B11initial,Bppmxfinal,B11final,'LineStyle','none')
zlabel('\delta11B in ‰');
ylabel('Boron concentration in ppm');
xlabel('initial \delta11B in ‰');
grid on;

assignin('base','F50',F50);
assignin('base','F57',F57);
assignin('base','F51',F51);
assignin('base','F52',F52);

else 
    
errordlg('Set all variables','Error');

end



% --- Executes on button press in Bpureopen.
function Bpureopen_Callback(hObject, eventdata, handles)
% hObject    handle to Bpureopen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ExistBppmxfrom=evalin( 'base', 'exist(''Bppmxfrom'',''var'') == 1' );
ExistBppmxinterval=evalin( 'base', 'exist(''Bppmxinterval'',''var'') == 1' );
ExistBppmxto=evalin( 'base', 'exist(''Bppmxto'',''var'') == 1' );
ExistB11from=evalin( 'base', 'exist(''B11from'',''var'') == 1' );
ExistB11interval=evalin( 'base', 'exist(''B11interval'',''var'') == 1' );
ExistB11to=evalin( 'base', 'exist(''B11to'',''var'') == 1' );
ExistByaxesmin=evalin( 'base', 'exist(''Byaxesmin'',''var'') == 1' );
ExistByaxesmax=evalin( 'base', 'exist(''Byaxesmax'',''var'') == 1' );
Existbaxesmin=evalin( 'base', 'exist(''baxesmin'',''var'') == 1' );
Existbaxesmax=evalin( 'base', 'exist(''baxesmax'',''var'') == 1' );
ExistTinC1=evalin( 'base', 'exist(''TinC1'',''var'') == 1' ); 




if ExistBppmxfrom && ExistBppmxinterval && ExistBppmxto && ... 
   ExistB11from && ExistB11interval && ExistB11to && ExistByaxesmin ...
   && ExistByaxesmax && Existbaxesmax && Existbaxesmin && ExistTinC1   


TinC1=evalin('base','TinC1');                                               
Bppmxfrom=evalin('base','Bppmxfrom'); 
Bppmxinterval=evalin('base','Bppmxinterval'); 
Bppmxto=evalin('base','Bppmxto'); 
B11from=evalin('base','B11from'); 
B11interval=evalin('base','B11interval');
B11to=evalin('base','B11to'); 
Byaxesmin=evalin('base','Byaxesmin');
Byaxesmax=evalin('base','Byaxesmax');
baxesmin=evalin('base','baxesmin');
baxesmax=evalin('base','baxesmax');


TinK=TinC1+273.15;
T1000=1000/TinK;                                                            %Boron alpha factor calculation based on: Maner, J.L., London, D., 2018. Fractionation of the isotopes of boron between granitic melt and aqueous solution at 700 °C and 800 °C (200 MPa). Chemical Geology 489, 16–27. doi:10.1016/j.chemgeo.2018.05.007.

lowBalphaBlog=0.6962*T1000-7.5821;

lowhalphaB=exp(lowBalphaBlog/1000);                                         % 



alphaB=1/lowhalphaB; 

%%%


if B11from>B11to
    errordlg(strcat('First', 32, char(hex2dec('03B4')),'11B in ‰ field requires a lower value than third  '),'Error');                                      
return
end

if Bppmxfrom>Bppmxto
     errordlg('First Boron concentration field requires a lower value than third field','Error'); 
    return
end



if Byaxesmin>Byaxesmax
     errordlg('First x-axis field requires a lower value than second field','Error'); 
    return
end

if baxesmin>baxesmax
     errordlg('First  y-axis field requires a lower value than second field','Error'); 
    return
end




Bppmxinitial=Bppmxto;
Bppmxfinal=Bppmxto:-Bppmxinterval:Bppmxfrom;
B11initial=B11from:B11interval:B11to   ; 
B11final=zeros(length(Bppmxfinal),length(B11initial));
assignin('base','Bppmxfinal',Bppmxfinal);
assignin('base','B11initial',B11initial);
%%%


Bppmxinitial1=zeros(1,length(Bppmxfinal)+1);                                %preallocation of waterinitial1 with the fitting size of the variable

nn=1;                                                                       %setting starting column
for Binitialloop=B11initial                                                   %outerloop calculations saved into column
  Binitialloop1=Binitialloop;                                               %
    n=1;                                                                    %setting starting row
    Bppmxinitial1(1)=Bppmxinitial;                                          %need initial value  for each first run of the inner loop
for Bppmxfinalfinalloop=Bppmxfinal                                               %inner loop calculations saved into row
    

Bppmxinitial1(n+1)=Bppmxfinalfinalloop;                                          %setting last used water value as initial water value for the next iteration of the loop
B11final(n,nn)=(Binitialloop1+1000)*((Bppmxfinalfinalloop/Bppmxinitial1(n))^(alphaB-1))-1000;  %dD value calculation for open system degassing (Taylor 1991).  Dfinal(n,nn) calculates Dfinal into row n and column nn,  alpha(n,1) calls value of the variable alpha at row n and column 1    
Binitialloop1=B11final(n,nn);
n=n+1;                                                                      %changing n for next iteration so every variable value can be saved at the next row 

end                                                                         %inner loop end

nn=nn+1;                                                                    %changing m for next iteration so every variable value can be saved at the next column 
end                                                                         %outer loop end






assignin('base','B11final',B11final);


F50=figure(50);set(F50,'name','Open-system degassing 2D-plot main figure','numbertitle','off');
plot(Bppmxfinal,B11final)
ylabel('\delta11B in ‰');
xlabel('Boron concentration in ppm');
axis([baxesmin baxesmax Byaxesmin Byaxesmax]);
grid on;

F56=figure(56);set(F56,'name','Open-system degassing 2D-plot for comparing','numbertitle','off');
plot(Bppmxfinal,B11final)
ylabel('\delta11B in ‰');
xlabel('Boron concentration in ppm');
axis([baxesmin baxesmax Byaxesmin Byaxesmax]);
grid on;


F51=figure(51);set(F51,'name','Open-system degassing 3D-plot','numbertitle','off');
surf(B11initial,Bppmxfinal,B11final)
zlabel('\delta11B in ‰');
ylabel('Boron concentration in ppm');
xlabel('initial \delta11B in ‰');
grid on;

F52=figure(52);set(F52,'name','Open-system degassing 3D-plot cleaned for visibility','numbertitle','off');
surf(B11initial,Bppmxfinal,B11final,'LineStyle','none')
zlabel('\delta11B in ‰');
ylabel('Boron concentration in ppm');
xlabel('initial \delta11B in ‰');
grid on;

assignin('base','F50',F50);
assignin('base','F56',F56);
assignin('base','F51',F51);
assignin('base','F52',F52);

else 
    
errordlg('Set all variables','Error');

end




% --- Executes on button press in Bpurebatchedvariable.
function Bpurebatchedvariable_Callback(hObject, eventdata, handles)
% hObject    handle to Bpurebatchedvariable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ExistBppmxfrom=evalin( 'base', 'exist(''Bppmxfrom'',''var'') == 1' );
ExistBppmxinterval=evalin( 'base', 'exist(''Bppmxinterval'',''var'') == 1' );
ExistBppmxto=evalin( 'base', 'exist(''Bppmxto'',''var'') == 1' );
ExistB11from=evalin( 'base', 'exist(''B11from'',''var'') == 1' );
ExistB11interval=evalin( 'base', 'exist(''B11interval'',''var'') == 1' );
ExistB11to=evalin( 'base', 'exist(''B11to'',''var'') == 1' );
ExistByaxesmin=evalin( 'base', 'exist(''Byaxesmin'',''var'') == 1' );
ExistByaxesmax=evalin( 'base', 'exist(''Byaxesmax'',''var'') == 1' );
Existbaxesmin=evalin( 'base', 'exist(''baxesmin'',''var'') == 1' );
Existbaxesmax=evalin( 'base', 'exist(''baxesmax'',''var'') == 1' );
ExistBpurebatchedvarpercentage=evalin( 'base', 'exist(''Bpurebatchedvarpercentage'',''var'') == 1' );
ExistTinC1=evalin( 'base', 'exist(''TinC1'',''var'') == 1' ); 


if ExistBpurebatchedvarpercentage
    
  Bpurebatchedvarpercentage=evalin('base','Bpurebatchedvarpercentage'); 
  
else
    
  Bpurebatchedvarpercentage=50 ; 
  
end

BPercentwaterlossvarfin=1-Bpurebatchedvarpercentage/100;


if ExistBppmxfrom && ExistBppmxinterval && ExistBppmxto && ... 
   ExistB11from && ExistB11interval && ExistB11to && ExistByaxesmin ...
   && ExistByaxesmax && Existbaxesmax && Existbaxesmin && ExistTinC1   



Bppmxfrom=evalin('base','Bppmxfrom'); 
Bppmxinterval=evalin('base','Bppmxinterval'); 
Bppmxto=evalin('base','Bppmxto'); 
B11from=evalin('base','B11from'); 
B11interval=evalin('base','B11interval');
B11to=evalin('base','B11to'); 
Byaxesmin=evalin('base','Byaxesmin');
Byaxesmax=evalin('base','Byaxesmax');
baxesmin=evalin('base','baxesmin');
baxesmax=evalin('base','baxesmax');
TinC1=evalin('base','TinC1');                                               

TinK=TinC1+273.15;
T1000=1000/TinK;                                                            %Boron alpha factor calculation based on: Maner, J.L., London, D., 2018. Fractionation of the isotopes of boron between granitic melt and aqueous solution at 700 °C and 800 °C (200 MPa). Chemical Geology 489, 16–27. doi:10.1016/j.chemgeo.2018.05.007.

lowBalphaBlog=0.6962*T1000-7.5821;

lowhalphaB=exp(lowBalphaBlog/1000);                                         % 



alphaB=1/lowhalphaB; 

%%%


if B11from>B11to
    errordlg(strcat('First', 32, char(hex2dec('03B4')),'11B in ‰ field requires a lower value than third  '),'Error');                                      
return
end

if Bppmxfrom>Bppmxto
     errordlg('First Boron concentration field requires a lower value than third field','Error'); 
    return
end



if Byaxesmin>Byaxesmax
     errordlg('First x-axis field requires a lower value than second field','Error'); 
    return
end

if baxesmin>baxesmax
     errordlg('First  y-axis field requires a lower value than second field','Error'); 
    return
end






mm=1;                                                                      %as no constant step size, boron concentration need to be newly calculated starting from highest boron concentration
Bppmxfinal(mm)=Bppmxto;                                                      %mm set to one => highest boron concentration  is  first boronconcentration of data point in new calculated model
mm=2;                                                                      %mm set to 2 to not overwrite  existing boron concentration value
while Bppmxfinal > Bppmxfrom                                                 %while loop, loop runs as long as Bppmxfinal values are bigger then  B11from value (lowest boron value)
    
    Bppmxfinal(mm)=Bppmxfinal(mm-1)*BPercentwaterlossvarfin;                                      %50 % Boron loss on each step is calculated here (/2)
    mm=mm+1;                                                                %counting up for next iteration => boron concentration value is saved into new position
    
end

Bppmxfinal=sort(Bppmxfinal,'descend');



Bppmxinitial=Bppmxto;
B11initial=B11from:B11interval:B11to   ; 
B11final=zeros(length(Bppmxfinal),length(B11initial));
assignin('base','Bppmxfinal',Bppmxfinal);
assignin('base','B11initial',B11initial);
%%%


Bppmxinitial1=zeros(1,length(Bppmxfinal)+1);                                %preallocation of waterinitial1 with the fitting size of the variable





nn=1;                                                                       %setting starting column
for Binitialloop=B11initial                                                   %outerloop calculations saved into column
  Binitialloop1=Binitialloop;                                               %
    n=1;                                                                    %setting starting row
    Bppmxinitial1(1)=Bppmxinitial;                                          %need initial value  for each first run of the inner loop
for Bppmxfinalfinalloop=Bppmxfinal                                               %inner loop calculations saved into row
    


Bppmxinitial1(n+1)=Bppmxfinalfinalloop;                                          %setting last used water value as initial water value for the next iteration of the loop
B11final(n,nn)=Binitialloop1-((1-(Bppmxfinalfinalloop/Bppmxinitial1(n)))*10^3)*log(alphaB);  %dD value calculation for open system degassing (Taylor 1991).  Dfinal(n,nn) calculates Dfinal into row n and column nn,  alpha(n,1) calls value of the variable alpha at row n and column 1    
Binitialloop1=B11final(n,nn);
n=n+1;                                                                      %changing n for next iteration so every variable value can be saved at the next row 

end                                                                         %inner loop end

nn=nn+1;                                                                    %changing m for next iteration so every variable value can be saved at the next column 
end                                                                         %outer loop end






assignin('base','B11final',B11final);


F50=figure(50);set(F50,'name','Batched-system degassing (variable % water loss) 2D-plot main figure','numbertitle','off');
plot(Bppmxfinal,B11final)
ylabel('\delta11B in ‰');
xlabel('Boron concentration in ppm');
axis([baxesmin baxesmax Byaxesmin Byaxesmax]);
grid on;

F58=figure(58);set(F58,'name','Batched-system degassing (variable % water loss) 2D-plot for comparing','numbertitle','off');
plot(Bppmxfinal,B11final)
ylabel('\delta11B in ‰');
xlabel('Boron concentration in ppm');
axis([baxesmin baxesmax Byaxesmin Byaxesmax]);
grid on;


F51=figure(51);set(F51,'name','Batched-system degassing (variable % water loss) 3D-plot','numbertitle','off');
surf(B11initial,Bppmxfinal,B11final)
zlabel('\delta11B in ‰');
ylabel('Boron concentration in ppm');
xlabel('initial \delta11B in ‰');
grid on;

F52=figure(52);set(F52,'name','Batched-system degassing (variable % water loss) 3D-plot cleaned for visibility','numbertitle','off');
surf(B11initial,Bppmxfinal,B11final,'LineStyle','none')
zlabel('\delta11B in ‰');
ylabel('Boron concentration in ppm');
xlabel('initial \delta11B in ‰');
grid on;

assignin('base','F50',F50);
assignin('base','F58',F58);
assignin('base','F51',F51);
assignin('base','F52',F52);

else 
    
errordlg('Set all variables','Error');

end



function Bpurebatchedvareditfield_Callback(hObject, eventdata, handles)
% hObject    handle to Bpurebatchedvareditfield (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Bpurebatchedvarpercentage=str2double(get(hObject,'String')) ;


 assignin('base','Bpurebatchedvarpercentage',Bpurebatchedvarpercentage);
% Hints: get(hObject,'String') returns contents of Bpurebatchedvareditfield as text
%        str2double(get(hObject,'String')) returns contents of Bpurebatchedvareditfield as a double


% --- Executes during object creation, after setting all properties.
function Bpurebatchedvareditfield_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Bpurebatchedvareditfield (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in clearboron.
function clearboron_Callback(hObject, eventdata, handles)
% hObject    handle to clearboron (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
evalin('base','clearvars -except GUIdataofexcel HoldONbuttonif'); 






% --- Executes on button press in Boronautomaticalcalc.
function Boronautomaticalcalc_Callback(hObject, eventdata, handles)
% hObject    handle to Boronautomaticalcalc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


[filename2B, pathname2B] = ...                                                  %saving filename and pathname together of
     uigetfile({'*.*'},'Input measured data by formatted excel sheet (first column boron concentration in ppm, second column d11B value)');                                    %selected file of all formats ({'*.*'})which are selected from the opened window named File selector( file selection dialog box) /(uigetfile({'*.*'},'File Selector')
fullpath2B=strcat(pathname2B,filename2B);                                         %saving filename and selected path as actual usable variable
assignin('base','fullpath2B',fullpath2B);                                       %saving variable to workspace
if filename2B==0

  return
end
excelautoB=xlsread(fullpath2B); 


autofuncionusedB=1;


assignin('base','autofuncionusedB',autofuncionusedB);   


tic

ExistBppmxfrom=evalin( 'base', 'exist(''Bppmxfrom'',''var'') == 1' );
ExistBppmxinterval=evalin( 'base', 'exist(''Bppmxinterval'',''var'') == 1' );
ExistBppmxto=evalin( 'base', 'exist(''Bppmxto'',''var'') == 1' );
ExistB11from=evalin( 'base', 'exist(''B11from'',''var'') == 1' );
ExistB11interval=evalin( 'base', 'exist(''B11interval'',''var'') == 1' );
ExistB11to=evalin( 'base', 'exist(''B11to'',''var'') == 1' );
ExistByaxesmin=evalin( 'base', 'exist(''Byaxesmin'',''var'') == 1' );
ExistByaxesmax=evalin( 'base', 'exist(''Byaxesmax'',''var'') == 1' );
Existbaxesmin=evalin( 'base', 'exist(''baxesmin'',''var'') == 1' );
Existbaxesmax=evalin( 'base', 'exist(''baxesmax'',''var'') == 1' );
ExistBmsotlikelytranspointvalue=evalin( 'base', 'exist(''Bmsotlikelytranspointvalue'',''var'') == 1' );
ExistTinC1=evalin( 'base', 'exist(''TinC1'',''var'') == 1' ); 


if ExistBmsotlikelytranspointvalue
    
  Bmsotlikelytranspointvalue=evalin('base','Bmsotlikelytranspointvalue'); 
  
else
    
  Bmsotlikelytranspointvalue=55; 
  
end




if ExistBppmxfrom && ExistBppmxinterval && ExistBppmxto && ... 
   ExistB11from && ExistB11interval && ExistB11to && ExistByaxesmin ...
   && ExistByaxesmax && Existbaxesmax && Existbaxesmin && ExistTinC1   






Bppmxfrom=evalin('base','Bppmxfrom'); 
Bppmxinterval=evalin('base','Bppmxinterval'); 
Bppmxto=evalin('base','Bppmxto'); 
B11from=evalin('base','B11from'); 
B11interval=evalin('base','B11interval');
B11to=evalin('base','B11to'); 
Byaxesmin=evalin('base','Byaxesmin');
Byaxesmax=evalin('base','Byaxesmax');
baxesmin=evalin('base','baxesmin');
baxesmax=evalin('base','baxesmax');
TinC1=evalin('base','TinC1');  


TinK=TinC1+273.15;
T1000=1000/TinK;                                                            %Boron alpha factor calculation based on: Maner, J.L., London, D., 2018. Fractionation of the isotopes of boron between granitic melt and aqueous solution at 700 °C and 800 °C (200 MPa). Chemical Geology 489, 16–27. doi:10.1016/j.chemgeo.2018.05.007.

lowBalphaBlog=0.6962*T1000-7.5821;

lowhalphaB=exp(lowBalphaBlog/1000);                                         % 



alphaB=1/lowhalphaB; 

%%%


if B11from>B11to
    errordlg(strcat('First', 32, char(hex2dec('03B4')),'11B in ‰ field requires a lower value than third  '),'Error');                                      
return
end

if Bppmxfrom>Bppmxto
     errordlg('First Boron concentration field requires a lower value than third field','Error'); 
    return
end



if Byaxesmin>Byaxesmax
     errordlg('First x-axis field requires a lower value than second field','Error'); 
    return
end

if baxesmin>baxesmax
     errordlg('First  y-axis field requires a lower value than second field','Error'); 
    return
end




waitbarautoB = waitbar(0,'Calculating open-system...','Name','Best-fit calculations');                                               %creating progress bar
frames = java.awt.Frame.getFrames();
frames(end).setAlwaysOnTop(1); 


Bppmxfinal=Bppmxto:-Bppmxinterval:Bppmxfrom;
Bppmxinitial=Bppmxto;
B11initial=B11from:B11interval:B11to   ; 
assignin('base','Bppmxfinal',Bppmxfinal);
assignin('base','B11initial',B11initial);







%open system

Boronppminitial1=zeros(1,length(Bppmxfinal)+1);
Bfinalpureopen=zeros(length(Bppmxfinal),length(B11initial));      
nn=1;
for Binitialloop=B11initial
  Binitialloop1=Binitialloop; 
    n=1;
    Boronppminitial1(1)=Bppmxinitial;  
for Bppmxxxfinalloop=Bppmxfinal

    
Boronppminitial1(n+1)=Bppmxxxfinalloop;
Bfinalpureopen(n,nn)=(Binitialloop1+1000)*((Bppmxxxfinalloop/Boronppminitial1(n))^(alphaB-1))-1000; 
Binitialloop1=Bfinalpureopen(n,nn);
n=n+1;

end  

nn=nn+1;
end  

nnn=nn-1;


                                                                              

    fullpath2roundedB=round(excelautoB(:,1)*100)/100;                        % rounding excelautoB to round to 2 digits to the right of the decimal point, trick to make program useable with older versions
                                
    
interpolBppmxval=(min(fullpath2roundedB):0.01:max(fullpath2roundedB))';    %setting the required x values for interpolation






indexforBppmx=zeros(1,length(fullpath2roundedB));

for ismemberreplaceB=1:length(fullpath2roundedB)
[~, indexforBppmx(ismemberreplaceB)]=min(abs(interpolBppmxval-fullpath2roundedB(ismemberreplaceB)));   %%find minimum difference between searched value and data values ('~' for saving it as the location/place of the data), watercontent always descends, no double value are found
end

indexforBppmx=indexforBppmx';






RfactormopenB=zeros(nnn,1);
adjRfactormopenB=zeros(nnn,1);
RMSEvalopenB=zeros(nnn,1);
%^ global use
%individual use

for rloop=1:nnn


interpolatedvaluesy=interp1(Bppmxfinal,Bfinalpureopen(:,rloop),interpolBppmxval);        %interpolation of y values in relation to x values


valuesytocompare=interpolatedvaluesy(indexforBppmx);


RfactormopenB(rloop,1)=corr(valuesytocompare,excelautoB(:,2))^2;                              %calculating Pearson correlation coefficient and ^2 for the coefficient of deteremination from user data y values (testy(:,2)) and the by the program calculated and interpolated y values (valuesytocompare)
adjRfactormopenB(rloop,1)=1-(1-RfactormopenB(rloop,1))*((length(valuesytocompare)-1)/(length(valuesytocompare)-1-1));   %calculating the adjusted coefficient of determination
RMSEvalopenB(rloop,1)=rms(valuesytocompare-excelautoB(:,2));                                     




end
%
[RMSEvalopenminB,RMSEvalopenminindexB]=min(RMSEvalopenB);                      %

RfactormB=RfactormopenB(RMSEvalopenminindexB);
adjRfactormB=adjRfactormopenB(RMSEvalopenminindexB);
initialvalueB=B11initial(1,RMSEvalopenminindexB);                                 %the different colums of Bfinalpureopen/Binalsearch are calculated using different B initial values, they are the same columns as B initial columns, searched y value (column) is at the same time also the same columns with its B initial value                                                                                                                        

if isnan(RfactormB)
    rightinterpreter= struct('WindowStyle','modal',...                      %setting the an interpreter (tex) for the following errordlg
              'Interpreter','tex');
    errordlg('For R^{2} the calculated values are required to portray all sample data. Example: With a step size of 0.1 set lowest boron concentration (ppm) as 0.001 and initial  boron concentration  as 100.001 instead of 100 ','Error'...
        ,rightinterpreter);                                                 %interpreter to be used. Here ît is required for the line "R^{2}" to be displayed correctly
end

initialvaluestringB=num2str(initialvalueB);                                    %creating string from a value with num2str
DisplaysentenceB=('Calculated graph with initial \delta11B value of');
permilledisplayB=(' ‰');
initialvaluestringdisplayB=strcat(DisplaysentenceB, 32,initialvaluestringB,permilledisplayB); %connecting strings with strcat 

RsuperstringB=('R^{2}   =');                                                 %creating string whereas ^{} is the tex code for superscript
RfactormtostringB=num2str(RfactormB);
stringRfactormB=strcat(RsuperstringB, 32, RfactormtostringB);                  %concatenate strings whereas  32 is the ASCII code for a blank space

adjRsuBstringB=('R^{2}_{adj} =');                                            %creating string whereas ^{} is the tex code for superscript and _{} for subscript
adjRfactormtostringB=num2str(adjRfactormB);                                   %converting number to character arrary
stringadjRfactormB=strcat(adjRsuBstringB, 32, adjRfactormtostringB);

RMSEpurestringB=('RMSE =');  
RMSEpurestringtostringB=num2str(RMSEvalopenminB);
stringRMSEvalB=strcat(RMSEpurestringB, 32, RMSEpurestringtostringB);




F3551=figure(3551);set(F3551,'name','Best fit open-degassing system','numbertitle','off');
movegui(F3551,'southwest');

LINE3551=plot(Bppmxfinal,Bfinalpureopen(:,RMSEvalopenminindexB),'DisplayName',initialvaluestringdisplayB);
ylabel('\delta11B in ‰');
xlabel('Boron concentration in ppm');
axis([baxesmin baxesmax Byaxesmin Byaxesmax]);

hold on
excelautopointsB=plot(excelautoB(:,1),excelautoB(:,2),'r.','MarkerSize',10,'DisplayName','Sample data');                 %plotting all original data points as dots with a marker size of 10 and display name Sample data for the legend

hold on
R2plotB=plot(NaN,NaN,'DisplayName',stringRfactormB, 'linestyle', 'none');% the legend requires a plot it relates too, here an empty plot is created (NaN) only containing the stringRfactormB string
 hold on
adjR2plotB=plot(NaN,NaN,'DisplayName',stringadjRfactormB, 'linestyle', 'none'); % same as above
 hold on
RMSEvalplotB=plot(NaN,NaN,'DisplayName',stringRMSEvalB, 'linestyle', 'none');
 

legend([LINE3551,excelautopointsB,R2plotB,adjR2plotB,RMSEvalplotB],'Location','southeast');   
  grid on;

 hold off

 
 
 
 Bppmxxcontent=Bppmxfinal';                                                 %changing boron concentration data layout to use it for table (one row into one columns "'")
Bfinalopentrans1=num2cell(Bfinalpureopen(:,RMSEvalopenminindexB));          %converting array to cell array

Bppmxcontent1=num2cell(Bppmxxcontent);

BininitialvalueB=cell(1,length(Bppmxxcontent));                              %preallocation with cells. Creates empty cell with desired rows and columns

for TablepreploopB=1:length(Bppmxxcontent)                                   %simplistic loop which wrties empty cells of type "char" for character cell, instead of cells of type "double", by writing string ''
    BininitialvalueB{TablepreploopB}=num2str('');
end

Bininitialvalueemtpy=BininitialvalueB';                                      %transposing cell
RfactormstringtableB=Bininitialvalueemtpy;
adjRfactormstringtableB=Bininitialvalueemtpy;
RMSEvalstringtableB=Bininitialvalueemtpy;
BininitialvalueB{1}=strcat(32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,num2str(initialvalueB));                                  %setting first cell of char array as a string containing the initial d11B value
BininitialvalueB=BininitialvalueB';



RfactormstringtableB{1}=RfactormB;
adjRfactormstringtableB{1}=adjRfactormB;
RMSEvalstringtableB{1}=RMSEvalopenminB;

F3552=figure(3552);set(F3552,'name','Best fit open-degassing system', ...
    'numbertitle','off','unit','normalized','Position', [0.2 0.2 0.43 0.5],'visible','off');
deltacodeB = char(hex2dec('03B4'));                                           %workaround for uitable in next line. Uitable can not read special characters or tex code (\delta), hex2dec translate Unicode into ASCII code which then can be read by char as the special character                                       
TableopenB=uitable('Data',[Bppmxcontent1,Bfinalopentrans1,BininitialvalueB,RfactormstringtableB,adjRfactormstringtableB,RMSEvalstringtableB],'unit','normalized', ...           %creating a table on a new figure window whereas 'Data' considers the variable inside the next [] as the data it should write, which fills the whole figure  ('unit','normalized','Position', [0 0 1 1])       
'Position', [0 0 1 1],'ColumnName',{'Boron concentration in ppm',[' ',deltacodeB,'11B in ‰'],[' Selected graph initial', 032,deltacodeB,'11B in ‰'], ...       %'ColumnsName', sets the next imnput inside the {} as the column names
['R',char(hex2dec('00B2'))],['adjR',char(hex2dec('00B2'))],['RMSE']});   








DataoftableopenB=get(TableopenB,'Data');                                  %gets the current Data ('Data') of active table (TableopenB)
ColumnheaderopenB=get(TableopenB,'ColumnName');                           %gets the current Column names ('ColumnName') of active table



DataofgraphopenB=[ColumnheaderopenB';DataoftableopenB];




assignin('base','DataofgraphopenB',DataofgraphopenB);
 
 


assignin('base','F3551',F3551);
assignin('base','LINE3551',LINE3551);


%

%










 
%closed system
 waitbar(0.14,waitbarautoB,'Calculating closed-system...','Name','Best-fit calculations');   %updating progress bar


Bfinalpureclosed=zeros(length(Bppmxfinal),length(B11initial));      
nn=1;
for Binitialloop=B11initial
  Binitialloop1=Binitialloop; 
    n=1;
  
for Bppmxxxfinalloop=Bppmxfinal

    
Bfinalpureclosed(n,nn)=Binitialloop1-((1-(Bppmxxxfinalloop/Bppmxinitial))*10^3)*log(alphaB);

n=n+1;

end  

nn=nn+1;
end  

nnn=nn-1;












RfactormclosedB=zeros(nnn,1);
adjRfactormclosedB=zeros(nnn,1);
RMSEvalclosedB=zeros(nnn,1);


for rloop=1:nnn


interpolatedvaluesy=interp1(Bppmxfinal,Bfinalpureclosed(:,rloop),interpolBppmxval);        


valuesytocompare=interpolatedvaluesy(indexforBppmx);

RfactormclosedB(rloop,1)=corr(valuesytocompare,excelautoB(:,2))^2;                              
adjRfactormclosedB(rloop,1)=1-(1-RfactormclosedB(rloop,1))*((length(valuesytocompare)-1)/(length(valuesytocompare)-1-1));   
RMSEvalclosedB(rloop,1)=rms(valuesytocompare-excelautoB(:,2));                                     




end
%
[RMSEvalclosedminB,RMSEvalclosedinindexB]=min(RMSEvalclosedB);                      

RfactormB=RfactormclosedB(RMSEvalclosedinindexB);
adjRfactormB=adjRfactormclosedB(RMSEvalclosedinindexB);
initialvalueB=B11initial(1,RMSEvalclosedinindexB);                                                                                                                                                          



initialvaluestringB=num2str(initialvalueB);                                     
initialvaluestringdisplayB=strcat(DisplaysentenceB, 32,initialvaluestringB,permilledisplayB);  


RfactormtostringB=num2str(RfactormB);
stringRfactormB=strcat(RsuperstringB, 32, RfactormtostringB);                   

                                            
adjRfactormtostringB=num2str(adjRfactormB);                                    
stringadjRfactormB=strcat(adjRsuBstringB, 32, adjRfactormtostringB);


RMSEpurestringtostringB=num2str(RMSEvalclosedminB);
stringRMSEvalB=strcat(RMSEpurestringB, 32, RMSEpurestringtostringB);




F6551=figure(6551);set(F6551,'name','Best fit closed-degassing system','numbertitle','off');
movegui(F6551,'south');


LINE6551=plot(Bppmxfinal,Bfinalpureclosed(:,RMSEvalclosedinindexB),'DisplayName',initialvaluestringdisplayB);
ylabel('\delta11B in ‰');
xlabel('Boron concentration in ppm');
axis([baxesmin baxesmax Byaxesmin Byaxesmax]);

hold on
excelautopointsB=plot(excelautoB(:,1),excelautoB(:,2),'r.','MarkerSize',10,'DisplayName','Sample data');                  

hold on
R2plotB=plot(NaN,NaN,'DisplayName',stringRfactormB, 'linestyle', 'none'); 
 hold on
adjR2plotB=plot(NaN,NaN,'DisplayName',stringadjRfactormB, 'linestyle', 'none'); 
 hold on
RMSEvalplotB=plot(NaN,NaN,'DisplayName',stringRMSEvalB, 'linestyle', 'none');
 

legend([LINE6551,excelautopointsB,R2plotB,adjR2plotB,RMSEvalplotB],'Location','southeast');   
  grid on;

 hold off

 
 
 
                                                
    

                      

                                  
Bfinalclosedtrans1=num2cell(Bfinalpureclosed(:,RMSEvalclosedinindexB)); 


BininitialvalueB{1}=strcat(32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,num2str(initialvalueB));                                   
RfactormstringtableB{1}=RfactormB;
adjRfactormstringtableB{1}=adjRfactormB;
RMSEvalstringtableB{1}=RMSEvalclosedminB;

F6552=figure(6552);set(F6552,'name','Best fit closed-degassing system', ...
    'numbertitle','off','unit','normalized','Position', [0.2 0.2 0.43 0.5],'visible','off');
                                                                                   
TableclosedB=uitable('Data',[Bppmxcontent1,Bfinalclosedtrans1,BininitialvalueB,RfactormstringtableB,adjRfactormstringtableB,RMSEvalstringtableB],'unit','normalized', ...                   
'Position', [0 0 1 1],'ColumnName',{'Boron concentration in ppm',[' ',deltacodeB,'11B in ‰'],[' Selected graph initial', 032,deltacodeB,'11B in ‰'], ...        
['R',char(hex2dec('00B2'))],['adjR',char(hex2dec('00B2'))],['RMSE']});   








DataoftableclosedB=get(TableclosedB,'Data');                                   
ColumnheaderclosedB=get(TableclosedB,'ColumnName');                            



DataofgraphclosedB=[ColumnheaderclosedB';DataoftableclosedB];




assignin('base','DataofgraphclosedB',DataofgraphclosedB);
 
 


assignin('base','F6551',F6551);
assignin('base','LINE6551',LINE6551);







%batched system

 waitbar(0.28,waitbarautoB,'Calculating batched-system...','Name','Best-fit calculations');



Boronppminitial1=zeros(1,length(Bppmxfinal)+1);
Bfinalpurebatched=zeros(length(Bppmxfinal),length(B11initial));      
nn=1;
for Binitialloop=B11initial
  Binitialloop1=Binitialloop; 
    n=1;
      Boronppminitial1(1)=Bppmxinitial;  

for Bppmxxxfinalloop=Bppmxfinal

Boronppminitial1(n+1)=Bppmxxxfinalloop;
Bfinalpurebatched(n,nn)=Binitialloop1-((1-(Bppmxxxfinalloop/Boronppminitial1(n)))*10^3)*log(alphaB);
Binitialloop1=Bfinalpurebatched(n,nn);

n=n+1;

end  

nn=nn+1;
end  

nnn=nn-1;









RfactormbatchedB=zeros(nnn,1);
adjRfactormbatchedB=zeros(nnn,1);
RMSEvalbatchedB=zeros(nnn,1);


for rloop=1:nnn


interpolatedvaluesy=interp1(Bppmxfinal,Bfinalpurebatched(:,rloop),interpolBppmxval);        


valuesytocompare=interpolatedvaluesy(indexforBppmx);


RfactormbatchedB(rloop,1)=corr(valuesytocompare,excelautoB(:,2))^2;                              
adjRfactormbatchedB(rloop,1)=1-(1-RfactormbatchedB(rloop,1))*((length(valuesytocompare)-1)/(length(valuesytocompare)-1-1));   
RMSEvalbatchedB(rloop,1)=rms(valuesytocompare-excelautoB(:,2));                                     




end
%
[RMSEvalbatchedminB,RMSEvalbatchedinindexB]=min(RMSEvalbatchedB);                      

RfactormB=RfactormbatchedB(RMSEvalbatchedinindexB);
adjRfactormB=adjRfactormbatchedB(RMSEvalbatchedinindexB);
initialvalueB=B11initial(1,RMSEvalbatchedinindexB);                                                                                                                                                          



initialvaluestringB=num2str(initialvalueB);                                     
initialvaluestringdisplayB=strcat(DisplaysentenceB, 32,initialvaluestringB,permilledisplayB);  


RfactormtostringB=num2str(RfactormB);
stringRfactormB=strcat(RsuperstringB, 32, RfactormtostringB);                   

                                            
adjRfactormtostringB=num2str(adjRfactormB);                                    
stringadjRfactormB=strcat(adjRsuBstringB, 32, adjRfactormtostringB);


RMSEpurestringtostringB=num2str(RMSEvalbatchedminB);
stringRMSEvalB=strcat(RMSEpurestringB, 32, RMSEpurestringtostringB);




F6554=figure(6554);set(F6554,'name','Best fit batched-degassing system','numbertitle','off');
movegui(F6554,'southeast');


LINE6554=plot(Bppmxfinal,Bfinalpurebatched(:,RMSEvalbatchedinindexB),'DisplayName',initialvaluestringdisplayB);
ylabel('\delta11B in ‰');
xlabel('Boron concentration in ppm');
axis([baxesmin baxesmax Byaxesmin Byaxesmax]);

hold on
excelautopointsB=plot(excelautoB(:,1),excelautoB(:,2),'r.','MarkerSize',10,'DisplayName','Sample data');                  

hold on
R2plotB=plot(NaN,NaN,'DisplayName',stringRfactormB, 'linestyle', 'none'); 
 hold on
adjR2plotB=plot(NaN,NaN,'DisplayName',stringadjRfactormB, 'linestyle', 'none'); 
 hold on
RMSEvalplotB=plot(NaN,NaN,'DisplayName',stringRMSEvalB, 'linestyle', 'none');
 

legend([LINE6554,excelautopointsB,R2plotB,adjR2plotB,RMSEvalplotB],'Location','southeast');   
  grid on;

 hold off

 
 
                                  
Bfinalbatchedtrans1=num2cell(Bfinalpurebatched(:,RMSEvalbatchedinindexB)); 


BininitialvalueB{1}=strcat(32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,num2str(initialvalueB));                                   
RfactormstringtableB{1}=RfactormB;
adjRfactormstringtableB{1}=adjRfactormB;
RMSEvalstringtableB{1}=RMSEvalbatchedminB;

F6555=figure(6555);set(F6555,'name','Best fit batched-degassing system', ...
    'numbertitle','off','unit','normalized','Position', [0.2 0.2 0.43 0.5],'visible','off');
                                                                                   
TablebatchedB=uitable('Data',[Bppmxcontent1,Bfinalbatchedtrans1,BininitialvalueB,RfactormstringtableB,adjRfactormstringtableB,RMSEvalstringtableB],'unit','normalized', ...                   
'Position', [0 0 1 1],'ColumnName',{'Boron concentration in ppm',[' ',deltacodeB,'11B in ‰'],[' Selected graph initial', 032,deltacodeB,'11B in ‰'], ...        
['R',char(hex2dec('00B2'))],['adjR',char(hex2dec('00B2'))],['RMSE']});   








DataoftablebatchedB=get(TablebatchedB,'Data');                                   
ColumnheaderbatchedB=get(TablebatchedB,'ColumnName');                            



DataofgraphbatchedB=[ColumnheaderbatchedB';DataoftablebatchedB];




assignin('base','DataofgraphbatchedB',DataofgraphbatchedB);
 
 

assignin('base','F6554',F6554);
assignin('base','LINE6554',LINE6554);










%batched variable steps 
%%%%%%
%%%
 waitbar(0.42,waitbarautoB,'Calculating batched-system (variable step size)...','Name','Best-fit calculations');
















Percentwaterlossvar=[5 10 15 20 25 30 35 40 45 50 55 60 65 70 75 80 85 90 95];


Percentwaterlossvarfin2=[0.95 0.9 0.85 0.8 0.75 0.7 0.65 0.6 0.55 0.5 0.45 0.4 0.35 0.3 0.25 0.2 0.15 0.1 0.05];

Bppmxfinalbatchautobatchauto=zeros(140000,19);                                 %estimated maximum size needed for preallocation. Can not be known before while loop
for iiii=1:19

   mm=1;                                                                 
Bppmxfinalbatchautobatchauto(1,iiii)=Bppmxinitial;                                                    
Bppmxfinalbatchautobatchautostepbefore=Bppmxinitial;
                                                                     
while Bppmxfinalbatchautobatchauto(mm,iiii) > Bppmxfrom                                                    
    

    Bppmxfinalbatchautobatchauto(mm+1,iiii)=Bppmxfinalbatchautobatchautostepbefore*Percentwaterlossvarfin2(iiii);
     
    mm=mm+1 ;                                                                
      Bppmxfinalbatchautobatchautostepbefore=Bppmxfinalbatchautobatchauto(mm,iiii);
    
end



end


Bppmxfinalbatchautobatchauto(Bppmxfinalbatchautobatchauto == 0)=NaN;        %all remaining 0 from the zeros command are replaced by NaN, so that these values are not calculated

Bppmxfinalbatchautoforindexnonnans=Bppmxfinalbatchautobatchauto(:,1);

Bppmxfinalbatchautobatchauto=Bppmxfinalbatchautobatchauto(1:length(Bppmxfinalbatchautoforindexnonnans(~isnan(Bppmxfinalbatchautoforindexnonnans))),:);      %








Bfinalpurebatchedvariablestep=zeros(length(Bppmxfinalbatchautobatchauto(:,1)),length(B11initial),19);
Bppmxinitialline(1,1:19)=Bppmxinitial;

Bppmxinitial122=[Bppmxinitialline ; Bppmxfinalbatchautobatchauto];

for batchindBoronloss=1:19
    
nn=1;
for Binitialloop=B11initial
  Binitialloop1=Binitialloop;
   
for Bppmxfinalloopbatch=1:length(Bppmxfinalbatchautobatchauto(:,batchindBoronloss))

    

Bfinalpurebatchedvariablestep(Bppmxfinalloopbatch,nn,batchindBoronloss)=Binitialloop1-((1-(Bppmxfinalbatchautobatchauto(Bppmxfinalloopbatch,batchindBoronloss)/Bppmxinitial122(Bppmxfinalloopbatch,batchindBoronloss)))*10^3)*log(alphaB);
Binitialloop1=Bfinalpurebatchedvariablestep(Bppmxfinalloopbatch,nn,batchindBoronloss);


end  

nn=nn+1;

end  

end

Bfinalpurebatchedvariablestep(Bfinalpurebatchedvariablestep == 0)= NaN;

nnn=nn-1;



                                                                              






RfactormbatchedvariableB=zeros(nnn,19);
adjRfactormbatchedvariableB=zeros(nnn,19);
RMSEvalbatchedvariableB=zeros(nnn,19);
Boronnanslater=zeros(1,19);
for zloop=1:19
    Boronnans=find(isnan(Bppmxfinalbatchautobatchauto(:,zloop)),1);            %find the first NaN value index

if isempty(Boronnans)
    Boronnans=length(Bppmxfinalbatchautobatchauto(:,zloop));
end

Boronnanslater(zloop)=Boronnans-1;

for rloop=1:nnn




interpolatedvaluesy=interp1((Bppmxfinalbatchautobatchauto(1:Boronnans-1,zloop)),Bfinalpurebatchedvariablestep(1:Boronnans-1,rloop,zloop),interpolBppmxval);        


valuesytocompare=interpolatedvaluesy(indexforBppmx);


RfactormbatchedvariableB(rloop,zloop)=corr(valuesytocompare,excelautoB(:,2))^2;                              
adjRfactormbatchedvariableB(rloop,zloop)=1-(1-RfactormbatchedvariableB(rloop,zloop))*((length(valuesytocompare)-1)/(length(valuesytocompare)-1-1));   
RMSEvalbatchedvariableB(rloop,zloop)=rms(valuesytocompare-excelautoB(:,2));                                     



end
end
%



[RMSEvalbatchedvariablemin1B,RMSEvalbatchedvariableinindex1B]=min(min(RMSEvalbatchedvariableB,[],1));              %column
[RMSEvalbatchedvariablemin2B,RMSEvalbatchedvariableinindex2B]=min(min(RMSEvalbatchedvariableB,[],2));              %line

RfactormB=RfactormbatchedvariableB(RMSEvalbatchedvariableinindex2B,RMSEvalbatchedvariableinindex1B);
adjRfactormB=adjRfactormbatchedvariableB(RMSEvalbatchedvariableinindex2B,RMSEvalbatchedvariableinindex1B);
initialvalueB=B11initial(1,RMSEvalbatchedvariableinindex2B);                                                                                                                                                          



assignin('base','RfactormbatchedvariableB',RfactormbatchedvariableB);   %%%%
assignin('base','adjRfactormbatchedvariableB',adjRfactormbatchedvariableB);   %%%%
assignin('base','RMSEvalbatchedvariableB',RMSEvalbatchedvariableB);   %%%%




initialvaluestringB=num2str(initialvalueB);                                     
initialvaluestringdisplayB=strcat(DisplaysentenceB, 32,initialvaluestringB,permilledisplayB);  


RfactormtostringB=num2str(RfactormB);
stringRfactormB=strcat(RsuperstringB, 32, RfactormtostringB);                   

                                            
adjRfactormtostringB=num2str(adjRfactormB);                                    
stringadjRfactormB=strcat(adjRsuBstringB, 32, adjRfactormtostringB);


RMSEpurestringtostringB=num2str(RMSEvalbatchedvariablemin1B);
stringRMSEvalB=strcat(RMSEpurestringB, 32, RMSEpurestringtostringB);

stringPercentageplotpurestringB='Percentage of water loss at each step =';
stringPercentageplotnum2stringB=num2str(Percentwaterlossvar(RMSEvalbatchedvariableinindex1B));
stringPercentageplotsrtringB=strcat(stringPercentageplotpurestringB, 32, stringPercentageplotnum2stringB );



F6556=figure(6556);set(F6556,'name','Best fit batched-degassing system (variable step sizes)','numbertitle','off');
movegui(F6556,'northwest');


LINE6556=plot(Bppmxfinalbatchautobatchauto(:,RMSEvalbatchedvariableinindex1B),Bfinalpurebatchedvariablestep(:,RMSEvalbatchedvariableinindex2B,RMSEvalbatchedvariableinindex1B),'DisplayName',initialvaluestringdisplayB);
ylabel('\delta11B in ‰');
xlabel('Boron concentration in ppm');
axis([baxesmin baxesmax Byaxesmin Byaxesmax]);

hold on
excelautopointsB=plot(excelautoB(:,1),excelautoB(:,2),'r.','MarkerSize',10,'DisplayName','Sample data');                  

hold on
R2plotB=plot(NaN,NaN,'DisplayName',stringRfactormB, 'linestyle', 'none'); 
 hold on
adjR2plotB=plot(NaN,NaN,'DisplayName',stringadjRfactormB, 'linestyle', 'none'); 
 hold on
RMSEvalplotB=plot(NaN,NaN,'DisplayName',stringRMSEvalB, 'linestyle', 'none');
  hold on
Percentageplotings=plot(NaN,NaN,'DisplayName',stringPercentageplotsrtringB, 'linestyle', 'none');

legend([LINE6556,excelautopointsB,Percentageplotings,R2plotB,adjR2plotB,RMSEvalplotB],'Location','southeast');   
  grid on;

 hold off

 
 


                                         
    

                      
 
Boroncontentbatchvari=Bppmxfinalbatchautobatchauto(1:Boronnanslater(RMSEvalbatchedvariableinindex1B),RMSEvalbatchedvariableinindex1B);                                                 %changing boron concentration data layout to use it for table (one row into one columns "'")
Bfinalbatchvariabletrans1=num2cell(Bfinalpurebatchedvariablestep(1:Boronnanslater(RMSEvalbatchedvariableinindex1B),RMSEvalbatchedvariableinindex2B,RMSEvalbatchedvariableinindex1B));



Boroncontent123=num2cell(Boroncontentbatchvari);
                                  
Bininitialvaluebatchedvar=cell(1,length(Boroncontentbatchvari));                              %preallocation with cells. Creates empty cell with desired rows and columns

for TablepreploopbavaB=1:length(Boroncontentbatchvari)                                   %simplistic loop which wrties empty cells of type "char" for character cell, instead of cells of type "double", by writing string ''
    Bininitialvaluebatchedvar{TablepreploopbavaB}=num2str('');
end

Bininitialvalueemtpybatchedvar=Bininitialvaluebatchedvar';                                      %transposing cell
RfactormstringtablebatchvarB=Bininitialvalueemtpybatchedvar;
adjRfactormstringtablebatchvarB=Bininitialvalueemtpybatchedvar;
RMSEvalstringtablebatchvarB=Bininitialvalueemtpybatchedvar;
PercentwaterlossatstepbatchedvarB=Bininitialvalueemtpybatchedvar;

Bininitialvaluebatchedvar=Bininitialvaluebatchedvar';

PerceentwaterlossvarnumstrB=num2str(Percentwaterlossvar(RMSEvalbatchedvariableinindex1B));


Bininitialvaluebatchedvar{1}=strcat(32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,num2str(initialvalueB));                                   
RfactormstringtablebatchvarB{1}=RfactormB;
adjRfactormstringtablebatchvarB{1}=adjRfactormB;
RMSEvalstringtablebatchvarB{1}=RMSEvalbatchedvariablemin1B;
PercentwaterlossatstepbatchedvarB{1}=strcat(32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,PerceentwaterlossvarnumstrB);

F6557=figure(6557);set(F6557,'name','Best fit batched-degassing system (variable step sizes)', ...
    'numbertitle','off','unit','normalized','Position', [0.2 0.2 0.43 0.5],'visible','off');
                                                                                   
TablebatchedvariB=uitable('Data',[Boroncontent123,Bfinalbatchvariabletrans1,Bininitialvaluebatchedvar,PercentwaterlossatstepbatchedvarB,RfactormstringtablebatchvarB,adjRfactormstringtablebatchvarB,RMSEvalstringtablebatchvarB],'unit','normalized', ...                   
'Position', [0 0 1 1],'ColumnName',{'Boron concentration in ppm',[' ',deltacodeB,'11B in ‰'],[' Selected graph initial', 032,deltacodeB,'11B in ‰'], ...        
'% water loss at each step',['R',char(hex2dec('00B2'))],['adjR',char(hex2dec('00B2'))],['RMSE']});   



DataoftablebatchedvariableB=get(TablebatchedvariB,'Data');                                   
ColumnheaderbatchedvariableB=get(TablebatchedvariB,'ColumnName');                            



DataofgraphbatchedvariableB=[ColumnheaderbatchedvariableB';DataoftablebatchedvariableB];


assignin('base','DataofgraphbatchedvariableB',DataofgraphbatchedvariableB);

assignin('base','F6556',F6556);










%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%two-stage  systems
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Closed to ...

 waitbar(0.56,waitbarautoB,'Calculating closed-, to open-system...','Name','Best-fit calculations');













higherBoronvaluesthantransitionindex=find(fullpath2roundedB>=Bmsotlikelytranspointvalue);
higherdBvaluesthantransitfull=excelautoB(higherBoronvaluesthantransitionindex,2);


interpolwatervalclosexB=(min(fullpath2roundedB(find(fullpath2roundedB>=Bmsotlikelytranspointvalue))):0.0001:max(fullpath2roundedB))';





%
fullpath2roundedforloopB=fullpath2roundedB(find(fullpath2roundedB >= Bmsotlikelytranspointvalue));
indexforBoronclosex=zeros(1,length(fullpath2roundedforloopB));

for ismemberreplace2B=1:length(fullpath2roundedforloopB)
indexforBoronclosex(ismemberreplace2B)=find(abs(interpolwatervalclosexB-fullpath2roundedforloopB(ismemberreplace2B))<=0.000001);  %%find minimum difference between searched value and data values ('~' for saving it as the location/place of the data), boron content always descends, no double value are found
end

indexforBoronclosex=indexforBoronclosex';




indexforBoronclosex(indexforBoronclosex==0)=[];




if ~isempty(indexforBoronclosex)




RfactormclosedautoxB=zeros(length(B11initial),1);
adjRfactormclosedautoxB=zeros(length(B11initial),1);
RMSEvalclosedautoxB=zeros(length(B11initial),1);



for rloop=1:length(B11initial)


interpolatedvaluesy=interp1(Bppmxfinal,Bfinalpureclosed(:,rloop),interpolwatervalclosexB);        


valuesytocompare=interpolatedvaluesy(indexforBoronclosex);

RfactormclosedautoxB(rloop,1)=corr(valuesytocompare,higherdBvaluesthantransitfull)^2;                              
adjRfactormclosedautoxB(rloop,1)=1-(1-RfactormclosedautoxB(rloop,1))*((length(valuesytocompare)-1)/(length(valuesytocompare)-1-1));   
RMSEvalclosedautoxB(rloop,1)=rms(valuesytocompare-higherdBvaluesthantransitfull);                                     




end
%
[RMSEvalclosedtoxminB,RMSEvalclosedtoxinindexB]=min(RMSEvalclosedautoxB);                      

RfactormB=RfactormclosedautoxB(RMSEvalclosedtoxinindexB);
adjRfactormB=adjRfactormclosedautoxB(RMSEvalclosedtoxinindexB);
initialvalueB=B11initial(1,RMSEvalclosedtoxinindexB);                                                                                                                                                          



%graph for all calculations=

d11Bbestfitclosedtox=Bfinalpureclosed(:,RMSEvalclosedtoxinindexB);
assignin('base','d11Bbestfitclosedtox',d11Bbestfitclosedtox);  %%%    


%transitionpoints to calculate
DifferenttransitionvalueslowerB=zeros(20,1);
DifferenttransitionvalueslowerB(1,1)=Bmsotlikelytranspointvalue;

countinglowerBoron=Bmsotlikelytranspointvalue;
manman=1;

while countinglowerBoron>Bppmxfrom
    
    DifferenttransitionvalueslowerB(manman,1)=countinglowerBoron-1;
    countinglowerBoron=DifferenttransitionvalueslowerB(manman,1);

manman=manman+1;

end

DifferenttransitionvalueslowerB(DifferenttransitionvalueslowerB==0)=[];

DifferenttransitionvalueshigherB=zeros(10,1);
DifferenttransitionvalueshigherB(1)=Bmsotlikelytranspointvalue;
countinghigherBoron=Bmsotlikelytranspointvalue;

malal=1;

while countinghigherBoron<Bmsotlikelytranspointvalue+100 && countinghigherBoron<Bppmxto-1

DifferenttransitionvalueshigherB(malal,1)=countinghigherBoron+1;
countinghigherBoron=DifferenttransitionvalueshigherB(malal,1);


malal=malal+1;

end


AlltransitionpointstocalcB=sort([DifferenttransitionvalueshigherB; Bmsotlikelytranspointvalue; DifferenttransitionvalueslowerB],'descend');



searchclosestBorontotransindex=zeros(length(AlltransitionpointstocalcB),1);
for z=1:length(AlltransitionpointstocalcB)
    
[~,searchclosestBorontotransindex(z,1)]= min(abs(Bppmxfinal-AlltransitionpointstocalcB(z,1))); 
    

end


Boroncontentstocalculatenew=nan(length(Bppmxfinal)-searchclosestBorontotransindex(1,1),length(AlltransitionpointstocalcB));


for indexyy=1:length(AlltransitionpointstocalcB)
    
    
    
 
    
Boroncontentstocalculatenew(1:length(Bppmxfinal)-searchclosestBorontotransindex(indexyy,1)+1,indexyy)=Bppmxfinal(searchclosestBorontotransindex(indexyy,1):length(Bppmxfinal));


end







%closed,- to open-system

Bfinalcloseopenauto=nan(length(Bppmxfinal)-searchclosestBorontotransindex(1,1)+1,length(AlltransitionpointstocalcB));
Bppmxfinal1closeopenauto=nan(length(Bppmxfinal)-searchclosestBorontotransindex(1,1),length(AlltransitionpointstocalcB));


for indextransBoron=1:length(AlltransitionpointstocalcB)

    
    
Bchangeforloop=d11Bbestfitclosedtox(searchclosestBorontotransindex(indextransBoron,1));

 Bppmxfinal1closeopenauto(1,indextransBoron)=Boroncontentstocalculatenew(1,indextransBoron);
 
n=1;

for Bppmxxxfinalloop=1:length(Bppmxfinal)-searchclosestBorontotransindex(indextransBoron,1)+1                 %as index can not be zero it has to be counted +1

    
Bppmxfinal1closeopenauto(n+1,indextransBoron)=Boroncontentstocalculatenew(Bppmxxxfinalloop,indextransBoron);

Bfinalcloseopenauto(n,indextransBoron)=(Bchangeforloop+1000)*((Boroncontentstocalculatenew(Bppmxxxfinalloop,indextransBoron)/Bppmxfinal1closeopenauto(n,indextransBoron))^(alphaB-1))-1000;
Bchangeforloop=Bfinalcloseopenauto(n,indextransBoron);
n=n+1;

end  

end

                           







assignin('base','Bfinalcloseopenauto',Bfinalcloseopenauto);                                   %saving variable into workspace




d11Boldandnewvaluescloseopenauto=zeros(length(Bppmxfinal),length(AlltransitionpointstocalcB));

for indexxa=1:length(AlltransitionpointstocalcB)
    

    

d11Boldandnewvaluescloseopenauto(1:length(Bppmxfinal),indexxa)=[d11Bbestfitclosedtox(1:searchclosestBorontotransindex(indexxa,1)-1);Bfinalcloseopenauto(~isnan(Bfinalcloseopenauto(:,indexxa)),indexxa)];

  
end




  
  
  
RfactormvcloseopenautoB=zeros(length(AlltransitionpointstocalcB),1);
adjRfactormcloseopenautoB=zeros(length(AlltransitionpointstocalcB),1);
RMSEvalcloseopenautoB=zeros(length(AlltransitionpointstocalcB),1);


for rloop=1:length(AlltransitionpointstocalcB)


interpolatedvaluesy=interp1(Bppmxfinal,d11Boldandnewvaluescloseopenauto(:,rloop),interpolBppmxval);        


valuesytocompare=interpolatedvaluesy(indexforBppmx);


RfactormvcloseopenautoB(rloop,1)=corr(valuesytocompare,excelautoB(:,2))^2;                              
adjRfactormcloseopenautoB(rloop,1)=1-(1-RfactormvcloseopenautoB(rloop,1))*((length(valuesytocompare)-1)/(length(valuesytocompare)-1-1));   
RMSEvalcloseopenautoB(rloop,1)=rms(valuesytocompare-excelautoB(:,2));                                     




end
%
  
[RMSEvalclosetoopenautominB,RMSEvalclosetoopenautoinindexB]=min(RMSEvalcloseopenautoB);                      

RfactormB=RfactormvcloseopenautoB(RMSEvalclosetoopenautoinindexB);
adjRfactormB=adjRfactormcloseopenautoB(RMSEvalclosetoopenautoinindexB);



  
initialvaluestringB=num2str(initialvalueB);                                     
initialvaluestringdisplayB=strcat(DisplaysentenceB, 32,initialvaluestringB,permilledisplayB);  


RfactormtostringB=num2str(RfactormB);
stringRfactormB=strcat(RsuperstringB, 32, RfactormtostringB);                   

                                            
adjRfactormtostringB=num2str(adjRfactormB);                                    
stringadjRfactormB=strcat(adjRsuBstringB, 32, adjRfactormtostringB);


RMSEpurestringtostringB=num2str(RMSEvalclosetoopenautominB);
stringRMSEvalB=strcat(RMSEpurestringB, 32, RMSEpurestringtostringB);


TranspointstrgxautoB=num2str(AlltransitionpointstocalcB(RMSEvalclosetoopenautoinindexB,1));
TranspointstrgyautoB=num2str(d11Bbestfitclosedtox(searchclosestBorontotransindex(RMSEvalclosetoopenautoinindexB,1)));
TranspointstrgpureB='Transition point: ';
Bppmperdisplay=' ppm boron, ';
permilldisanddelt=' ‰ \delta11B ' ;
Transpointstring112B=strcat(TranspointstrgpureB, 32,TranspointstrgxautoB,Bppmperdisplay, 32,TranspointstrgyautoB,permilldisanddelt);




F1556=figure(1556);set(F1556,'name','Best fit closed-, to open-dagassing system','numbertitle','off');
movegui(F1556,'north');

LINE1556=plot(Bppmxfinal,d11Boldandnewvaluescloseopenauto(:,RMSEvalclosetoopenautoinindexB),'DisplayName',initialvaluestringdisplayB);
ylabel('\delta11B in ‰');
xlabel('Boron concentration in ppm');
axis([baxesmin baxesmax Byaxesmin Byaxesmax]);

hold on
excelautopointsB=plot(excelautoB(:,1),excelautoB(:,2),'r.','MarkerSize',10,'DisplayName','Sample data');                  
hold on
TranspointautoB=plot(AlltransitionpointstocalcB(RMSEvalclosetoopenautoinindexB,1),d11Bbestfitclosedtox(searchclosestBorontotransindex(RMSEvalclosetoopenautoinindexB,1)),'kx','MarkerSize',10,'LineWidth',3,'DisplayName',Transpointstring112B);
hold on
R2plotB=plot(NaN,NaN,'DisplayName',stringRfactormB, 'linestyle', 'none'); 
 hold on
adjR2plotB=plot(NaN,NaN,'DisplayName',stringadjRfactormB, 'linestyle', 'none'); 
 hold on
RMSEvalplotB=plot(NaN,NaN,'DisplayName',stringRMSEvalB, 'linestyle', 'none');
 

legend([LINE1556,excelautopointsB,TranspointautoB,R2plotB,adjR2plotB,RMSEvalplotB],'Location','southeast');   
  grid on;

 hold off


                      

                                  
Bfinalclosedtoopentrans123B=num2cell(d11Boldandnewvaluescloseopenauto(:,RMSEvalclosetoopenautoinindexB)); 


BininitialvalueB{1}=strcat(32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,num2str(initialvalueB));                                   
RfactormstringtableB{1}=RfactormB;
adjRfactormstringtableB{1}=adjRfactormB;
RMSEvalstringtableB{1}=RMSEvalclosetoopenautominB;
TransitionpointautoB=Bininitialvalueemtpy;

TransitionpointautoB{1}=strcat(' TP:', 32, TranspointstrgxautoB,' ppm',',',TranspointstrgyautoB,' ‰');          
TransitionpointautoB{searchclosestBorontotransindex(RMSEvalclosetoopenautoinindexB,1)}='   Transition point';


F1557=figure(1557);set(F1557,'name','Best fit closed-, to open-dagassing system', ...
    'numbertitle','off','unit','normalized','Position', [0.2 0.2 0.43 0.5],'visible','off');
                                                                                   
TableclosedtoopenautoB=uitable('Data',[Bppmxcontent1,Bfinalclosedtoopentrans123B,BininitialvalueB,TransitionpointautoB,RfactormstringtableB,adjRfactormstringtableB,RMSEvalstringtableB],'unit','normalized', ...                   
'Position', [0 0 1 1],'ColumnName',{'Boron concentration in ppm',[' ',deltacodeB,'11B in ‰'],[' Selected graph initial', 032,deltacodeB,'11B in ‰'], ...        
['        Transition point        '],['R',char(hex2dec('00B2'))],['adjR',char(hex2dec('00B2'))],['RMSE']});   








DataoftableclosedtoopenautoB=get(TableclosedtoopenautoB,'Data');                                   
ColumnheaderclosedtoopenautoB=get(TableclosedtoopenautoB,'ColumnName');                            



DataofgraphclosedtoopenautoB=[ColumnheaderclosedtoopenautoB';DataoftableclosedtoopenautoB];







 assignin('base','DataofgraphclosedtoopenautoB',DataofgraphclosedtoopenautoB);

 
 assignin('base','F1556',F1556);











%closed,- to batched-system


 waitbar(0.7,waitbarautoB,'Calculating closed-, to batched-system...','Name','Best-fit calculations');


Bfinalclosebatchedauto=nan(length(Bppmxfinal)-searchclosestBorontotransindex(1,1)+1,length(AlltransitionpointstocalcB));
B11initial1closebatchedauto=nan(length(Bppmxfinal)-searchclosestBorontotransindex(1,1),length(AlltransitionpointstocalcB));


for indextransBoron=1:length(AlltransitionpointstocalcB)

    
    
Bchangeforloopbatch=d11Bbestfitclosedtox(searchclosestBorontotransindex(indextransBoron,1));

 B11initial1closebatchedauto(1,indextransBoron)=Boroncontentstocalculatenew(1,indextransBoron);
 
n=1;

for Bppmxxxfinalloop=1:length(Bppmxfinal)-searchclosestBorontotransindex(indextransBoron,1)+1                 %as index can not be zero it has to be counted +1

    
B11initial1closebatchedauto(n+1,indextransBoron)=Boroncontentstocalculatenew(Bppmxxxfinalloop,indextransBoron);

Bfinalclosebatchedauto(n,indextransBoron)=Bchangeforloopbatch-((1-(Boroncontentstocalculatenew(Bppmxxxfinalloop,indextransBoron)/B11initial1closebatchedauto(n,indextransBoron)))*10^3)*log(alphaB);
Bchangeforloopbatch=Bfinalclosebatchedauto(n,indextransBoron);
n=n+1;




end  

end

                    









d11Boldandnewvaluesclosebatchedauto=zeros(length(Bppmxfinal),length(AlltransitionpointstocalcB));

for indexxa=1:length(AlltransitionpointstocalcB)
    

    

d11Boldandnewvaluesclosebatchedauto(1:length(Bppmxfinal),indexxa)=[d11Bbestfitclosedtox(1:searchclosestBorontotransindex(indexxa,1)-1);Bfinalclosebatchedauto(~isnan(Bfinalclosebatchedauto(:,indexxa)),indexxa)];

  
end



  
  
  
  RfactormvclosebatchedautoB=zeros(length(AlltransitionpointstocalcB),1);
adjRfactormclosebatchedautoB=zeros(length(AlltransitionpointstocalcB),1);
RMSEvalclosebatchedautoB=zeros(length(AlltransitionpointstocalcB),1);


for rloop=1:length(AlltransitionpointstocalcB)


interpolatedvaluesy=interp1(Bppmxfinal,d11Boldandnewvaluesclosebatchedauto(:,rloop),interpolBppmxval);        


valuesytocompare=interpolatedvaluesy(indexforBppmx);


RfactormvclosebatchedautoB(rloop,1)=corr(valuesytocompare,excelautoB(:,2))^2;                              
adjRfactormclosebatchedautoB(rloop,1)=1-(1-RfactormvclosebatchedautoB(rloop,1))*((length(valuesytocompare)-1)/(length(valuesytocompare)-1-1));   
RMSEvalclosebatchedautoB(rloop,1)=rms(valuesytocompare-excelautoB(:,2));                                     




end
%
  
[RMSEvalclosetobatchedautominB,RMSEvalclosetobatchedautoinindexB]=min(RMSEvalclosebatchedautoB);                      

RfactormB=RfactormvclosebatchedautoB(RMSEvalclosetobatchedautoinindexB);
adjRfactormB=adjRfactormclosebatchedautoB(RMSEvalclosetobatchedautoinindexB);



  
  
initialvaluestringB=num2str(initialvalueB);                                     
initialvaluestringdisplayB=strcat(DisplaysentenceB, 32,initialvaluestringB,permilledisplayB);  


RfactormtostringB=num2str(RfactormB);
stringRfactormB=strcat(RsuperstringB, 32, RfactormtostringB);                   

                                            
adjRfactormtostringB=num2str(adjRfactormB);                                    
stringadjRfactormB=strcat(adjRsuBstringB, 32, adjRfactormtostringB);


RMSEpurestringtostringB=num2str(RMSEvalclosetobatchedautominB);
stringRMSEvalB=strcat(RMSEpurestringB, 32, RMSEpurestringtostringB);


TranspointstrgxautoB=num2str(AlltransitionpointstocalcB(RMSEvalclosetobatchedautoinindexB,1));
TranspointstrgyautoB=num2str(d11Bbestfitclosedtox(searchclosestBorontotransindex(RMSEvalclosetobatchedautoinindexB,1)));
TranspointstrgpureB='Transition point: ';
Bppmperdisplay=' ppm boron, ';
permilldisanddelt=' ‰ \delta11B ' ;
Transpointstring112B=strcat(TranspointstrgpureB, 32,TranspointstrgxautoB,Bppmperdisplay, 32,TranspointstrgyautoB,permilldisanddelt);




F1656=figure(1656);set(F1656,'name','Best fit closed-, to batched-dagassing system','numbertitle','off');
movegui(F1656,'northeast');

LINE1656=plot(Bppmxfinal,d11Boldandnewvaluesclosebatchedauto(:,RMSEvalclosetobatchedautoinindexB),'DisplayName',initialvaluestringdisplayB);


ylabel('\delta11B in ‰');
xlabel('Boron concentration in ppm');
axis([baxesmin baxesmax Byaxesmin Byaxesmax]);


hold on
excelautopointsB=plot(excelautoB(:,1),excelautoB(:,2),'r.','MarkerSize',10,'DisplayName','Sample data');                  
hold on
TranspointautoB=plot(AlltransitionpointstocalcB(RMSEvalclosetobatchedautoinindexB,1),d11Bbestfitclosedtox(searchclosestBorontotransindex(RMSEvalclosetobatchedautoinindexB,1)),'kx','MarkerSize',10,'LineWidth',3,'DisplayName',Transpointstring112B);
hold on
R2plotB=plot(NaN,NaN,'DisplayName',stringRfactormB, 'linestyle', 'none'); 
 hold on
adjR2plotB=plot(NaN,NaN,'DisplayName',stringadjRfactormB, 'linestyle', 'none'); 
 hold on
RMSEvalplotB=plot(NaN,NaN,'DisplayName',stringRMSEvalB, 'linestyle', 'none');
 

legend([LINE1656,excelautopointsB,TranspointautoB,R2plotB,adjR2plotB,RMSEvalplotB],'Location','southeast');   
  grid on;

 hold off

 

                      

                                  
Bfinalclosedtoopentrans123B=num2cell(d11Boldandnewvaluesclosebatchedauto(:,RMSEvalclosetobatchedautoinindexB)); 


BininitialvalueB{1}=strcat(32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,num2str(initialvalueB));                                   
RfactormstringtableB{1}=RfactormB;
adjRfactormstringtableB{1}=adjRfactormB;
RMSEvalstringtableB{1}=RMSEvalclosetobatchedautominB;
TransitionpointautoB=Bininitialvalueemtpy;

TransitionpointautoB{1}=strcat(' TP:', 32, TranspointstrgxautoB,' ppm',',',TranspointstrgyautoB,' ‰');          
TransitionpointautoB{searchclosestBorontotransindex(RMSEvalclosetobatchedautoinindexB,1)}='   Transition point';


F1658=figure(1658);set(F1658,'name','Best fit closed-, to batched-dagassing system', ...
    'numbertitle','off','unit','normalized','Position', [0.2 0.2 0.43 0.5],'visible','off');
                                                                                   
TableclosedtobatchedautoB=uitable('Data',[Bppmxcontent1,Bfinalclosedtoopentrans123B,BininitialvalueB,TransitionpointautoB,RfactormstringtableB,adjRfactormstringtableB,RMSEvalstringtableB],'unit','normalized', ...                   
'Position', [0 0 1 1],'ColumnName',{'Boron concentration in ppm',[' ',deltacodeB,'11B in ‰'],[' Selected graph initial', 032,deltacodeB,'11B in ‰'], ...        
['        Transition point        '],['R',char(hex2dec('00B2'))],['adjR',char(hex2dec('00B2'))],['RMSE']});   








DataoftableclosedtobatchedautoB=get(TableclosedtobatchedautoB,'Data');                                   
ColumnheaderclosedtobatchedautoB=get(TableclosedtobatchedautoB,'ColumnName');                            



DataofgraphclosedtobatchedautoB=[ColumnheaderclosedtobatchedautoB';DataoftableclosedtobatchedautoB];




 assignin('base','DataofgraphclosedtobatchedautoB',DataofgraphclosedtobatchedautoB);


 assignin('base','F1656',F1656);



%closed,- to batched-system (variable step size)

 waitbar(0.84,waitbarautoB,'Calculating closed-, to batched-system (variable step size)...','Name','Best-fit calculations');




PercentwaterlossvarclosetobatchB=[5 10 15 20 25 30 35 40 45 50 55 60 65 70 75 80 85 90 95];


Percentwaterlossvarfin2closetobatchB=[0.95 0.9 0.85 0.8 0.75 0.7 0.65 0.6 0.55 0.5 0.45 0.4 0.35 0.3 0.25 0.2 0.15 0.1 0.05];



Bppmxfinalclosetobatchautovar=zeros(500,19,length(AlltransitionpointstocalcB));   



for forindex=1:length(AlltransitionpointstocalcB)

                              
for iiii=1:19

   mm=1;                                                                 
Bppmxfinalclosetobatchautovar(1,iiii,forindex)=AlltransitionpointstocalcB(forindex);                                                    
Bppmxfinalbatchautobatchautostepbefore=AlltransitionpointstocalcB(forindex);
                                                                     
while Bppmxfinalclosetobatchautovar(mm,iiii,forindex) > Bppmxfrom                                                    
    

    Bppmxfinalclosetobatchautovar(mm+1,iiii,forindex)=Bppmxfinalbatchautobatchautostepbefore*Percentwaterlossvarfin2closetobatchB(iiii);
     
    mm=mm+1 ;                                                                
      Bppmxfinalbatchautobatchautostepbefore=Bppmxfinalclosetobatchautovar(mm,iiii,forindex);
    
end



end

end

Bppmxfinalclosetobatchautovar(Bppmxfinalclosetobatchautovar == 0)=NaN;        %all remaining 0 from the zeros command are replaced by NaN, so that these values are not calculated

Bppmxfinalclosebatchvartoforindexnonnans=Bppmxfinalclosetobatchautovar(:,1,1);

Bppmxfinalclosetobatchautovar=Bppmxfinalclosetobatchautovar(1:length(Bppmxfinalclosebatchvartoforindexnonnans(~isnan(Bppmxfinalclosebatchvartoforindexnonnans))),:,:);      %






sizeBoronfclosetobatchedvar=size(Bppmxfinalclosetobatchautovar);


%%%

    








Bfinalclosetobatchedvariablestepnew=nan(sizeBoronfclosetobatchedvar);




for indexBorontranspoint=1:length(AlltransitionpointstocalcB)                %values transition points
    
for batchindBoronlosstrans=1:19                                             %values percentage boron loss
    
Binitialloopclosebatchvar=d11Bbestfitclosedtox(searchclosestBorontotransindex(indexBorontranspoint,1));

   Bppmxinitial1223=Bppmxfinalclosetobatchautovar(1,batchindBoronlosstrans,indexBorontranspoint);
   
   
for Bppmxfinalloopbatch=1:length(Bppmxfinalclosetobatchautovar(:,batchindBoronlosstrans,indexBorontranspoint))      %ppm boron to calc

    

Bfinalclosetobatchedvariablestepnew(Bppmxfinalloopbatch,batchindBoronlosstrans,indexBorontranspoint)=Binitialloopclosebatchvar-((1-(Bppmxfinalclosetobatchautovar(Bppmxfinalloopbatch,batchindBoronlosstrans,indexBorontranspoint)/Bppmxinitial1223))*10^3)*log(alphaB);
Binitialloopclosebatchvar=Bfinalclosetobatchedvariablestepnew(Bppmxfinalloopbatch,batchindBoronlosstrans,indexBorontranspoint);
Bppmxinitial1223=Bppmxfinalclosetobatchautovar(Bppmxfinalloopbatch,batchindBoronlosstrans,indexBorontranspoint);

end  



end  

end



assignin('base','Bfinalclosetobatchedvariablestepnew',Bfinalclosetobatchedvariablestepnew);   %%%%


Bfinalclosetobatchedvariablestepnew1=Bfinalclosetobatchedvariablestepnew;
d11Bbestfitclosedtox1=d11Bbestfitclosedtox;

Bfinalclosetobatchedvariablestepnew1(Bfinalclosetobatchedvariablestepnew1==0)=9887775.55124;       %replacing 0 temporary so the artificial 0 values can be cut out later
d11Bbestfitclosedtox1(d11Bbestfitclosedtox==0)=9887775.55124;

Bppmxfinalclosetobatchallvaluesautovar=nan(length(Bppmxfinal),19,length(AlltransitionpointstocalcB));
d11Boldandnewvaluesclosebatchedautovar=nan(length(Bppmxfinal),19,length(AlltransitionpointstocalcB));

for indextranspointB=1:length(AlltransitionpointstocalcB)
    
for percentageindexiB=1:19
    

d11Boldandnewvaluesclosebatchedautovar(1:searchclosestBorontotransindex(indextranspointB,1)-1+length(find(~isnan(Bfinalclosetobatchedvariablestepnew1(:,percentageindexiB,indextranspointB)))),percentageindexiB,indextranspointB)=[d11Bbestfitclosedtox1(1:searchclosestBorontotransindex(indextranspointB,1)-1);Bfinalclosetobatchedvariablestepnew1(~isnan(Bfinalclosetobatchedvariablestepnew1(:,percentageindexiB,indextranspointB)),percentageindexiB,indextranspointB)];
Bppmxfinalclosetobatchallvaluesautovar(1:searchclosestBorontotransindex(indextranspointB,1)-1+length(find(~isnan(Bppmxfinalclosetobatchautovar(:,percentageindexiB,indextranspointB)))),percentageindexiB,indextranspointB)=[Bppmxfinal(1:searchclosestBorontotransindex(indextranspointB,1)-1)';Bppmxfinalclosetobatchautovar(~isnan(Bppmxfinalclosetobatchautovar(:,percentageindexiB,indextranspointB)),percentageindexiB,indextranspointB)];
  
end
end




d11Boldandnewvaluesclosebatchedautovar(d11Boldandnewvaluesclosebatchedautovar==0)=NaN;
Bppmxfinalclosetobatchallvaluesautovar(Bppmxfinalclosetobatchallvaluesautovar==0)=NaN;




d11Boldandnewvaluesclosebatchedautovar(d11Boldandnewvaluesclosebatchedautovar==9887775.55124)=0;





d11Boldandnewvaluesclosebatchedautovarshorten(1:length(find(~isnan(d11Boldandnewvaluesclosebatchedautovar(:,1,length(AlltransitionpointstocalcB))))),:,:)=d11Boldandnewvaluesclosebatchedautovar(1:length(find(~isnan(d11Boldandnewvaluesclosebatchedautovar(:,1,length(AlltransitionpointstocalcB))))),:,:);
Bppmxfinalclosetobatchallvaluesautovarshorten(1:length(find(~isnan(Bppmxfinalclosetobatchallvaluesautovar(:,1,length(AlltransitionpointstocalcB))))),:,:)=Bppmxfinalclosetobatchallvaluesautovar(1:length(find(~isnan(Bppmxfinalclosetobatchallvaluesautovar(:,1,length(AlltransitionpointstocalcB))))),:,:);





  

  
  
  
 
 
  RfactormvclosebatchedvarautoB=zeros(19,length(AlltransitionpointstocalcB));
adjRfactormclosebatchevardautoB=zeros(19,length(AlltransitionpointstocalcB));
RMSEvalclosebatchedvarautoB=zeros(19,length(AlltransitionpointstocalcB));



for rloop=1:length(AlltransitionpointstocalcB)
    
for percentBoron=1:19

  
interpolatedvaluesy=interp1(Bppmxfinalclosetobatchallvaluesautovarshorten(1:length(find(~isnan(Bppmxfinalclosetobatchallvaluesautovarshorten(:,percentBoron,rloop)))),percentBoron,rloop),d11Boldandnewvaluesclosebatchedautovarshorten(1:length(find(~isnan(d11Boldandnewvaluesclosebatchedautovarshorten(:,percentBoron,rloop)))),percentBoron,rloop),interpolBppmxval);       



valuesytocompare=interpolatedvaluesy(indexforBppmx);


RfactormvclosebatchedvarautoB(percentBoron,rloop)=corr(valuesytocompare,excelautoB(:,2))^2;                              
adjRfactormclosebatchevardautoB(percentBoron,rloop)=1-(1-RfactormvclosebatchedvarautoB(percentBoron,rloop))*((length(valuesytocompare)-1)/(length(valuesytocompare)-1-1));   
RMSEvalclosebatchedvarautoB(percentBoron,rloop)=rms(valuesytocompare-excelautoB(:,2));                                     



end
end




 

 


[RMSEvalclosetobatchedvariableautomin1B,RMSEvalclosetobatchedvariableautoinindex1B]=min(min(RMSEvalclosebatchedvarautoB,[],1));              %column!!!!!!!!!transition point
[RMSEvalclosetobatchedvariableautomin2B,RMSEvalclosetobatchedvariableautoinindex2B]=min(min(RMSEvalclosebatchedvarautoB,[],2));              %line  !!!!percentage

RfactormB=RfactormvclosebatchedvarautoB(RMSEvalclosetobatchedvariableautoinindex2B,RMSEvalclosetobatchedvariableautoinindex1B);
adjRfactormB=adjRfactormclosebatchevardautoB(RMSEvalclosetobatchedvariableautoinindex2B,RMSEvalclosetobatchedvariableautoinindex1B);
                                                                                                                                                


 waitbar(0.9,waitbarautoB,'Finishing...','Name','Best-fit calculations');




                                 
initialvaluestringdisplayB=strcat(DisplaysentenceB, 32,initialvaluestringB,permilledisplayB);  


RfactormtostringB=num2str(RfactormB);
stringRfactormB=strcat(RsuperstringB, 32, RfactormtostringB);                   

                                            
adjRfactormtostringB=num2str(adjRfactormB);                                    
stringadjRfactormB=strcat(adjRsuBstringB, 32, adjRfactormtostringB);


RMSEpurestringtostringB=num2str(RMSEvalclosebatchedvarautoB(RMSEvalclosetobatchedvariableautoinindex2B,RMSEvalclosetobatchedvariableautoinindex1B));
stringRMSEvalB=strcat(RMSEpurestringB, 32, RMSEpurestringtostringB);

stringPercentageplotpurestringB='Percentage of boron loss at each step =';
stringPercentageplotnum2stringB=num2str(Percentwaterlossvar(RMSEvalclosetobatchedvariableautoinindex2B));
stringPercentageplotsrtringB=strcat(stringPercentageplotpurestringB, 32, stringPercentageplotnum2stringB );


TranspointstrgxautoB=num2str(AlltransitionpointstocalcB(RMSEvalclosetobatchedvariableautoinindex1B,1));
TranspointstrgyautoB=num2str(d11Bbestfitclosedtox(searchclosestBorontotransindex(RMSEvalclosetobatchedvariableautoinindex1B,1)));

Transpointstring1121B=strcat(TranspointstrgpureB, 32,TranspointstrgxautoB,Bppmperdisplay, 32,TranspointstrgyautoB,permilldisanddelt);




F1256=figure(1256);set(F1256,'name','Best fit closed-, to batched-degassing system (variable step sizes)','numbertitle','off');
movegui(F1256,'center');

LINE11265=plot(Bppmxfinalclosetobatchallvaluesautovarshorten(:,RMSEvalclosetobatchedvariableautoinindex2B,RMSEvalclosetobatchedvariableautoinindex1B),d11Boldandnewvaluesclosebatchedautovarshorten(:,RMSEvalclosetobatchedvariableautoinindex2B,RMSEvalclosetobatchedvariableautoinindex1B),'DisplayName',initialvaluestringdisplayB);
ylabel('\delta11B in ‰');
xlabel('Boron concentration in ppm');
axis([baxesmin baxesmax Byaxesmin Byaxesmax]);

hold on
excelautopointsB=plot(excelautoB(:,1),excelautoB(:,2),'r.','MarkerSize',10,'DisplayName','Sample data');                  

hold on
R2plotB=plot(NaN,NaN,'DisplayName',stringRfactormB, 'linestyle', 'none'); 
 hold on
adjR2plotB=plot(NaN,NaN,'DisplayName',stringadjRfactormB, 'linestyle', 'none'); 
 hold on
RMSEvalplotB=plot(NaN,NaN,'DisplayName',stringRMSEvalB, 'linestyle', 'none');
  hold on
Percentageplotings=plot(NaN,NaN,'DisplayName',stringPercentageplotsrtringB, 'linestyle', 'none');
hold on
TranspointautobatchB=plot(AlltransitionpointstocalcB(RMSEvalclosetobatchedvariableautoinindex1B,1),d11Bbestfitclosedtox(searchclosestBorontotransindex(RMSEvalclosetobatchedvariableautoinindex1B,1)),'kx','MarkerSize',10,'LineWidth',3,'DisplayName',Transpointstring1121B);

legend([LINE11265,excelautopointsB,TranspointautobatchB,Percentageplotings,R2plotB,adjR2plotB,RMSEvalplotB],'Location','southeast');   
  grid on;

 hold off

 
 
     
    

                      
 
Boroncontentclosebatchvari=Bppmxfinalclosetobatchallvaluesautovarshorten(1:length(find(~isnan(Bppmxfinalclosetobatchallvaluesautovarshorten(:,RMSEvalclosetobatchedvariableautoinindex2B,RMSEvalclosetobatchedvariableautoinindex1B)))),RMSEvalclosetobatchedvariableautoinindex2B,RMSEvalclosetobatchedvariableautoinindex1B);                                                 %changing watervalue data layout to use it for table (one row into one columns "'")
Bfinalclosebatchvariabletrans1=num2cell(d11Boldandnewvaluesclosebatchedautovarshorten(1:length(find(~isnan(d11Boldandnewvaluesclosebatchedautovarshorten(:,RMSEvalclosetobatchedvariableautoinindex2B,RMSEvalclosetobatchedvariableautoinindex1B)))),RMSEvalclosetobatchedvariableautoinindex2B,RMSEvalclosetobatchedvariableautoinindex1B));



Boroncontent1233=num2cell(Boroncontentclosebatchvari);
                                  
Bininitialvalueclosebatchedvar=cell(1,length(Boroncontentclosebatchvari));                              %preallocation with cells. Creates empty cell with desired rows and columns

for TablepreploopbavaB=1:length(Boroncontentclosebatchvari)                                   %simplistic loop which wrties empty cells of type "char" for character cell, instead of cells of type "double", by writing string ''
    Bininitialvalueclosebatchedvar{TablepreploopbavaB}=num2str('');
end

Bininitialvalueemtpyclosebatchedvar=Bininitialvalueclosebatchedvar';                                      %transposing cell
RfactormstringtableclosebatchvarB=Bininitialvalueemtpyclosebatchedvar;
adjRfactormstringtableclosebatchvarB=Bininitialvalueemtpyclosebatchedvar;
RMSEvalstringtableclosebatchvarB=Bininitialvalueemtpyclosebatchedvar;
PercentBoronlossatstepclosebatchedvar=Bininitialvalueemtpyclosebatchedvar;


TranspointstrgxautoB=num2str(AlltransitionpointstocalcB(RMSEvalclosetobatchedvariableautoinindex1B,1));
TranspointstrgyautoB=num2str(d11Bbestfitclosedtox(searchclosestBorontotransindex(RMSEvalclosetobatchedvariableautoinindex1B,1)));




TransitionpointautoB=Bininitialvalueemtpyclosebatchedvar;

TransitionpointautoB{1}=strcat(' TP:', 32, TranspointstrgxautoB,' ppm',',',TranspointstrgyautoB,' ‰');          
TransitionpointautoB{searchclosestBorontotransindex(RMSEvalclosetobatchedvariableautoinindex1B,1)}='   Transition point';


Bininitialvalueclosebatchedvar=Bininitialvalueclosebatchedvar';

PerceentwaterlossvarnumstrB=num2str(Percentwaterlossvar(RMSEvalclosetobatchedvariableautoinindex2B));


Bininitialvalueclosebatchedvar{1}=strcat(32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,num2str(initialvalueB));                                   
RfactormstringtableclosebatchvarB{1}=RfactormB;
adjRfactormstringtableclosebatchvarB{1}=adjRfactormB;
RMSEvalstringtableclosebatchvarB{1}=RMSEvalclosebatchedvarautoB(RMSEvalclosetobatchedvariableautoinindex2B,RMSEvalclosetobatchedvariableautoinindex1B);
PercentBoronlossatstepclosebatchedvar{1}=strcat(32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,PerceentwaterlossvarnumstrB);












F1578=figure(1578);set(F1578,'name','Best fit closed-, to batched-degassing system (variable step sizes)', ...
    'numbertitle','off','unit','normalized','Position', [0.2 0.2 0.505 0.5],'visible','off');
                                                                                   
TableclosebatchedvariB=uitable('Data',[Boroncontent1233,Bfinalclosebatchvariabletrans1,Bininitialvalueclosebatchedvar,PercentBoronlossatstepclosebatchedvar,TransitionpointautoB,RfactormstringtableclosebatchvarB,adjRfactormstringtableclosebatchvarB,RMSEvalstringtableclosebatchvarB],'unit','normalized', ...                   
'Position', [0 0 1 1],'ColumnName',{'Boron concentration in ppm',[' ',deltacodeB,'11B in ‰'],[' Selected graph initial', 032,deltacodeB,'11B in ‰'], ...        
'% Boron loss at each step',['        Transition point        '],['R',char(hex2dec('00B2'))],['adjR',char(hex2dec('00B2'))],['RMSE']});   



DataoftableclosebatchedvariableB=get(TableclosebatchedvariB,'Data');                                   
ColumnheaderclosebatchedvariableB=get(TableclosebatchedvariB,'ColumnName');                            



DataofgraphclosebatchedautovariableB=[ColumnheaderclosebatchedvariableB';DataoftableclosebatchedvariableB];

assignin('base','DataofgraphclosebatchedautovariableB',DataofgraphclosebatchedautovariableB);

 
 assignin('base','F1256',F1256);
                                           
 
 
 toc
 
                       
 waitbar(1,waitbarautoB,'Finished','Name','Best-fit calculations');
 
 pause(3)
 
 if ishandle(waitbarautoB)                                                   %ishandle checks the existence of a figure. 
close(waitbarautoB)
 end









else
 errordlg('The transition point is required to be lower than the highest measured boron concentration','Error');   
    
    
end




else 
    
errordlg('Set all variables','Error');

end






function Bmsotlikelytranspoint_Callback(hObject, eventdata, handles)
% hObject    handle to Bmsotlikelytranspoint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Bmsotlikelytranspointvalue=str2double(get(hObject,'String')) ;


 assignin('base','Bmsotlikelytranspointvalue',Bmsotlikelytranspointvalue);
% Hints: get(hObject,'String') returns contents of Bmsotlikelytranspoint as text
%        str2double(get(hObject,'String')) returns contents of Bmsotlikelytranspoint as a double


% --- Executes during object creation, after setting all properties.
function Bmsotlikelytranspoint_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Bmsotlikelytranspoint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
