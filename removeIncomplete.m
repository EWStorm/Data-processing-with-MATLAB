%%

function idComplete=removeIncomplete(id)
id=[1.3, 2.2, 2.3, 4.2, 5.1, 3.2, 5.3, 3.3, 2.1, 1.1, 5.2, 3.1];
 
experiment_number=floor(id) ; %raunding numbers 
%output=idComplete

for  i=1:max(experiment_number) 
    
   if  sum(experiment_number==i)~=3    
   experiment_number(experiment_number==i)=0; 
       
   end 
   
end 
 id(experiment_number==0)=0;

idComplete=id(id~=0);

 
 







 
%  
%  
% function idComplete = removeIncomplete3(id)
% 
% v=floor(id);
% 
% for i=1:max(v)
% 
% if sum(v==i) ~= 3
% 
% v(v==i)=0;
% 
% end
% 
% end
% 
% %indætter 0 alle steder i id vektor, hvor vektorer v har 0
% 
% id(v==0)=0;


 
 
 
 
 


% 
% function idComplete=removeIncomplete(id)
% id=[1.3, 2.2, 2.3,4.2,5.1,3.2,5.3, 3.3,2.1,1.1,5.2, 3.1]; 
% ex=floor(id) ; %experiment number rounded
% %counts and removes elements that occur less than 3 times. 
% x = sort(ex); 
% ii = [ find(x(1:end-1) ~= x(2:end)) length(x) ];
% l = diff([ 0 ii ]);
% v = x(ii);
% Output = v(l~=3); %numbers that occur less than 3 times (1,4)
% 
% %
% ex(v(l~=3)) = []; %removing the output 
% 
% idComplete=ex;
% disp(idComplete)

%
% 
% function idComplete=removeIncomplete(id)
% %id=[1.3, 2.2, 2.3, 4.2, 5.1, 3.2, 5.3, 3.3, 2.1, 1.1, 5.2, 3.1];
%  
%
















%  