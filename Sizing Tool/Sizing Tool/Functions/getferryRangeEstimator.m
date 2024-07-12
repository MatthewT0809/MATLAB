


function [FerryRange] = getferryRangeEstimator(x,MTOW,missiontable)
aircraftname = x;
AircraftData

ratio_WfW0 = 1-missiontable{12,2}; %%
WeW0 = 0.97*MTOW^(-0.06);
OEW = MTOW * WeW0;
MFC = ratio_WfW0 * MTOW; % MFC is the max Fuel Capacity
%MFR = MTOW * (1-Res_fuel);
ratio_MFR = MFC/(OEW + MFC); %% HINT: or consider the reserve fuel
weightRatio = 1 - ratio_MFR;
C1 = Aircraft.c_cruise * (1/3600);
% @ Cruise Alt, which is 36000 ft
H = 0.3048 * Aircraft.CruiseAlt;
K = 1/(pi*Aircraft.e*Aircraft.AR);
[~,~,~,a] = get_AtmosProperties(H);
V = a * Aircraft.CruiseMach;
CL_Cruise = sqrt(Aircraft.CD0/(3*K));  %sqrt(Aircraft.CD0/(3*K)); %2/pho * aircraft.WS * (1/(V^2));
CD = Aircraft.CD0 + K*CL_Cruise^2;
ratio_LD = CL_Cruise/CD;

for i = 1:12
    if i ~= 4
        weightRatio = weightRatio./missiontable{i,1};
    end
end

disp(weightRatio);

FerryRange = (V/(C1)) * ratio_LD * log(1/(weightRatio)) * (1/1852) + Aircraft.ClimbDescentCredit;