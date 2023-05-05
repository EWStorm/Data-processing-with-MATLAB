%modul2. box assignment. 


function A=boxArea(boxCorners, area)

boxCorners(1:8);
index=[1,2,3,4,5,6,7,8];

index=[1]; 
x1=boxCorners(index);
index=[2];
x2=boxCorners(index);
index=[3];
x3=boxCorners(index);
index=[4];
x4=boxCorners(index);
index=[5]; 
y1=boxCorners(index);
index=[6];
y2=boxCorners(index);
index=[7];
y3=boxCorners(index);
index=[8];
y4=boxCorners(index);

area; 

%area=["Box1", "Box2", "Union", "Intersection"]; %???????

    switch (area)
        
    case 'Box1'
        A= (x2-x1)*(y2-y1); %A1 area of the box 1
        %disp(A);
    case 'Box2'
        A=(x4-x3)*(y4-y3); %area of the box 2 A2
       % disp(A);
    case 'Intersection'
        A=max(0, min(x2,x4)-max(x1,x3))*max(0, min(y2,y4)-max(y1,y3));%Ao
       % disp(A);
    case 'Union'
        A= ((x2-x1)*(y2-y1)+(x4-x3)*(y4-y3))-...
            max(0, min(x2,x4)-max(x1,x3))*max(0, min(y2,y4)-max(y1,y3));
       % disp(A);
    end 
        
end 
     
