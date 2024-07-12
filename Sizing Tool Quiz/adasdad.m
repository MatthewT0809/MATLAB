% plotting temperature vs entropy for 50500 RPM jet engine
z1 = data(:,9) + 273.15;
TT3 = mean(z1);
z1 = data(:,10) + 273.15;
TT4 = mean(z1);
z1 = data(:,11) + 273.15;
TT5 = mean(z1);
z1 = data(:,12) + 273.15;
TT6 = mean(z1);
TT1 = 288.15; %K
Cp_air = 1010; % J/kg/K
Cp_gas = 1140; % J/kg/K
R = 287; % J/kgK
Pa = 101325;
z1 = data(:,2) * 6895 + 101325;
P1 = mean(z1);
z1 = data(:,3) * 6895 + 101325; %converting psi to pascals and making absolute
P3 = mean(z1);
z1 = data(:,4) * 6895 + 101325;
PT3 = mean(z1);
z1 = data(:,5) * 6895 + 101325;
PT4 = mean(z1);
z1 = data(:,6) * 6895 + 101325;
PT5 = mean(z1);
S1 = 0;
S3 = S1 + Cp_air * log(TT3 / TT1) - R * log(PT3 / Pa);
S4 = S3 + Cp_gas * log(TT4 / TT3) - R * log(PT4 / PT3);
S5 = S4 + Cp_gas * log(TT5 / TT4) - R * log(PT4 / PT5);
S6 = S5 + Cp_gas * log(TT6 / TT5) - R * log(Pa / PT5);
y_values = [TT1, TT3, TT4, TT5, TT6];
x_values = [S1, S3, S4, S5, S6];
% Initialize arrays
S_interp = zeros(1, 150); % Preallocate space for 150 entropies (50 for each interval)
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
T_interp = [T_interp, linspace(TT5, TT6, 50)];
P_interp = [P_interp, linspace(PT5, Pa, 50)];
% Calculate entropies using linear interpolation
for i = 1:200
if i <=50
S_interp(i) = S1 + Cp_air * log(T_interp(i) / TT1) - R * log(P_interp(i) / Pa);
elseif i <= 100
S_interp(i) = S3 + Cp_gas * log(T_interp(i) / TT3) - R * log(P_interp(i) / PT3);
elseif i <= 150
S_interp(i) = S4 + Cp_gas * log(T_interp(i) / TT4) - R * log(P_interp(i) / PT4);
else
S_interp(i) = S5 + Cp_gas * log(T_interp(i) / TT5) - R * log(P_interp(i) / PT5);
end
end
% Plotting with line
plot(x_values, y_values, '-', 'LineWidth', 2)
hold on
% Plotting with points
plot(x_values, y_values, 'o', 'MarkerFaceColor', 'b', 'MarkerSize', 4)
plot(S_interp, T_interp, '--', 'LineWidth', 2)
% Plotting interpolated entropy points
%plot(S_interp, T_interp, '*', 'MarkerFaceColor', 'r', 'MarkerSize', 4)
hold off % Release the hold
% Adding legend with separate entries for line and points
legend({'Realised Outcome', 'Ideal', 'Ideal Scenario'}, 'Location', 'best')
% Labeling axes
box on
xlabel('Entropy (J/K)') % Label for the x-axis
ylabel('Temperature (K)') % Label for the y-axis
% Adding grid
grid on
% Adding title
title('T-S Plot for 50,500 RPM')