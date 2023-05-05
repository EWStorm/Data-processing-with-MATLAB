%%7G assignment NATO alphabet 

function natoText=textToNato(plainText)
%plainText input word, strings 

% natoAlph=["Alpha","Bravo","Charlie","Delta","Echo","Foxtrot","Golf", ...
%     "Hotel","India","Juliet","Kilo","Lima","Mike","November","Oscar", ...
%     "Papa","Quebec","Romeo","Sierra","Tango","Uniform","Victor",...
%     "Whiskey","Xray","Yankee","Zulu"];

natoAlph={'Alpha','Bravo','Charlie','Delta','Echo','Foxtrot','Golf', ...
     'Hotel','India','Juliet','Kilo','Lima','Mike','November','Oscar', ...
     'Papa','Quebec','Romeo','Sierra','Tango','Uniform','Victor',...
     'Whiskey','Xray','Yankee','Zulu'}; 


var=plainText;
lw=lower(var) ; %lower case 
natoText = strjoin(natoAlph(char(lower(lw))-96), '-');

end  

%%Explanation: 
% This uses a trick that character arrays can be 
% treated as numeric arrays of their ASCII equivalent values. 
% The code char(lower(plainText))-96 converts plainText to lowercase, 
% then to a character array (if it isn't already) and implicitly converts 
% it to a numeric vector of ASCII values by subtracting 96. Since 'a' is equal 
% to 97, this creates an index vector containing the values 1 ('a') 
% through 26 ('z'). This is used to index the string array natoAlph, and 
% these are then joined together with hyphens (bindestreger).









