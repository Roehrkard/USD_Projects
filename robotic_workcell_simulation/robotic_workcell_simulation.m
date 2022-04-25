% robotic_workcell_simulation.m 
% is a script that generates an animation of a two degree-of-freedom
% robototic arm moving (5 in/sec) a hypothetical gear blank from an infeed conveyor,
% to a machine tool, to an outfeed conveyor, and back to the initial pick
% up point. After the animation is complete, a theta 1 & 2 vs time plot is
% generated for each destination. 

clear all;
clc; 

%Variables
a = -10; %initial x
b = 42;  %initial y
da = -1.579; %change in x 
db = -1.684; %change in y
xv = [1.1038;1.4634]; %vector of theta1 & theta2 (roots)
fv = [0;0]; %vector of functions evaluated at roots
n = 1; %increments of n

%Animation
A1 = [0,0]; A2 = [0.5*a,0.5*b];
A3 = [0.5*a,0.5*b]; A4 = [a,b];
hold on
plot([A1(1),A2(1)],[A1(2),A2(2)],[A3(1),A4(1)],[A3(2),A4(2)],'linewidth',3), 
plot(a,b,'o','MarkerFaceColor','b','Markersize',8) %projectile plot
axis([-50 0 -10 50]) %plot dimensions
M(1) = getframe; %function to capture snapshot

%Moves hand from Infeed Conveyor (-10,42) to the Machine Tool (-40,10)
while n < 20    %while loop to create twenty points along line
a = a + da;
b = b + db;

[x,f,ea,iter] = newtmult(@fjacR,[2;2],a,b); %function that calculates roots
xv = [xv x];
fv = [fv f];

%Animation
hold on;
A1 = [0,0]; A2 = [0.5*a,0.5*b];
A3 = [0.5*a,0.5*b]; A4 = [a,b];
plot([A1(1),A2(1)],[A1(2),A2(2)],[A3(1),A4(1)],[A3(2),A4(2)],'linewidth',3), 
plot(a,b,'o','MarkerFaceColor','b','Markersize',8) %projectile plot
axis([-50 0 -10 50]) %plot dimensions
M(n)=getframe;
clf('reset')

n = n+1;
end


xv1 = xv;

%differentiate rates
xv1c1 = xv(1, 1:20);
dxv1c1 = diff(xv1c1); 
xv1c2 = xv(2, 1:20);
dxv1c2 = diff(xv1c2);
dxv1=[dxv1c1;dxv1c2];
dt1 = 0.4617;
rate1= dxv1./dt1;

%differentiate accelerations
rate1c1 = rate1(1, 1:19);
drate1c1 = diff(rate1c1); 
rate1c2 = rate1(2, 1:19);
drate1c2 = diff(rate1c2);
drate1=[drate1c1;drate1c2];
dt1 = 0.4617;
acc1= dxv1./dt1;

%Reassign Variables
da = 0;
db = 1.684;
m = 1; 


%Moves hand from the Machine Tool (-40,10), to the Outfeed Conveyor (-40,42)
while m < 20    %while loop to create twenty points along line
a = a + da;
b = b + db;

[x,f,ea,iter] = newtmult(@fjacR,[2;2],a,b); %function that calculates roots
xv = [xv x];
fv = [fv f];

%Animation
hold on;
A1 = [0,0]; A2 = [0.5*a,0.5*b];
A3 = [0.5*a,0.5*b]; A4 = [a,b];
plot([A1(1),A2(1)],[A1(2),A2(2)],[A3(1),A4(1)],[A3(2),A4(2)],'linewidth',3),
plot(a,b,'o','MarkerFaceColor','b','Markersize',8) %projectile plot
axis([-50 0 -10 50]) %plot dimensions
M(m)=getframe;
clf('reset')

m = m+1;
end


%Reassign Variables
da = 1.579;
db = 0;
p = 1;

xv2 = xv(1:2,20:39);

%Moves hand from the Outfeed Conveyor (-40,42), to the Infeed Conveyor (-10,42)
while p < 20    %while loop to create twenty points along line
a = a + da;
b = b + db;

