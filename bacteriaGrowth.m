%%modul 4, assignment 4E.  bacteria growth 


function tN=bacteriaGrowth(n0, alpha, K, N)
% n0=100; %initial number of bacteria 
% alpha=0.4;
% K=1000; %capacity
% N=500; %final population size (n0<N<K) 
tN=0; %original time

while n0<=N 
   
tN=tN+1;
n0=(((1-(n0/K))*alpha)+1)*n0; 

tN=tN(end);

end 



end 


