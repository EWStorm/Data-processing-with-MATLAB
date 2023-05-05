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


%% Function barPlot.m 
%-receives a matrixes- data_a, and a string- 'period'.
%-displays combined bar chart for El. consumption in 4 zones for agragated data 
%in periods: 'monthly', 'hour of the day'.
%E.W. Storm (163627).
%Co-authors: Erlend André Hall, s202055
%            Johnnie Hundrup, s203983


function barPlot(data_a, timescale)
f2 = figure('Name', sprintf('Electricity Consumption, year 2008. Time period- %s.', timescale),'NumberTitle','off','WindowState', 'maximized');  

%extracting data for plotting 
Zone1=data_a(:,1);
Zone2=data_a(:,2); 
Zone3=data_a(:,3);
Zone4=data_a(:,4); 

Y = [Zone1, Zone2, Zone3, Zone4]; 
%adjusting the size of bars
b=bar(Y,1.5);
%set colors for the bars, aligned with the figure 1 colors from CombinedPlot 
b(1).FaceColor = [0 0 0]; %black 
b(2).FaceColor = [1 0 0]; %red
b(3).FaceColor = [0 0 1]; %blue
b(4).FaceColor = [0 1 0]; %green

grid on  
grid minor %smaller grid lines 

lgd = legend('Zone 1', 'Zone 2', 'Zone 3', 'Zone 4'); %create legend 
lgd.NumColumns = 2; %split legend in to 2 columns 
lgd.Location= 'best'; %adjust location 
lgd.FontSize = 8;
title(lgd,'1-4 Zones in a household'); %title for the legend box 

%TITLE
[t,s]=title('Electricity Consumption in a household for year 2008','Color','black');
t.FontSize = 11; 
%x,y labels 
h=xlabel(sprintf('Time scale: %s', timescale)); %adjust xlabel to the Scale/Period
set(h, 'FontSize', 11); %adjust font size (sourse:https://se.mathworks.com/matlabcentral/answers/8884-changing-font-size-using-xlabel)
ylabel('units: Watt/h'); 

%adjusting x-axis labels for timescale 'monthly' or 'hourly average' or standard. 
if strcmp(timescale,'monthly') 
    month = ["", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
    xlim([0 13])
    xticks(0:13);
    xticklabels(month);
elseif strcmp(timescale,'hourly average')
    hourly = ["", "00-01", "01-02", "02-03", "03-04", "04-05", "05-06", "06-07", "07-08", "08-09", "09-10", "10-11", "11-12", "12-13", "13-14", "14-15", "15-16", "16-17", "17-18", "18-19", "19-20", "20-21", "21-22", "22-23", "23-00"];
    xlim([0 25])
    xticks(0:25);
    xticklabels(hourly);
else
    xticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24]);
end 

end  