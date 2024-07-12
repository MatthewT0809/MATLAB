

function [Range] = getpyldRangeEstimator(x,MTOW,missiontable)
aircraftname = x;
AircraftData

WeW0 = 0.97*MTOW^(-0.06);
Aircraft.EmptyWeight = MTOW*WeW0;
% OEW1 = MTOW1 * (1-ratio_WfW0) - 16000 ;  %%% 16000 needs to be substitude to typical payload function
%MFR = MTOW * (1-Res_fuel);
ratio_MPR = (MTOW-(Aircraft.EmptyWeight+Aircraft.MaxPyld))/MTOW;

C1 = Aircraft.c_cruise * (1/3600);
% @ Cruise Alt, which is 36000 ft
H = 0.3048 * Aircraft.CruiseAlt;
K = 1/(pi*Aircraft.e*Aircraft.AR);
[~,~,~,a] = get_AtmosProperties(H);
V = a * Aircraft.CruiseMach;
CL_Cruise = sqrt(Aircraft.CD0/(3*K)); %2/pho * Aircraft.WS * (1/(V^2)); 6.8*47.88
CD = Aircraft.CD0 + K * CL_Cruise^2;
ratio_LD = CL_Cruise/CD;
weightRatio = 1-ratio_MPR;
disp(weightRatio)
%segFraction = missiontable(:,2);
for i = 1:12
    if i ~= 4
        weightRatio = weightRatio./missiontable{i,1};
    end
end
disp(weightRatio);
Range = (V/(C1)) * ratio_LD * log(1./(weightRatio))*(1/1852) + Aircraft.ClimbDescentCredit;
end