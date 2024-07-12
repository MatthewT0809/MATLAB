function [Range] = getpyldRangeEstimator(x,MTOW)
aircraftname = x;
AircraftData
%ratio_WfW0 = 1-missiontable; %%
WeW0 = 0.97*MTOW^(-0.06);
OEW = WeW0 * MTOW;
%MFR = MTOW * (1-Res_fuel);
ratio_MPR = (MTOW-(OEW+Aircraft.MaxPyld))/MTOW;

C1 = Aircraft.c_cruise * (1/3600);
% @ Cruise Alt, which is 36000 ft
H = 0.3048 * Aircraft.CruiseAlt;
K = 1/(pi*Aircraft.e*Aircraft.AR);
[~,~,~,a] = get_AtmosProperties(H);
V = a * Aircraft.CruiseMach;
CL_Cruise = sqrt(Aircraft.CD0/(3*K)); %2/pho * Aircraft.WS * (1/(V^2));
CD = Aircraft.CD0 + K*CL_Cruise^2;
ratio_LD = CL_Cruise/CD;

Range = (V/(C1)) * ratio_LD * log(1/(1-ratio_MPR))/1000;
end