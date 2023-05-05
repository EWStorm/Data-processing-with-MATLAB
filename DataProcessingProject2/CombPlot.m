%% Generally about visualisation. 
%There are 4 functions used in visualisation: 
%CombPlot.m, barPlot.m, consumptionZonePlot.m, barPlot_perZone.m. 
%% 'CombPlot.m'- shows combined electricity consumption for all 4 zones for the 
%time scale: 'hour', 'day'. 
%% 'barPlot.m'- shows combined El. consumption for all zones for the periods
%'month', 'hour of the day' as a bar chart, since the agregated data contains
%less than 25 measurements. 
%% 'consumptionZonePlot.m'- plots the data for each zone separately,for the time scale: 
%'day','hour'.  
%% 'barPlot_perZone'- shows data for each zone in separate window as a bar chart.
% Time scale: 'month', hour of the day'. The agregated data contans less than 25 meausurements.  
%

%% Function CombPlot.m
%-receives matrixes- (size Nx6, Nx4)- tvec_a, data_a, and a string- 'timescale'.
%-diplays combined plot for El.consumption according to time scale: "hour", "day" in 4 Zones. 
%E.W. Storm (163627).
% Co-authors: Erlend André Hall, s202055
%            Johnnie Hundrup, s203983



function CombPlot(tvec_a,data_a, timescale)
f1 = figure('Name','Electricity consumption, year 2008', 'NumberTitle','off','WindowState', 'maximized');

%extract y-axis data for plotting for 4 zones 
zone1=data_a(:,1);
zone2=data_a(:,2);
zone3=data_a(:,3);
zone4=data_a(:,4);

%x- axis == time line. 
x=(1:length(tvec_a));

%first plot Zone1+ hold on
plot(x,zone1,'DisplayName', 'Zone 1- kitchen', 'Color' ,'k','LineWidth',0.3); 
hold on 
% %add 3 more plots for zones 2-4
plot(x,zone2,'DisplayName', 'Zone 2- the laundry room', 'Color' ,'r','LineWidth',0.3);
plot(x,zone3,'DisplayName', 'Zone 3- water heater, AC', 'Color' ,'b','LineWidth',0.3);
plot(x,zone4,'DisplayName', 'Zone 4- miscellaneous, out of scope of zones1-3', 'Color' ,'g','LineWidth',0.3);
hold off 
   
%adjusting x,y labels. 
 xlabel(sprintf('Time scale: %s', timescale)) ; %print time scale on xlabel 
 xlim auto
 ylabel('Units: W/h'); %print units on ylabel
  lgd = legend; %create legend 
  lgd.NumColumns = 2; %split legend in to 2 columns 
  lgd.Location= 'best'; %adjust location 
  title(lgd,'Electricity Consumption per zone'); %title for the legend box 
 grid on 
 grid minor 

 %TITLE
 [t,s] = title('Household Electricity Consumption, 2008.','Color','black'); 
 t.FontSize = 14;
 s.FontAngle = 'italic';
 
end 
