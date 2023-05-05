% DATAPLOT Generate and display plots
%
% Usage: dataPlot(data))
% 
% Author: Ekaterina Wyss Storm, s163627
%
% Co-authors: Erlend André Hall, s202055
%             Johnnie Hundrup, s203983
%

function dataPlot(data)

ActiveFilter = cell2mat(struct2cell(load('ActivatedFilters.mat')));
noFilters = [10 60 0 1;0 0 0 0];
filterText = '';
filterText1 = '';
filterText2 = '';
filterText3 = '';
filterText4 = '';
filterText5 = '';

if ActiveFilter(:,:) == noFilters(:,:)
    filterText = 'No data filter is applied.';
end
if ActiveFilter(1,1) ~= noFilters(1,1)
    filterText1 = 'Active filter - Minimum Temperature set.';
end
if ActiveFilter(1,2) ~= noFilters(1,2)
    filterText2 = 'Active filter - Maximum Temperature set.';
end
if ActiveFilter(1,3) ~= noFilters(1,3)
    filterText3 = 'Active filter - Minimum Growth rate set.';
end
if ActiveFilter(1,4) ~= noFilters(1,4)
    filterText4 = 'Active filter - Maximum Growth rate set.';
end
if ActiveFilter(2,:) ~= noFilters(2,:)
    filterText5 = 'Active filter - One or more bacteria types has been chosen.';
end

f1 = figure('Name','Number of Bacteria'); %put a name to a figure 'Number of Bacteria'

f2 = figure('Name','Growth Rate by Temperature');

% plot 1 - Number of Bacteria
figure(f1);

%Computing data for plotting
Salmonella = sum((data(:,3) == 1)); %14
Bacillus = sum((data(:,3) == 2)); %27
Listeria = sum((data(:,3) == 3)); %20
Brochothrix = sum((data(:,3) == 4)); %5

X = categorical({'Salmonella enteria','Bacillus cereus','Listeria','Brochothrix thermosphacta'}); %names
Y = [Salmonella, Bacillus, Listeria, Brochothrix]; %the actual vector
%b = bar(X,Y,0.4,'b'); %40 %less in size, %how to make different colors?
b = bar(X, Y, 'FaceColor','flat');
grid on  %
grid minor %smaller grid lines 

%add a number to the top of bars --- NB! This can give a problem if a user
%is filtering data, need to check with filters (Ekaterina)

xtips1 = b(1).XEndPoints; %get coordinates of tips XEndpoints /YEnd, pass to text function  
ytips1 = b(1).YEndPoints; 
labels1 = string(b(1).YData); 
text(xtips1,ytips1,labels1,'HorizontalAlignment','center',...%specifies alignment vertical/horizontal
    'VerticalAlignment','bottom'); 

%TITLE
[t,s] = title('Amount of Bacteria','Color','black');
xlabel('Types of Bacteria') ;
ylabel('Number of dataset') ;

%bar(X,Y);
b.CData(1,:) = [1 0 0];
b.CData(2,:) = [0 1 0];
b.CData(3,:) = [0 0 1];
b.CData(4,:) = [1 1 0];

%positioning the figure
movegui(f1,[200 400]);

% plot 2 - Growth rate by temperature
figure(f2);

%Sorting data for plotting
[~,idx] = sort(data(:,1));
Sdata = data(idx,:);

xlim([10, 60]);% Set the limits of the x and y-axis'
%ymax = (max(data(:,2))+1)
ylim([0, 2]);

%Salmonella graph 
x_B1 = Sdata(Sdata(:,3) == 1,1);
y_B1 = Sdata(Sdata(:,3) == 1,2);
hold on

%Bacillus graph 
x_B2 = Sdata(Sdata(:,3) == 2,1);
y_B2 = Sdata(Sdata(:,3) == 2,2);

%Listeria graph 
x_B3 = Sdata(Sdata(:,3) == 3,1);
y_B3 = Sdata(Sdata(:,3) == 3,2);

%'Brochothrix thermosphacta'
x_B4 = Sdata(Sdata(:,3) == 4,1);
y_B4 = Sdata(Sdata(:,3) == 4,2);

%*******************************NEW PLOTS for figure 2 ********************
%make first Salmonella plot and hold on 
plot(x_B1,y_B1,'-o','DisplayName', 'Salmonella enterica', 'Color' ,'y') ;%Salmonella  
hold on
%add 3 other plots 
plot(x_B2,y_B2,'-o','DisplayName','Bacillus cereus','Color','r') ;  
plot(x_B3,y_B3,'-o','DisplayName','Listeria', 'Color', 'b');  
plot(x_B4,y_B4,'-o','DisplayName','Brochothrix thermosphacta', 'Color', 'g'); 
hold off 

warning('off')
 lgd = legend; %create legend 
 lgd.NumColumns = 2; %split legend in to 2 columns 
 lgd.Location= 'best'; %adjust location 
 title(lgd,'Types of Bacteria'); %title for the legend box 

xlabel('Temperature in degrees');
ylabel('Growth Rate');
grid on 

% TITLE
[tt,ss] = title('Visualisation of Growth Rate by Tempearture','Color','black'); %TITLE

% positioning the figure
movegui(f2,[-200 400]);

% create a info dialog for plots
f3 = warndlg({sprintf('The two plots are displayed, and you can use menu within each plot window.\n\nWhen you press OK the two plot windows will be closed, and you will return to the main menu!\n');filterText;filterText1;filterText2;filterText3;filterText4;filterText5}, 'Data plot function');
% positioning the figure
movegui(f3,[600 -600]);
% hold figure f3 until closing
waitfor(f3);

close all
clc

end













