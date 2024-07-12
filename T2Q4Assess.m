
%Cheuk Tam's code CW2 
x = linspace(0.25,2.25,9);
%Vector of X by a linspace function as they are all eventually apart from
%each other
y = [1.5 4.49 7.2 10.49 13.20 16.35 19.05 22.49 25.71];
%Vector of Y
p = polyfit(x,y, 1);
% Determines the coeffiecent of the line of best fit between the vectors through 
% the use of polyfit, degree as 1 as it dipicts a linear line
p2 = polyval(p,x);
% polyval uses the coefficients to illustrate the line of best fit on the graph 
figure
% opens a new window of graph
plot(x,y, '+')
%Plot points with the vector data aka raw data, marked with + sign
title('Probes sensitivity')
xlabel('Voltage (V)')
ylabel('Gap (mm)')
hold on
%Tells the software to maintain data while inputting new ones.
plot(x,p2)
%Plots the line generated from polyval in line 9
s = P(1);
%Provides the sensitivity 
disp(['Sensitivity = ' num2str(s) ' V/mm'])
%displays the sensitivity in the command window
z = interp1(x, p2, 0, "linear", "extrap");
%Provides data when exterpolated backwards to 0 in a linear manner
disp(['Zerogap at ' num2str(z) ' V'])
%displays the finding in command window