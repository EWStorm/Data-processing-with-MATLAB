%% ex.modul6. 6B. assignment

function itemCost = computeItemCost(resourceItemMatrix, resourceCost)
 %resourceItemMatrix= [6,3,0; 17,11,9; 4,2,12] ;
%resourceCost=[101.25; 84.00; 75.50];
% 
% A_cost=sum(resourceItemMatrix(:, 1)*resourceCost); 
% B_cost=sum(resourceItemMatrix(:, 2)*resourceCost);
% C_cost=sum(resourceItemMatrix(:, 3)*resourceCost);


itemCost=resourceCost*resourceItemMatrix;


end 
