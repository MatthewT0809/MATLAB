function [cruise] = getDiversionSegment(x,r)

%R = 185.2; %[km] Range/Change if different [100NM]
R = r* 185.2/1000; % [km]
aircraftname = x;
AircraftData
H = Aircraft.CruiseAlt*0.3048;
g = 9.81;  
K = 1/(pi*Aircraft.e*Aircraft.AR);
CLmax = sqrt(Aircraft.CD0/(3*K));
CD = Aircraft.CD0 + K*CLmax^2;
R = (100)*1.852*10^3;
M = 0.785; %[-] Mach number
[~,~,~,a] = get_AtmosProperties(H);
ctp = 0.565*(1/3600);
V = M*a;
cruise = exp(-(R*ctp)/(V*(CLmax/CD)));

end