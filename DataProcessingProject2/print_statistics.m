%About the function print_statistics. 
%- receives matrixes size (Nx6,Nx4) tvec and data.
%- displays a table with min and max values, quartiles for each zone and
% summary. 
%Author: EW.Storm (163627)
%Co-authors: Erlend André Hall, s202055
%            Johnnie Hundrup, s203983 

%from theory -Descriptive statistics:
% *********Definitions:**********************************************************
%The first quartile (Q1) is defined as the middle number between the smallest number 
%(minimum) and the Median of the data set. It is also known as the lower or 25th empirical 
%quartile, as 25% of the data is below this point.
%The second quartile (Q2) is the median of a data set; thus 50% of the data lies 
%below this point.
%(Q3) is the middle value between the median and the highest value (maximum) of the data set.
%It is known as the upper or 75th empirical quartile, as 75% of the data lies below this point
%c: "A modern introduction to probability and statistics : understanding why and how". 
%Dekking, Michel. London: Springer. 2005. pp. 234–238. ISBN 978-1-85233-896-1. OCLC 262680588.
%https://archive.org/details/modernintroducti00dekk_722/page/n240/mode/2up
%____________________

function print_statistics(tvec, data)
%call global variable
global TimeScale

%Percintile calculation with build -in function- 'quantile'. 
X=data;
%%create a vector of cumulative probabilities -[0.0 0.25 0.50 0.75 1.0]. 
%0.25,0.5,0.75 relates to Q1,Q2,Q3- quantiles. Median = 50%(0.5), min=0,
%max=1. 
p = [0.0:0.1 0.25 0.50 0.75 1]; 
%calculate quantiles for each column of X: dim=1(default)+min and max value
ZoneMatrix = quantile(X,p); %matrix, Rows: quantiles, Columns: Zones 

%for the Table- make Transpose matrix 
matrix1=ZoneMatrix'; %(Rows:4 zones/ Col.: min, q1.q2,q3,max)
%sum of All values for the zones
sum_vector =sum(matrix1); %the last row in the matrix/Table 

%final matrix 
mm=[matrix1 ;sum_vector ]; 

%first Table 
A = array2table(mm,'VariableNames',{'Min','Q1','Q2','Q3','Max'});
Zones = [1,2,3,4,"all"]'; %make array Zones into a Table 
%second table 
b=array2table(Zones); 
%join 2 tables together 
T=[b A];
%display Table 
disp(T);

%print units and the time scale
fprintf('<strong> Time scale: %s </strong>\n', TimeScale);
fprintf('<strong> Units: Watt/hour</strong>\n');

end 


  

 
  






