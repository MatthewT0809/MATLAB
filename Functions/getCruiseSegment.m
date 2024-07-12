function [Cruise] = getCruiseSegment(x)
aircraftname = x;
AircraftData
H = Aircraft.CruiseAlt*0.3048;
[~,~,~,a] = get_AtmosProperties(H);
K = 1/(pi*Aircraft.e*Aircraft.AR);
CLmax = sqrt(Aircraft.CD0/(3*K));
CD = Aircraft.CD0 + K*CLmax^2;
C = 0.565*(1/3600);
V = 0.785 * a;
R = (3200-200)*1.852*10^3;
Cruise = exp(-(R*C)/(V*(CLmax/CD)));
end