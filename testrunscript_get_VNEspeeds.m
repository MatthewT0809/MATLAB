% Clear workspace and command window
close all
clc
clear

% Create an array of altitudes to test the function
H = [0 2000 5000 10000 15000]'; % Note: apostrophe make it a column vector

% 'Pre-allocate' arrays 
VNE_ms = zeros(length(H),1); % Structural VNE
VME_ms = zeros(length(H),1); % Mach-aerodynamics VNE
VstallTO_ms = zeros(length(H),1); % Stall TAS in TO Config.
VstallLD_ms = zeros(length(H),1); % Stall TAS in LD Config.

for i = 1:height(H)

    % Calculate ISA properties as function of altitude
    [VNE_ms(i,1), VME_ms(i,1), VstallTO_ms(i,1), VstallLD_ms(i,1)] = ...
        get_VNEspeeds(H(i,1));

end

% Copy outputs into a new mini ISA table
T = table(H,VNE_ms,VME_ms,VstallTO_ms,VstallLD_ms,'VariableNames',...
    ["Altitude_m","StructureLim_ms","MachLim_ms","StallLimTO_ms",...
    "StallLimLD_ms"])

% Write table to text file
filename = 'my_miniVNEspeeds_check.csv';
writetable(T,filename)


