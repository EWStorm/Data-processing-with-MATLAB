

function projection= computeProjection(a)
%dimentions of vector b should modify to fit to dimention of input-a
length(a);
b=ones(1,length(a)); 

projection=dot(a,b)/norm(a)^2.*a;
end 




