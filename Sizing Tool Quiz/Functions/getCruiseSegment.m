function [Cruise] = getCruiseSegment(x)
aircraftname = x;
AircraftData
H = Aircraft.CruiseAlt*0.3048;
[~,~,~,a] = get_AtmosProperties(H);
K = 1/(pi*Aircraft.e*Aircraft.AR);
CLmax = sqrt(Aircraft.CD0/(3*K));
CD = Aircraft.CD0 + K*CLmax^2;
C = Aircraft.c_cruise*(1/3600);
V = Aircraft.CruiseMach * a;
R = (Aircraft.Range - Aircraft.ClimbDescentCredit) * 1.852*10^3;
Cruise = exp(-(R*C)/(V*(CLmax/CD)));
end