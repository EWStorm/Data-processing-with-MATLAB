%  Introduction to programming and data processing. 2021
%Ekaterina Wyss Storm (163627).
%count novel words. Assignment B 
%with use of Text analytical tool box 
%


function c=count_novel(filename)
filename='small_text.txt';
str = extractFileText(filename);
textData = split(str,newline);
document = tokenizedDocument(textData);

bag = bagOfWords(document);
T = topkwords(bag);
k = 20000; %prolem 1: difficulty with setting limits of k=number of words 
T = topkwords(bag,k) %table with words and number of encounters 
%problem 2: reads also signs like commas and dots. 

c=T.Count'; %extracting vector c from the Table
disp(c);
end 