[x,f,ea,iter] = newtmult(@fjacR,[2;2],a,b); %function that calculates roots
xv = [xv x];
fv = [fv f];

%Animation
hold on;
A1 = [0,0]; A2 = [0.5*a,0.5*b];
A3 = [0.5*a,0.5*b]; A4 = [a,b];
plot([A1(1),A2(1)],[A1(2),A2(2)],[A3(1),A4(1)],[A3(2),A4(2)],'linewidth',3),
plot(a,b,'o','MarkerFaceColor','b','Markersize',8) %projectile plot
axis([-50 0 -10 50]) %plot dimensions
M(p)=getframe;
clf('reset')

p = p+1;
end

xv3 = xv(1:2, 39:58);



%Distance & time from Infeed Conveyor (-10,42) to the Machine Tool (-40,10)
d1 = sqrt((-40-(-10))^2+(10-42)^2);  %distance of line
s = 5;  %Average velocity
t1 = d1/s;   %total time traveled
tplot1= linspace(0,t1,20);   %array of time in 20 increments
tplot1r = linspace(0,t1,19);
tplot1a = linspace(0,t1,19);

%Distance & time from the Machine Tool (-40,10), to the Outfeed Conveyor (-40,42)
d2 = sqrt((-40-(-40))^2+(42-10)^2);  %distance of line
s = 5;  %Average velocity
t2 = d2/s;   %total time traveled
tplot2= linspace(0,t2,20);   %array of time in 20 increments


%Distance & time from the Outfeed Conveyor (-40,42), to the Infeed Conveyor (-10,42)
d3 = sqrt((-10-(-40))^2+(42-42)^2);  %distance of line
s = 5;  %Average velocity
t3 = d3/s;   %total time traveled
tplot3= linspace(0,t3,20);   %array of time in 20 increments



figure
subplot(1,3,1), plot(tplot1,xv1),title('Infeed Conveyor to Machine tool'),xlabel('time(s)'),ylabel('theta1(rad) & theta2(rad)') %angle vs time plot
subplot(1,3,2), plot(tplot2,xv2),title('Machine Tool to Outfeed Conveyor'),xlabel('time(s)'),ylabel('theta1(rad) & theta2(rad)') %angle vs time plot
subplot(1,3,3), plot(tplot3,xv3),title('Outfeed Conveyor to Infeed Conveyor'),xlabel('time(s)'),ylabel('theta1(rad) & theta2(rad)') %angle vs time plot


function [x, f, ea, iter] = newtmult(func, x0, varargin)

% newtmult: Newton-Raphson root zeroes nonlinear systems
%  [x,f,ea,iter] = newtmult(func, x0, p1, p2, ...)
%  uses the Newton-Raphson method to find the roots of a system of
%  nonlinear equations
% input: 
%  func = name of function that returns f and J
%  x0 = initial guess
%  es = desired percent relative error (default = 0.0001%)
%  maxit = maximum allowable iterations (default = 50)
%  p1, p2, ... = additional parameters used by function
% ouput:
%  x = vector of roots
%  f = vector of functions evaluated at roots
%  ea = approximate percent relative error (%)
%  iter = number of iterations
%
if nargin<2, error ('at least 2 input arguments required'), end
es = 0.0001; 
maxit = 200;
iter = 0;
x = x0;
while (1)
    [J, f] = func(x, varargin{:});
    dx = J \ f;
    x = x - dx;
    iter = iter + 1;
    ea = 100*max(abs(dx./x));
    if iter >= maxit | ea <=es, break, end
end
end

function [J,F] = fjacR(x,a,b)

F = [30*cos(x(1))+28*cos(x(1)+x(2))-a;30*sin(x(1))+28*sin(x(1)+x(2))-b];
J = [-30*sin(x(1))-28*sin(x(1)+x(2)) -28*sin(x(1)+x(2));30*cos(x(1))+28*cos(x(1)+x(2)) 28*cos(x(1)+x(2))];
end




