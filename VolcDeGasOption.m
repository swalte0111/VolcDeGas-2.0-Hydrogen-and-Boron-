function varargout = VolcDeGasOption(varargin)
% VOLCDEGASOPTION MATLAB code for VolcDeGasOption.fig
%      VOLCDEGASOPTION, by itself, creates a new VOLCDEGASOPTION or raises the existing
%      singleton*.
%
%      H = VOLCDEGASOPTION returns the handle to a new VOLCDEGASOPTION or the handle to
%      the existing singleton*.
%       637265617465642062793a2053656261737469616e204361726c2057616c7465722c204d61696e7a 
%      VOLCDEGASOPTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VOLCDEGASOPTION.M with the given input arguments.
% 
%      VOLCDEGASOPTION('Property','Value',...) creates a new VOLCDEGASOPTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before VolcDeGasOption_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to VolcDeGasOption_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help VolcDeGasOption

% Last Modified by GUIDE v2.5 05-Oct-2022 17:23:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @VolcDeGasOption_OpeningFcn, ...
                   'gui_OutputFcn',  @VolcDeGasOption_OutputFcn, ...
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


% --- Executes just before VolcDeGasOption is made visible.
function VolcDeGasOption_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to VolcDeGasOption (see VARARGIN)

% Choose default command line output for VolcDeGasOption
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

GUIdataofexcel=handles;
assignin('base','GUIdataofexcel',GUIdataofexcel);
% UIWAIT makes VolcDeGasOption wait for user response (see UIRESUME)
% uiwait(handles.ExcelandsoonGUI);


% --- Outputs from this function are returned to the command line.
function varargout = VolcDeGasOption_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


%start of GUI (buttons, fields )   


