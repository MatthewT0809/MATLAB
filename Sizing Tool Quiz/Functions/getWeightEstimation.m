function [MTOW] = getWeightEstimation(missiontable,aircraftname)

aircraftname = aircraftname;
AircraftData

W0 = 3*Aircraft.Pax * Aircraft.PaxWeight;
Wpay = Aircraft.Pax * Aircraft.PaxWeight + Aircraft.Bags*Aircraft.BagWeight + Aircraft.Cargo;  
ratio_WfW0 = 1-missiontable;
X1 = W0;

while true
    X2 = Wpay/(1-ratio_WfW0-0.97*X1^(-0.06));
    C = abs(X1 - X2);
    if C < 0.6
        break
    else
        X1 = X2;
    end
end
MTOW = X2;
Aircraft.MTOW = X2;



