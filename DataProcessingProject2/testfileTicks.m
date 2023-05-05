%testfile ticks 


f4 = figure('Name','Electricity Consumption, year 2008. Bar chart.','NumberTitle','off','WindowState', 'maximized');  

%extracting data for each zone. 
Zone1=data_a(:,1);
Zone2=data_a(:,2); 
Zone3=data_a(:,3);
Zone4=data_a(:,4); 

% Create 4 plots
t = tiledlayout(2,2); 
t.TileSpacing = 'compact';
t.Padding = 'compact';

%bar chart for zone 1. 
ax1=nexttile ;
b1=bar(Zone1,0.5);
title('Electricity consumption, Zone1');
grid(ax1,'on') 
 grid minor 

% zone2
ax2=nexttile ;
b2=bar(Zone2, 0.5);
title('Electricity consumption, Zone2');
ylim auto 
grid(ax2,'on')
grid minor 

%zone3
ax3=nexttile;
b3=bar(Zone3,0.5);
title('Electricity consumption, Zone3');
ylim auto 
grid(ax3,'on')
grid minor 

%zone 4
ax4=nexttile;
b4=bar(Zone4,0.5);
title('Electricity consumption, Zone4'); 
grid(ax4,'on')
grid minor 

%set colors for the bars, aligned with the figure 1 colors from CombPlot function 
b1.FaceColor = [0 0 0]; %black 
b2.FaceColor = [1 0 0]; %red
b3.FaceColor = [0 0 1]; %blue
b4.FaceColor = [0 1 0]; %'green

%Display Shared Title and Axis Labels
linkaxes([ax1,ax2,ax3, ax4],'x');
xlabel(t,sprintf('Time scale: %s', timescale));
ylabel(t,'units, W/h');
[t,s]=title(t,sprintf('Electricity consumption in zones 1-4. Time scale for data agregation - %s.', timescale));
t.FontSize=11;

%adjusting x-axis labels for timescale 'monthly' or 'hourly average' or standard. 
timescale='monthly'; 
%timescale='hourly average';
if strcmp(timescale,'monthly') 
    month = [ "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
     xlim([0 12])
     xticks(0:12);
     %xticklabels(month);
   
    xticklabels(ax1,month);
    xticklabels(ax2,month);
    xticklabels(ax3,month);
    xticklabels(ax4,month);
    
    
elseif strcmp(timescale,'hourly average')
    hourly = ["", "00-01", "01-02", "02-03", "03-04", "04-05", "05-06", "06-07", "07-08", "08-09", "09-10", "10-11", "11-12", "12-13", "13-14", "14-15", "15-16", "16-17", "17-18", "18-19", "19-20", "20-21", "21-22", "22-23", "23-00"];
    xlim([0 25])
    xticks(0:25);
    xticklabels(hourly);
else
    xticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24]);
end
