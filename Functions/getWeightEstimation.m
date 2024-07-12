function [MTOW] = getWeightEstimation(missiontable,x)
aircraftname = x; 
AircraftData
W0 = 50000; %Aircraft.MaxPyld*3;
Wpay = Aircraft.Pax * Aircraft.PaxWeight + Aircraft.Bags*Aircraft.BagWeight + Aircraft.Cargo;  
ratio_WfW0 = 1-missiontable;

while true
    X1 = W0;
    X2 = Wpay/(1-ratio_WfW0-0.97*W0^(-0.06));
    C = abs(X1 - X2);
    if C < 0.4
        break
    else
        W0 = W0 + 1;
    end
end
MTOW = W0;
Aircraft.MTOW = W0;



