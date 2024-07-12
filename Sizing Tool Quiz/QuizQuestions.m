clear
aircraftname = 'C';
AircraftData

k = 1/(pi*Aircraft.e*Aircraft.AR);
beta = 0.9653;
[p,~,rho,a] = get_AtmosProperties(Aircraft.CruiseAlt * 0.3048);

WS = 3700; % Input
W = 107000 * 9.81;
S = W/WS;
Ccruise = Aircraft.c_cruise/3600;
qc = 0.5 * rho * (a*Aircraft.CruiseMach)^2;
CL_cruise = (beta*WS)/(qc);
CD_cruise = Aircraft.CD0 + k * (CL_cruise)^2;



SAR = (9.81/Ccruise) * sqrt(2/(rho*S*W*beta)) * (CL_cruise^0.5)/CD_cruise;