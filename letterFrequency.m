%Assignment 6D. 
%frequency of letters 
%% to do : function that takes the text file as an input and computes the frequency of the letters 
% in the text. converts the text to lower case, only uses characters from a
% to z. 
%1. read text file, convert to lower case
%2. count the number of times each of the letters a to z occur. using a string or a vector with a...z, and a loop. (vector size 26. )
%3. output a vector, size 26, frequency of each letter occurence. 

function freq=letterFrequency(filename)
textVar=fileread(filename); 

newStr=lower(textVar); %lower case convertion 
%replace punctuation marcs and some letters with space characters 
p = [".","?","!",",",";",":", "'", "å", "æ","ø"];
newStr=replace(newStr,p," "); 
 %replace numbers with space characters 
pat = digitsPattern(1);
newStr = replace(newStr,pat,""); 


%***converts to numbers 
newStr=lower(newStr)- '0' - 48; 

% Take the histogram.
edges = 1:27;
counts = histcounts(newStr, edges); %how many times occurs 
% counts(1) is the number of "a"s in the word.
% counts(26) is the number of "z"s in the word.

freq=counts./sum(counts)*100; %freq. in %


end  


