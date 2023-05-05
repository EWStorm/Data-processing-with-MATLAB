% Aggregate measurements according to a given period
%
% Usage: [tvec_a, data_a] = aggregate_measurements(tvec, data, period)
% The function takes as input a matrix of time vectors tvec,
% a matrix of measurements data, and a string period that determines
% how to aggregate1 the measurements. The input period
%
% Author: Erlend André Hall, s202055
%Co-authors: 
%            


function [tvec_a, data_a] = aggregate_measurements(tvec, data, period)
%Creates a combine matrix of tvec and data
Combined_matrix = [tvec,data];
%If the user chooses no aggregation, nothing is done to either of the
%vectors
if strcmp(period,'Consumption per minute (no aggregation)')
    tvec_a = tvec;
    data_a = data;
end
%If the user chooses a monthly period
if strcmp(period,'Consumption per month')
    %creates an empty array that can be filled in the loop
    consumption = [];
    %creates an empty array that can be filled in the loop
    %Finding the rows with unique months, last one is showing
    [~,months] = unique(Combined_matrix(:,2),'last');
    %Adding the columns belonging to the tvec with the unique months
    unique_months = Combined_matrix(months,1:6);

for ii=1:12
    %month_i is the sum of the EL consumption for each month in each zone
    month_i = sum(Combined_matrix((Combined_matrix(:,2))==ii,7:end),1);
    %Adding the EL consumption for each month_i into a matrix
    consumption = [consumption;month_i];
end
%setting data_a equal to the matrix with EL consumption of all the months
data_a = consumption;
%Removing rows with only zeros
data_a( ~any(data_a,2), : ) = []; %source: https://se.mathworks.com/matlabcentral/answers/40018-delete-zeros-rows-and-columns
%setting tvec_a equal to representative matrix above
tvec_a = unique_months;
end
if strcmp(period,'Consumption per day')
    %creates an empty array that can be filled in the loop
    consumption = [];
    %creates an empty array that can be filled in the loop
    unique_days = [];
    for ii=1:12
        %Splits the tvec into parts for each month, zooms in one fraction
        %of the combined matrix
        zoom_1 = Combined_matrix((Combined_matrix(:,2)==ii),1:end);
        %Finds the rows for the unique days in each month, last one is showing 
        [~,days] = unique(zoom_1(:,3),'last');
        %Adding the columns belonging to the tvec with the unique days for
        %each month
        unique_days=[unique_days;zoom_1(days,1:6)];
        for i=1:31
            %day_i is the sum of the EL consumption for each day in the 
            %respective month in each zone
            day_i = sum(zoom_1((zoom_1(:,3))==i,7:end),1);
            %Adding the EL consumption for each day_i into a matrix
            consumption = [consumption;day_i];
        end
    end
%setting data_a equal to the matrix with EL consumption of all the months
data_a = consumption;
%Removing rows with only zeros
data_a( ~any(data_a,2), : ) = []; %source: https://se.mathworks.com/matlabcentral/answers/40018-delete-zeros-rows-and-columns
%setting tvec_a equal to representative matrix in the loop
tvec_a = unique_days;
end

if strcmp(period,'Consumption per hour')
    %creates an empty array that can be filled in the loop
    consumption = [];
    %creates an empty array that can be filled in the loop
    unique_hours = [];
    for ii=1:12
        %Splits the tvec into parts for each month, zooms in one fraction
        %of the combined matrix 
        zoom_1 = Combined_matrix((Combined_matrix(:,2)==ii),1:end);
        for i=1:31
            %Splits the tvec into parts foreach day in each month, zooms 
            %in another fraction of the combined matrix
            zoom_2 = zoom_1((zoom_1(:,3)==i),1:end);
            %Finds the rows for the unique hours in each day, last one is showing
            [~,hours] = unique(zoom_2(:,4),'last');
            %Adding the columns belonging to the tvec with the unique hours for
            %each day in each month
            unique_hours = [unique_hours;zoom_2(hours,1:6)];
            for iii = 0:24
            %hour_i is the sum of the EL consumption for each hour in the 
            %respective day and month in each zone
            hour_i = sum(zoom_2((zoom_2(:,4))==iii,7:end),1);
            %Adding the EL consumption for each hour into a matrix
            consumption = [consumption;hour_i];
            end
        end
    end
%setting data_a equal to the matrix with EL consumption of all the months
data_a = consumption;
%Removing rows with only zeros
data_a( ~any(data_a,2), : ) = []; %source: https://se.mathworks.com/matlabcentral/answers/40018-delete-zeros-rows-and-columns
%setting tvec_a equal to representative matrix in the loop
tvec_a = unique_hours;
end

if strcmp(period,'Hour-of-day consumption (hourly average)')
    %creates an empty array that can be filled in the loop
    something = [];
for i=0:24
    % hour_i is the mean of the EL consumption for each hour through the
    % year
    hour_i = mean(Combined_matrix((Combined_matrix(:,4))==i,7:end),1);
    % Adding the EL consumption for each month i into a matrix
    something = [something;hour_i];
end
%setting data_a equal to the matrix with EL consumption of all the months
data_a = something;
%Removing rows with only zeros
data_a( ~any(data_a,2), : ) = []; %source: https://se.mathworks.com/matlabcentral/answers/40018-delete-zeros-rows-and-columns
%Finds the rows for the unique hours in each day, last one is showing
[~,hour] = unique(Combined_matrix(:,4),'last');
%Adding the columns belonging to the tvec with the hours
unique_months = Combined_matrix(hour,1:6);
tvec_a = unique_months;
end

end