% --- Executes on button press in input.
function input_Callback(hObject, eventdata, handles)                        
[filename, pathname] = ...                                                  %saving filename and pathname together of
     uigetfile({'*.*'},'File Selector');                                    %selected file of all formats ({'*.*'})which are selected from the opened window named File selector( file selection dialog box) /(uigetfile({'*.*'},'File Selector')
fullpath=strcat(pathname,filename);                                         %saving filename and selected path as actual usable variable
assignin('base','fullpath',fullpath);                                       %saving variable to workspace
if filename==0

  return
end

% hObject    handle to input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%


% --- Executes on button press in plot.
function plot_Callback(hObject, eventdata, handles)


existfullpath=evalin( 'base', 'exist(''fullpath'',''var'') == 1' );          %check existence of a vatiable, output is a logical 1 or 0 representing true and false

if existfullpath                                                            % if fullpath exists, the following code is invoked
    
existDOT111=evalin( 'base', 'exist(''DOT111'',''var'') == 1' );     %check existence of a vatiable, output is a logical 1 or 0 representing true and false
existpolydegree=evalin( 'base', 'exist(''polydegree'',''var'') == 1' );     %check existence of a vatiable, output is a logical 1 or 0 representing true and false



if existpolydegree                                                          % if polydegree exists polydegree is loaded to function
     polydegree=evalin('base','polydegree');                                %loading variable form workspace into function (evalin) 
else                                                                        %if polydegree does not exist set it as 2
    polydegree=2;
end                                                                         %end if loop

fullpath=evalin('base','fullpath');
testy=xlsread(fullpath);                                                    %reading excel data from user selected file                                                        
polyfitdata=polyfit(testy(:,1),testy(:,2),polydegree);                      %calculation and saving of the polifit factor (polynomial function coefficients ) polynomial curve fitting with selected polynomial degree
mintest=min(testy(:,1));                                                    %finding and saving minimum value of the excel sheet as variable
maxtest=max(testy(:,1));                                                    %finding and saving maximum value of the excel sheet as variable
polyfitdatafiner=linspace(mintest,maxtest);                                 %creating a lot of evenly spaced points between min and max to make a finer x axis and to interpolate these polyfitted data
f = polyval(polyfitdata,polyfitdatafiner);                                  %evaluation and calculation of calculated polynomial factor of polyfit based on each data point (x axis) 
figure(1);                                                                  %calling figure 1 which shows the before calculated graphs of openandclose script   

hold on                                                                     %code to plot more than one plot in same figure without overwriting the existing plot
testpoints=plot(testy(:,1),testy(:,2),'r.','MarkerSize',10,'DisplayName','Sample data');                 %plotting all original data points as dots with a marker size of 10 and display name Sample data for the legend
hold on 
Testplot=plot(polyfitdatafiner,f,'k','DisplayName','Polyfittedplot');                                      %plot calculated polynomial function based on the x axes values    
 
hold off
if existDOT111
 Transpointstring=evalin('base','Transpointstring');   
closestvaluex=evalin('base','closestvaluex');
closestvaluey=evalin('base','closestvaluey');

hold on
DOT111=plot(closestvaluex,closestvaluey, 'kx','MarkerSize',10,'LineWidth',3,'DisplayName',Transpointstring);
        legend([testpoints,Testplot,DOT111],'Location','southeast')         %set legend as the before saved plots [testpoints,Testplot,DOT111]    
hold off
else
legend([testpoints,Testplot],'Location','southeast')
end
  

assignin('base','polyfitdatafiner',polyfitdatafiner);                       %saving variables to workspace
assignin('base','testy',testy);
assignin('base','Testplot',Testplot);
assignin('base','testpoints',testpoints);
assignin('base','f',f);

else                                                                        % if fulltpath does not exist the following code is applied
    errordlg(strcat('Input a prepared excel with sample data first by pressing Input Excel'),'Error');    %Opens an error dialog box
    
end


% hObject    handle to plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in delete.
function delete_Callback(hObject, eventdata, handles) 


Testplot=evalin('base','Testplot');
testpoints=evalin('base','testpoints');
delete(testpoints(1))                                                       %deletion and clearing of plots (point and lines of user data)
clear testpoints
delete(Testplot(1))
clear Testplot



% hObject    handle to delete (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%__________________________________________________________________________________________
% exemplary for all those fiel calls
function polydegree_Callback(hObject, eventdata, handles)                   %field call (where the user inputs variables on th GUI)                 
polydegree=str2double(get(hObject,'String'));                               %get(hObject),'String') grabs the still string value the user put in the field, str2double translates the string value into a real number value for the program to use. 
assignin('base','polydegree',polydegree);                                   %saving variable into workspace

% hObject    handle to polydegree (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of polydegree as text
%        str2double(get(hObject,'String')) returns contents of polydegree as a double

%_______________________________________________________________________________________________________________________________________

% end of example




% --- Executes during object creation, after setting all properties.
function polydegree_CreateFcn(hObject, eventdata, handles)
% hObject    handle to polydegree (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




%________________________________________________________________________________________________________________________________
%________________________________________________________________________
%description of open-degassing system with transition points starts here,see also Degassingcalculation script description, only new code will be explained here exemplary, other buttons (batched),are described the same way as in this example if not stated otherwise



% --- Executes on button press in transitioncloseopen.
function transitioncloseopen_Callback(hObject, eventdata, handles)
% hObject    handle to transitioncloseopen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
waterfinal=evalin('base','waterfinal');
Dinitial=evalin('base','Dinitial');
waterini=evalin('base','waterini');
Dfinal=evalin('base','Dfinal');
minxax=evalin('base','minxax');
maxxax=evalin('base','maxxax');
minyax=evalin('base','minyax');
maxyax=evalin('base','maxyax');
alpha=evalin('base','alpha');
water2=evalin('base','water2'); 
testyexist=evalin( 'base', 'exist(''testy'',''var'') == 1' );               
 



figure(1); 
[x,y] = ginput(1);                                                          %select a point with the mouse on figure 1 and saving the x axis and y axis value of the selected point
searchvaluex=x;                                                             %resaving to another variable name
searchvaluey=y;
                





[~,closestvaluenumberx] = min(abs(waterfinal-searchvaluex));                %find minimum difference between searched value and data values ('~' for saving it as the location/place of the data), watercontent always descends, no double value are found
closestvaluex = waterfinal(closestvaluenumberx) ;                           %actual value of the closest point on x axes (watercontent) 

DfinalsearchX=Dfinal(closestvaluenumberx,:)  ;                              %for searching, only selecting the different dD values with the  x values (watercontent) chosen by the user (one row of Dfinal)

[~,closestvaluenumbery] = min(abs(DfinalsearchX-searchvaluey));             %see above, now searching the y value representing the different initial dD values in Dfinal. Only saerching in the before defined one row in Dfinal => no double values problem
closestvaluey = DfinalsearchX(closestvaluenumbery);                         %actual value of the selected point
initialvalue=Dinitial(closestvaluenumbery);                                 %the different colums of Dfinal/Dinalsearch are calculated using different Diniitial values,they are the same columns as Dinitial columns, searched y value (column) is at the same time also the same columns with its Dinitial value                                                                                                                        

initialvaluestringclosedopen=num2str(initialvalue);                         %creating string from a value with num2str
Displaysentence=('Calculated graph with initial \deltaD value of');
permilledisplay=(' ‰');
initialvaluestringclosedopendisplay=strcat(Displaysentence, 32,initialvaluestringclosedopen,permilledisplay); %connecting strings with strcat 

Transpointstrgx=num2str(closestvaluex);
Transpointstrgy=num2str(closestvaluey);
Transpointstrgpure='Transition point: ';
wtperdisplay=' wt% water, ';
permilldisanddelt=' ‰ \deltaD ' ;
Transpointstring=strcat(Transpointstrgpure, 32,Transpointstrgx,wtperdisplay, 32,Transpointstrgy,permilldisanddelt);

assignin('base','Transpointstring',Transpointstring);                                               %saving variable into workspace
assignin('base','closestvaluex',closestvaluex);    
assignin('base','closestvaluey',closestvaluey);    



figure(1);
hold on 
TPOINTFIG1=plot(closestvaluex,closestvaluey, 'kx','MarkerSize',10,'LineWidth',3,'DisplayName',Transpointstring); %plotting user selected transition point into the open graph as a red x with the size 10 and the Plot name Transition Point
if ~testyexist                                                              %if testy does not exist, the legend will be set as the Transpointstring
legend([TPOINTFIG1],'Location','southeast');                                                        
end

hold off                                                                    %stopping hold on



F100=figure(100);set(F100,'name','Selected transition point and degassing graph 2D-plot','numbertitle','off'); %calling figure and setting figure name
DOT100=plot(closestvaluex,closestvaluey, 'kx','MarkerSize',10,'LineWidth',3,'DisplayName',Transpointstring);                             %plotting with red cross
ylabel('\deltaD in ‰');                                                 %setting y label
xlabel('Bulk water content in wt%');                                                  %setting x label
hold on                                                                     %plotting in one plot without overwritign exsisting one 
LINE100=plot(waterfinal,Dfinal(:,closestvaluenumbery),'DisplayName',initialvaluestringclosedopendisplay);                                       
axis([minxax maxxax minyax maxyax]);                                        %setting x and y axis defined by user
hold off
legend([LINE100,DOT100],'Location','southeast');                            %writing  initial value of closest selected graph and Transitionpoint into the legend
grid on;                                                                    %making grid

assignin('base','F100',F100);                                               %saving variable into workspace
assignin('base','LINE100',LINE100);        
assignin('base','DOT100',DOT100);        

newtocalcwater=waterfinal(closestvaluenumberx:length(waterfinal));          %saving values of watercontent which are required to be new calculated(from transition point on) into a new variable




Dinitialer=Dfinal(closestvaluenumberx,closestvaluenumbery);                 %last points y value (dD) (transition point)set/saved as new initial value

%%%
waterinitial=waterfinal(closestvaluenumberx);                               %last point x value (watercontent) as new initial value
Dfinalopen=zeros(length(newtocalcwater),1);

waterinitial1=zeros(1,length(newtocalcwater)+1);                            %prealocation for loop



  waterinitial1(1)=waterinitial;                                            %for explanation see script openandclose. Only changes will be explained here / here only one dimensional values need to be saved
nn=1;
for waterfinalloop=newtocalcwater

waterinitial1(nn+1)=waterfinalloop;  
Dfinalopen(nn)=(Dinitialer+1000)*((waterfinalloop/waterinitial1(nn))^(alpha(nn+closestvaluenumberx-1,1)-1))-1000;  %only need alhpa value at point closestvaluenumberx to end, as no index starts with 1 (nn) -1 is used insided the alhpa bracket 
Dinitialer=Dfinalopen(nn);
nn=nn+1;

end 


assignin('base','Dfinalopen',Dfinalopen); 
Dfinalold=Dfinal(:,closestvaluenumbery);
Dfinalclosetoopentrans=[Dfinalold(1:closestvaluenumberx-1 );Dfinalopen  ];       %connecting old and new dD values togehter in a new variable (-1 to not having double values)
assignin('base','Dfinalclosetoopentrans',Dfinalclosetoopentrans);



if testyexist                                                               % if loop. testyexist is the logical variable for testy, which consists of the user data and which was checked for existence before (1 is true , 0 is false),only if the sample data of the user exists, it will/can be calculated
    
    testy=evalin('base','testy');
    testyxrounded=round(testy(:,1)*1000)/1000;                                       % rounding testy to round to 3 digits to the right of the decimal point
    
interpolwaterval=(min(testyxrounded):0.0001:max(testyxrounded))';           %setting the required x values for interpolation
interpolatedvaluesy=interp1(waterfinal,Dfinalclosetoopentrans,interpolwaterval);        %interpolation of y values in relation to x values





indexforwater=zeros(1,length(testyxrounded));

for ismemberreplace=1:length(testyxrounded)
[~, indexforwater(ismemberreplace)]=min(abs(interpolwaterval-testyxrounded(ismemberreplace)));   %%find minimum difference between searched value and data values ('~' for saving it as the location/place of the data), watercontent always descends, no double value are found
end


valuesytocompare=interpolatedvaluesy(indexforwater);


Rfactorm=corr(valuesytocompare,testy(:,2))^2;                              %calculating Pearson correlation coefficient and ^2 for the coefficient of deteremination from user data y values (testy(:,2)) and the by the program calculated and interpolated y values (valuesytocompare)
adjRfactorm=1-(1-Rfactorm)*((length(valuesytocompare)-1)/(length(valuesytocompare)-1-1));   %calculating the adjusted coefficient of determination
RMSEval=rms(valuesytocompare-testy(:,2));                                     %calculatrion of Root Mean Square Error


if isnan(Rfactorm)
    rightinterpreter= struct('WindowStyle','modal',...                      %setting the an interpreter (tex) for the following errordlg
              'Interpreter','tex');
    errordlg('For R^{2} the calculated values are required to portray all sample data. Example: With a step size of 0.1 set lowest bulk water content as 0.001 and initial bulk water content as 4.001 instead of 4 ','Error'...
        ,rightinterpreter);                                                 %interpreter to be used. Here ît is required for the line "R^{2}" to be displayed correctly
end

assignin('base','adjRfactorm',adjRfactorm);

assignin('base','RMSEval',RMSEval);
assignin('base','Rfactorm',Rfactorm);


Rsuperstring=('R^{2}   =');                                                 %creating string whereas ^{} is the tex code for superscript
Rfactormtostring=num2str(Rfactorm);

stringRfactorm=strcat(Rsuperstring, 32, Rfactormtostring);                  %concatenate strings whereas  32 is the ASCII code for a blank space


adjRsuBstring=('R^{2}_{adj} =');                                            %creating string whereas ^{} is the tex code for superscript and _{} for subscript
adjRfactormtostring=num2str(adjRfactorm);                                   %converting number to character arrary
stringadjRfactorm=strcat(adjRsuBstring, 32, adjRfactormtostring);

RMSEpurestring=('RMSE =');  
RMSEpurestringtostring=num2str(RMSEval);
stringRMSEval=strcat(RMSEpurestring, 32, RMSEpurestringtostring);


end



F111=figure(111);set(F111,'name','Selected closed-, to open-system degassing 2D-plot','numbertitle','off');
DOT111=plot(closestvaluex,closestvaluey,'kx','MarkerSize',10,'LineWidth',3,'DisplayName',Transpointstring');
ylabel('\deltaD in ‰');
xlabel('Bulk water content in wt%');
hold on
LINE111=plot(waterfinal,Dfinalclosetoopentrans,'DisplayName',initialvaluestringclosedopendisplay);
axis([minxax maxxax minyax maxyax]);

if testyexist                                                              % only if the sample data of the user exists, it will/can be plotted
    R2plot=plot(NaN,NaN,'DisplayName',stringRfactorm, 'linestyle', 'none');% the legend requires a plot it relates too, here an empty plot is created (NaN) only containing the stringRfactorm string
    hold on
  adjR2plot=plot(NaN,NaN,'DisplayName',stringadjRfactorm, 'linestyle', 'none'); % same as above
  hold on
 RMSEvalplot=plot(NaN,NaN,'DisplayName',stringRMSEval, 'linestyle', 'none');
  
  
legend([LINE111,DOT111,R2plot,adjR2plot,RMSEvalplot],'Location','southeast');       

assignin('base','R2plot',R2plot);
assignin('base','adjR2plot',adjR2plot);
assignin('base','RMSEvalplot',RMSEvalplot);
  
else                                                                        %if no user data exists, the legend will be set without the user data and its follow up calculations (R,adjR)
legend([LINE111,DOT111],'Location','southeast');        
end

assignin('base','F111',F111);
grid on;
assignin('base','LINE111',LINE111);
assignin('base','DOT111',DOT111);
 hold off

 
watercontent=waterfinal';                                                   %changing watervalue data layout to use it for table (one row into one columns "'")
Dfinalclosetoopentrans1=num2cell(Dfinalclosetoopentrans);                   %converting array to cell array

watercontent1=num2cell(watercontent);

Dininitialvalue=cell(1,length(watercontent));                              %preallocation with cells. Creates empty cell with desired rows and columns

for Tablepreploop=1:length(watercontent)                                   %simplistic loop which wrties empty cells of type "char" for character cell, instead of cells of type "double", by writing string ''
    Dininitialvalue{Tablepreploop}=num2str('');
end

Dininitialvalueemtpy=Dininitialvalue';                                      %transposing cell
Rfactormstringtable=Dininitialvalueemtpy;
adjRfactormstringtable=Dininitialvalueemtpy;
RMSEvalstringtable=Dininitialvalueemtpy;
Dininitialvalueemtpy{closestvaluenumberx}='   Transition point';
Dininitialvalueemtpy{1}=strcat(' TP:', 32, Transpointstrgx,' wt%',',',Transpointstrgy,' ‰');
Dininitialvalue{1}=num2str(initialvalue);                                  %setting first cell of char array as a string containing the initial dD value
Dininitialvalue=Dininitialvalue';


if testyexist

Rfactormstringtable{1}=Rfactorm;
adjRfactormstringtable{1}=adjRfactorm;
RMSEvalstringtable{1}=RMSEval;

F312=figure(312);set(F312,'name','Selected closed-, to open-system degassing table (do not copy & paste from here)', ...
    'numbertitle','off','unit','normalized','Position', [0.2 0.2 0.43 0.5]);
deltacode = char(hex2dec('03B4'));                                           %workaround for uitable in next line. Uitable can not read special characters or tex code (\delta), hex2dec translate Unicode into ASCII code which then can be read by char as the special character                                       
Tableclosedtoopen=uitable('Data',[watercontent1,Dfinalclosetoopentrans1,Dininitialvalueemtpy,Dininitialvalue,Rfactormstringtable,adjRfactormstringtable,RMSEvalstringtable],'unit','normalized', ...           %creating a table on a new figure window whereas 'Data' considers the variable inside the next [] as the data it should write, which fills the whole figure  ('unit','normalized','Position', [0 0 1 1])       
'Position', [0 0 1 1],'ColumnName',{'Bulk water content in wt%',[' ',deltacode,'D in ‰'],['        Transition point        '],[' Selected graph initial', 032,deltacode,'D in ‰'], ...       %'ColumnsName', sets the next imnput inside the {} as the column names
['R',char(hex2dec('00B2'))],['adjR',char(hex2dec('00B2'))],['RMSE']});   

else
  F312=figure(312);set(F312,'name','Selected closed-, to open-system degassing table (do not copy & paste from here)','numbertitle','off');
deltacode = char(hex2dec('03B4'));                                          
Tableclosedtoopen=uitable('Data',[watercontent1,Dfinalclosetoopentrans1,Dininitialvalueemtpy,Dininitialvalue],'unit','normalized', ...          
   'Position', [0 0 1 1],'ColumnName',{'Bulk water content in wt%',[deltacode,'D in ‰'],['        Transition point        '],['Selected graph initial', 032,deltacode,'D in ‰']});   
  

end




Dataoftable=get(Tableclosedtoopen,'Data');                                  %gets the current Data ('Data') of active table (Tableclosedtoopen)
Columnheader=get(Tableclosedtoopen,'ColumnName');                           %gets the current Column names ('ColumnName') of active table



Dataofgraphcloseopen=[Columnheader';Dataoftable];




assignin('base','Dataofgraphcloseopen',Dataofgraphcloseopen);

 




% --- Executes on button press in Plotowndatafinish.
function Plotowndatafinish_Callback(hObject, eventdata, handles)    
existfullpath=evalin( 'base', 'exist(''fullpath'',''var'') == 1' );

if existfullpath
    
LINE111=evalin('base','LINE111');                                  
fullpath=evalin('base','fullpath');
Existingclosedtobatchedtoopen=evalin( 'base', 'exist(''F1112'',''var'') == 1' );
existpolydegree=evalin( 'base', 'exist(''polydegree'',''var'') == 1' );     
ExistingDOT111=evalin( 'base', 'exist(''DOT111'',''var'') == 1' );
ExistDchosen=evalin( 'base', 'exist(''Dchosen'',''var'') == 1' );
ExistR2plot=evalin( 'base', 'exist(''R2plot'',''var'') == 1' );


if existpolydegree                                                         
     polydegree=evalin('base','polydegree');                                
else                                                                        
    polydegree=2;
end          


testy=xlsread(fullpath);                                                                                                    
polyfitdata=polyfit(testy(:,1),testy(:,2),polydegree);                      
mintest=min(testy(:,1));                                                    
maxtest=max(testy(:,1));                                                    
polyfitdatafiner=linspace(mintest,maxtest);                                 
f = polyval(polyfitdata,polyfitdatafiner);      

figure(111);
hold on
testpoints=plot(testy(:,1),testy(:,2),'r.','MarkerSize',10,'DisplayName','Sample data');
hold on 
Testplot=plot(polyfitdatafiner,f,'k','DisplayName','Polyfittedplot');  
hold off
if ExistingDOT111  && ExistR2plot && ~Existingclosedtobatchedtoopen                                         %if DOT111 and R2plot exists and closedtobatchedtoopen does not exist,excecute following code 
    DOT111=evalin('base','DOT111'); 
    R2plot=evalin('base','R2plot'); 
    adjR2plot=evalin('base','adjR2plot'); 
   RMSEvalplot=evalin('base','RMSEvalplot'); 

legend([testpoints,Testplot,LINE111,DOT111,R2plot,adjR2plot,RMSEvalplot],'Location','southeast');

elseif ExistingDOT111  && ~ExistR2plot && ~Existingclosedtobatchedtoopen                                     %if DOT111 exists but R2plot and closedtobatchedtoopen  does not exist excecute following code
        DOT111=evalin('base','DOT111'); 
ExistingDfinalclosetobatched=evalin( 'base', 'exist(''Dfinalclosetobatched'',''var'') == 1' );
ExistinngDfinalclosetoopentrans=evalin( 'base', 'exist(''Dfinalclosetoopentrans'',''var'') == 1' );
ExistingDfinalclosetobatchedtaylor=evalin( 'base', 'exist(''Dfinalclosetobatchedtaylor'',''var'') == 1' );
waterfinal=evalin('base','waterfinal');                                  


        
        
        
        
      testyxrounded=round(testy(:,1)*1000)/1000;   
                                    
    
interpolwaterval=(min(testyxrounded):0.0001:max(testyxrounded))';



if ExistingDfinalclosetobatched  
    
 Dfinalclosetobatched=evalin('base','Dfinalclosetobatched'); 

interpolatedvaluesy=interp1(waterfinal,Dfinalclosetobatched,interpolwaterval);

elseif ExistinngDfinalclosetoopentrans 
 Dfinalclosetoopentrans=evalin('base','Dfinalclosetoopentrans'); 

interpolatedvaluesy=interp1(waterfinal,Dfinalclosetoopentrans,interpolwaterval);


elseif ExistingDfinalclosetobatchedtaylor 
 Dfinalclosetobatchedtaylor=evalin('base','Dfinalclosetobatchedtaylor'); 

interpolatedvaluesy=interp1(waterfinal,Dfinalclosetobatchedtaylor,interpolwaterval);


end

indexforwater=zeros(1,length(testyxrounded));

for ismemberreplace=1:length(testyxrounded)
[~, indexforwater(ismemberreplace)]=min(abs(interpolwaterval-testyxrounded(ismemberreplace)));   %%find minimum difference between searched value and data values ('~' for saving it as the location/place of the data), watercontent always descends, no double value are found
end


valuesytocompare=interpolatedvaluesy(indexforwater);


Rfactorm=corr(valuesytocompare,testy(:,2))^2;
adjRfactorm=1-(1-Rfactorm)*((length(valuesytocompare)-1)/(length(valuesytocompare)-1-1));
RMSEval=rms(valuesytocompare-testy(:,2));                                     

if isnan(Rfactorm)
    rightinterpreter= struct('WindowStyle','modal',...                      
              'Interpreter','tex');
    errordlg('For R^{2} the calculated values are required to portray all sample data. Example: With a step size of 0.1 set lowest bulk water content as 0.001 and initial bulk water content as 4.001 instead of 4 ','Error'...
        ,rightinterpreter);   
end

assignin('base','adjRfactorm',adjRfactorm);
assignin('base','RMSEval',RMSEval);
assignin('base','Rfactorm',Rfactorm);

Rsuperstring=('R^{2}   =');
Rfactormtostring=num2str(Rfactorm);

stringRfactorm=strcat(Rsuperstring, 32, Rfactormtostring);


adjRsuBstring=('R^{2}_{adj} =');
adjRfactormtostring=num2str(adjRfactorm);
stringadjRfactorm=strcat(adjRsuBstring, 32, adjRfactormtostring);

RMSEpurestring=('RMSE =');  
RMSEpurestringtostring=num2str(RMSEval);
stringRMSEval=strcat(RMSEpurestring, 32, RMSEpurestringtostring);




figure(111)
    hold on
    R2plot=plot(NaN,NaN,'DisplayName',stringRfactorm, 'linestyle', 'none');
    hold on
  adjR2plot=plot(NaN,NaN,'DisplayName',stringadjRfactorm, 'linestyle', 'none');
 hold on
  RMSEvalplot=plot(NaN,NaN,'DisplayName',stringRMSEval, 'linestyle', 'none');
  
 legend([LINE111,DOT111,testpoints,Testplot,R2plot,adjR2plot,RMSEvalplot],'Location','southeast');          
  assignin('base','R2plot',R2plot);
assignin('base','adjR2plot',adjR2plot);
  assignin('base','RMSEvalplot',RMSEvalplot);

hold off
    

    

elseif ExistDchosen && ExistR2plot
     R2plot=evalin('base','R2plot'); 
    adjR2plot=evalin('base','adjR2plot'); 

legend([LINE111,testpoints,Testplot,R2plot,adjR2plot],'Location','southeast');

elseif ExistDchosen && ~ExistR2plot
    waterfinal=evalin('base','waterfinal');                                  
Dchosen=evalin('base','Dchosen');                                  

   
     testyxrounded=round(testy(:,1)*1000)/1000;                                      
 
interpolwaterval=(min(testyxrounded):0.0001:max(testyxrounded))';
interpolatedvaluesy=interp1(waterfinal,Dchosen,interpolwaterval);





indexforwater=zeros(1,length(testyxrounded));

for ismemberreplace=1:length(testyxrounded)
[~, indexforwater(ismemberreplace)]=min(abs(interpolwaterval-testyxrounded(ismemberreplace)));   %%find minimum difference between searched value and data values ('~' for saving it as the location/place of the data), watercontent always descends, no double value are found
end





valuesytocompare=interpolatedvaluesy(indexforwater);



Rfactorm=corr(valuesytocompare,testy(:,2))^2;
adjRfactorm=1-(1-Rfactorm)*((length(valuesytocompare)-1)/(length(valuesytocompare)-1-1));
RMSEval=rms(valuesytocompare-testy(:,2));                                     

if isnan(Rfactorm)
    rightinterpreter= struct('WindowStyle','modal',...                      
              'Interpreter','tex');
    errordlg('For R^{2} the calculated values are required to portray all sample data. Example: With a step size of 0.1 set lowest bulk water content as 0.001 and initial bulk water content as 4.001 instead of 4 ','Error'...
        ,rightinterpreter);   
end

assignin('base','adjRfactorm',adjRfactorm);
assignin('base','RMSEval',RMSEval);
assignin('base','Rfactorm',Rfactorm);


Rsuperstring=('R^{2}   =');
Rfactormtostring=num2str(Rfactorm);

stringRfactorm=strcat(Rsuperstring, 32, Rfactormtostring);


adjRsuBstring=('R^{2}_{adj} =');
adjRfactormtostring=num2str(adjRfactorm);
stringadjRfactorm=strcat(adjRsuBstring, 32, adjRfactormtostring);

RMSEpurestring=('RMSE =');  
RMSEpurestringtostring=num2str(RMSEval);
stringRMSEval=strcat(RMSEpurestring, 32, RMSEpurestringtostring);




figure(111);
    hold on
    R2plot=plot(NaN,NaN,'DisplayName',stringRfactorm, 'linestyle', 'none');
    hold on
  adjR2plot=plot(NaN,NaN,'DisplayName',stringadjRfactorm, 'linestyle', 'none');
 hold on
  RMSEvalplot=plot(NaN,NaN,'DisplayName',stringRMSEval, 'linestyle', 'none');
  
 legend([LINE111,testpoints,Testplot,R2plot,adjR2plot,RMSEvalplot],'Location','southeast');          
  assignin('base','R2plot',R2plot);
assignin('base','adjR2plot',adjR2plot);
hold off





end
 
    
    

if Existingclosedtobatchedtoopen
    DOT111=evalin('base','DOT111');  
    LINE1112=evalin('base','LINE1112');  
    R2plot=evalin('base','R2plot');  
    RMSEvalplot=evalin('base','RMSEvalplot');  
    adjR2plot=evalin('base','adjR2plot');  

   
    figure(1112);
  

  hold on
testpoints=plot(testy(:,1),testy(:,2),'r.','MarkerSize',10,'DisplayName','Sample data');
Testplot=plot(polyfitdatafiner,f,'k','DisplayName','Polyfittedplot');  
legend([testpoints,Testplot,LINE1112,DOT111,R2plot,adjR2plot,RMSEvalplot],'Location','southeast');
hold off
end


assignin('base','testpoints',testpoints);
assignin('base','Testplot',Testplot);
assignin('base','testy',testy);
else
     errordlg(strcat('Input a prepared excel with sample data first by pressing Input Excel'),'Error'); 
end




% hObject    handle to Plotowndatafinish (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in selectgraph.
function selectgraph_Callback(hObject, eventdata, handles)                  %selecting one graph and outputtin table explanation see above
waterfinal=evalin('base','waterfinal');
Dinitial=evalin('base','Dinitial');
waterini=evalin('base','waterini');
Dfinal=evalin('base','Dfinal');
minxax=evalin('base','minxax');
maxxax=evalin('base','maxxax');
minyax=evalin('base','minyax');
maxyax=evalin('base','maxyax');
testyexist=evalin( 'base', 'exist(''testy'',''var'') == 1' );

figure(1); 
[x,y] = ginput(1);  
searchvaluex=x;
searchvaluey=y;
                
[~,closestvaluenumberx] = min(abs(waterfinal-searchvaluex));      
closestvaluex = waterfinal(closestvaluenumberx) ;        

DfinalsearchX=Dfinal(closestvaluenumberx,:)  ;    

[~,closestvaluenumbery] = min(abs(DfinalsearchX-searchvaluey));
closestvaluey = DfinalsearchX(closestvaluenumbery);
initialvalue=Dinitial(closestvaluenumbery);

initialvaluestringonegraph=num2str(initialvalue);
Displaysentence=('Initial \deltaD value of graph:  ');
permilledisplay=(' ‰');
initialvaluestringonegraphdisplay=strcat(Displaysentence, 32,initialvaluestringonegraph,permilledisplay);

Dchosen=Dfinal(:,closestvaluenumbery);                                      %save all dD values of selected graph
assignin('base','Dchosen',Dchosen);


if testyexist
    
    testy=evalin('base','testy');
    testyxrounded=round(testy(:,1)*1000)/1000;                                        
    
interpolwaterval=(min(testyxrounded):0.0001:max(testyxrounded))';
interpolatedvaluesy=interp1(waterfinal,Dchosen,interpolwaterval);





indexforwater=zeros(1,length(testyxrounded));

for ismemberreplace=1:length(testyxrounded)
[~, indexforwater(ismemberreplace)]=min(abs(interpolwaterval-testyxrounded(ismemberreplace)));   %%find minimum difference between searched value and data values ('~' for saving it as the location/place of the data), watercontent always descends, no double value are found
end


valuesytocompare=interpolatedvaluesy(indexforwater);



Rfactorm=corr(valuesytocompare,testy(:,2))^2;
adjRfactorm=1-(1-Rfactorm)*((length(valuesytocompare)-1)/(length(valuesytocompare)-1-1));

if isnan(Rfactorm)
    rightinterpreter= struct('WindowStyle','modal',...                      
              'Interpreter','tex');
    errordlg('For R^{2} the calculated values are required to portray all sample data. Example: With a step size of 0.1 set lowest bulk water content as 0.001 and initial bulk water content as 4.001 instead of 4 ','Error'...
        ,rightinterpreter);   
end

assignin('base','adjRfactorm',adjRfactorm);


assignin('base','Rfactorm',Rfactorm);

Rsuperstring=('R^{2}   =');
Rfactormtostring=num2str(Rfactorm);

stringRfactorm=strcat(Rsuperstring, 32, Rfactormtostring);


adjRsuBstring=('R^{2}_{adj} =');
adjRfactormtostring=num2str(adjRfactorm);
stringadjRfactorm=strcat(adjRsuBstring, 32, adjRfactormtostring);

end




F111=figure(111);set(F111,'name','Selected degassing graph 2D-plot','numbertitle','off');
LINE111=plot(waterfinal,Dchosen,'DisplayName',initialvaluestringonegraphdisplay);
ylabel('\deltaD in ‰');
xlabel('Bulk water content in wt%');
axis([minxax maxxax minyax maxyax]);

if testyexist
    hold on
    R2plot=plot(NaN,NaN,'DisplayName',stringRfactorm, 'linestyle', 'none');
    hold on
  adjR2plot=plot(NaN,NaN,'DisplayName',stringadjRfactorm, 'linestyle', 'none');

 legend([LINE111,R2plot,adjR2plot],'Location','southeast');          
  assignin('base','R2plot',R2plot);
assignin('base','adjR2plot',adjR2plot);

else
legend([LINE111],'Location','southeast');  
end

grid on
assignin('base','F111',F111);
assignin('base','LINE111',LINE111);
hold off


watercontent=waterfinal';                                                   
Dchosen1=num2cell(Dchosen);                    

watercontent1=num2cell(watercontent);

Dininitialvalue=cell(1,length(watercontent));                               

for Tablepreploop=1:length(watercontent)                                    
    Dininitialvalue{Tablepreploop}=num2str('');
end

Dininitialvalueemtpy=Dininitialvalue'; 
Rfactormstringtable=Dininitialvalueemtpy;
adjRfactormstringtable=Dininitialvalueemtpy;

Dininitialvalue{1}=num2str(initialvalue);                                   
Dininitialvalue=Dininitialvalue';

if testyexist

Rfactormstringtable{1}=Rfactorm;
adjRfactormstringtable{1}=adjRfactorm;


F314=figure(314);set(F314,'name','Selected degassing graph table (do not copy & paste from here)','numbertitle','off','unit','normalized','Position', [0.2 0.2 0.4 0.5]);
deltacode = char(hex2dec('03B4'));                                          
Tablechoosen=uitable('Data',[watercontent1,Dchosen1,Dininitialvalueemtpy,Dininitialvalue,Rfactormstringtable,adjRfactormstringtable],'unit','normalized', ...          
   'Position', [0 0 1 1],'ColumnName',{'Bulk water content in wt%',[' ',deltacode,'D in ‰'],['   '],['Selected graph initial', 032,deltacode,'D in ‰'],['R',char(hex2dec('00B2'))],['adjR',char(hex2dec('00B2'))]});   

else
  F314=figure(314);set(F314,'name','Selected degassing graph table (do not copy & paste from here)','numbertitle','off');
deltacode = char(hex2dec('03B4'));                                          
Tablechoosen=uitable('Data',[watercontent1,Dchosen1,Dininitialvalueemtpy,Dininitialvalue],'unit','normalized', ...          
   'Position', [0 0 1 1],'ColumnName',{'Bulk water content in wt%',[' ',deltacode,'D in ‰'],['   '],['Selected graph initial', 032,deltacode,'D in ‰']});   
  
    
end




Dataoftable=get(Tablechoosen,'Data');                                   
Columnheader=get(Tablechoosen,'ColumnName');                           

                               
Dataofgraph=[Columnheader';Dataoftable];



assignin('base','Dataofgraph',Dataofgraph);






% hObject    handle to selectgraph (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in transitionclosebatched.
function transitionclosebatched_Callback(hObject, eventdata, handles)       %transition point closed to batched degassing, see above for explanation (bathced with constant step size initial water content and dD values constantly adjusting)
% hObject    handle to transitionclosebatched (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
waterfinal=evalin('base','waterfinal');
Dinitial=evalin('base','Dinitial');
waterini=evalin('base','waterini');
Dfinal=evalin('base','Dfinal');
minxax=evalin('base','minxax');
maxxax=evalin('base','maxxax');
minyax=evalin('base','minyax');
maxyax=evalin('base','maxyax');
alpha=evalin('base','alpha');
water2=evalin('base','water2'); 
testyexist=evalin( 'base', 'exist(''testy'',''var'') == 1' );


figure(1); 
[x,y] = ginput(1);   
searchvaluex=x;
searchvaluey=y;
                





[~,closestvaluenumberx] = min(abs(waterfinal-searchvaluex));      
closestvaluex = waterfinal(closestvaluenumberx) ;        

DfinalsearchX=Dfinal(closestvaluenumberx,:)  ;   

[~,closestvaluenumbery] = min(abs(DfinalsearchX-searchvaluey));
closestvaluey = DfinalsearchX(closestvaluenumbery);

initialvalueclosebatched=Dinitial(closestvaluenumbery);

Tpclosedbatchedx=closestvaluex;
Tpclosedbatchedy=closestvaluey;

assignin('base','Tpclosedbatchedx',Tpclosedbatchedx);
assignin('base','Tpclosedbatchedy',Tpclosedbatchedy);


initialindexclosebatchedx=closestvaluenumberx;
assignin('base','initialindexclosebatchedx',initialindexclosebatchedx);
assignin('base','closestvaluex',closestvaluex);    
assignin('base','closestvaluey',closestvaluey);    


initialvaluestringclosebatched=num2str(initialvalueclosebatched);
Displaysentence=('Initial \deltaD value of graph:  ');
permilledisplay=(' ‰');
initialvaluestringclsoedbatcheddisplay=strcat(Displaysentence, 32,initialvaluestringclosebatched,permilledisplay);
assignin('base','initialvaluestringclsoedbatcheddisplay',initialvaluestringclsoedbatcheddisplay);

Transpointstrgx=num2str(closestvaluex);
Transpointstrgy=num2str(closestvaluey);
Transpointstrgpure='Transition point: ';
wtperdisplay=' wt% water, ';
permilldisanddelt=' ‰ \deltaD ' ;
Transpointstring=strcat(Transpointstrgpure, 32,Transpointstrgx,wtperdisplay, 32,Transpointstrgy,permilldisanddelt);
assignin('base','Transpointstring',Transpointstring)

Transpointstrgxbatched=Transpointstrgx;
Transpointstrgybatched=Transpointstrgy;
assignin('base','Transpointstrgxbatched',Transpointstrgxbatched); 
assignin('base','Transpointstrgybatched',Transpointstrgybatched); 
assignin('base','Transpointstrgbatchedfull',Transpointstring);




figure(1);
hold on 
TPOINTFIG1=plot(closestvaluex,closestvaluey, 'kx','MarkerSize',10,'LineWidth',3,'DisplayName',Transpointstring);
if ~testyexist
legend([TPOINTFIG1],'Location','southeast');                            
end

hold off


assignin('base','initialvalueclosebatched',initialvalueclosebatched); 

F100=figure(100);set(F100,'name','Selected transition point and degassing graph 2D-plot','numbertitle','off');
DOT100=plot(closestvaluex,closestvaluey, 'kx','MarkerSize',10,'LineWidth',3,'DisplayName',Transpointstring);
ylabel('\deltaD in ‰');
xlabel('Bulk water content in wt%');
hold on
LINE100=plot(waterfinal,Dfinal(:,closestvaluenumbery),'DisplayName',initialvaluestringclsoedbatcheddisplay);
axis([minxax maxxax minyax maxyax]);
hold off
legend([LINE100,DOT100],'Location','southeast');
grid on;

assignin('base','F100',F100);
assignin('base','LINE100',LINE100);
assignin('base','DOT100',DOT100);

dotfromclosebatchedtransitionpoint=[closestvaluex,closestvaluey];
assignin('base','dotfromclosebatchedtransitionpoint',dotfromclosebatchedtransitionpoint);

newtocalcwater=waterfinal(closestvaluenumberx:length(waterfinal));




Dinitialer=Dfinal(closestvaluenumberx,closestvaluenumbery);

%%%
waterinitial=waterfinal(closestvaluenumberx);   
Dfinalbatched=zeros(length(newtocalcwater),1);

waterinitial1=zeros(1,length(newtocalcwater)+1);



  waterinitial1(1)=waterinitial;  
nn=1;
for waterfinalloop=newtocalcwater

waterinitial1(nn+1)=waterfinalloop;  
Dfinalbatched(nn)=Dinitialer-((1-(waterfinalloop/waterinitial1(nn)))*10^3)*log(alpha(nn+closestvaluenumberx-1,1));  %need alhpa vaule at point closestvaluenumberx to end
Dinitialer=Dfinalbatched(nn);
nn=nn+1;

end 


assignin('base','Dfinalbatched',Dfinalbatched); 
Dfinalold=Dfinal(:,closestvaluenumbery);
Dfinalclosetobatched=[Dfinalold(1:closestvaluenumberx-1 );Dfinalbatched];
assignin('base','Dfinalclosetobatched',Dfinalclosetobatched);




if testyexist
    
    testy=evalin('base','testy');
    testyxrounded=round(testy(:,1)*1000)/1000;                                         
    
interpolwaterval=(min(testyxrounded):0.0001:max(testyxrounded))';
interpolatedvaluesy=interp1(waterfinal,Dfinalclosetobatched,interpolwaterval);




indexforwater=zeros(1,length(testyxrounded));

for ismemberreplace=1:length(testyxrounded)
[~, indexforwater(ismemberreplace)]=min(abs(interpolwaterval-testyxrounded(ismemberreplace)));   %%find minimum difference between searched value and data values ('~' for saving it as the location/place of the data), watercontent always descends, no double value are found
end



valuesytocompare=interpolatedvaluesy(indexforwater);


Rfactorm=corr(valuesytocompare,testy(:,2))^2;
adjRfactorm=1-(1-Rfactorm)*((length(valuesytocompare)-1)/(length(valuesytocompare)-1-1));
RMSEval=rms(valuesytocompare-testy(:,2));                                     



if isnan(Rfactorm)
    rightinterpreter= struct('WindowStyle','modal',...                      
              'Interpreter','tex');
    errordlg('For R^{2} the calculated values are required to portray all sample data. Example: With a step size of 0.1 set lowest bulk water content as 0.001 and initial bulk water content as 4.001 instead of 4 ','Error'...
        ,rightinterpreter);   
end

assignin('base','adjRfactorm',adjRfactorm);

assignin('base','RMSEval',RMSEval);

assignin('base','Rfactorm',Rfactorm);

Rsuperstring=('R^{2}   =');
Rfactormtostring=num2str(Rfactorm);

stringRfactorm=strcat(Rsuperstring, 32, Rfactormtostring);


adjRsuBstring=('R^{2}_{adj} =');
adjRfactormtostring=num2str(adjRfactorm);
stringadjRfactorm=strcat(adjRsuBstring, 32, adjRfactormtostring);
RMSEpurestring=('RMSE =');  
RMSEpurestringtostring=num2str(RMSEval);
stringRMSEval=strcat(RMSEpurestring, 32, RMSEpurestringtostring);

end





F111=figure(111);set(F111,'name','Selected closed-, to batched-system degassing 2D-plot','numbertitle','off');
DOT111=plot(closestvaluex,closestvaluey, 'kx','MarkerSize',10,'LineWidth',3,'DisplayName',Transpointstring);
ylabel('\deltaD in ‰');
xlabel('Bulk water content in wt%');
hold on
LINE111=plot(waterfinal,Dfinalclosetobatched,'DisplayName',initialvaluestringclsoedbatcheddisplay);
axis([minxax maxxax minyax maxyax]);

if testyexist
    hold on
    R2plot=plot(NaN,NaN,'DisplayName',stringRfactorm, 'linestyle', 'none');
    hold on
  adjR2plot=plot(NaN,NaN,'DisplayName',stringadjRfactorm, 'linestyle', 'none');
  hold on
  RMSEvalplot=plot(NaN,NaN,'DisplayName',stringRMSEval, 'linestyle', 'none');
  
 legend([LINE111,DOT111,R2plot,adjR2plot,RMSEvalplot],'Location','southeast');    
 
 assignin('base','R2plot',R2plot);
assignin('base','adjR2plot',adjR2plot);
  assignin('base','RMSEvalplot',RMSEvalplot);
  
else
legend([LINE111,DOT111],'Location','southeast');  
end

assignin('base','F111',F111);
grid on;
hold off

assignin('base','LINE111',LINE111);
assignin('base','DOT111',DOT111);





watercontent=waterfinal';                                                   
Dfinalclosetobatched1=num2cell(Dfinalclosetobatched);                    

watercontent1=num2cell(watercontent);

Dininitialvalue=cell(1,length(watercontent));                               

for Tablepreploop=1:length(watercontent)                                    
    Dininitialvalue{Tablepreploop}=num2str('');
end

Dininitialvalueemtpy=Dininitialvalue';     
Rfactormstringtable=Dininitialvalueemtpy;
adjRfactormstringtable=Dininitialvalueemtpy;
RMSEvalstringtable=Dininitialvalueemtpy;

Dininitialvalueemtpy{closestvaluenumberx}='   Transition point';
Dininitialvalueemtpy{1}=strcat(' TP:', 32, Transpointstrgx,' wt%',',',Transpointstrgy,' ‰');                         
Dininitialvalue{1}=num2str(initialvalueclosebatched);                                   
Dininitialvalue=Dininitialvalue';


if testyexist

Rfactormstringtable{1}=Rfactorm;
adjRfactormstringtable{1}=adjRfactorm;
RMSEvalstringtable{1}=RMSEval;


F315=figure(315);set(F315,'name','Selected closed-, to batched-system degassing table (do not copy & paste from here)', ...
    'numbertitle','off','unit','normalized','Position', [0.2 0.2 0.43 0.5]);
deltacode = char(hex2dec('03B4'));                                           %workaround for uitable in next line. Uitable can not read special characters or tex code (\delta), hex2dec translate Unicode into ASCII code which then can be read by char as the special character                                       
Tableclosedbatched=uitable('Data',[watercontent1,Dfinalclosetobatched1,Dininitialvalueemtpy,Dininitialvalue,Rfactormstringtable,adjRfactormstringtable,RMSEvalstringtable],'unit','normalized', ...           %creating a table on a new figure window whereas 'Data' considers the variable inside the next [] as the data it should write, which fills the whole figure  ('unit','normalized','Position', [0 0 1 1])       
'Position', [0 0 1 1],'ColumnName',{'Bulk water content in wt%',[' ',deltacode,'D in ‰'],['        Transition point        '],[' Selected graph initial', 032,deltacode,'D in ‰'], ...       %'ColumnsName', sets the next imnput inside the {} as the column names
['R',char(hex2dec('00B2'))],['adjR',char(hex2dec('00B2'))],['RMSE']});   

else
  F315=figure(315);set(F315,'name','Selected closed-, to batched-system degassing table (do not copy & paste from here)','numbertitle','off');
deltacode = char(hex2dec('03B4'));                                          
Tableclosedbatched=uitable('Data',[watercontent1,Dfinalclosetobatched1,Dininitialvalueemtpy,Dininitialvalue],'unit','normalized', ...          
   'Position', [0 0 1 1],'ColumnName',{'Bulk water content in wt%',[deltacode,'D in ‰'],['        Transition point        '],['Selected graph initial', 032,deltacode,'D in ‰']});   
  
    
end




Dataoftable=get(Tableclosedbatched,'Data');                                   
Columnheader=get(Tableclosedbatched,'ColumnName');                           

                                
Dataofgraphclosebatched=[Columnheader';Dataoftable];


assignin('base','Dataofgraphclosebatched',Dataofgraphclosebatched);




% --- Executes on button press in closetobatchedtoopen.
function closetobatchedtoopen_Callback(hObject, eventdata, handles)         % open to batched calculation ,same procedure like explained above except old closed and batched dagassing values added to the now newly calculated open ones, changes to above described are described
% hObject    handle to closetobatchedtoopen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB

existdotfromclosebatchedtransitionpoint=evalin( 'base', 'exist(''dotfromclosebatchedtransitionpoint'',''var'') == 1' );

if ~existdotfromclosebatchedtransitionpoint

errordlg('Plot the closed-, to batched degassing system first','Error');
return
    
end

waterfinal=evalin('base','waterfinal');
waterini=evalin('base','waterini');
dotfromclosebatchedtransitionpoint=evalin('base','dotfromclosebatchedtransitionpoint');     
Dfinalclosetobatched=evalin('base','Dfinalclosetobatched');
minxax=evalin('base','minxax');
maxxax=evalin('base','maxxax');
minyax=evalin('base','minyax');
maxyax=evalin('base','maxyax');
alpha=evalin('base','alpha');
water2=evalin('base','water2'); 
initialvalueclosebatched=evalin('base','initialvalueclosebatched'); 
initialvaluestringclsoedbatcheddisplay=evalin('base','initialvaluestringclsoedbatcheddisplay'); 
initialindexclosebatchedx=evalin('base','initialindexclosebatchedx'); 
Transpointstrgxbatched=evalin('base','Transpointstrgxbatched'); 
Transpointstrgybatched=evalin('base','Transpointstrgybatched'); 
testyexist=evalin( 'base', 'exist(''testy'',''var'') == 1' );
Transpointstrgbatchedfull=evalin('base','Transpointstrgbatchedfull'); 



figure(111); 
[x,y] = ginput(1);   
searchvaluex=x;

                




[~,closestvaluenumberx] = min(abs(waterfinal-searchvaluex));                %only serching inside the one graph (column) already defined in the open transition calculations
closestvaluex = waterfinal(closestvaluenumberx) ;       



closestvaluey = Dfinalclosetobatched(closestvaluenumberx);


Transpointstrgx=num2str(closestvaluex);
Transpointstrgy=num2str(closestvaluey);
Transpointstrgpure='Transition point: ';
wtperdisplay=' wt% water, ';
permilldisanddelt=' ‰ \deltaD ' ;
Transpointstring=strcat(Transpointstrgpure, 32,Transpointstrgx,wtperdisplay, 32,Transpointstrgy,permilldisanddelt);

assignin('base','closestvaluex',closestvaluex);    
assignin('base','closestvaluey',closestvaluey);    

figure(111);
hold on 
TPOINTFIG1=plot(closestvaluex,closestvaluey, 'kx','MarkerSize',10,'LineWidth',3,'DisplayName',Transpointstring);
if ~testyexist
legend([TPOINTFIG1],'Location','southeast');                            
end
hold off





newtocalcwater=waterfinal(closestvaluenumberx:length(waterfinal));




Dinitialer=Dfinalclosetobatched(closestvaluenumberx);

%%%
waterinitial=waterfinal(closestvaluenumberx);     
Dfinalopen=zeros(length(newtocalcwater),1);

waterinitial1=zeros(1,length(newtocalcwater)+1);



  waterinitial1(1)=waterinitial;   
nn=1;
for waterfinalloop=newtocalcwater

waterinitial1(nn+1)=waterfinalloop;  
Dfinalopen(nn)=(Dinitialer+1000)*((waterfinalloop/waterinitial1(nn))^(alpha(nn+closestvaluenumberx-1,1)-1))-1000;  %need alhpa vaule at point closestvaluenumberx to end
Dinitialer=Dfinalopen(nn);
nn=nn+1;

end 


assignin('base','Dfinalopen',Dfinalopen); 
Dfinalold=Dfinalclosetobatched;
Dfinalclosetobatchedtoopentrans=[Dfinalold(1:closestvaluenumberx-1 );Dfinalopen  ];             %adding before in close to batched degassing system calculated valuses to the here newly calculated ones.
assignin('base','Dfinalclosetobatchedtoopentrans',Dfinalclosetobatchedtoopentrans);



if testyexist
    
    testy=evalin('base','testy');
    testyxrounded=round(testy(:,1)*1000)/1000;                                      
    
interpolwaterval=(min(testyxrounded):0.0001:max(testyxrounded))';
interpolatedvaluesy=interp1(waterfinal,Dfinalclosetobatchedtoopentrans,interpolwaterval);




indexforwater=zeros(1,length(testyxrounded));

for ismemberreplace=1:length(testyxrounded)
[~, indexforwater(ismemberreplace)]=min(abs(interpolwaterval-testyxrounded(ismemberreplace)));   %%find minimum difference between searched value and data values ('~' for saving it as the location/place of the data), watercontent always descends, no double value are found
end



valuesytocompare=interpolatedvaluesy(indexforwater);



Rfactorm=corr(valuesytocompare,testy(:,2))^2;
adjRfactorm=1-(1-Rfactorm)*((length(valuesytocompare)-1)/(length(valuesytocompare)-1-1));
RMSEval=rms(valuesytocompare-testy(:,2));                                     

if isnan(Rfactorm)
    rightinterpreter= struct('WindowStyle','modal',...                      
              'Interpreter','tex');
    errordlg('For R^{2} the calculated values are required to portray all sample data. Example: With a step size of 0.1 set lowest bulk water content as 0.001 and initial bulk water content as 4.001 instead of 4 ','Error'...
        ,rightinterpreter);   
end

assignin('base','adjRfactorm',adjRfactorm);

assignin('base','RMSEval',RMSEval);

assignin('base','Rfactorm',Rfactorm);

Rsuperstring=('R^{2}   =');
Rfactormtostring=num2str(Rfactorm);

stringRfactorm=strcat(Rsuperstring, 32, Rfactormtostring);


adjRsuBstring=('R^{2}_{adj} =');
adjRfactormtostring=num2str(adjRfactorm);
stringadjRfactorm=strcat(adjRsuBstring, 32, adjRfactormtostring);

RMSEpurestring=('RMSE =');  
RMSEpurestringtostring=num2str(RMSEval);
stringRMSEval=strcat(RMSEpurestring, 32, RMSEpurestringtostring);



end



F1112=figure(1112);set(F1112,'name','Selected closed-, to batched-, to open-system degassing 2D-plot','numbertitle','off');
DOT1112=plot(closestvaluex,closestvaluey, 'kx','MarkerSize',10,'LineWidth',3,'DisplayName',Transpointstring);
ylabel('\deltaD in ‰');
xlabel('Bulk water content in wt%');
hold on
LINE1112=plot(waterfinal,Dfinalclosetobatchedtoopentrans,'DisplayName',initialvaluestringclsoedbatcheddisplay);
axis([minxax maxxax minyax maxyax]);
hold on
Oldtransitionpointfromclosedtobatched=plot(dotfromclosebatchedtransitionpoint(1),dotfromclosebatchedtransitionpoint(2),'kx','MarkerSize',10,'LineWidth',3,'DisplayName',Transpointstrgbatchedfull);

if testyexist
    hold on
    R2plot=plot(NaN,NaN,'DisplayName',stringRfactorm, 'linestyle', 'none');
    hold on
  adjR2plot=plot(NaN,NaN,'DisplayName',stringadjRfactorm, 'linestyle', 'none');
  hold on
  RMSEvalplot=plot(NaN,NaN,'DisplayName',stringRMSEval, 'linestyle', 'none');

 legend([LINE1112,DOT1112,Oldtransitionpointfromclosedtobatched,R2plot,adjR2plot,RMSEvalplot],'Location','southeast');   
 
assignin('base','R2plot',R2plot);
assignin('base','adjR2plot',adjR2plot);
  assignin('base','RMSEvalplot',RMSEvalplot);
  
else
legend([LINE1112,DOT1112,Oldtransitionpointfromclosedtobatched],'Location','southeast');  
end
assignin('base','F1112',F1112);
grid on;
hold off

assignin('base','LINE1112',LINE1112);
assignin('base','DOT1112',DOT1112);
assignin('base','Transpointstring',Transpointstring)




watercontent=waterfinal';                                                   
Dfinalclosetobatchedtoopentrans1=num2cell(Dfinalclosetobatchedtoopentrans);                    

watercontent1=num2cell(watercontent);

Dininitialvalue=cell(1,length(watercontent));                               

for Tablepreploop=1:length(watercontent)                                    
    Dininitialvalue{Tablepreploop}=num2str('');
end




Dininitialvalueemtpy=Dininitialvalue';   
Rfactormstringtable=Dininitialvalueemtpy;
adjRfactormstringtable=Dininitialvalueemtpy;
RMSEvalstringtable=Dininitialvalueemtpy;

Dininitialvalueemtpy{closestvaluenumberx}='   Transition point';
Dininitialvalueemtpy{initialindexclosebatchedx}='   Transition point';



Dininitialvalueemtpy{1}=strcat(' TP:', 32, Transpointstrgx,' wt%',',',Transpointstrgy,' ‰');
Dininitialvalueemtpy{2}=strcat(' TP:', 32, Transpointstrgxbatched,' wt%',',',Transpointstrgybatched,' ‰');


                              
Dininitialvalue{1}=num2str(initialvalueclosebatched);                                   
Dininitialvalue=Dininitialvalue';

if testyexist
Rfactormstringtable{1}=Rfactorm;
adjRfactormstringtable{1}=adjRfactorm;
RMSEvalstringtable{1}=RMSEval;


F317=figure(317);set(F317,'name','Selected closed-, to batched-, to open-system degassing table (do not copy & paste from here)', ...
    'numbertitle','off','unit','normalized','Position', [0.2 0.2 0.43 0.5]);
deltacode = char(hex2dec('03B4'));                                           %workaround for uitable in next line. Uitable can not read special characters or tex code (\delta), hex2dec translate Unicode into ASCII code which then can be read by char as the special character                                       
Tableclosedbatchedopen=uitable('Data',[watercontent1,Dfinalclosetobatchedtoopentrans1,Dininitialvalueemtpy,Dininitialvalue,Rfactormstringtable,adjRfactormstringtable,RMSEvalstringtable],'unit','normalized', ...           %creating a table on a new figure window whereas 'Data' considers the variable inside the next [] as the data it should write, which fills the whole figure  ('unit','normalized','Position', [0 0 1 1])       
'Position', [0 0 1 1],'ColumnName',{'Bulk water content in wt%',[' ',deltacode,'D in ‰'],['        Transition point        '],[' Selected graph initial', 032,deltacode,'D in ‰'], ...       %'ColumnsName', sets the next imnput inside the {} as the column names
['R',char(hex2dec('00B2'))],['adjR',char(hex2dec('00B2'))],['RMSE']});   

else
  F317=figure(317);set(F317,'name','Selected closed-, to batched-, to open-system degassing table (do not copy & paste from here)','numbertitle','off');
deltacode = char(hex2dec('03B4'));                                          
Tableclosedbatchedopen=uitable('Data',[watercontent1,Dfinalclosetobatchedtoopentrans1,Dininitialvalueemtpy,Dininitialvalue],'unit','normalized', ...          
   'Position', [0 0 1 1],'ColumnName',{'Bulk water content in wt%',[deltacode,'D in ‰'],['        Transition point        '],['Selected graph initial', 032,deltacode,'D in ‰']});   
  
    
end



Dataoftable=get(Tableclosedbatchedopen,'Data');                                   
Columnheader=get(Tableclosedbatchedopen,'ColumnName');                           

                        
Dataofgraphclosebatchedopenopen=[Columnheader';Dataoftable];


assignin('base','Dataofgraphclosebatchedopenopen',Dataofgraphclosebatchedopenopen);



% --- Executes on button press in transitionclosebatchedtaylor.
function transitionclosebatchedtaylor_Callback(hObject, eventdata, handles)     %closed to batched system degassing (after Taylor 1991), no constant step size, 50% water lose on each step, explanation see above, changes  to above are explained 
% hObject    handle to transitionclosebatchedtaylor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
waterfinal=evalin('base','waterfinal');
Dinitial=evalin('base','Dinitial');
waterini=evalin('base','waterini');
Dfinal=evalin('base','Dfinal');
minxax=evalin('base','minxax');
maxxax=evalin('base','maxxax');
minyax=evalin('base','minyax');
maxyax=evalin('base','maxyax');
water1=evalin('base','water1'); 
TinC1=evalin('base','TinC1');
alphaH20=0.9896;  
alphaOH=1.0415;
testyexist=evalin( 'base', 'exist(''testy'',''var'') == 1' );
Existalphaself=evalin( 'base', 'exist(''alphaself'',''var'') == 1' );


Percentwaterlossscndstagevareva=evalin( 'base', 'exist(''Percentwaterlossscndstagevar'',''var'') == 1' );
if Percentwaterlossscndstagevareva
    Percentwaterlossscndstagevar=evalin('base','Percentwaterlossscndstagevar'); 
else
    Percentwaterlossscndstagevar=50;
end
Percentwaterlossvarfin=1-Percentwaterlossscndstagevar/100;


figure(1); 
[x,y] = ginput(1);  
searchvaluex=x;
searchvaluey=y;
                





[~,closestvaluenumberx] = min(abs(waterfinal-searchvaluex));    
closestvaluex = waterfinal(closestvaluenumberx) ;         

DfinalsearchX=Dfinal(closestvaluenumberx,:)  ;   
[~,closestvaluenumbery] = min(abs(DfinalsearchX-searchvaluey));
closestvaluey = DfinalsearchX(closestvaluenumbery);
initialvalueclosebatchedtaylor=Dinitial(closestvaluenumbery);

initialvaluestringclosebatchedtay=num2str(initialvalueclosebatchedtaylor);
Displaysentence=('Initial \deltaD value of graph:  ');
permilledisplay=(' ‰');
initialvaluestringclsoedbatchedtaydisplay=strcat(Displaysentence, 32,initialvaluestringclosebatchedtay,permilledisplay);

Transpointstrgx=num2str(closestvaluex);
Transpointstrgy=num2str(closestvaluey);
Transpointstrgpure='Transition point: ';
wtperdisplay=' wt% water, ';
permilldisanddelt=' ‰ \deltaD ' ;
Transpointstring=strcat(Transpointstrgpure, 32,Transpointstrgx,wtperdisplay, 32,Transpointstrgy,permilldisanddelt);

assignin('base','closestvaluex',closestvaluex);    
assignin('base','closestvaluey',closestvaluey);    

figure(1);
hold on 
TPOINTFIG1=plot(closestvaluex,closestvaluey, 'kx','MarkerSize',10,'LineWidth',3,'DisplayName',Transpointstring);
if ~testyexist
legend([TPOINTFIG1],'Location','southeast');                            
end
hold off

assignin('base','initialvalueclosebatchedtaylor',initialvalueclosebatchedtaylor);               

F100=figure(100);set(F100,'name','Selected transition point and degassing graph 2D-plot','numbertitle','off');             
DOT100=plot(closestvaluex,closestvaluey, 'kx','MarkerSize',10,'LineWidth',3,'DisplayName',Transpointstring);
ylabel('\deltaD in ‰');
xlabel('Bulk water content in wt%');
hold on
LINE100=plot(waterfinal,Dfinal(:,closestvaluenumbery),'DisplayName',initialvaluestringclsoedbatchedtaydisplay);
axis([minxax maxxax minyax maxyax]);
hold off
legend([LINE100,DOT100],'Location','southeast');
grid on;

assignin('base','F100',F100);
assignin('base','LINE100',LINE100);
assignin('base','DOT100',DOT100);





mm=1;                                                                       %as no constant step size, water values need to be newly calculated from the transition point
newtocalcwater(mm)=closestvaluex;                                           %mm set to one => transition point watercontent value is  first watercontent data point in new calculated model
mm=2;                                                                       %mm set to 2 to not overwrite  existing watercontent value
while newtocalcwater > water1                                               %while loop, loop runs as long as newtocalcwater values are bigger then  water1 value (lowest vater value)
    
    newtocalcwater(mm)=newtocalcwater(mm-1)*Percentwaterlossvarfin;                              %50 % water loss on each step is calculated here (/2).(mm-1) to calculated from first value and newtocalcwater(mm) to save those values starting at 2nd position, as the first position has the original watercontent value of the transition point saved 
    mm=mm+1;                                                                %counting up for next iteration => watercontent value is saved into new position
    
end

newtocalcwater=sort(newtocalcwater,'descend');                              %sorting the new watercontent values in descending order and saving into new variable

SiO2peroxygen=30.0421;                                                      %alpha factors need to be calculated with new watercontnet values, same procedure as described in openandclose scripts
TinK=TinC1+273.15;
K=exp(1.89-3120/TinK);
alpha1=zeros(length(newtocalcwater),1);




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



fspecH2O = polyval(polyfitdataspecH2O,newtocalcwater);                          %evaluation and calculation of calculated polynomial factor of polyfit based on each data point (x axis) in form fspecH2O = polyfitdataspecH2O(1)*waterfinal.^2+polyfitdataspecH2O(2)*waterfinal+polyfitdataspecH2O(3); 
fspecOH = polyval(polyfitdataspecOH,newtocalcwater);   

H2Owtfractionpoly=fspecH2O/100;                                             %calculalating of wt fraction from wt%
OHwtfractionpoly=fspecOH/100;


%%%%
m=1;                                                                        %setting m starting value => place of number (index) 
for H2Owtfractionpolyloop=1:length(newtocalcwater)                                              %starting of the loop with before described waterfinal values

H2Owtfractionpolyfull=H2Owtfractionpoly(m)/(H2Owtfractionpoly(m)+OHwtfractionpoly(m));  % calculating wt fraction of H2Om in relation to total water content     
OHwtfractionpolyfull=OHwtfractionpoly(m)/(H2Owtfractionpoly(m)+OHwtfractionpoly(m));    % calculating wt fraction of OH in relation to total water content  

alpha1(m,1)=H2Owtfractionpolyfull*alphaH20+(OHwtfractionpolyfull)*alphaOH;   %calculation of  bulk water fractionation factor (alpha) in rhyolitic melts which is saved on each iteration as alpha at position (m,1)which is row m column 1  
m=m+1;                                                                      %changing m for next iteration so alpha  can be saved at the next position

end    
    
    
    
    
    
    
else

m=1;
for waterfinalloop=newtocalcwater

Xbulk=(waterfinalloop/18.015)/((waterfinalloop/18.015)+(100-waterfinalloop)/SiO2peroxygen);  





XOHm=(1/2-(1/4-((K-4)/K)*(Xbulk-Xbulk^2))^0.5)/((K-4)/(2*K));

XH2Om=Xbulk-0.5*XOHm;
XH20mfraction=2*XH2Om/(2*XH2Om+XOHm);





alpha1(m,1)=exp(XH20mfraction*log(alphaH20)+(1-XH20mfraction)*log(alphaOH));    
m=m+1;
end
end


Dinitialer=Dfinal(closestvaluenumberx,closestvaluenumbery);

%%%
waterinitial=waterfinal(closestvaluenumberx);    
Dfinalbatchedvar=zeros(length(newtocalcwater),1);

waterinitial1=zeros(1,length(newtocalcwater)+1);



  waterinitial1(1)=waterinitial;   
nn=1;
for waterfinalloop=newtocalcwater

waterinitial1(nn+1)=waterfinalloop;  
Dfinalbatchedvar(nn)=Dinitialer-((1-(waterfinalloop/waterinitial1(nn)))*10^3)*log(alpha1(nn,1)); 
Dinitialer=Dfinalbatchedvar(nn);
nn=nn+1;

end  


assignin('base','Dfinalbatchedvar',Dfinalbatchedvar); 
Dfinalold=Dfinal(:,closestvaluenumbery);
Dfinalclosetobatchedtaylor=[Dfinalold(1:closestvaluenumberx-1 );Dfinalbatchedvar];
assignin('base','Dfinalclosetobatchedtaylor',Dfinalclosetobatchedtaylor);
waterfinal=[waterfinal(1:closestvaluenumberx-1),newtocalcwater];
assignin('base','waterfinal',waterfinal);



if testyexist
    
    testy=evalin('base','testy');
    testyxrounded=round(testy(:,1)*1000)/1000;                                       
    
interpolwaterval=(min(testyxrounded):0.0001:max(testyxrounded))';
interpolatedvaluesy=interp1(waterfinal,Dfinalclosetobatchedtaylor,interpolwaterval);



indexforwater=zeros(1,length(testyxrounded));

for ismemberreplace=1:length(testyxrounded)
[~, indexforwater(ismemberreplace)]=min(abs(interpolwaterval-testyxrounded(ismemberreplace)));   %%find minimum difference between searched value and data values ('~' for saving it as the location/place of the data), watercontent always descends, no double value are found
end



valuesytocompare=interpolatedvaluesy(indexforwater);



Rfactorm=corr(valuesytocompare,testy(:,2))^2;
adjRfactorm=1-(1-Rfactorm)*((length(valuesytocompare)-1)/(length(valuesytocompare)-1-1));
RMSEval=rms(valuesytocompare-testy(:,2));                                     

if isnan(Rfactorm)
    rightinterpreter= struct('WindowStyle','modal',...                      
              'Interpreter','tex');
    errordlg('For R^{2} the calculated values are required to portray all sample data. Example: With a step size of 0.1 set lowest bulk water content as 0.001 and initial bulk water content as 4.001 instead of 4 ','Error'...
        ,rightinterpreter);   
end

assignin('base','adjRfactorm',adjRfactorm);

assignin('base','RMSEval',RMSEval);

assignin('base','Rfactorm',Rfactorm);

Rsuperstring=('R^{2}   =');
Rfactormtostring=num2str(Rfactorm);

stringRfactorm=strcat(Rsuperstring, 32, Rfactormtostring);


adjRsuBstring=('R^{2}_{adj} =');
adjRfactormtostring=num2str(adjRfactorm);
stringadjRfactorm=strcat(adjRsuBstring, 32, adjRfactormtostring);

RMSEpurestring=('RMSE =');  
RMSEpurestringtostring=num2str(RMSEval);
stringRMSEval=strcat(RMSEpurestring, 32, RMSEpurestringtostring);

end





F111=figure(111);set(F111,'name','Selected closed-, to batched-system degassing (variable % water loss) 2D-plot','numbertitle','off');
DOT111=plot(closestvaluex,closestvaluey, 'kx','MarkerSize',10,'LineWidth',3,'DisplayName',Transpointstring);
ylabel('\deltaD in ‰');
xlabel('Bulk water content in wt%');
hold on
LINE111=plot(waterfinal,Dfinalclosetobatchedtaylor,'DisplayName',initialvaluestringclsoedbatchedtaydisplay);
axis([minxax maxxax minyax maxyax]);

if testyexist
    hold on
    R2plot=plot(NaN,NaN,'DisplayName',stringRfactorm, 'linestyle', 'none');
    hold on
  adjR2plot=plot(NaN,NaN,'DisplayName',stringadjRfactorm, 'linestyle', 'none');
  hold on
  RMSEvalplot=plot(NaN,NaN,'DisplayName',stringRMSEval, 'linestyle', 'none');

 legend([LINE111,DOT111,R2plot,adjR2plot,RMSEvalplot],'Location','southeast');          
  
assignin('base','R2plot',R2plot);
assignin('base','adjR2plot',adjR2plot);
assignin('base','RMSEvalplot',RMSEvalplot);


else
legend([LINE111,DOT111],'Location','southeast');  
end

assignin('base','F111',F111);
grid on;
hold off


assignin('base','LINE111',LINE111);							
assignin('base','DOT111',DOT111);
assignin('base','Transpointstring',Transpointstring)

watercontent=waterfinal';
Dfinalclosetobatchedtaylor1=num2cell(Dfinalclosetobatchedtaylor);

watercontent1=num2cell(watercontent);

Dininitialvalue=cell(1,length(watercontent));
for Tablepreploop=1:length(watercontent)
    Dininitialvalue{Tablepreploop}=num2str('');
end

Dininitialvalueemtpy=Dininitialvalue';
Rfactormstringtable=Dininitialvalueemtpy;
adjRfactormstringtable=Dininitialvalueemtpy;
RMSEvalstringtable=Dininitialvalueemtpy;
Dininitialvalueemtpy{closestvaluenumberx}='   Transition point';
Dininitialvalueemtpy{1}=strcat(' TP:', 32, Transpointstrgx,' wt%',',',Transpointstrgy,' ‰');

Dininitialvalue{1}=num2str(initialvalueclosebatchedtaylor);
Dininitialvalue=Dininitialvalue';


if testyexist

Rfactormstringtable{1}=Rfactorm;
adjRfactormstringtable{1}=adjRfactorm;
RMSEvalstringtable{1}=RMSEval;

F319=figure(319);set(F319,'name','Selected closed-, to batched-system degassing (variable % water loss) table (do not copy & paste from here)', ...
    'numbertitle','off','unit','normalized','Position', [0.2 0.2 0.43 0.5]);
deltacode = char(hex2dec('03B4'));                                           %workaround for uitable in next line. Uitable can not read special characters or tex code (\delta), hex2dec translate Unicode into ASCII code which then can be read by char as the special character                                       
Tableclosedbatchetaylor=uitable('Data',[watercontent1,Dfinalclosetobatchedtaylor1,Dininitialvalueemtpy,Dininitialvalue,Rfactormstringtable,adjRfactormstringtable,RMSEvalstringtable],'unit','normalized', ...           %creating a table on a new figure window whereas 'Data' considers the variable inside the next [] as the data it should write, which fills the whole figure  ('unit','normalized','Position', [0 0 1 1])       
'Position', [0 0 1 1],'ColumnName',{'Bulk water content in wt%',[' ',deltacode,'D in ‰'],['        Transition point        '],[' Selected graph initial', 032,deltacode,'D in ‰'], ...       %'ColumnsName', sets the next imnput inside the {} as the column names
['R',char(hex2dec('00B2'))],['adjR',char(hex2dec('00B2'))],['RMSE']});   

else
  F319=figure(319);set(F319,'name','Selected closed-, to batched-system degassing (variable % water loss) table (do not copy & paste from here)','numbertitle','off');
deltacode = char(hex2dec('03B4'));                                          
Tableclosedbatchetaylor=uitable('Data',[watercontent1,Dfinalclosetobatchedtaylor1,Dininitialvalueemtpy,Dininitialvalue],'unit','normalized', ...          
   'Position', [0 0 1 1],'ColumnName',{'Bulk water content in wt%',[deltacode,'D in ‰'],['        Transition point        '],['Selected graph initial', 032,deltacode,'D in ‰']});   
  
    
end



Dataoftable=get(Tableclosedbatchetaylor,'Data');                                   
Columnheader=get(Tableclosedbatchetaylor,'ColumnName');                           

                               
Dataofgraphclosebatchedtaylor=[Columnheader';Dataoftable];




assignin('base','Dataofgraphclosebatchedtaylor',Dataofgraphclosebatchedtaylor);



% --- Executes on button press in deletepolyfitplot.
function deletepolyfitplot_Callback(hObject, eventdata, handles)

Testplot=evalin('base','Testplot');                                                    
delete(Testplot(1))
clear Testplot



% hObject    handle to deletepolyfitplot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in holdonfornextrun.
function holdonfornextrun_Callback(hObject, eventdata, handles)
% hObject    handle to holdonfornextrun (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

HoldONbuttonif=evalin('base','HoldONbuttonif');

if HoldONbuttonif                                                           % if true  this command will be excecuted (d11B calculations)
figure(50)
hold on    
    
else                                                                        % if not true then this command will be excecuted (dD calculations)
    
  figure (1)
hold on  
end       



% --- Executes on button press in Create_excel.
function Create_excel_Callback(hObject, eventdata, handles)
% hObject    handle to Create_excel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

waitbarexcel = waitbar(0,'Saving data...','Name','Excel is being created...');

Datacloseopencalculationeva=evalin( 'base', 'exist(''Dataofgraphcloseopen'',''var'') == 1' );
Datadegassingcalculationeva=evalin( 'base', 'exist(''Dataofgraph'',''var'') == 1' );
Dataclosebatchedcalculationeva=evalin( 'base', 'exist(''Dataofgraphclosebatched'',''var'') == 1' );
Dataclosebatchedopencalculationeva=evalin( 'base', 'exist(''Dataofgraphclosebatchedopenopen'',''var'') == 1' );
Dataclosebatchedtaylorcalculationeva=evalin( 'base', 'exist(''Dataofgraphclosebatchedtaylor'',''var'') == 1' );
existautofuncionused=evalin( 'base', 'exist(''autofuncionused'',''var'') == 1' );




if Datacloseopencalculationeva
     Datacloseopencalculation=evalin('base','Dataofgraphcloseopen');
     [filenamexlswrite, pathnamexlswrite] = uiputfile('*.xls', 'Choose a file name');  
     xlswritefullpath=strcat(pathnamexlswrite,filenamexlswrite);
     xlswrite(xlswritefullpath,Datacloseopencalculation);
   
     Excelprop = actxserver('Excel.Application');                           %defining excel properties
ExcelWorkbookopen = Excelprop.Workbooks.Open(xlswritefullpath);             %open excel defined worksheet
ExcelWorksheet = ExcelWorkbookopen.Sheets.Item(1);                          %selecting first sheet                            
ExcelWorksheet.Columns.Item(1).columnWidth = 22;                            %setting first column width
ExcelWorksheet.Columns.Item(2).columnWidth = 15;                            %setting second column width
ExcelWorksheet.Columns.Item(3).columnWidth = 25;                            %setting third column width
ExcelWorksheet.Columns.Item(4).columnWidth = 25;                            %setting fourth column width
ExcelWorkbookopen.Save;                                                     %save changes
ExcelWorkbookopen.Close;                                                    %close the excel
Excelprop.Quit;                                                             %quit access

     
     elseif  Dataclosebatchedopencalculationeva
    Dataclosebatchedopencalculation=evalin('base','Dataofgraphclosebatchedopenopen');
         [filenamexlswrite, pathnamexlswrite] = uiputfile('*.xls', 'Choose a file name'); 
     xlswritefullpath=strcat(pathnamexlswrite,filenamexlswrite);
     xlswrite(xlswritefullpath,Dataclosebatchedopencalculation);
        
     Excelprop = actxserver('Excel.Application');                           %defining excel properties
ExcelWorkbookopen = Excelprop.Workbooks.Open(xlswritefullpath);             %open excel defined worksheet
ExcelWorksheet = ExcelWorkbookopen.Sheets.Item(1);                          %selecting first sheet                            
ExcelWorksheet.Columns.Item(1).columnWidth = 22;                            %setting first column width
ExcelWorksheet.Columns.Item(2).columnWidth = 15;                            %setting second column width
ExcelWorksheet.Columns.Item(3).columnWidth = 25;                            %setting third column width
ExcelWorksheet.Columns.Item(4).columnWidth = 25;                            %setting fourth column width
ExcelWorkbookopen.Save;                                                     %save changes
ExcelWorkbookopen.Close;                                                    %close the excel
Excelprop.Quit;                                                             %quit access

elseif Datadegassingcalculationeva
    Datadegassingcalculation=evalin('base','Dataofgraph');
         [filenamexlswrite, pathnamexlswrite] = uiputfile('*.xls', 'Choose a file name'); 
     xlswritefullpath=strcat(pathnamexlswrite,filenamexlswrite);
     xlswrite(xlswritefullpath,Datadegassingcalculation);
       
     Excelprop = actxserver('Excel.Application');                           %defining excel properties
ExcelWorkbookopen = Excelprop.Workbooks.Open(xlswritefullpath);             %open excel defined worksheet
ExcelWorksheet = ExcelWorkbookopen.Sheets.Item(1);                          %selecting first sheet                            
ExcelWorksheet.Columns.Item(1).columnWidth = 22;                            %setting first column width
ExcelWorksheet.Columns.Item(2).columnWidth = 15;                            %setting second column width
ExcelWorksheet.Columns.Item(3).columnWidth = 5;                             %setting third column width
ExcelWorksheet.Columns.Item(4).columnWidth = 25;                            %setting fourth column width
ExcelWorkbookopen.Save;                                                     %save changes
ExcelWorkbookopen.Close;                                                    %close the excel
Excelprop.Quit;                                                             %quit access

elseif Dataclosebatchedcalculationeva
    Dataclosebatchedcalculation=evalin('base','Dataofgraphclosebatched');
         [filenamexlswrite, pathnamexlswrite] = uiputfile('*.xls', 'Choose a file name'); 
     xlswritefullpath=strcat(pathnamexlswrite,filenamexlswrite);
     xlswrite(xlswritefullpath,Dataclosebatchedcalculation);
   
     Excelprop = actxserver('Excel.Application');                           %defining excel properties
ExcelWorkbookopen = Excelprop.Workbooks.Open(xlswritefullpath);             %open excel defined worksheet
ExcelWorksheet = ExcelWorkbookopen.Sheets.Item(1);                          %selecting first sheet                            
ExcelWorksheet.Columns.Item(1).columnWidth = 22;                            %setting first column width
ExcelWorksheet.Columns.Item(2).columnWidth = 15;                            %setting second column width
ExcelWorksheet.Columns.Item(3).columnWidth = 25;                            %setting third column width
ExcelWorksheet.Columns.Item(4).columnWidth = 25;                            %setting fourth column width
ExcelWorkbookopen.Save;                                                     %save changes
ExcelWorkbookopen.Close;                                                    %close the excel
Excelprop.Quit;                                                             %quit access



elseif Dataclosebatchedtaylorcalculationeva
    Dataclosebatchedtaylorcalculation=evalin('base','Dataofgraphclosebatchedtaylor');
         [filenamexlswrite, pathnamexlswrite] = uiputfile('*.xls', 'Choose a file name'); 
     xlswritefullpath=strcat(pathnamexlswrite,filenamexlswrite);
     xlswrite(xlswritefullpath,Dataclosebatchedtaylorcalculation);
   
     Excelprop = actxserver('Excel.Application');                           %defining excel properties
ExcelWorkbookopen = Excelprop.Workbooks.Open(xlswritefullpath);             %open excel defined worksheet
ExcelWorksheet = ExcelWorkbookopen.Sheets.Item(1);                          %selecting first sheet                            
ExcelWorksheet.Columns.Item(1).columnWidth = 22;                            %setting first column width
ExcelWorksheet.Columns.Item(2).columnWidth = 15;                            %setting second column width
ExcelWorksheet.Columns.Item(3).columnWidth = 25;                            %setting third column width
ExcelWorksheet.Columns.Item(4).columnWidth = 25;                            %setting fourth column width
ExcelWorkbookopen.Save;                                                     %save changes
ExcelWorkbookopen.Close;                                                    %close the excel
Excelprop.Quit;                                                             %quit access



     elseif  existautofuncionused
    Dataofgraphopen=evalin('base','Dataofgraphopen');
    Dataofgraphclosed=evalin('base','Dataofgraphclosed');
    Dataofgraphbatched=evalin('base','Dataofgraphbatched');
    Dataofgraphbatchedvariable=evalin('base','Dataofgraphbatchedvariable');
    Dataofgraphclosedtoopenauto=evalin('base','Dataofgraphclosedtoopenauto');
    Dataofgraphclosedtobatchedauto=evalin('base','Dataofgraphclosedtobatchedauto');
    Dataofgraphclosebatchedautovariable=evalin('base','Dataofgraphclosebatchedautovariable');

     warning( 'off', 'MATLAB:xlswrite:AddSheet' ) ;
    
    
         [filenamexlswrite, pathnamexlswrite] = uiputfile('*.xls', 'Choose a file name'); 
     xlswritefullpath=strcat(pathnamexlswrite,filenamexlswrite);
     
     xlswrite(xlswritefullpath,Dataofgraphopen,2);
        
     Excelprop = actxserver('Excel.Application');                           %defining excel properties
ExcelWorkbookopen = Excelprop.Workbooks.Open(xlswritefullpath);             %open excel defined worksheet
ExcelWorksheet = ExcelWorkbookopen.Sheets.Item(2);                          %selecting first sheet     
ExcelWorkbookopen.Sheets.Item(2).Name = 'Open';   %rename  sheet
ExcelWorksheet.Columns.Item(1).columnWidth = 22;                            %setting first column width
ExcelWorksheet.Columns.Item(2).columnWidth = 15;                            %setting second column width
ExcelWorksheet.Columns.Item(3).columnWidth = 25;                            %setting third column width
ExcelWorkbookopen.Save;                                                     %save changes
ExcelWorkbookopen.Close;                                                    %close the excel
Excelprop.Quit;                                                             %quit access


    xlswrite(xlswritefullpath,Dataofgraphclosed,1);
        
     Excelprop = actxserver('Excel.Application');                           %defining excel properties
ExcelWorkbookopen = Excelprop.Workbooks.Open(xlswritefullpath);             %open excel defined worksheet
ExcelWorksheet = ExcelWorkbookopen.Sheets.Item(1);                          %selecting first sheet    
ExcelWorkbookopen.Sheets.Item(1).Name = 'Closed';   %rename  sheet
ExcelWorksheet.Columns.Item(1).columnWidth = 22;                            %setting first column width
ExcelWorksheet.Columns.Item(2).columnWidth = 15;                            %setting second column width
ExcelWorksheet.Columns.Item(3).columnWidth = 25;                            %setting third column width
ExcelWorkbookopen.Save;                                                     %save changes
ExcelWorkbookopen.Close;                                                    %close the excel
Excelprop.Quit;                                                             %quit access


    xlswrite(xlswritefullpath,Dataofgraphbatched,3);
        
     Excelprop = actxserver('Excel.Application');                           %defining excel properties
ExcelWorkbookopen = Excelprop.Workbooks.Open(xlswritefullpath);             %open excel defined worksheet
ExcelWorksheet = ExcelWorkbookopen.Sheets.Item(3);                          %selecting first sheet     
ExcelWorkbookopen.Sheets.Item(3).Name = 'Batched';   %rename  sheet
ExcelWorksheet.Columns.Item(1).columnWidth = 22;                            %setting first column width
ExcelWorksheet.Columns.Item(2).columnWidth = 15;                            %setting second column width
ExcelWorksheet.Columns.Item(3).columnWidth = 25;                            %setting third column width
ExcelWorkbookopen.Save;                                                     %save changes
ExcelWorkbookopen.Close;                                                    %close the excel
Excelprop.Quit;                                                             %quit access

    xlswrite(xlswritefullpath,Dataofgraphbatchedvariable,4);
        
     Excelprop = actxserver('Excel.Application');                           %defining excel properties
ExcelWorkbookopen = Excelprop.Workbooks.Open(xlswritefullpath);             %open excel defined worksheet
ExcelWorksheet = ExcelWorkbookopen.Sheets.Item(4);                          %selecting first sheet 
ExcelWorkbookopen.Sheets.Item(4).Name = 'Batched (variable step size)';   %rename  sheet
ExcelWorksheet.Columns.Item(1).columnWidth = 22;                            %setting first column width
ExcelWorksheet.Columns.Item(2).columnWidth = 15;                            %setting second column width
ExcelWorksheet.Columns.Item(3).columnWidth = 25;                            %setting third column width
ExcelWorksheet.Columns.Item(4).columnWidth = 21.1;                            %setting fourth column width
ExcelWorkbookopen.Save;                                                     %save changes
ExcelWorkbookopen.Close;                                                    %close the excel
Excelprop.Quit;                                                             %quit access

    xlswrite(xlswritefullpath,Dataofgraphclosedtoopenauto,5);
        
     Excelprop = actxserver('Excel.Application');                           %defining excel properties
ExcelWorkbookopen = Excelprop.Workbooks.Open(xlswritefullpath);             %open excel defined worksheet
ExcelWorksheet = ExcelWorkbookopen.Sheets.Item(5);                          %selecting first sheet 
ExcelWorkbookopen.Sheets.Item(5).Name = 'Closed-, to open';   %rename  sheet
ExcelWorksheet.Columns.Item(1).columnWidth = 22;                            %setting first column width
ExcelWorksheet.Columns.Item(2).columnWidth = 15;                            %setting second column width
ExcelWorksheet.Columns.Item(3).columnWidth = 25;                            %setting third column width
ExcelWorksheet.Columns.Item(4).columnWidth = 21;                            %setting fourth column width
ExcelWorkbookopen.Save;                                                     %save changes
ExcelWorkbookopen.Close;                                                    %close the excel
Excelprop.Quit;                                                             %quit access

    xlswrite(xlswritefullpath,Dataofgraphclosedtobatchedauto,6);
        
     Excelprop = actxserver('Excel.Application');                           %defining excel properties
ExcelWorkbookopen = Excelprop.Workbooks.Open(xlswritefullpath);             %open excel defined worksheet
ExcelWorksheet = ExcelWorkbookopen.Sheets.Item(6);                          %selecting first sheet 
ExcelWorkbookopen.Sheets.Item(6).Name = 'Closed-, to batched';   %rename  sheet
ExcelWorksheet.Columns.Item(1).columnWidth = 22;                            %setting first column width
ExcelWorksheet.Columns.Item(2).columnWidth = 15;                            %setting second column width
ExcelWorksheet.Columns.Item(3).columnWidth = 25;                            %setting third column width
ExcelWorksheet.Columns.Item(4).columnWidth = 21;                            %setting fourth column width
ExcelWorkbookopen.Save;                                                     %save changes
ExcelWorkbookopen.Close;                                                    %close the excel
Excelprop.Quit;                                                             %quit access

    xlswrite(xlswritefullpath,Dataofgraphclosebatchedautovariable,7);
        
     Excelprop = actxserver('Excel.Application');                           %defining excel properties
ExcelWorkbookopen = Excelprop.Workbooks.Open(xlswritefullpath);             %open excel defined worksheet
ExcelWorksheet = ExcelWorkbookopen.Sheets.Item(7);                          %selecting first sheet
ExcelWorkbookopen.Sheets.Item(7).Name = 'Closed-, to batched (variable)';   %rename  sheet
ExcelWorksheet.Columns.Item(1).columnWidth = 22;                            %setting first column width
ExcelWorksheet.Columns.Item(2).columnWidth = 15;                            %setting second column width
ExcelWorksheet.Columns.Item(3).columnWidth = 25;                            %setting third column width
ExcelWorksheet.Columns.Item(4).columnWidth = 21.1;                            %setting fourth column width
ExcelWorksheet.Columns.Item(5).columnWidth = 21;   
ExcelWorkbookopen.Save;                                                     %save changes
ExcelWorkbookopen.Close;                                                    %close the excel
Excelprop.Quit;                                                             %quit access
delete(Excelprop)




end
waitbar(1,waitbarexcel,'Finishing...');
pause(2)

if ishandle(waitbarexcel)                                                   %ishandle only checks the existence of a figure. If it is closed or not avaiable, the output value is a logical 0 which is a false. In an if loop a false does not excecute the code inside
close(waitbarexcel)
end   


function percentwaterlossscndstage_Callback(hObject, eventdata, handles)
% hObject    handle to percentwaterlossscndstage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Percentwaterlossscndstagevar=str2double(get(hObject,'String'));                                                            
assignin('base','Percentwaterlossscndstagevar',Percentwaterlossscndstagevar);
% Hints: get(hObject,'String') returns contents of percentwaterlossscndstage as text
%        str2double(get(hObject,'String')) returns contents of percentwaterlossscndstage as a double


% --- Executes during object creation, after setting all properties.
function percentwaterlossscndstage_CreateFcn(hObject, eventdata, handles)
% hObject    handle to percentwaterlossscndstage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function FontSizedaxesDitfield_Callback(hObject, eventdata, handles)            %text field which changes the font size of all figures
% hObject    handle to FontSizedaxesDitfield (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


Fontsizeofuserrr=str2double(get(hObject,'String'));                        %get(hObject),'String') grabs the still in string format value the user put in the field, str2double translates the string value into a real number value for the program to use                                                         

existF1=evalin( 'base', 'exist(''F1'',''var'') == 1' );




if existF1
F1=evalin('base','F1');                                                     %excecuting variable on base workspace and saving it in function 
F2=evalin('base','F2');     
F3=evalin('base','F3');     

if ishandle(F1)                                                            %ishandle only checks the existence of a figure. If it is closed or not avaiable, the output value is a logical 0 which is a false. In an if loop a false does not excecute the code inside
figure(1);                                                                 %
 set(findall(gca,'type','Axes'),'FontSize',Fontsizeofuserrr);                                                     %this line sets the desired font size for all fonts inside the active figure. "gca" access the current axes handle in which the property "FontSize" is adressed. With "findall()" all properties of FontSize within a figure are adressed and these are set with "set(...., 'FontSize',Fontsizeofuserrr)
end

if ishandle(F2)
figure(2);
 set(findall(gca,'type','Axes'),'FontSize',Fontsizeofuserrr);
end

if ishandle(F3)
figure(3);
 set(findall(gca,'type','Axes'),'FontSize',Fontsizeofuserrr);
end
end

existF100=evalin( 'base', 'exist(''F100'',''var'') == 1' );
existF111=evalin( 'base', 'exist(''F111'',''var'') == 1' );
existF1112=evalin( 'base', 'exist(''F1112'',''var'') == 1' );

if existF100 && existF111
    
    F100=evalin('base','F100');  
    F111=evalin('base','F111'); 
    
    if ishandle(F100)
figure(100);
 set(findall(gca,'type','Axes'),'FontSize',Fontsizeofuserrr);
    end
    
    if ishandle(F111)
figure(111);
 set(findall(gca,'type','Axes'),'FontSize',Fontsizeofuserrr);
    end

elseif ~existF100 && ~existF1112 && existF111	
    
    F111=evalin('base','F111');  
    
    if ishandle(F111)
figure(111); 
set(findall(gca,'type','Axes'),'FontSize',Fontsizeofuserrr);
end
    
elseif existF1112
    
    F100=evalin('base','F100'); 
    F111=evalin('base','F111'); 
    F1112=evalin('base','F1112'); 
    
    if ishandle(F100)
figure(100);
 set(findall(gca,'type','Axes'),'FontSize',Fontsizeofuserrr);
    end
    
    if ishandle(F111)
figure(111);
 set(findall(gca,'type','Axes'),'FontSize',Fontsizeofuserrr);
    end
    
    if ishandle(F1112)
figure(1112);
 set(findall(gca,'type','Axes'),'FontSize',Fontsizeofuserrr);
    end
  
    
end
    
    
    
existautof=evalin( 'base', 'exist(''autofuncionused'',''var'') == 1' );
 
if existautof
  
    F1334=evalin('base','F1334'); 
    F1338=evalin('base','F1338'); 
    F1339=evalin('base','F1339'); 
      
    F1256=evalin('base','F1256'); 
    F15687=evalin('base','F15687'); 
    F16687=evalin('base','F16687'); 
      
    F11265=evalin('base','F11265'); 
   
      
          if ishandle(F1334)
figure(1334);
 set(findall(gca,'type','Axes'),'FontSize',Fontsizeofuserrr);
          end
    
    if ishandle(F1338)
figure(1338);
 set(findall(gca,'type','Axes'),'FontSize',Fontsizeofuserrr);
    end
    
    if ishandle(F1339)
figure(1339);
 set(findall(gca,'type','Axes'),'FontSize',Fontsizeofuserrr);
    end
    
    if ishandle(F1256)
figure(1256);
 set(findall(gca,'type','Axes'),'FontSize',Fontsizeofuserrr);
    end
    
    if ishandle(F15687)
figure(15687);
 set(findall(gca,'type','Axes'),'FontSize',Fontsizeofuserrr);
    end
    if ishandle(F16687)
figure(16687);
 set(findall(gca,'type','Axes'),'FontSize',Fontsizeofuserrr);
    end
    
    if ishandle(F11265)
figure(11265);
 set(findall(gca,'type','Axes'),'FontSize',Fontsizeofuserrr);
    end

  end
    
    existF57789=evalin( 'base', 'exist(''F57789'',''var'') == 1' );

   if existF57789 
    
        F57789=evalin('base','F57789'); 
        sub111=evalin('base','sub111'); 
        sub212=evalin('base','sub212'); 


assignin('base','sub111',sub111);

   if ishandle(F57789)
figure(57789);
set(findall(sub111,'type','Axes'),'FontSize',Fontsizeofuserrr);
set(findall(sub212,'type','Axes'),'FontSize',Fontsizeofuserrr);
    end
    
   end
    
    





% Hints: get(hObject,'String') returns contents of FontSizedaxesDitfield as text
%        str2double(get(hObject,'String')) returns contents of FontSizedaxesDitfield as a double


% --- Executes during object creation, after setting all properties.
function FontSizedaxesDitfield_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FontSizedaxesDitfield (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Plotowndataintofinishedplot11B.
function Plotowndataintofinishedplot11B_Callback(hObject, eventdata, handles)
% hObject    handle to Plotowndataintofinishedplot11B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
existfullpathB=evalin( 'base', 'exist(''fullpathB'',''var'') == 1' );

if existfullpathB
    
LINE9111=evalin('base','LINE9111');                                  
fullpathB=evalin('base','fullpathB');
existpolydegreeB=evalin( 'base', 'exist(''polydegreeB'',''var'') == 1' );     
ExistingDOT9111=evalin( 'base', 'exist(''DOT9111'',''var'') == 1' );
ExistBchosen=evalin( 'base', 'exist(''Bchosen'',''var'') == 1' );
ExistR2plotB=evalin( 'base', 'exist(''R2plotB'',''var'') == 1' );


if existpolydegreeB                                                         
     polydegreeB=evalin('base','polydegreeB');                                
else                                                                        
    polydegreeB=2;
end          


testyB=xlsread(fullpathB);                                                                                                    
polyfitdataB=polyfit(testyB(:,1),testyB(:,2),polydegreeB);                      
mintestB=min(testyB(:,1));                                                    
maxtestB=max(testyB(:,1));                                                    
polyfitdatafinerB=linspace(mintestB,maxtestB);                                 
fB = polyval(polyfitdataB,polyfitdatafinerB);      

figure(9111);
hold on
testpointsB=plot(testyB(:,1),testyB(:,2),'r.','MarkerSize',10,'DisplayName','Sample data');
hold on 
TestplotB=plot(polyfitdatafinerB,fB,'k','DisplayName','Polyfittedplot');  
hold off
if ExistingDOT9111  && ExistR2plotB                                           
    DOT9111=evalin('base','DOT9111'); 
    R2plotB=evalin('base','R2plotB'); 
    adjR2plotB=evalin('base','adjR2plotB'); 
   RMSEvalplotB=evalin('base','RMSEvalplotB'); 

legend([testpointsB,TestplotB,LINE9111,DOT9111,R2plotB,adjR2plotB,RMSEvalplotB],'Location','southeast');

elseif ExistingDOT9111  && ~ExistR2plotB                                       
        DOT9111=evalin('base','DOT9111'); 
ExistingBfinalclosetobatched=evalin( 'base', 'exist(''Bfinalclosetobatched'',''var'') == 1' );
ExistinngBfinalclosetoopentrans=evalin( 'base', 'exist(''Bfinalclosetoopentrans'',''var'') == 1' );
ExistingBfinalclosetobatchedtaylor=evalin( 'base', 'exist(''Bfinalclosetobatchedtaylor'',''var'') == 1' );
Bppmxfinal=evalin('base','Bppmxfinal');                                  


        
        
        
        
      testyBxrounded=round(testyB(:,1)*1000)/1000;   
                                    
    
interpolBoronval=(min(testyBxrounded):0.0001:max(testyBxrounded))';



if ExistingBfinalclosetobatched  
    
 Bfinalclosetobatched=evalin('base','Bfinalclosetobatched'); 

interpolatedvaluesyB=interp1(Bppmxfinal,Bfinalclosetobatched,interpolBoronval);

elseif ExistinngBfinalclosetoopentrans 
 Bfinalclosetoopentrans=evalin('base','Bfinalclosetoopentrans'); 

interpolatedvaluesyB=interp1(Bppmxfinal,Bfinalclosetoopentrans,interpolBoronval);


elseif ExistingBfinalclosetobatchedtaylor 
 Bfinalclosetobatchedtaylor=evalin('base','Bfinalclosetobatchedtaylor'); 

interpolatedvaluesyB=interp1(Bppmxfinal,Bfinalclosetobatchedtaylor,interpolBoronval);


end

indexforBoron=zeros(1,length(testyBxrounded));

for ismemberreplaceB=1:length(testyBxrounded)
[~, indexforBoron(ismemberreplaceB)]=min(abs(interpolBoronval-testyBxrounded(ismemberreplaceB)));   %%find minimum difference between searched value and data values ('~' for saving it as the location/place of the data), watercontent always descends, no double value are found
end


valuesytocompare=interpolatedvaluesyB(indexforBoron);


RfactormB=corr(valuesytocompare,testyB(:,2))^2;
adjRfactormB=1-(1-RfactormB)*((length(valuesytocompare)-1)/(length(valuesytocompare)-1-1));
RMSEvalB=rms(valuesytocompare-testyB(:,2));                                     

if isnan(RfactormB)
    rightinterpreterB= struct('WindowStyle','modal',...                      
              'Interpreter','tex');
    errordlg('For R^{2} the calculated values are required to portray all sample data. Example: With a step size of 1 set lowest boron concentration as 0.001 and initial boron concentration as 120.001 instead of 120 ','Error'...
        ,rightinterpreterB);   
end

assignin('base','adjRfactormB',adjRfactormB);
assignin('base','RMSEvalB',RMSEvalB);
assignin('base','RfactormB',RfactormB);

RsuperstringB=('R^{2}   =');
RfactormtostringB=num2str(RfactormB);

stringRfactormB=strcat(RsuperstringB, 32, RfactormtostringB);


adjRsuBstringB=('R^{2}_{adj} =');
adjRfactormtostringB=num2str(adjRfactormB);
stringadjRfactormB=strcat(adjRsuBstringB, 32, adjRfactormtostringB);

RMSEpurestringB=('RMSE =');  
RMSEpurestringtostringB=num2str(RMSEvalB);
stringRMSEvalB=strcat(RMSEpurestringB, 32, RMSEpurestringtostringB);




figure(9111)
    hold on
    R2plotB=plot(NaN,NaN,'DisplayName',stringRfactormB, 'linestyle', 'none');
    hold on
  adjR2plotB=plot(NaN,NaN,'DisplayName',stringadjRfactormB, 'linestyle', 'none');
 hold on
  RMSEvalplotB=plot(NaN,NaN,'DisplayName',stringRMSEvalB, 'linestyle', 'none');
  
 legend([LINE9111,DOT9111,testpointsB,TestplotB,R2plotB,adjR2plotB,RMSEvalplotB],'Location','southeast');          
  assignin('base','R2plotB',R2plotB);
assignin('base','adjR2plotB',adjR2plotB);
  assignin('base','RMSEvalplotB',RMSEvalplotB);

hold off
    

    

elseif ExistBchosen && ExistR2plotB
     R2plotB=evalin('base','R2plotB'); 
    adjR2plotB=evalin('base','adjR2plotB'); 

legend([LINE9111,testpointsB,TestplotB,R2plotB,adjR2plotB],'Location','southeast');

elseif ExistBchosen && ~ExistR2plotB
    Bppmxfinal=evalin('base','Bppmxfinal');                                  
Bchosen=evalin('base','Bchosen');                                  

   
     testyBxrounded=round(testyB(:,1)*1000)/1000;                                      
 
interpolBoronval=(min(testyBxrounded):0.0001:max(testyBxrounded))';
interpolatedvaluesyB=interp1(Bppmxfinal,Bchosen,interpolBoronval);





indexforBoron=zeros(1,length(testyBxrounded));

for ismemberreplaceB=1:length(testyBxrounded)
[~, indexforBoron(ismemberreplaceB)]=min(abs(interpolBoronval-testyBxrounded(ismemberreplaceB)));   %%find minimum difference between searched value and data values ('~' for saving it as the location/place of the data), watercontent always descends, no double value are found
end





valuesytocompare=interpolatedvaluesyB(indexforBoron);



RfactormB=corr(valuesytocompare,testyB(:,2))^2;
adjRfactormB=1-(1-RfactormB)*((length(valuesytocompare)-1)/(length(valuesytocompare)-1-1));
RMSEvalB=rms(valuesytocompare-testyB(:,2));                                     

if isnan(RfactormB)
    rightinterpreterB= struct('WindowStyle','modal',...                      
              'Interpreter','tex');
    errordlg('For R^{2} the calculated values are required to portray all sample data. Example: With a step size of 1 set lowest boron concentration as 0.001 and initial boron concentration as 120.001 instead of 120 ','Error'...
        ,rightinterpreterB);   
end

assignin('base','adjRfactormB',adjRfactormB);
assignin('base','RMSEvalB',RMSEvalB);
assignin('base','RfactormB',RfactormB);


RsuperstringB=('R^{2}   =');
RfactormtostringB=num2str(RfactormB);

stringRfactormB=strcat(RsuperstringB, 32, RfactormtostringB);


adjRsuBstringB=('R^{2}_{adj} =');
adjRfactormtostringB=num2str(adjRfactormB);
stringadjRfactormB=strcat(adjRsuBstringB, 32, adjRfactormtostringB);

RMSEpurestringB=('RMSE =');  
RMSEpurestringtostringB=num2str(RMSEvalB);
stringRMSEvalB=strcat(RMSEpurestringB, 32, RMSEpurestringtostringB);




figure(9111);
    hold on
    R2plotB=plot(NaN,NaN,'DisplayName',stringRfactormB, 'linestyle', 'none');
    hold on
  adjR2plotB=plot(NaN,NaN,'DisplayName',stringadjRfactormB, 'linestyle', 'none');
 hold on
  RMSEvalplotB=plot(NaN,NaN,'DisplayName',stringRMSEvalB, 'linestyle', 'none');
  
 legend([LINE9111,testpointsB,TestplotB,R2plotB,adjR2plotB,RMSEvalplotB],'Location','southeast');          
  assignin('base','R2plotB',R2plotB);
assignin('base','adjR2plotB',adjR2plotB);
hold off

end
assignin('base','testpointsB',testpointsB);
assignin('base','TestplotB',TestplotB);
assignin('base','testyB',testyB);

else
     errordlg(strcat('Input a prepared excel with sample data first by pressing Input Excel'),'Error'); 


end
 

    


% --- Executes on button press in Create_excel11B.
function Create_excel11B_Callback(hObject, eventdata, handles)
% hObject    handle to Create_excel11B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
waitbarexcel = waitbar(0,'Saving data...','Name','Excel is being created...');

DatacloseopencalculationevaB=evalin( 'base', 'exist(''DataofgraphcloseopenB'',''var'') == 1' );
DatadegassingcalculationevaB=evalin( 'base', 'exist(''DataofgraphB'',''var'') == 1' );
DataclosebatchedcalculationevaB=evalin( 'base', 'exist(''DataofgraphclosebatchedB'',''var'') == 1' );
DataclosebatchedtaylorcalculationevaB=evalin( 'base', 'exist(''DataofgraphclosebatchedtaylorB'',''var'') == 1' );
existautofuncionusedB=evalin( 'base', 'exist(''autofuncionusedB'',''var'') == 1' );




if DatacloseopencalculationevaB
     DatacloseopenBcalculation=evalin('base','DataofgraphcloseopenB');
     [filenamexlswrite, pathnamexlswrite] = uiputfile('*.xls', 'Choose a file name');  
     xlswritefullpath=strcat(pathnamexlswrite,filenamexlswrite);
     xlswrite(xlswritefullpath,DatacloseopenBcalculation);
   
     Excelprop = actxserver('Excel.Application');                           %defining excel properties
ExcelWorkbookopen = Excelprop.Workbooks.Open(xlswritefullpath);             %open excel defined worksheet
ExcelWorksheet = ExcelWorkbookopen.Sheets.Item(1);                          %selecting first sheet                            
ExcelWorksheet.Columns.Item(1).columnWidth = 24;                            %setting first column width
ExcelWorksheet.Columns.Item(2).columnWidth = 15;                            %setting second column width
ExcelWorksheet.Columns.Item(3).columnWidth = 26.5;                            %setting third column width
ExcelWorksheet.Columns.Item(4).columnWidth = 26.5;                            %setting fourth column width
ExcelWorkbookopen.Save;                                                     %save changes
ExcelWorkbookopen.Close;                                                    %close the excel
Excelprop.Quit;                                                             %quit access

     
                                    %quit access

elseif DatadegassingcalculationevaB
    DatadegassingcalculationB=evalin('base','DataofgraphB');
         [filenamexlswrite, pathnamexlswrite] = uiputfile('*.xls', 'Choose a file name'); 
     xlswritefullpath=strcat(pathnamexlswrite,filenamexlswrite);
     xlswrite(xlswritefullpath,DatadegassingcalculationB);
       
     Excelprop = actxserver('Excel.Application');                           %defining excel properties
ExcelWorkbookopen = Excelprop.Workbooks.Open(xlswritefullpath);             %open excel defined worksheet
ExcelWorksheet = ExcelWorkbookopen.Sheets.Item(1);                          %selecting first sheet                            
ExcelWorksheet.Columns.Item(1).columnWidth = 24;                            %setting first column width
ExcelWorksheet.Columns.Item(2).columnWidth = 15;                            %setting second column width
ExcelWorksheet.Columns.Item(3).columnWidth = 5;                             %setting third column width
ExcelWorksheet.Columns.Item(4).columnWidth = 26.5;                            %setting fourth column width
ExcelWorkbookopen.Save;                                                     %save changes
ExcelWorkbookopen.Close;                                                    %close the excel
Excelprop.Quit;                                                             %quit access

elseif DataclosebatchedcalculationevaB
    DataclosebatchedcalculationB=evalin('base','DataofgraphclosebatchedB');
         [filenamexlswrite, pathnamexlswrite] = uiputfile('*.xls', 'Choose a file name'); 
     xlswritefullpath=strcat(pathnamexlswrite,filenamexlswrite);
     xlswrite(xlswritefullpath,DataclosebatchedcalculationB);
   
     Excelprop = actxserver('Excel.Application');                           %defining excel properties
ExcelWorkbookopen = Excelprop.Workbooks.Open(xlswritefullpath);             %open excel defined worksheet
ExcelWorksheet = ExcelWorkbookopen.Sheets.Item(1);                          %selecting first sheet                            
ExcelWorksheet.Columns.Item(1).columnWidth = 24;                            %setting first column width
ExcelWorksheet.Columns.Item(2).columnWidth = 15;                            %setting second column width
ExcelWorksheet.Columns.Item(3).columnWidth = 26.5;                            %setting third column width
ExcelWorksheet.Columns.Item(4).columnWidth = 26.5;                            %setting fourth column width
ExcelWorkbookopen.Save;                                                     %save changes
ExcelWorkbookopen.Close;                                                    %close the excel
Excelprop.Quit;                                                             %quit access



elseif DataclosebatchedtaylorcalculationevaB
    DataclosebatchedtaylorcalculationB=evalin('base','DataofgraphclosebatchedtaylorB');
         [filenamexlswrite, pathnamexlswrite] = uiputfile('*.xls', 'Choose a file name'); 
     xlswritefullpath=strcat(pathnamexlswrite,filenamexlswrite);
     xlswrite(xlswritefullpath,DataclosebatchedtaylorcalculationB);
   
     Excelprop = actxserver('Excel.Application');                           %defining excel properties
ExcelWorkbookopen = Excelprop.Workbooks.Open(xlswritefullpath);             %open excel defined worksheet
ExcelWorksheet = ExcelWorkbookopen.Sheets.Item(1);                          %selecting first sheet                            
ExcelWorksheet.Columns.Item(1).columnWidth = 24;                            %setting first column width
ExcelWorksheet.Columns.Item(2).columnWidth = 15;                            %setting second column width
ExcelWorksheet.Columns.Item(3).columnWidth = 26.5;                            %setting third column width
ExcelWorksheet.Columns.Item(4).columnWidth = 26.5;                            %setting fourth column width
ExcelWorkbookopen.Save;                                                     %save changes
ExcelWorkbookopen.Close;                                                    %close the excel
Excelprop.Quit;                                                             %quit access



     elseif  existautofuncionusedB
    DataofgraphopenB=evalin('base','DataofgraphopenB');
    DataofgraphclosedB=evalin('base','DataofgraphclosedB');
    DataofgraphbatchedB=evalin('base','DataofgraphbatchedB');
    DataofgraphbatchedvariableB=evalin('base','DataofgraphbatchedvariableB');
    DataofgraphclosedtoopenautoB=evalin('base','DataofgraphclosedtoopenautoB');
    DataofgraphclosedtobatchedautoB=evalin('base','DataofgraphclosedtobatchedautoB');
    DataofgraphclosebatchedautovariableB=evalin('base','DataofgraphclosebatchedautovariableB');

     warning( 'off', 'MATLAB:xlswrite:AddSheet' ) ;
    
    
         [filenamexlswrite, pathnamexlswrite] = uiputfile('*.xls', 'Choose a file name'); 
     xlswritefullpath=strcat(pathnamexlswrite,filenamexlswrite);
     
     xlswrite(xlswritefullpath,DataofgraphopenB,2);
        
     Excelprop = actxserver('Excel.Application');                           %defining excel properties
ExcelWorkbookopen = Excelprop.Workbooks.Open(xlswritefullpath);             %open excel defined worksheet
ExcelWorksheet = ExcelWorkbookopen.Sheets.Item(2);                          %selecting first sheet     
ExcelWorkbookopen.Sheets.Item(2).Name = 'Open';   %rename  sheet
ExcelWorksheet.Columns.Item(1).columnWidth = 24;                            %setting first column width
ExcelWorksheet.Columns.Item(2).columnWidth = 15;                            %setting second column width
ExcelWorksheet.Columns.Item(3).columnWidth = 26.5;                            %setting third column width
ExcelWorkbookopen.Save;                                                     %save changes
ExcelWorkbookopen.Close;                                                    %close the excel
Excelprop.Quit;                                                             %quit access


    xlswrite(xlswritefullpath,DataofgraphclosedB,1);
        
     Excelprop = actxserver('Excel.Application');                           %defining excel properties
ExcelWorkbookopen = Excelprop.Workbooks.Open(xlswritefullpath);             %open excel defined worksheet
ExcelWorksheet = ExcelWorkbookopen.Sheets.Item(1);                          %selecting first sheet    
ExcelWorkbookopen.Sheets.Item(1).Name = 'Closed';   %rename  sheet
ExcelWorksheet.Columns.Item(1).columnWidth = 24;                            %setting first column width
ExcelWorksheet.Columns.Item(2).columnWidth = 15;                            %setting second column width
ExcelWorksheet.Columns.Item(3).columnWidth = 26.5;                            %setting third column width
ExcelWorkbookopen.Save;                                                     %save changes
ExcelWorkbookopen.Close;                                                    %close the excel
Excelprop.Quit;                                                             %quit access


    xlswrite(xlswritefullpath,DataofgraphbatchedB,3);
        
     Excelprop = actxserver('Excel.Application');                           %defining excel properties
ExcelWorkbookopen = Excelprop.Workbooks.Open(xlswritefullpath);             %open excel defined worksheet
ExcelWorksheet = ExcelWorkbookopen.Sheets.Item(3);                          %selecting first sheet     
ExcelWorkbookopen.Sheets.Item(3).Name = 'Batched';   %rename  sheet
ExcelWorksheet.Columns.Item(1).columnWidth = 24;                            %setting first column width
ExcelWorksheet.Columns.Item(2).columnWidth = 15;                            %setting second column width
ExcelWorksheet.Columns.Item(3).columnWidth = 26.5;                            %setting third column width
ExcelWorkbookopen.Save;                                                     %save changes
ExcelWorkbookopen.Close;                                                    %close the excel
Excelprop.Quit;                                                             %quit access

    xlswrite(xlswritefullpath,DataofgraphbatchedvariableB,4);
        
     Excelprop = actxserver('Excel.Application');                           %defining excel properties
ExcelWorkbookopen = Excelprop.Workbooks.Open(xlswritefullpath);             %open excel defined worksheet
ExcelWorksheet = ExcelWorkbookopen.Sheets.Item(4);                          %selecting first sheet 
ExcelWorkbookopen.Sheets.Item(4).Name = 'Batched (variable step size)';   %rename  sheet
ExcelWorksheet.Columns.Item(1).columnWidth = 24;                            %setting first column width
ExcelWorksheet.Columns.Item(2).columnWidth = 15;                            %setting second column width
ExcelWorksheet.Columns.Item(3).columnWidth = 26.5;                            %setting third column width
ExcelWorksheet.Columns.Item(4).columnWidth = 21.1;                            %setting fourth column width
ExcelWorkbookopen.Save;                                                     %save changes
ExcelWorkbookopen.Close;                                                    %close the excel
Excelprop.Quit;                                                             %quit access

    xlswrite(xlswritefullpath,DataofgraphclosedtoopenautoB,5);
        
     Excelprop = actxserver('Excel.Application');                           %defining excel properties
ExcelWorkbookopen = Excelprop.Workbooks.Open(xlswritefullpath);             %open excel defined worksheet
ExcelWorksheet = ExcelWorkbookopen.Sheets.Item(5);                          %selecting first sheet 
ExcelWorkbookopen.Sheets.Item(5).Name = 'Closed-, to open';   %rename  sheet
ExcelWorksheet.Columns.Item(1).columnWidth = 24;                            %setting first column width
ExcelWorksheet.Columns.Item(2).columnWidth = 15;                            %setting second column width
ExcelWorksheet.Columns.Item(3).columnWidth = 26.5;                            %setting third column width
ExcelWorksheet.Columns.Item(4).columnWidth = 21;                            %setting fourth column width
ExcelWorkbookopen.Save;                                                     %save changes
ExcelWorkbookopen.Close;                                                    %close the excel
Excelprop.Quit;                                                             %quit access

    xlswrite(xlswritefullpath,DataofgraphclosedtobatchedautoB,6);
        
     Excelprop = actxserver('Excel.Application');                           %defining excel properties
ExcelWorkbookopen = Excelprop.Workbooks.Open(xlswritefullpath);             %open excel defined worksheet
ExcelWorksheet = ExcelWorkbookopen.Sheets.Item(6);                          %selecting first sheet 
ExcelWorkbookopen.Sheets.Item(6).Name = 'Closed-, to batched';   %rename  sheet
ExcelWorksheet.Columns.Item(1).columnWidth = 24;                            %setting first column width
ExcelWorksheet.Columns.Item(2).columnWidth = 15;                            %setting second column width
ExcelWorksheet.Columns.Item(3).columnWidth = 26.5;                            %setting third column width
ExcelWorksheet.Columns.Item(4).columnWidth = 21;                            %setting fourth column width
ExcelWorkbookopen.Save;                                                     %save changes
ExcelWorkbookopen.Close;                                                    %close the excel
Excelprop.Quit;                                                             %quit access

    xlswrite(xlswritefullpath,DataofgraphclosebatchedautovariableB,7);
        
     Excelprop = actxserver('Excel.Application');                           %defining excel properties
ExcelWorkbookopen = Excelprop.Workbooks.Open(xlswritefullpath);             %open excel defined worksheet
ExcelWorksheet = ExcelWorkbookopen.Sheets.Item(7);                          %selecting first sheet
ExcelWorkbookopen.Sheets.Item(7).Name = 'Closed-, to batched (variable)';   %rename  sheet
ExcelWorksheet.Columns.Item(1).columnWidth = 24;                            %setting first column width
ExcelWorksheet.Columns.Item(2).columnWidth = 15;                            %setting second column width
ExcelWorksheet.Columns.Item(3).columnWidth = 26.5;                            %setting third column width
ExcelWorksheet.Columns.Item(4).columnWidth = 21.1;                            %setting fourth column width
ExcelWorksheet.Columns.Item(5).columnWidth = 21;   
ExcelWorkbookopen.Save;                                                     %save changes
ExcelWorkbookopen.Close;                                                    %close the excel
Excelprop.Quit;                                                             %quit access
delete(Excelprop)




end
waitbar(1,waitbarexcel,'Finishing...');
pause(2)

if ishandle(waitbarexcel)                                                   %ishandle only checks the existence of a figure. If it is closed or not avaiable, the output value is a logical 0 which is a false. In an if loop a false does not excecute the code inside
close(waitbarexcel)
end   














function SetFontSizeaxes11B_Callback(hObject, eventdata, handles)
% hObject    handle to SetFontSizeaxes11B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fontsizechosend11B=str2double(get(hObject,'String'));  
existF50=evalin( 'base', 'exist(''F50'',''var'') == 1' );


if existF50
F50=evalin('base','F50');                                                     %excecuting variable on base workspace and saving it in function 
F51=evalin('base','F51');     
F52=evalin('base','F52');     

if ishandle(F50)                                                            %ishandle only checks the existence of a figure. If it is closed or not avaiable, the output value is a logical 0 which is a false. In an if loop a false does not excecute the code inside
figure(50);                                                                 %
 set(findall(gca,'type','Axes'),'FontSize',Fontsizechosend11B);
end

if ishandle(F51)
figure(51);
 set(findall(gca,'type','Axes'),'FontSize',Fontsizechosend11B);
end

if ishandle(F52)
figure(F52);
 set(findall(gca,'type','Axes'),'FontSize',Fontsizechosend11B);
end
end

existF9100=evalin( 'base', 'exist(''F9100'',''var'') == 1' );
existF9111=evalin( 'base', 'exist(''F9111'',''var'') == 1' );


if existF9100 && existF9111
    
    F9100=evalin('base','F9100');  
    F9111=evalin('base','F9111'); 
    
    if ishandle(F9100)
figure(F9100);
 set(findall(gca,'type','Axes'),'FontSize',Fontsizechosend11B);
    end
    
    if ishandle(F9111)
figure(F9111);
 set(findall(gca,'type','Axes'),'FontSize',Fontsizechosend11B);
    end

elseif ~existF9100 && existF9111	
    
    F9111=evalin('base','F9111');  
    
    if ishandle(F9111)
figure(F9111);
 set(findall(gca,'type','Axes'),'FontSize',Fontsizechosend11B);
    end
    
    
end
    
    
    
existautofB=evalin( 'base', 'exist(''autofuncionusedB'',''var'') == 1' );
 
if existautofB
  
    F3551=evalin('base','F3551'); 
    F6554=evalin('base','F6554'); 
    F6556=evalin('base','F6556'); 
      

    
    
    F1556=evalin('base','F1556'); 
    F1656=evalin('base','F1656'); 
    F1256=evalin('base','F1256'); 
      
    F6551=evalin('base','F6551'); 
   
      
          if ishandle(F3551)
figure(3551);
 set(findall(gca,'type','Axes'),'FontSize',Fontsizechosend11B);
          end
    
    if ishandle(F6554)
figure(6554);
 set(findall(gca,'type','Axes'),'FontSize',Fontsizechosend11B);
    end
    
    if ishandle(F6556)
figure(6556);
 set(findall(gca,'type','Axes'),'FontSize',Fontsizechosend11B);
    end
    
    if ishandle(F1556)
figure(1556);
 set(findall(gca,'type','Axes'),'FontSize',Fontsizechosend11B);
    end
    
    if ishandle(F1656)
figure(1656);
 set(findall(gca,'type','Axes'),'FontSize',Fontsizechosend11B);
    end
    if ishandle(F1256)
figure(1256);
 set(findall(gca,'type','Axes'),'FontSize',Fontsizechosend11B);
    end
    
    if ishandle(F6551)
figure(6551);
 set(findall(gca,'type','Axes'),'FontSize',Fontsizechosend11B);
    end

  end
    
 
    
    



% Hints: get(hObject,'String') returns contents of SetFontSizeaxes11B as text
%        str2double(get(hObject,'String')) returns contents of SetFontSizeaxes11B as a double


% --- Executes during object creation, after setting all properties.
function SetFontSizeaxes11B_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SetFontSizeaxes11B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Chosengraph11B.
function Chosengraph11B_Callback(hObject, eventdata, handles)
% hObject    handle to Chosengraph11B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Bppmxfinal=evalin('base','Bppmxfinal');
B11initial=evalin('base','B11initial');
Bppmxto=evalin('base','Bppmxto');
B11final=evalin('base','B11final');
Byaxesmin=evalin('base','Byaxesmin');
Byaxesmax=evalin('base','Byaxesmax');
baxesmin=evalin('base','baxesmin');
baxesmax=evalin('base','baxesmax');
d11Btestyexist=evalin( 'base', 'exist(''testyB'',''var'') == 1' );

Bppmxinitial=Bppmxto;


figure(50); 
[Bx,By] = ginput(1);  
searchvaluexB=Bx;
searchvalueyB=By;
                
[~,closestvaluenumberxB] = min(abs(Bppmxfinal-searchvaluexB));      
closestvaluexB = Bppmxfinal(closestvaluenumberxB) ;        

BfinalsearchX=B11final(closestvaluenumberxB,:)  ;    

[~,closestvaluenumberyB] = min(abs(BfinalsearchX-searchvalueyB));
closestvalueyB = BfinalsearchX(closestvaluenumberyB);
initialvalueB=B11initial(closestvaluenumberyB);

initialvaluestringonegraphB=num2str(initialvalueB);
DisplaysentenceB=('Initial \delta11B value of graph:  ');
permilledisplay=(' ‰');
initialvaluestringonegraphdisplayB=strcat(DisplaysentenceB, 32,initialvaluestringonegraphB,permilledisplay);

Bchosen=B11final(:,closestvaluenumberyB);                                      %save all dD values of selected graph
assignin('base','Bchosen',Bchosen);


if d11Btestyexist
    
    testyB=evalin('base','testyB');
    testyxroundedB=round(testyB(:,1)*1000)/1000;                                        
    
interpolBoronval=(min(testyxroundedB):0.0001:max(testyxroundedB))';
interpolatedvaluesyB=interp1(Bppmxfinal,Bchosen,interpolBoronval);





indexforBoron=zeros(1,length(testyxroundedB));

for ismemberreplaceB=1:length(testyxroundedB)
[~, indexforBoron(ismemberreplaceB)]=min(abs(interpolBoronval-testyxroundedB(ismemberreplaceB)));   %%find minimum difference between searched value and data values ('~' for saving it as the location/place of the data), watercontent always descends, no double value are found
end


valuesytocompare=interpolatedvaluesyB(indexforBoron);



RfactormB=corr(valuesytocompare,testyB(:,2))^2;
adjRfactormB=1-(1-RfactormB)*((length(valuesytocompare)-1)/(length(valuesytocompare)-1-1));

if isnan(RfactormB)
    rightinterpreterB= struct('WindowStyle','modal',...                      
              'Interpreter','tex');
    errordlg('For R^{2} the calculated values are required to portray all sample data. Example: With a step size of 1 set lowest boron concentration as 0.001 and initial boron concentration as 120.001 instead of 120 ','Error'...
        ,rightinterpreterB);   
end

assignin('base','adjRfactormB',adjRfactormB);


assignin('base','RfactormB',RfactormB);

RsuperstringB=('R^{2}   =');
RfactormtostringB=num2str(RfactormB);

stringRfactormB=strcat(RsuperstringB, 32, RfactormtostringB);


adjRsuBstringB=('R^{2}_{adj} =');
adjRfactormtostringB=num2str(adjRfactormB);
stringadjRfactormB=strcat(adjRsuBstringB, 32, adjRfactormtostringB);

end




F9111=figure(9111);set(F9111,'name','Selected degassing graph 2D-plot','numbertitle','off');
LINE9111=plot(Bppmxfinal,Bchosen,'DisplayName',initialvaluestringonegraphdisplayB);
ylabel('\delta11B in ‰');
xlabel('Boron concentration in ppm');
axis([baxesmin baxesmax Byaxesmin Byaxesmax]);

if d11Btestyexist
    hold on
    R2plotB=plot(NaN,NaN,'DisplayName',stringRfactormB, 'linestyle', 'none');
    hold on
  adjR2plotB=plot(NaN,NaN,'DisplayName',stringadjRfactormB, 'linestyle', 'none');

 legend([LINE9111,R2plotB,adjR2plotB],'Location','southeast');          
  assignin('base','R2plotB',R2plotB);
assignin('base','adjR2plotB',adjR2plotB);

else
legend([LINE9111],'Location','southeast');  
end

grid on
assignin('base','F9111',F9111);
assignin('base','LINE9111',LINE9111);
hold off


Boroncontent=Bppmxfinal';                                                   
Bchosen1=num2cell(Bchosen);                    

Boroncontent1=num2cell(Boroncontent);

Bininitialvalue=cell(1,length(Boroncontent));                               

for TablepreploopB=1:length(Boroncontent)                                    
    Bininitialvalue{TablepreploopB}=num2str('');
end

Bininitialvalueemtpy=Bininitialvalue';
RfactormstringtableB=Bininitialvalueemtpy;
adjRfactormstringtableB=Bininitialvalueemtpy;

Bininitialvalue{1}=num2str(initialvalueB);                                   
Bininitialvalue=Bininitialvalue';

if d11Btestyexist

RfactormstringtableB{1}=RfactormB;
adjRfactormstringtableB{1}=adjRfactormB;


F9314=figure(9314);set(F9314,'name','Selected degassing graph table (do not copy & paste from here)','numbertitle','off','unit','normalized','Position', [0.2 0.2 0.4 0.5]);
deltacode = char(hex2dec('03B4'));                                          
TablechoosenB=uitable('Data',[Boroncontent1,Bchosen1,Bininitialvalueemtpy,Bininitialvalue,RfactormstringtableB,adjRfactormstringtableB],'unit','normalized', ...          
   'Position', [0 0 1 1],'ColumnName',{'Boron concentration in ppm',[' ',deltacode,'11B in ‰'],['   '],['Selected graph initial', 032,deltacode,'11B in ‰'],['R',char(hex2dec('00B2'))],['adjR',char(hex2dec('00B2'))]});   

else
  F9314=figure(9314);set(F9314,'name','Selected degassing graph table (do not copy & paste from here)','numbertitle','off');
deltacode = char(hex2dec('03B4'));                                          
TablechoosenB=uitable('Data',[Boroncontent1,Bchosen1,Bininitialvalueemtpy,Bininitialvalue],'unit','normalized', ...          
   'Position', [0 0 1 1],'ColumnName',{'Boron concentration in ppm',[' ',deltacode,'11B in ‰'],['   '],['Selected graph initial', 032,deltacode,'11B in ‰']});   
  
    
end




DataoftableB=get(TablechoosenB,'Data');                                   
ColumnheaderB=get(TablechoosenB,'ColumnName');                           

                               
DataofgraphB=[ColumnheaderB';DataoftableB];



assignin('base','DataofgraphB',DataofgraphB);


% --- Executes on button press in Closedtoopen11B.
function Closedtoopen11B_Callback(hObject, eventdata, handles)
% hObject    handle to Closedtoopen11B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Bppmxfinal=evalin('base','Bppmxfinal');
B11initial=evalin('base','B11initial');
Bppmxto=evalin('base','Bppmxto');
B11final=evalin('base','B11final');
Byaxesmin=evalin('base','Byaxesmin');
Byaxesmax=evalin('base','Byaxesmax');
baxesmin=evalin('base','baxesmin');
baxesmax=evalin('base','baxesmax');
d11Btestyexist=evalin( 'base', 'exist(''testyB'',''var'') == 1' );
TinC1=evalin('base','TinC1');                                               


TinK=TinC1+273.15;
T1000=1000/TinK;                                                            %Boron alpha factor calculation based on: Maner, J.L., London, D., 2018. Fractionation of the isotopes of boron between granitic melt and aqueous solution at 700 °C and 800 °C (200 MPa). Chemical Geology 489, 16–27. doi:10.1016/j.chemgeo.2018.05.007.

lowBalphaBlog=0.6962*T1000-7.5821;

lowhalphaB=exp(lowBalphaBlog/1000);                                         % 


alphaB=1/lowhalphaB; 


figure(50); 
[Bx,By] = ginput(1);                                                          %select a point with the mouse on figure 1 and saving the x axis and y axis value of the selected point
searchvaluexB=Bx;                                                             %resaving to another variable name
searchvalueyB=By;
                





[~,closestvaluenumberxB] = min(abs(Bppmxfinal-searchvaluexB));                %find minimum difference between searched value and data values ('~' for saving it as the location/place of the data), watercontent always descends, no double value are found
closestvaluexB = Bppmxfinal(closestvaluenumberxB) ;                           %actual value of the closest point on x axes (watercontent) 

BfinalsearchX=B11final(closestvaluenumberxB,:)  ;                              %for searching, only selecting the different dD values with the  x values (watercontent) chosen by the user (one row of Dfinal)

[~,closestvaluenumberyB] = min(abs(BfinalsearchX-searchvalueyB));             %see above, now searching the y value representing the different initial dD values in Dfinal. Only saerching in the before defined one row in Dfinal => no double values problem
closestvalueyB = BfinalsearchX(closestvaluenumberyB);                         %actual value of the selected point
initialvalueB=B11initial(closestvaluenumberyB);                                 %the different colums of Dfinal/Dinalsearch are calculated using different Diniitial values,they are the same columns as Dinitial columns, searched y value (column) is at the same time also the same columns with its Dinitial value                                                                                                                        

initialvaluestringclosedopenB=num2str(initialvalueB);                         %creating string from a value with num2str
DisplaysentenceB=('Calculated graph with initial \delta11B value of');
permilledisplayB=(' ‰');
initialvaluestringclosedopendisplayB=strcat(DisplaysentenceB, 32,initialvaluestringclosedopenB,permilledisplayB); %connecting strings with strcat 

TranspointstrgxB=num2str(closestvaluexB);
TranspointstrgyB=num2str(closestvalueyB);
TranspointstrgpureB='Transition point: ';
BppmperdisplayB=' ppm boron, ';
permilldisanddeltB=' ‰ \delta11B ' ;
TranspointstringB=strcat(TranspointstrgpureB, 32,TranspointstrgxB,BppmperdisplayB, 32,TranspointstrgyB,permilldisanddeltB);

assignin('base','TranspointstringB',TranspointstringB);                                               %saving variable into workspace
assignin('base','closestvaluexB',closestvaluexB);    
assignin('base','closestvalueyB',closestvalueyB);    



figure(50);
hold on 
TPOINTFIG1B=plot(closestvaluexB,closestvalueyB, 'kx','MarkerSize',10,'LineWidth',3,'DisplayName',TranspointstringB); %plotting user selected transition point into the open graph as a red x with the size 10 and the Plot name Transition Point
if ~d11Btestyexist                                                              %if testy does not exist, the legend will be set as the Transpointstring
legend([TPOINTFIG1B],'Location','southeast');                                                        
end

hold off                                                                    %stopping hold on




F9100=figure(9100);set(F9100,'name','Selected transition point and degassing graph 2D-plot','numbertitle','off'); %calling figure and setting figure name
DOT9100=plot(closestvaluexB,closestvalueyB, 'kx','MarkerSize',10,'LineWidth',3,'DisplayName',TranspointstringB);                             %plotting with red cross
ylabel('\delta11B in ‰');
xlabel('Boron concentration in ppm');
                                          
hold on                                                                     %plotting in one plot without overwritign exsisting one 
LINE9100=plot(Bppmxfinal,B11final(:,closestvaluenumberyB),'DisplayName',initialvaluestringclosedopendisplayB);                                       
axis([baxesmin baxesmax Byaxesmin Byaxesmax]);
hold off
legend([LINE9100,DOT9100],'Location','southeast');                            %writing  initial value of closest selected graph and Transitionpoint into the legend
grid on;                                                                    %making grid

assignin('base','F9100',F9100);                                               %saving variable into workspace
assignin('base','LINE9100',LINE9100);        
assignin('base','DOT9100',DOT9100);        

newtocalcBoron=Bppmxfinal(closestvaluenumberxB:length(Bppmxfinal));          %saving values of watercontent which are required to be new calculated(from transition point on) into a new variable




Binitialer=B11final(closestvaluenumberxB,closestvaluenumberyB);                 %last points y value (dD) (transition point)set/saved as new initial value

%%%
Boroninitial=Bppmxfinal(closestvaluenumberxB);                               %last point x value (watercontent) as new initial value
Bfinalopen=zeros(length(newtocalcBoron),1);

Boroninitial1=zeros(1,length(newtocalcBoron)+1);                            %prealocation for loop



  Boroninitial1(1)=Boroninitial;                                            %for explanation see script openandclose. Only changes will be explained here / here only one dimensional values need to be saved
nn=1;
for Boronfinalloop=newtocalcBoron

Boroninitial1(nn+1)=Boronfinalloop;  
Bfinalopen(nn)=(Binitialer+1000)*((Boronfinalloop/Boroninitial1(nn))^(alphaB-1))-1000;  %only need alhpa value at point closestvaluenumberx to end, as no index starts with 1 (nn) -1 is used insided the alhpa bracket 
Binitialer=Bfinalopen(nn);
nn=nn+1;

end 


assignin('base','Bfinalopen',Bfinalopen); 
Bfinalold=B11final(:,closestvaluenumberyB);
Bfinalclosetoopentrans=[Bfinalold(1:closestvaluenumberxB-1 );Bfinalopen  ];       %connecting old and new dD values togehter in a new variable (-1 to not having double values)
assignin('base','Bfinalclosetoopentrans',Bfinalclosetoopentrans);



if d11Btestyexist                                                               % if loop. testyexist is the logical variable for testy, which consists of the user data and which was checked for existence before (1 is true , 0 is false),only if the sample data of the user exists, it will/can be calculated
    
    testyB=evalin('base','testyB');
    testyxroundedB=round(testyB(:,1)*1000)/1000;                                       % rounding testy to round to 3 digits to the right of the decimal point
    
interpolBoronval=(min(testyxroundedB):0.0001:max(testyxroundedB))';           %setting the required x values for interpolation
interpolatedvaluesyB=interp1(Bppmxfinal,Bfinalclosetoopentrans,interpolBoronval);        %interpolation of y values in relation to x values





indexforBoron=zeros(1,length(testyxroundedB));

for ismemberreplaceB=1:length(testyxroundedB)
[~, indexforBoron(ismemberreplaceB)]=min(abs(interpolBoronval-testyxroundedB(ismemberreplaceB)));   %%find minimum difference between searched value and data values ('~' for saving it as the location/place of the data), watercontent always descends, no double value are found
end


valuesytocompare=interpolatedvaluesyB(indexforBoron);


RfactormB=corr(valuesytocompare,testyB(:,2))^2;                              %calculating Pearson correlation coefficient and ^2 for the coefficient of deteremination from user data y values (testy(:,2)) and the by the program calculated and interpolated y values (valuesytocompare)
adjRfactormB=1-(1-RfactormB)*((length(valuesytocompare)-1)/(length(valuesytocompare)-1-1));   %calculating the adjusted coefficient of determination
RMSEvalB=rms(valuesytocompare-testyB(:,2));                                     %calculatrion of Root Mean Square Error


if isnan(RfactormB)
    rightinterpreterB= struct('WindowStyle','modal',...                      %setting the an interpreter (tex) for the following errordlg
              'Interpreter','tex');
    errordlg('For R^{2} the calculated values are required to portray all sample data. Example: With a step size of 1 set lowest boron concentration as 0.001 and initial boron concentration as 120.001 instead of 120 ','Error'...
        ,rightinterpreterB);                                                 %interpreter to be used. Here ît is required for the line "R^{2}" to be displayed correctly
end

assignin('base','adjRfactormB',adjRfactormB);

assignin('base','RMSEvalB',RMSEvalB);
assignin('base','RfactormB',RfactormB);


RsuperstringB=('R^{2}   =');                                                 %creating string whereas ^{} is the tex code for superscript
RfactormtostringB=num2str(RfactormB);

stringRfactormB=strcat(RsuperstringB, 32, RfactormtostringB);                  %concatenate strings whereas  32 is the ASCII code for a blank space


adjRsuBstringB=('R^{2}_{adj} =');                                            %creating string whereas ^{} is the tex code for superscript and _{} for subscript
adjRfactormtostringB=num2str(adjRfactormB);                                   %converting number to character arrary
stringadjRfactormB=strcat(adjRsuBstringB, 32, adjRfactormtostringB);

RMSEpurestringB=('RMSE =');  
RMSEpurestringtostringB=num2str(RMSEvalB);
stringRMSEvalB=strcat(RMSEpurestringB, 32, RMSEpurestringtostringB);


end



F9111=figure(9111);set(F9111,'name','Selected closed-, to open-system degassing 2D-plot','numbertitle','off');
DOT9111=plot(closestvaluexB,closestvalueyB,'kx','MarkerSize',10,'LineWidth',3,'DisplayName',TranspointstringB');
ylabel('\delta11B in ‰');
xlabel('Boron concentration in ppm');
hold on
LINE9111=plot(Bppmxfinal,Bfinalclosetoopentrans,'DisplayName',initialvaluestringclosedopendisplayB);
axis([baxesmin baxesmax Byaxesmin Byaxesmax]);

if d11Btestyexist                                                              % only if the sample data of the user exists, it will/can be plotted
    R2plotB=plot(NaN,NaN,'DisplayName',stringRfactormB, 'linestyle', 'none');% the legend requires a plot it relates too, here an empty plot is created (NaN) only containing the stringRfactorm string
    hold on
  adjR2plotB=plot(NaN,NaN,'DisplayName',stringadjRfactormB, 'linestyle', 'none'); % same as above
  hold on
 RMSEvalplotB=plot(NaN,NaN,'DisplayName',stringRMSEvalB, 'linestyle', 'none');
  
  
legend([LINE9111,DOT9111,R2plotB,adjR2plotB,RMSEvalplotB],'Location','southeast');       

assignin('base','R2plotB',R2plotB);
assignin('base','adjR2plotB',adjR2plotB);
assignin('base','RMSEvalplotB',RMSEvalplotB);
  
else                                                                        %if no user data exists, the legend will be set without the user data and its follow up calculations (R,adjR)
legend([LINE9111,DOT9111],'Location','southeast');        
end

assignin('base','F9111',F9111);
grid on;
assignin('base','LINE9111',LINE9111);
assignin('base','DOT9111',DOT9111);
 hold off

 
Boroncontent=Bppmxfinal';                                                   %changing watervalue data layout to use it for table (one row into one columns "'")
Bfinalclosetoopentrans1=num2cell(Bfinalclosetoopentrans);                   %converting array to cell array

Boroncontent1=num2cell(Boroncontent);

Bininitialvalue=cell(1,length(Boroncontent));                              %preallocation with cells. Creates empty cell with desired rows and columns

for TablepreploopB=1:length(Boroncontent)                                   %simplistic loop which wrties empty cells of type "char" for character cell, instead of cells of type "double", by writing string ''
    Bininitialvalue{TablepreploopB}=num2str('');
end

Bininitialvalueemtpy=Bininitialvalue';                                      %transposing cell
RfactormstringtableB=Bininitialvalueemtpy;
adjRfactormstringtableB=Bininitialvalueemtpy;
RMSEvalstringtableB=Bininitialvalueemtpy;
Bininitialvalueemtpy{closestvaluenumberxB}='   Transition point';
Bininitialvalueemtpy{1}=strcat(' TP:', 32, TranspointstrgxB,' ppm',',',TranspointstrgyB,' ‰');
Bininitialvalue{1}=num2str(initialvalueB);                                  %setting first cell of char array as a string containing the initial dD value
Bininitialvalue=Bininitialvalue';


if d11Btestyexist

RfactormstringtableB{1}=RfactormB;
adjRfactormstringtableB{1}=adjRfactormB;
RMSEvalstringtableB{1}=RMSEvalB;

F9312=figure(9312);set(F9312,'name','Selected closed-, to open-system degassing table (do not copy & paste from here)', ...
    'numbertitle','off','unit','normalized','Position', [0.2 0.2 0.43 0.5]);
deltacode = char(hex2dec('03B4'));                                           %workaround for uitable in next line. Uitable can not read special characters or tex code (\delta), hex2dec translate Unicode into ASCII code which then can be read by char as the special character                                       
TableclosedtoopenB=uitable('Data',[Boroncontent1,Bfinalclosetoopentrans1,Bininitialvalueemtpy,Bininitialvalue,RfactormstringtableB,adjRfactormstringtableB,RMSEvalstringtableB],'unit','normalized', ...           %creating a table on a new figure window whereas 'Data' considers the variable inside the next [] as the data it should write, which fills the whole figure  ('unit','normalized','Position', [0 0 1 1])       
'Position', [0 0 1 1],'ColumnName',{'Boron concentration in ppm',[' ',deltacode,'11B in ‰'],['        Transition point        '],[' Selected graph initial', 032,deltacode,'11B in ‰'], ...       %'ColumnsName', sets the next imnput inside the {} as the column names
['R',char(hex2dec('00B2'))],['adjR',char(hex2dec('00B2'))],['RMSE']});   

else
  F9312=figure(9312);set(F9312,'name','Selected closed-, to open-system degassing table (do not copy & paste from here)','numbertitle','off');
deltacode = char(hex2dec('03B4'));                                          
TableclosedtoopenB=uitable('Data',[Boroncontent1,Bfinalclosetoopentrans1,Bininitialvalueemtpy,Bininitialvalue],'unit','normalized', ...          
   'Position', [0 0 1 1],'ColumnName',{'Boron concentration in ppm',[deltacode,'11B in ‰'],['        Transition point        '],['Selected graph initial', 032,deltacode,'11B in ‰']});   
  

end




DataoftableB=get(TableclosedtoopenB,'Data');                                  %gets the current Data ('Data') of active table (Tableclosedtoopen)
ColumnheaderB=get(TableclosedtoopenB,'ColumnName');                           %gets the current Column names ('ColumnName') of active table



DataofgraphcloseopenB=[ColumnheaderB';DataoftableB];




assignin('base','DataofgraphcloseopenB',DataofgraphcloseopenB);



% --- Executes on button press in Closedtobatched11B.
function Closedtobatched11B_Callback(hObject, eventdata, handles)
% hObject    handle to Closedtobatched11B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Bppmxfinal=evalin('base','Bppmxfinal');
B11initial=evalin('base','B11initial');
Bppmxto=evalin('base','Bppmxto');
B11final=evalin('base','B11final');
Byaxesmin=evalin('base','Byaxesmin');
Byaxesmax=evalin('base','Byaxesmax');
baxesmin=evalin('base','baxesmin');
baxesmax=evalin('base','baxesmax');
d11Btestyexist=evalin( 'base', 'exist(''testyB'',''var'') == 1' );
TinC1=evalin('base','TinC1');                                               


TinK=TinC1+273.15;
T1000=1000/TinK;                                                            %Boron alpha factor calculation based on: Maner, J.L., London, D., 2018. Fractionation of the isotopes of boron between granitic melt and aqueous solution at 700 °C and 800 °C (200 MPa). Chemical Geology 489, 16–27. doi:10.1016/j.chemgeo.2018.05.007.

lowBalphaBlog=0.6962*T1000-7.5821;

lowhalphaB=exp(lowBalphaBlog/1000);                                         % 



alphaB=1/lowhalphaB; 

Bppmxinitial=Bppmxto;


figure(50); 
[x,y] = ginput(1);   
searchvaluexB=x;
searchvalueyB=y;
                





[~,closestvaluenumberxB] = min(abs(Bppmxfinal-searchvaluexB));     
closestvaluexB = Bppmxfinal(closestvaluenumberxB) ;        

BfinalsearchX=B11final(closestvaluenumberxB,:)  ;   

[~,closestvaluenumberyB] = min(abs(BfinalsearchX-searchvalueyB));
closestvalueyB = BfinalsearchX(closestvaluenumberyB);

initialvalueclosebatchedB=B11initial(closestvaluenumberyB);

TpclosedbatchedxB=closestvaluexB;
TpclosedbatchedyB=closestvalueyB;

assignin('base','TpclosedbatchedxB',TpclosedbatchedxB);
assignin('base','TpclosedbatchedyB',TpclosedbatchedyB);


initialindexclosebatchedxB=closestvaluenumberxB;
assignin('base','initialindexclosebatchedxB',initialindexclosebatchedxB);
assignin('base','closestvaluexB',closestvaluexB);    
assignin('base','closestvalueyB',closestvalueyB);    


initialvaluestringclosebatchedB=num2str(initialvalueclosebatchedB);
DisplaysentenceB=('Initial \delta11B value of graph:  ');
permilledisplayB=(' ‰');
initialvaluestringclsoedbatcheddisplayB=strcat(DisplaysentenceB, 32,initialvaluestringclosebatchedB,permilledisplayB);
assignin('base','initialvaluestringclsoedbatcheddisplayB',initialvaluestringclsoedbatcheddisplayB);

TranspointstrgxB=num2str(closestvaluexB);
TranspointstrgyB=num2str(closestvalueyB);
TranspointstrgpureB='Transition point: ';
BppmperdisplayB=' ppm boron, ';
permilldisanddeltD=' ‰ \delta11B ' ;
TranspointstringB=strcat(TranspointstrgpureB, 32,TranspointstrgxB,BppmperdisplayB, 32,TranspointstrgyB,permilldisanddeltD);
assignin('base','TranspointstringB',TranspointstringB)

TranspointstrgxbatchedB=TranspointstrgxB;
TranspointstrgybatchedB=TranspointstrgyB;
assignin('base','TranspointstrgxbatchedB',TranspointstrgxbatchedB); 
assignin('base','TranspointstrgybatchedB',TranspointstrgybatchedB); 
assignin('base','TranspointstringB',TranspointstringB);




figure(50);
hold on 
TPOINTFIG1G=plot(closestvaluexB,closestvalueyB, 'kx','MarkerSize',10,'LineWidth',3,'DisplayName',TranspointstringB);
if ~d11Btestyexist
legend([TPOINTFIG1G],'Location','southeast');                            
end

hold off


assignin('base','initialvalueclosebatchedB',initialvalueclosebatchedB); 

F9100=figure(9100);set(F9100,'name','Selected transition point and degassing graph 2D-plot','numbertitle','off');
DOT9100=plot(closestvaluexB,closestvalueyB, 'kx','MarkerSize',10,'LineWidth',3,'DisplayName',TranspointstringB);
ylabel('\delta11B in ‰');
xlabel('Boron concentration in ppm');
hold on
LINE9100=plot(Bppmxfinal,B11final(:,closestvaluenumberyB),'DisplayName',initialvaluestringclsoedbatcheddisplayB);

hold off
axis([baxesmin baxesmax Byaxesmin Byaxesmax]);
grid on;

assignin('base','F9100',F9100);
assignin('base','LINE9100',LINE9100);
assignin('base','DOT9100',DOT9100);

dotfromclosebatchedtransitionpointB=[closestvaluexB,closestvalueyB];
assignin('base','dotfromclosebatchedtransitionpointB',dotfromclosebatchedtransitionpointB);

newtocalcBoron=Bppmxfinal(closestvaluenumberxB:length(Bppmxfinal));




Binitialer=B11final(closestvaluenumberxB,closestvaluenumberyB);

%%%
Boroninitial=Bppmxfinal(closestvaluenumberxB);   
Bfinalbatched=zeros(length(newtocalcBoron),1);

Boroninitial1=zeros(1,length(newtocalcBoron)+1);



  Boroninitial1(1)=Boroninitial;  
nn=1;
for Boronfinalloop=newtocalcBoron

Boroninitial1(nn+1)=Boronfinalloop;  
Bfinalbatched(nn)=Binitialer-((1-(Boronfinalloop/Boroninitial1(nn)))*10^3)*log(alphaB);  %need alhpa vaule at point closestvaluenumberx to end
Binitialer=Bfinalbatched(nn);
nn=nn+1;

end 


assignin('base','Bfinalbatched',Bfinalbatched); 
Bfinalold=B11final(:,closestvaluenumberyB);
Bfinalclosetobatched=[Bfinalold(1:closestvaluenumberxB-1 );Bfinalbatched];
assignin('base','Bfinalclosetobatched',Bfinalclosetobatched);




if d11Btestyexist
    
    testyB=evalin('base','testyB');
    testyxroundedB=round(testyB(:,1)*1000)/1000;                                         
    
interpolBoronval=(min(testyxroundedB):0.0001:max(testyxroundedB))';
interpolatedvaluesyB=interp1(Bppmxfinal,Bfinalclosetobatched,interpolBoronval);




indexforBoron=zeros(1,length(testyxroundedB));

for ismemberreplaceB=1:length(testyxroundedB)
[~, indexforBoron(ismemberreplaceB)]=min(abs(interpolBoronval-testyxroundedB(ismemberreplaceB)));   %%find minimum difference between searched value and data values ('~' for saving it as the location/place of the data), watercontent always descends, no double value are found
end



valuesytocompare=interpolatedvaluesyB(indexforBoron);


RfactormB=corr(valuesytocompare,testyB(:,2))^2;
adjRfactormB=1-(1-RfactormB)*((length(valuesytocompare)-1)/(length(valuesytocompare)-1-1));
RMSEvalB=rms(valuesytocompare-testyB(:,2));                                     



if isnan(RfactormB)
    rightinterpreterB= struct('WindowStyle','modal',...                      
              'Interpreter','tex');
    errordlg('For R^{2} the calculated values are required to portray all sample data. Example: With a step size of 1 set lowest boron concentration as 0.001 and initial boron concentration as 120.001 instead of 120 ','Error'...
        ,rightinterpreterB);   
end

assignin('base','adjRfactormB',adjRfactormB);

assignin('base','RMSEvalB',RMSEvalB);

assignin('base','RfactormB',RfactormB);

RsuperstringB=('R^{2}   =');
RfactormtostringB=num2str(RfactormB);

stringRfactormB=strcat(RsuperstringB, 32, RfactormtostringB);


adjRsuBstringB=('R^{2}_{adj} =');
adjRfactormtostringB=num2str(adjRfactormB);
stringadjRfactormB=strcat(adjRsuBstringB, 32, adjRfactormtostringB);
RMSEpurestringB=('RMSE =');  
RMSEpurestringtostringB=num2str(RMSEvalB);
stringRMSEvalB=strcat(RMSEpurestringB, 32, RMSEpurestringtostringB);

end





F9111=figure(9111);set(F9111,'name','Selected closed-, to batched-system degassing 2D-plot','numbertitle','off');
DOT9111=plot(closestvaluexB,closestvalueyB, 'kx','MarkerSize',10,'LineWidth',3,'DisplayName',TranspointstringB);
ylabel('\delta11B in ‰');
xlabel('Boron concentration in ppm');

hold on
LINE9111=plot(Bppmxfinal,Bfinalclosetobatched,'DisplayName',initialvaluestringclsoedbatcheddisplayB);
axis([baxesmin baxesmax Byaxesmin Byaxesmax]);

if d11Btestyexist
    hold on
    R2plotB=plot(NaN,NaN,'DisplayName',stringRfactormB, 'linestyle', 'none');
    hold on
  adjR2plotB=plot(NaN,NaN,'DisplayName',stringadjRfactormB, 'linestyle', 'none');
  hold on
  RMSEvalplotB=plot(NaN,NaN,'DisplayName',stringRMSEvalB, 'linestyle', 'none');
  
 legend([LINE9111,DOT9111,R2plotB,adjR2plotB,RMSEvalplotB],'Location','southeast');    
 
 assignin('base','R2plotB',R2plotB);
assignin('base','adjR2plotB',adjR2plotB);
  assignin('base','RMSEvalplotB',RMSEvalplotB);
  
else
legend([LINE9111,DOT9111],'Location','southeast');  
end

assignin('base','F9111',F9111);
grid on;
hold off

assignin('base','LINE9111',LINE9111);
assignin('base','DOT9111',DOT9111);





Boroncontent=Bppmxfinal';                                                   
Bfinalclosetobatched1=num2cell(Bfinalclosetobatched);                    

Boroncontent1=num2cell(Boroncontent);

Bininitialvalue=cell(1,length(Boroncontent));                               

for TablepreploopB=1:length(Boroncontent)                                    
    Bininitialvalue{TablepreploopB}=num2str('');
end

Bininitialvalueemtpy=Bininitialvalue';
RfactormstringtableB=Bininitialvalueemtpy;
adjRfactormstringtableB=Bininitialvalueemtpy;
RMSEvalstringtableB=Bininitialvalueemtpy;

Bininitialvalueemtpy{closestvaluenumberxB}='   Transition point';
Bininitialvalueemtpy{1}=strcat(' TP:', 32, TranspointstrgxB,' ppm',',',TranspointstrgyB,' ‰');                         
Bininitialvalue{1}=num2str(initialvalueclosebatchedB);                                   
Bininitialvalue=Bininitialvalue';


if d11Btestyexist

RfactormstringtableB{1}=RfactormB;
adjRfactormstringtableB{1}=adjRfactormB;
RMSEvalstringtableB{1}=RMSEvalB;


F9315=figure(9315);set(F9315,'name','Selected closed-, to batched-system degassing table (do not copy & paste from here)', ...
    'numbertitle','off','unit','normalized','Position', [0.2 0.2 0.43 0.5]);
deltacode = char(hex2dec('03B4'));                                           %workaround for uitable in next line. Uitable can not read special characters or tex code (\delta), hex2dec translate Unicode into ASCII code which then can be read by char as the special character                                       
TableclosedbatchedB=uitable('Data',[Boroncontent1,Bfinalclosetobatched1,Bininitialvalueemtpy,Bininitialvalue,RfactormstringtableB,adjRfactormstringtableB,RMSEvalstringtableB],'unit','normalized', ...           %creating a table on a new figure window whereas 'Data' considers the variable inside the next [] as the data it should write, which fills the whole figure  ('unit','normalized','Position', [0 0 1 1])       
'Position', [0 0 1 1],'ColumnName',{'Boron concentration in ppm',[' ',deltacode,'11B in ‰'],['        Transition point        '],[' Selected graph initial', 032,deltacode,'11B in ‰'], ...       %'ColumnsName', sets the next imnput inside the {} as the column names
['R',char(hex2dec('00B2'))],['adjR',char(hex2dec('00B2'))],['RMSE']});   

else
  F9315=figure(9315);set(F9315,'name','Selected closed-, to batched-system degassing table (do not copy & paste from here)','numbertitle','off');
deltacode = char(hex2dec('03B4'));                                          
TableclosedbatchedB=uitable('Data',[Boroncontent1,Bfinalclosetobatched1,Bininitialvalueemtpy,Bininitialvalue],'unit','normalized', ...          
   'Position', [0 0 1 1],'ColumnName',{'Boron concentration in ppm',[deltacode,'11B in ‰'],['        Transition point        '],['Selected graph initial', 032,deltacode,'11B in ‰']});   
  
    
end




DataoftableB=get(TableclosedbatchedB,'Data');                                   
ColumnheaderB=get(TableclosedbatchedB,'ColumnName');                           

                                
DataofgraphclosebatchedB=[ColumnheaderB';DataoftableB];


assignin('base','DataofgraphclosebatchedB',DataofgraphclosebatchedB);



% --- Executes on button press in Closedbatchedvariable11B.
function Closedbatchedvariable11B_Callback(hObject, eventdata, handles)
% hObject    handle to Closedbatchedvariable11B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Bppmxfinal=evalin('base','Bppmxfinal');
B11initial=evalin('base','B11initial');
Bppmxto=evalin('base','Bppmxto');
B11final=evalin('base','B11final');
Byaxesmin=evalin('base','Byaxesmin');
Byaxesmax=evalin('base','Byaxesmax');
baxesmin=evalin('base','baxesmin');
baxesmax=evalin('base','baxesmax');
Bppmxfrom=evalin('base','Bppmxfrom');
d11Btestyexist=evalin( 'base', 'exist(''testyB'',''var'') == 1' );

TinC1=evalin('base','TinC1');                                               


TinK=TinC1+273.15;
T1000=1000/TinK;                                                            %Boron alpha factor calculation based on: Maner, J.L., London, D., 2018. Fractionation of the isotopes of boron between granitic melt and aqueous solution at 700 °C and 800 °C (200 MPa). Chemical Geology 489, 16–27. doi:10.1016/j.chemgeo.2018.05.007.

lowBalphaBlog=0.6962*T1000-7.5821;

lowhalphaB=exp(lowBalphaBlog/1000);                                         % 



alphaB=1/lowhalphaB; 

Bppmxinitial=Bppmxto;


existBoronlosspercentageinput=evalin( 'base', 'exist(''Boronlosspercentageinput'',''var'') == 1' );
if existBoronlosspercentageinput
    Boronlosspercentageinput=evalin('base','Boronlosspercentageinput'); 
else
    Boronlosspercentageinput=50;
end
PercentBoron1lossvarfin=1-Boronlosspercentageinput/100;


figure(50); 
[Bx,By] = ginput(1);  
searchvaluexB=Bx;
searchvalueyB=By;
                





[~,closestvaluenumberxB] = min(abs(Bppmxfinal-searchvaluexB));    
closestvaluexB = Bppmxfinal(closestvaluenumberxB) ;         

BfinalsearchX=B11final(closestvaluenumberxB,:)  ;   
[~,closestvaluenumberyB] = min(abs(BfinalsearchX-searchvalueyB));
closestvalueyB = BfinalsearchX(closestvaluenumberyB);
initialvalueclosebatchedtaylorB=B11initial(closestvaluenumberyB);

initialvaluestringclosebatchedtayB=num2str(initialvalueclosebatchedtaylorB);
DisplaysentenceB=('Initial \delta11B value of graph:  ');
permilledisplayB=(' ‰');
initialvaluestringclsoedbatchedtaydisplayB=strcat(DisplaysentenceB, 32,initialvaluestringclosebatchedtayB,permilledisplayB);

TranspointstrgxB=num2str(closestvaluexB);
TranspointstrgyB=num2str(closestvalueyB);
TranspointstrgpureB='Transition point: ';
BppmperdisplayB=' ppm boron, ';
permilldisanddeltB=' ‰ \delta11B ' ;
TranspointstringB=strcat(TranspointstrgpureB, 32,TranspointstrgxB,BppmperdisplayB, 32,TranspointstrgyB,permilldisanddeltB);

assignin('base','closestvaluexB',closestvaluexB);    
assignin('base','closestvalueyB',closestvalueyB);    

figure(50);
hold on 
TPOINTFIG1B=plot(closestvaluexB,closestvalueyB, 'kx','MarkerSize',10,'LineWidth',3,'DisplayName',TranspointstringB);
if ~d11Btestyexist
legend([TPOINTFIG1B],'Location','southeast');                            
end
hold off

assignin('base','initialvalueclosebatchedtaylorB',initialvalueclosebatchedtaylorB);               

F9100=figure(9100);set(F9100,'name','Selected transition point and degassing graph 2D-plot','numbertitle','off');             
DOT9100=plot(closestvaluexB,closestvalueyB, 'kx','MarkerSize',10,'LineWidth',3,'DisplayName',TranspointstringB);
ylabel('\delta11B in ‰');
xlabel('Boron concentration in ppm');
hold on
LINE9100=plot(Bppmxfinal,B11final(:,closestvaluenumberyB),'DisplayName',initialvaluestringclsoedbatchedtaydisplayB);
axis([baxesmin baxesmax Byaxesmin Byaxesmax]);
hold off
legend([LINE9100,DOT9100],'Location','southeast');
grid on;

assignin('base','F9100',F9100);
assignin('base','LINE9100',LINE9100);
assignin('base','DOT9100',DOT9100);





mm=1;                                                                        
newtocalcBoron(mm)=closestvaluexB;                                            
mm=2;                                                                       
while newtocalcBoron > Bppmxfrom                                                
    
    newtocalcBoron(mm)=newtocalcBoron(mm-1)*PercentBoron1lossvarfin;                               
    mm=mm+1;                                                                 
    
end

newtocalcBoron=sort(newtocalcBoron,'descend');                               


Binitialer=B11final(closestvaluenumberxB,closestvaluenumberyB);

%%%
Boroninitial=Bppmxfinal(closestvaluenumberxB);    
Bfinalbatchedvar=zeros(length(newtocalcBoron),1);

Boroninitial1=zeros(1,length(newtocalcBoron)+1);



  Boroninitial1(1)=Boroninitial;   
nn=1;
for Boronfinalloop=newtocalcBoron

Boroninitial1(nn+1)=Boronfinalloop;  
Bfinalbatchedvar(nn)=Binitialer-((1-(Boronfinalloop/Boroninitial1(nn)))*10^3)*log(alphaB); 
Binitialer=Bfinalbatchedvar(nn);
nn=nn+1;

end  


assignin('base','Bfinalbatchedvar',Bfinalbatchedvar); 
Bfinalold=B11final(:,closestvaluenumberyB);
Bfinalclosetobatchedtaylor=[Bfinalold(1:closestvaluenumberxB-1 );Bfinalbatchedvar];
assignin('base','Bfinalclosetobatchedtaylor',Bfinalclosetobatchedtaylor);
Bppmxfinal=[Bppmxfinal(1:closestvaluenumberxB-1),newtocalcBoron];
assignin('base','Bppmxfinal',Bppmxfinal);



if d11Btestyexist
    
    testyB=evalin('base','testyB');
    testyBxrounded=round(testyB(:,1)*1000)/1000;                                       
    
interpolBoronval=(min(testyBxrounded):0.0001:max(testyBxrounded))';
interpolatedvaluesyB=interp1(Bppmxfinal,Bfinalclosetobatchedtaylor,interpolBoronval);



indexforBoron=zeros(1,length(testyBxrounded));

for ismemberreplaceB=1:length(testyBxrounded)
[~, indexforBoron(ismemberreplaceB)]=min(abs(interpolBoronval-testyBxrounded(ismemberreplaceB)));   %%find minimum difference between searched value and data values ('~' for saving it as the location/place of the data), watercontent always descends, no double value are found
end



valuesytocompare=interpolatedvaluesyB(indexforBoron);



RfactormB=corr(valuesytocompare,testyB(:,2))^2;
adjRfactormB=1-(1-RfactormB)*((length(valuesytocompare)-1)/(length(valuesytocompare)-1-1));
RMSEvalB=rms(valuesytocompare-testyB(:,2));                                     

if isnan(RfactormB)
    rightinterpreter= struct('WindowStyle','modal',...                      
              'Interpreter','tex');
    errordlg('For R^{2} the calculated values are required to portray all sample data. Example: With a step size of 1 set lowest boron concentration as 0.001 and initial boron concentration as 120.001 instead of 120 ','Error'...
        ,rightinterpreter);   
end

assignin('base','adjRfactormB',adjRfactormB);

assignin('base','RMSEvalB',RMSEvalB);

assignin('base','RfactormB',RfactormB);

RsuperstringB=('R^{2}   =');
RfactormtostringB=num2str(RfactormB);

stringRfactormB=strcat(RsuperstringB, 32, RfactormtostringB);


adjRsuBstringB=('R^{2}_{adj} =');
adjRfactormtostringB=num2str(adjRfactormB);
stringadjRfactormB=strcat(adjRsuBstringB, 32, adjRfactormtostringB);

RMSEpurestringB=('RMSE =');  
RMSEpurestringtostringB=num2str(RMSEvalB);
stringRMSEvalB=strcat(RMSEpurestringB, 32, RMSEpurestringtostringB);

end





F9111=figure(9111);set(F9111,'name','Selected closed-, to batched-system degassing (variable % water loss) 2D-plot','numbertitle','off');
DOT9111=plot(closestvaluexB,closestvalueyB, 'kx','MarkerSize',10,'LineWidth',3,'DisplayName',TranspointstringB);
ylabel('\delta11B in ‰');
xlabel('Boron concentration in ppm');
hold on
LINE9111=plot(Bppmxfinal,Bfinalclosetobatchedtaylor,'DisplayName',initialvaluestringclsoedbatchedtaydisplayB);
axis([baxesmin baxesmax Byaxesmin Byaxesmax]);

if d11Btestyexist
    hold on
    R2plotB=plot(NaN,NaN,'DisplayName',stringRfactormB, 'linestyle', 'none');
    hold on
  adjR2plotB=plot(NaN,NaN,'DisplayName',stringadjRfactormB, 'linestyle', 'none');
  hold on
  RMSEvalplotB=plot(NaN,NaN,'DisplayName',stringRMSEvalB, 'linestyle', 'none');

 legend([LINE9111,DOT9111,R2plotB,adjR2plotB,RMSEvalplotB],'Location','southeast');          
  
assignin('base','R2plotB',R2plotB);
assignin('base','adjR2plotB',adjR2plotB);
assignin('base','RMSEvalplotB',RMSEvalplotB);


else
legend([LINE9111,DOT9111],'Location','southeast');  
end

assignin('base','F9111',F9111);
grid on;
hold off


assignin('base','LINE9111',LINE9111);							
assignin('base','DOT9111',DOT9111);
assignin('base','Transpointstring',TranspointstringB)

Boroncontent=Bppmxfinal';
Bfinalclosetobatchedtaylor1=num2cell(Bfinalclosetobatchedtaylor);

Boroncontent1=num2cell(Boroncontent);

Bininitialvalue=cell(1,length(Boroncontent));
for TablepreploopB=1:length(Boroncontent)
    Bininitialvalue{TablepreploopB}=num2str('');
end

Bininitialvalueemtpy=Bininitialvalue';
RfactormstringtableB=Bininitialvalueemtpy;
adjRfactormstringtableB=Bininitialvalueemtpy;
RMSEvalstringtableB=Bininitialvalueemtpy;
Bininitialvalueemtpy{closestvaluenumberxB}='   Transition point';
Bininitialvalueemtpy{1}=strcat(' TP:', 32, TranspointstrgxB,' ppm',',',TranspointstrgyB,' ‰');

Bininitialvalue{1}=num2str(initialvalueclosebatchedtaylorB);
Bininitialvalue=Bininitialvalue';


if d11Btestyexist

RfactormstringtableB{1}=RfactormB;
adjRfactormstringtableB{1}=adjRfactormB;
RMSEvalstringtableB{1}=RMSEvalB;

F9319=figure(9319);set(F9319,'name','Selected closed-, to batched-system degassing (variable % water loss) table (do not copy & paste from here)', ...
    'numbertitle','off','unit','normalized','Position', [0.2 0.2 0.43 0.5]);
deltacode = char(hex2dec('03B4'));                                           %workaround for uitable in next line. Uitable can not read special characters or tex code (\delta), hex2dec translate Unicode into ASCII code which then can be read by char as the special character                                       
TableclosedbatchetaylorB=uitable('Data',[Boroncontent1,Bfinalclosetobatchedtaylor1,Bininitialvalueemtpy,Bininitialvalue,RfactormstringtableB,adjRfactormstringtableB,RMSEvalstringtableB],'unit','normalized', ...           %creating a table on a new figure window whereas 'Data' considers the variable inside the next [] as the data it should write, which fills the whole figure  ('unit','normalized','Position', [0 0 1 1])       
'Position', [0 0 1 1],'ColumnName',{'Boron concentration in ppm',[' ',deltacode,'11B in ‰'],['        Transition point        '],[' Selected graph initial', 032,deltacode,'11B in ‰'], ...       %'ColumnsName', sets the next imnput inside the {} as the column names
['R',char(hex2dec('00B2'))],['adjR',char(hex2dec('00B2'))],['RMSE']});   

else
  F9319=figure(9319);set(F9319,'name','Selected closed-, to batched-system degassing (variable % water loss) table (do not copy & paste from here)','numbertitle','off');
deltacode = char(hex2dec('03B4'));                                          
TableclosedbatchetaylorB=uitable('Data',[Boroncontent1,Bfinalclosetobatchedtaylor1,Bininitialvalueemtpy,Bininitialvalue],'unit','normalized', ...          
   'Position', [0 0 1 1],'ColumnName',{'Boron concentration in ppm',[deltacode,'11B in ‰'],['        Transition point        '],['Selected graph initial', 032,deltacode,'11B in ‰']});   
  
    
end



DataoftableB=get(TableclosedbatchetaylorB,'Data');                                   
ColumnheaderB=get(TableclosedbatchetaylorB,'ColumnName');                           

                               
DataofgraphclosebatchedtaylorB=[ColumnheaderB';DataoftableB];




assignin('base','DataofgraphclosebatchedtaylorB',DataofgraphclosebatchedtaylorB);


function Boronlossateachstepstring_Callback(hObject, eventdata, handles)
% hObject    handle to Boronlossateachstepstring (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Boronlosspercentageinput=str2double(get(hObject,'String'));                                                            
assignin('base','Boronlosspercentageinput',Boronlosspercentageinput);
% Hints: get(hObject,'String') returns contents of Boronlossateachstepstring as text
%        str2double(get(hObject,'String')) returns contents of Boronlossateachstepstring as a double


% --- Executes during object creation, after setting all properties.
function Boronlossateachstepstring_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Boronlossateachstepstring (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Inputexcelboron.
function Inputexcelboron_Callback(hObject, eventdata, handles)
% hObject    handle to Inputexcelboron (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filenameBor2, pathnameBor2] = ...                                                  %saving filename and pathname together of
     uigetfile({'*.*'},'File Selector');                                    %selected file of all formats ({'*.*'})which are selected from the opened window named File selector( file selection dialog box) /(uigetfile({'*.*'},'File Selector')
fullpathB=strcat(pathnameBor2,filenameBor2);                                         %saving filename and selected path as actual usable variable
assignin('base','fullpathB',fullpathB);                                       %saving variable to workspace
if filenameBor2==0

  return
end


% --- Executes on button press in PlotnormalfirstBoron.
function PlotnormalfirstBoron_Callback(hObject, eventdata, handles)
% hObject    handle to PlotnormalfirstBoron (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

existfullpathB=evalin( 'base', 'exist(''fullpathB'',''var'') == 1' );          %check existence of a vatiable, output is a logical 1 or 0 representing true and false

if existfullpathB                                                            % if fullpath exists, the following code is invoked
    
existDOT9111=evalin( 'base', 'exist(''DOT9111'',''var'') == 1' );     %check existence of a vatiable, output is a logical 1 or 0 representing true and false
existpolydegreeB=evalin( 'base', 'exist(''polydegreeB'',''var'') == 1' );     %check existence of a vatiable, output is a logical 1 or 0 representing true and false



if existpolydegreeB                                                          % if polydegree exists polydegree is loaded to function
     polydegreeB=evalin('base','polydegreeB');                                %loading variable form workspace into function (evalin) 
else                                                                        %if polydegree does not exist set it as 2
    polydegreeB=2;
end                                                                         %end if loop

fullpathB=evalin('base','fullpathB');
testyB=xlsread(fullpathB);                                                    %reading excel data from user selected file                                                        
polyfitdataB=polyfit(testyB(:,1),testyB(:,2),polydegreeB);                      %calculation and saving of the polifit factor (polynomial function coefficients ) polynomial curve fitting with selected polynomial degree
mintestB=min(testyB(:,1));                                                    %finding and saving minimum value of the excel sheet as variable
maxtestB=max(testyB(:,1));                                                    %finding and saving maximum value of the excel sheet as variable
polyfitdatafinerB=linspace(mintestB,maxtestB);                                 %creating a lot of evenly spaced points between min and max to make a finer x axis and to interpolate these polyfitted data
fB = polyval(polyfitdataB,polyfitdatafinerB);                                  %evaluation and calculation of calculated polynomial factor of polyfit based on each data point (x axis) 
figure(50);                                                                  %calling figure 1 which shows the before calculated graphs of openandclose script   

hold on                                                                     %code to plot more than one plot in same figure without overwriting the existing plot
testpointsB=plot(testyB(:,1),testyB(:,2),'r.','MarkerSize',10,'DisplayName','Sample data');                 %plotting all original data points as dots with a marker size of 10 and display name Sample data for the legend
hold on 
TestplotB=plot(polyfitdatafinerB,fB,'k','DisplayName','Polyfittedplot');                                      %plot calculated polynomial function based on the x axes values    
 
hold off
if existDOT9111
 TranspointstringB=evalin('base','TranspointstringB');   
closestvaluexB=evalin('base','closestvaluexB');
closestvalueyB=evalin('base','closestvalueyB');

hold on
DOT9111=plot(closestvaluexB,closestvalueyB, 'kx','MarkerSize',10,'LineWidth',3,'DisplayName',TranspointstringB);
        legend([testpointsB,TestplotB,DOT9111],'Location','southeast')         %set legend as the before saved plots [testpoints,Testplot,DOT111]    
hold off
else
legend([testpointsB,TestplotB],'Location','southeast')
end
  

assignin('base','polyfitdatafinerB',polyfitdatafinerB);                       %saving variables to workspace
assignin('base','testyB',testyB);
assignin('base','TestplotB',TestplotB);
assignin('base','testpointsB',testpointsB);
assignin('base','fB',fB);

else                                                                        % if fulltpath does not exist the following code is applied
    errordlg(strcat('Input a prepared excel with sample data first by pressing Input Excel'),'Error');    %Opens an error dialog box
    
end




% --- Executes on button press in DeletaallplotsBoron.
function DeletaallplotsBoron_Callback(hObject, eventdata, handles)
% hObject    handle to DeletaallplotsBoron (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

TestplotB=evalin('base','TestplotB');
testpointsB=evalin('base','testpointsB');
delete(testpointsB(1))                                                       %deletion and clearing of plots (point and lines of user data)
clear testpointsB
delete(TestplotB(1))
clear TestplotB


function PolyndegreeBoron_Callback(hObject, eventdata, handles)
% hObject    handle to PolyndegreeBoron (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
polydegreeB=str2double(get(hObject,'String'));  

assignin('base','polydegreeB',polydegreeB); 
% Hints: get(hObject,'String') returns contents of PolyndegreeBoron as text
%        str2double(get(hObject,'String')) returns contents of PolyndegreeBoron as a double


% --- Executes during object creation, after setting all properties.
function PolyndegreeBoron_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PolyndegreeBoron (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in DeletepolyfitBoron.
function DeletepolyfitBoron_Callback(hObject, eventdata, handles)
% hObject    handle to DeletepolyfitBoron (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
TestplotB=evalin('base','TestplotB');                                                    
delete(TestplotB(1))
clear TestplotB


% --- Executes on button press in GridOnOff11B.
function GridOnOff11B_Callback(hObject, eventdata, handles)
% hObject    handle to GridOnOff11B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
existF50=evalin( 'base', 'exist(''F50'',''var'') == 1' );


if existF50
F50=evalin('base','F50');                                                     %excecuting variable on base workspace and saving it in function 
F51=evalin('base','F51');     
F52=evalin('base','F52');     

if ishandle(F50)                                                            %ishandle only checks the existence of a figure. If it is closed or not avaiable, the output value is a logical 0 which is a false. In an if loop a false does not excecute the code inside
figure(50);                                                                 %
grid
end

if ishandle(F51)
figure(51);
grid
end

if ishandle(F52)
figure(F52);
grid
end
end

existF9100=evalin( 'base', 'exist(''F9100'',''var'') == 1' );
existF9111=evalin( 'base', 'exist(''F9111'',''var'') == 1' );


if existF9100 && existF9111
    
    F9100=evalin('base','F9100');  
    F9111=evalin('base','F9111'); 
    
    if ishandle(F9100)
figure(F9100);
grid
    end
    
    if ishandle(F9111)
figure(F9111);
grid
    end

elseif ~existF9100 && existF9111	
    
    F9111=evalin('base','F9111');  
    
    if ishandle(F9111)
figure(F9111);
grid
    end
    
    
end
    
    
    
existautofB=evalin( 'base', 'exist(''autofuncionusedB'',''var'') == 1' );
 
if existautofB
  
    F3551=evalin('base','F3551'); 
    F6554=evalin('base','F6554'); 
    F6556=evalin('base','F6556'); 
      

    
    
    F1556=evalin('base','F1556'); 
    F1656=evalin('base','F1656'); 
    F1256=evalin('base','F1256'); 
      
    F6551=evalin('base','F6551'); 
   
      
          if ishandle(F3551)
figure(3551);
grid
          end
    
    if ishandle(F6554)
figure(6554);
grid
    end
    
    if ishandle(F6556)
figure(6556);
grid
    end
    
    if ishandle(F1556)
figure(1556);
grid
    end
    
    if ishandle(F1656)
figure(1656);
grid
    end
    
    if ishandle(F1256)
figure(1256);
grid
    end
    
    if ishandle(F6551)
figure(6551);
grid
    end

  end
    

% --- Executes on button press in GridOnOffdD.
function GridOnOffdD_Callback(hObject, eventdata, handles)
% hObject    handle to GridOnOffdD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
existF1=evalin( 'base', 'exist(''F1'',''var'') == 1' );



if existF1
F1=evalin('base','F1');                                                     %excecuting variable on base workspace and saving it in function 
F2=evalin('base','F2');     
F3=evalin('base','F3');     

if ishandle(F1)                                                            %ishandle only checks the existence of a figure. If it is closed or not avaiable, the output value is a logical 0 which is a false. In an if loop a false does not excecute the code inside
figure(1);                                                                 %
grid
end

if ishandle(F2)
figure(2);
grid
end

if ishandle(F3)
figure(3);
grid
end
end

existF100=evalin( 'base', 'exist(''F100'',''var'') == 1' );
existF111=evalin( 'base', 'exist(''F111'',''var'') == 1' );
existF1112=evalin( 'base', 'exist(''F1112'',''var'') == 1' );

if existF100 && existF111
    
    F100=evalin('base','F100');  
    F111=evalin('base','F111'); 
    
    if ishandle(F100)
figure(100);
grid
    end
    
    if ishandle(F111)
figure(111);
grid
    end

elseif ~existF100 && ~existF1112 && existF111	
    
    F111=evalin('base','F111');  
    
    if ishandle(F111)
figure(111);
grid
    end
    
elseif existF1112
    
    F100=evalin('base','F100'); 
    F111=evalin('base','F111'); 
    F1112=evalin('base','F1112'); 
    
    if ishandle(F100)
figure(100);
grid
    end
    
    if ishandle(F111)
figure(111);
grid
    end
    
    if ishandle(F1112)
figure(1112);
grid
    end
  
    
end
    
    
    
existautof=evalin( 'base', 'exist(''autofuncionused'',''var'') == 1' );
 
if existautof
  
    F1334=evalin('base','F1334'); 
    F1338=evalin('base','F1338'); 
    F1339=evalin('base','F1339'); 
      
    F1256=evalin('base','F1256'); 
    F15687=evalin('base','F15687'); 
    F16687=evalin('base','F16687'); 
      
    F11265=evalin('base','F11265'); 
   
      
          if ishandle(F1334)
figure(1334);
grid
          end
    
    if ishandle(F1338)
figure(1338);
grid
    end
    
    if ishandle(F1339)
figure(1339);
grid
    end
    
    if ishandle(F1256)
figure(1256);
grid
    end
    
    if ishandle(F15687)
figure(15687);
grid
    end
    if ishandle(F16687)
figure(16687);
grid
    end
    
    if ishandle(F11265)
figure(11265);
grid
    end

  end
    
    existF57789=evalin( 'base', 'exist(''F57789'',''var'') == 1' );

   if existF57789 
    
        F57789=evalin('base','F57789'); 
        
   if ishandle(F57789)
figure(57789);
grid
   end
    
   end



function Setlegendfontsized11B_Callback(hObject, eventdata, handles)
% hObject    handle to Setlegendfontsized11B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Setlegendfontsized11B as text
%        str2double(get(hObject,'String')) returns contents of Setlegendfontsized11B as a double
Fontsizechosend11B=str2double(get(hObject,'String'));  
existF50=evalin( 'base', 'exist(''F50'',''var'') == 1' );


if existF50
F50=evalin('base','F50');                                                     %excecuting variable on base workspace and saving it in function 
F51=evalin('base','F51');     
F52=evalin('base','F52');     

if ishandle(F50)                                                            %ishandle only checks the existence of a figure. If it is closed or not avaiable, the output value is a logical 0 which is a false. In an if loop a false does not excecute the code inside
figure(50);                                                                 %
 set(findall(gcf,'type','Legend'),'FontSize',Fontsizechosend11B);
end

if ishandle(F51)
figure(51);
 set(findall(gcf,'type','Legend'),'FontSize',Fontsizechosend11B);
end

if ishandle(F52)
figure(F52);
 set(findall(gcf,'type','Legend'),'FontSize',Fontsizechosend11B);
end
end

existF9100=evalin( 'base', 'exist(''F9100'',''var'') == 1' );
existF9111=evalin( 'base', 'exist(''F9111'',''var'') == 1' );


if existF9100 && existF9111
    
    F9100=evalin('base','F9100');  
    F9111=evalin('base','F9111'); 
    
    if ishandle(F9100)
figure(F9100);
 set(findall(gcf,'type','Legend'),'FontSize',Fontsizechosend11B);
    end
    
    if ishandle(F9111)
figure(F9111);
 set(findall(gcf,'type','Legend'),'FontSize',Fontsizechosend11B);
    end

elseif ~existF9100 && existF9111	
    
    F9111=evalin('base','F9111');  
    
    if ishandle(F9111)
figure(F9111);
 set(findall(gcf,'type','Legend'),'FontSize',Fontsizechosend11B);
    end
    
    
end
    
    
    
existautofB=evalin( 'base', 'exist(''autofuncionusedB'',''var'') == 1' );
 
if existautofB
  
    F3551=evalin('base','F3551'); 
    F6554=evalin('base','F6554'); 
    F6556=evalin('base','F6556'); 
      

    
    
    F1556=evalin('base','F1556'); 
    F1656=evalin('base','F1656'); 
    F1256=evalin('base','F1256'); 
      
    F6551=evalin('base','F6551'); 
   
      
          if ishandle(F3551)
figure(3551);
 set(findall(gcf,'type','Legend'),'FontSize',Fontsizechosend11B);
          end
    
    if ishandle(F6554)
figure(6554);
 set(findall(gcf,'type','Legend'),'FontSize',Fontsizechosend11B);
    end
    
    if ishandle(F6556)
figure(6556);
 set(findall(gcf,'type','Legend'),'FontSize',Fontsizechosend11B);
    end
    
    if ishandle(F1556)
figure(1556);
 set(findall(gcf,'type','Legend'),'FontSize',Fontsizechosend11B);
    end
    
    if ishandle(F1656)
figure(1656);
 set(findall(gcf,'type','Legend'),'FontSize',Fontsizechosend11B);
    end
    if ishandle(F1256)
figure(1256);
 set(findall(gcf,'type','Legend'),'FontSize',Fontsizechosend11B);
    end
    
    if ishandle(F6551)
figure(6551);
 set(findall(gcf,'type','Legend'),'FontSize',Fontsizechosend11B);
    end

  end
    
 

% --- Executes during object creation, after setting all properties.
function Setlegendfontsized11B_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Setlegendfontsized11B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function setlegendfontsizedD_Callback(hObject, eventdata, handles)
% hObject    handle to setlegendfontsizedD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of setlegendfontsizedD as text
%        str2double(get(hObject,'String')) returns contents of setlegendfontsizedD as a double
Fontsizeofuserrr=str2double(get(hObject,'String'));                        %get(hObject),'String') grabs the still in string format value the user put in the field, str2double translates the string value into a real number value for the program to use                                                         

existF1=evalin( 'base', 'exist(''F1'',''var'') == 1' );





if existF1
F1=evalin('base','F1');                                                     %excecuting variable on base workspace and saving it in function 
F2=evalin('base','F2');     
F3=evalin('base','F3');     

if ishandle(F1)                                                            %ishandle only checks the existence of a figure. If it is closed or not avaiable, the output value is a logical 0 which is a false. In an if loop a false does not excecute the code inside
figure(1);                                                                 %
set(findall(gcf,'type','Legend'),'FontSize',Fontsizeofuserrr);                                                    %this line sets the desired font size for all fonts inside the active figure. "gca" access the current axes handle in which the property "FontSize" is adressed. With "findall()" all properties of FontSize within a figure are adressed and these are set with "set(...., 'FontSize',Fontsizeofuserrr)
end

if ishandle(F2)
figure(2);
set(findall(gcf,'type','Legend'),'FontSize',Fontsizeofuserrr);
end

if ishandle(F3)
figure(3);
set(findall(gcf,'type','Legend'),'FontSize',Fontsizeofuserrr);
end
end

existF100=evalin( 'base', 'exist(''F100'',''var'') == 1' );
existF111=evalin( 'base', 'exist(''F111'',''var'') == 1' );
existF1112=evalin( 'base', 'exist(''F1112'',''var'') == 1' );

if existF100 && existF111
    
    F100=evalin('base','F100');  
    F111=evalin('base','F111'); 
    
    if ishandle(F100)
figure(100);
set(findall(gcf,'type','Legend'),'FontSize',Fontsizeofuserrr);
    end
    
    if ishandle(F111)
figure(111);
set(findall(gcf,'type','Legend'),'FontSize',Fontsizeofuserrr);
    end

elseif ~existF100 && ~existF1112 && existF111	
    
    F111=evalin('base','F111');  
    
    if ishandle(F111)
figure(111); 
set(findall(gcf,'type','Legend'),'FontSize',Fontsizeofuserrr);
end
    
elseif existF1112
    
    F100=evalin('base','F100'); 
    F111=evalin('base','F111'); 
    F1112=evalin('base','F1112'); 
    
    if ishandle(F100)
figure(100);
set(findall(gcf,'type','Legend'),'FontSize',Fontsizeofuserrr);
    end
    
    if ishandle(F111)
figure(111);
set(findall(gcf,'type','Legend'),'FontSize',Fontsizeofuserrr);
    end
    
    if ishandle(F1112)
figure(1112);
set(findall(gcf,'type','Legend'),'FontSize',Fontsizeofuserrr);
    end
  
    
end
    
    
    
existautof=evalin( 'base', 'exist(''autofuncionused'',''var'') == 1' );
 
if existautof
  
    F1334=evalin('base','F1334'); 
    F1338=evalin('base','F1338'); 
    F1339=evalin('base','F1339'); 
      
    F1256=evalin('base','F1256'); 
    F15687=evalin('base','F15687'); 
    F16687=evalin('base','F16687'); 
      
    F11265=evalin('base','F11265'); 
   
      
          if ishandle(F1334)
figure(1334);
set(findall(gcf,'type','Legend'),'FontSize',Fontsizeofuserrr);
          end
    
    if ishandle(F1338)
figure(1338);
set(findall(gcf,'type','Legend'),'FontSize',Fontsizeofuserrr);
    end
    
    if ishandle(F1339)
figure(1339);
set(findall(gcf,'type','Legend'),'FontSize',Fontsizeofuserrr);
    end
    
    if ishandle(F1256)
figure(1256);
set(findall(gcf,'type','Legend'),'FontSize',Fontsizeofuserrr);
    end
    
    if ishandle(F15687)
figure(15687);
set(findall(gcf,'type','Legend'),'FontSize',Fontsizeofuserrr);
    end
    if ishandle(F16687)
figure(16687);
set(findall(gcf,'type','Legend'),'FontSize',Fontsizeofuserrr);
    end
    
    if ishandle(F11265)
figure(11265);
set(findall(gcf,'type','Legend'),'FontSize',Fontsizeofuserrr);
    end

  end
    
    existF57789=evalin( 'base', 'exist(''F57789'',''var'') == 1' );

   if existF57789 
    
        F57789=evalin('base','F57789'); 
        sub111=evalin('base','sub111'); 
        sub212=evalin('base','sub212'); 


assignin('base','sub111',sub111);

   if ishandle(F57789)
figure(57789);
set(findall(gcf,'type','Legend'),'FontSize',Fontsizeofuserrr);

    end
    
   end
    

% --- Executes during object creation, after setting all properties.
function setlegendfontsizedD_CreateFcn(hObject, eventdata, handles)
% hObject    handle to setlegendfontsizedD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
