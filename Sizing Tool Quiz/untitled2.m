% plotting temperature vs entropy for 50500 RPM jet engine
z1 = data(:,9) + 273.15;
TT3 = mean(z1);
z2 = data(:,10) + 273.15;
TT4 = mean(z2);
z3 = data(:,11) + 273.15;
TT5 = mean(z3);
z4 = data(:,12) + 273.15;
TT6 = mean(z4);
TT1 = 288.15; %K

TTEnd = 473 + 273.15;
Cp_air = 1010; % J/kg/K
Cp_gas = 1140; % J/kg/K
R = 287; % J/kgK
Pa = 101325;
z1 = data(:,2) * 6895 + 101325;
P1 = mean(z1);
z2 = data(:,3) * 6895 + 101325; %converting psi to pascals and making absolute
P3 = mean(z2);
z3 = data(:,4) * 6895 + 101325; 
PT3 = mean(z3);
z4 = data(:,5) * 6895 + 101325;
PT4 = mean(z4);
z5 = data(:,6) * 6895 + 101325;
PT5 = mean(z5);
S1 = 0;
S3 = S1 + Cp_air * log(TT3 / TT1) - R * log(PT3 / Pa);
S4 = S3 + Cp_gas * log(TT4 / TT3) - R * log(PT4 / PT3);
S5 = S4 + Cp_gas * log(TT5 / TT4) - R * log(PT5 / PT4);
S6 = S5 + Cp_gas * log(TT6 / TT5) - R * log(Pa / PT5);

y_values = [TT1, TT3, TT4, TT5, TT6];
x_values = [S1, S3, S4, S5, S6];

% Initialize arrays
S_interp = zeros(1, 200); % Preallocate space for 150 entropies (50 for each interval)
T_interp = []; % Initialize empty array for interpolated temperatures
P_interp = []; % Initialize empty array for interpolated pressures
start = TT1;
% Interpolate between TT1 and TT3
T_interp = [T_interp, linspace(TT1, TT3, 50)];
P_interp = [P_interp, linspace(Pa, PT3, 50)];
% Interpolate between TT3 and TT4
T_interp = [T_interp, linspace(TT3, TT4, 50)];
P_interp = [P_interp, linspace(PT3, PT4, 50)];
% Interpolate between TT4 and TT5
T_interp = [T_interp, linspace(TT4, TT5, 50)];
P_interp = [P_interp, linspace(PT4, PT5, 50)];
% Interpolate between TT5 and TT6
T_interp = [T_interp, linspace(TT6, TT1, 50)];    
P_interp = [P_interp, linspace(PT5, Pa, 50)];
% Calculate entropies using linear interpolation
for i = 1:200
if i <=50
S_interp(i) = 0;
elseif i <= 100
S_interp(i) = S3 + Cp_gas * log(T_interp(i)/ TT3) - R * log(P_interp(i) / PT3);
elseif i <= 150
S_interp(i) = S_interp(100);
elseif i <= 200 
S_interp(i) = Cp_gas * log(T_interp(i)/TT1) - R * log(P_interp(i)/Pa );
end
end
% Plotting with line
plot(x_values, y_values, '-', 'LineWidth', 2, 'Color',"b")
hold on
% Plotting with points
plot(x_values, y_values, '*', 'MarkerEdgeColor', 'k', 'MarkerSize', 7)
plot(S_interp, T_interp, '--', 'LineWidth', 2,"Color",'b')
plot(S_interp(150),T_interp(150),'O')


hold off % Release the hold

% Set axis properties
set(gca,'XMinorTick','on')
set(gca,'YMinorTick','on')
set(gca,'TickLength',[0.01 0.01])
set(gca,'LineWidth',1.5)
grid(gca,'off')  
box(gca,'off')  

% Adding legend with separate entries for line and points
legend(gca,{'Realised Outcome', 'Realised Points', 'Ideal Scenario','Ideal'}, 'Location', 'best')
set(legend,'Location','SouthEast')
set(legend,'fontsize',12,'FontName','Times New Roman')
set(legend,'Box','on')

% Labeling axes
xlabel('Entropy (J/K)') % Label for the x-axis
ylabel('Temperature (K)') % Label for the y-axis
% Adding grid
grid on
box on
xlim([0, 1200]);
ylim([200, 1200]);
%set(gca,"Ytick",0:1000:10000)
%set(gca,"XTick",0:1200:12000)
% Adding title
title('T-S Plot for 85,500 RPM')
