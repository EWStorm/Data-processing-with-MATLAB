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


%% Function consumptionZonePlot.m  
%-receives matrixes size (Nx4, Nx6)- tvec_a, data_a, and a string- timescale.
%-displays El. consumption separately per each zone according to time scale: day or hour.
%Author: EW.Storm (163627). 
%Co-authors: Erlend André Hall, s202055
%            Johnnie Hundrup, s203983

function consumptionZonePlot(tvec_a,data_a, timescale)
 f3 = figure('Name','Electricity consumption, year 2008, Zones 1-4 of a household','NumberTitle','off','WindowState', 'maximized');
 
 %extracting measurements for plotting on y-axis 
zone1=data_a(:,1); %zone 1 data
zone2=data_a(:,2); %zone 2
zone3=data_a(:,3); %zone 3
zone4=data_a(:,4); %zone 4

%parameters for x-axis, time line.  
  x=(1:length(tvec_a));
  
%Reduce the spacing around the perimeter of the layout
t = tiledlayout(2,2);
t.Padding = 'compact';
t.TileSpacing = 'compact';

%plot, zone 1
%Create axes in tiled chart layout
ax1=nexttile;
plot(ax1,x ,zone1, 'Color' ,'k','LineWidth',0.5);
title('Electricity consumption, Zone1');
grid on 
grid minor 

%plot zone2
ax2=nexttile; 
plot(ax2,x,zone2, 'Color' ,'r','LineWidth',0.5)
title('Electricity consumption, Zone2')
grid on 
grid minor 

%zone 3
ax3=nexttile; 
plot(ax3, x, zone3,'Color','b','LineWidth',0.5)
title('Electricity consumption, Zone3')
grid on 
grid minor

% %zone4
ax4=nexttile; 
plot(ax4, x,zone4,'g','LineWidth',0.5);
title('Electricity consumption, Zone 4');
  grid on 
  grid minor 
 
%Link the axes, %Display Shared Title and Axis Labels
linkaxes([ax1,ax2,ax3, ax4],'x');
xlabel(t,sprintf('Time scale: %s', timescale));
xlim auto
ylabel(t,'units, W/h') %print units on ylabel 
title(t,sprintf('Electricity consumption in zones 1-4 measured per %s.', timescale));

end 


