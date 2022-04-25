% 2_bar_truss_CAE_design_tool.m 
% is a script that determines the height(H) and diameter (d) of a circular 
% member at the center of a two-bar truss system (as shown in the that can 
% support a given minimum weight design and can carry a specified
% load (2P) without either yielding or buckling. 



clear all; 
clc; 

P = input('Enter the load that is applied on the circular member (kips): ');
B = input('Enter the width between the two-bar truss members (in): ');
t = input('Enter the thickness of the circular member (in): ');
Y = input('Enter the yield strength of the circular member material (ksi): ');
E = input('Enter the Youngs modulus of the circular member material (ksi): ');
p = input('Enter the density of the circular member material (lbs/in^3): ');

d = 1:0.1:3; %array of diameter constraint range
H = 10:0.25:35; %array of height constraint range

for i = 21 %for loop for the 21 ticks between 1 & 3
    
    for n = 1:101 %for loop for the 101 ticks between 10 & 35
        sq = sqrt(B^2 + H(n)^2); %square root shortcut
        s = P*sq/(pi*d(i)*H(n)*t); %stress in each member
        sb = pi^2*E*(d(i)^2+t^2)/(8*sq^2); %Critical buckling stress
        if s < Y && s < sb %criteria of design
            W(i,n) = p*2*pi*d(i)*t*sq; %Vector of total weight of the truss
        end 
    end
end 

Wmin = min(W(W>0)); %min function that returns the minimum non zero W
[i,n] = find(W == Wmin); %find function locates the i & n associated with the previously located minimum non zero W
dmin = d(i); %assigns the diameter value from the location within the array
Hmin = H(n); %assigns the height value from the location within the array


disp(['The minimum diameter for the corresponding minimum weigth design is: ', num2str(dmin), '"'])
disp(['The minimum height for the corresponding minimum weigth design is: ', num2str(Hmin), '"'])
