function [E] = getloiterSegment(x)     %To calculate loitersegment
aircraftname = x;
AircraftData

TSFC = Aircraft.c_cruise * (1/3600);
k= 1 / (Aircraft.AR * Aircraft.e * pi);
CL_max=sqrt(Aircraft.CD0 / k);

L_D_max=CL_max/(Aircraft.CD0+k*(CL_max^2));
E = exp(-1800* TSFC /((L_D_max)));
end
