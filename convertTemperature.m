% 5A. temperature conversion

function T = convertTemperature(T, unitFrom, unitTo)
 %3 STRINGS 
s1='Celsius'; 
s2='Fahrenheit';
s3='Kelvin';
% Celsius to convert to....F, to K
if strcmp(s1, unitFrom)==1 && strcmp(s2, unitTo)==1
    T=1.8*T+32;

elseif strcmp(s1, unitFrom)==1 && strcmp(s3, unitTo)==1
    T= T+273.15; 
   
end 
%'Fahrenheit' to C, F to K. 
if strcmp(s2, unitFrom)==1 && strcmp(s1, unitTo)==1
    T=(T-32)/1.8;

elseif strcmp(s2, unitFrom)==1 && strcmp(s3, unitTo)==1
    T=(T+459.67)/1.8;  
   
end 
%Kelvin to C, to F. 
if strcmp(s3, unitFrom)==1 && strcmp(s1, unitTo)==1
    T=T-273.15;

elseif strcmp(s3, unitFrom)==1 && strcmp(s2, unitTo)==1   
    T=1.8*T-459.67; 

end 
  disp(T);
end 
