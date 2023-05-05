name = input('Please enter your name: ', 's')
%len = str2double(input('Enter the length in meters: ', 's'));

%while true
T = str2double(input('Enter the temperature: ', 's'));
unitFrom=str2double(input('Enter the unit of temperature(Celsius, Fahrenheit, or Kelvin): ', 's'));
unitTo= str2double(input('Enter the unit co convert(Celsius, Fahrenheit, or Kelvin): ', 's'));
T=convertTemperature(T, unitFrom, unitTo);
 

fprintf('The temperature is %.2f', T)

% if ~isnan(T)
%  break;
% end
% disp('Not valid number. Please try again.')

%end 

%strfind(lower(bigText),lower(keyword)) case insensitive 

choice=menu('hello, choose a color', 'red', 'blue', 'green', 'white')
