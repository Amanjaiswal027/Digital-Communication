clear ;
close ;
clc ;
clf ;

x =input('Enter bit data sequence:') 
z =0; 
for i =1:length (x)
t=[z:1:z+1]; 
subplot (2 ,1 ,1)

a= gca ();
a. data_bounds =[0,-1.5;length(x),1.5];
a.grid =[1,-1]
title('Input data');
plot (t,x(i)) 
subplot (2 ,1 ,2)

a= gca ();
a. data_bounds =[0,-1.5;length(x),1.5];
a. grid =[1 , -1]
if(x(i)==0)
plot (t,0) 
else
plot (t,1) 
end
z=z+1 
