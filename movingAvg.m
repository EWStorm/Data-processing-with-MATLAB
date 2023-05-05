
%Modul6. moving average

function ysmooth = movingAvg(y)
%y=[0.8];
matrix=[y 0 0 0 0; 

   0 y 0 0 0;

   0 0 y 0 0;

   0 0 0 y 0;

   0 0 0 0 y] ;


%adjusting vectors dimmensions

matrix = matrix(:,3: (length(y)+2));


%rows multiplied by number and then divide by 9

v=[1 2 3 2 1];

ysmooth=(v*matrix)/9;
end 
 
