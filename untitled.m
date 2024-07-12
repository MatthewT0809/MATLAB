clear
aircraftname = "A"; %temporrary change
AircraftData


RF = 0.69108;
W0 = 50000;
Wpay = 16000; 
ratio_WfW0 = 1-RF;
b = 0;
while true
    X1 = W0;
    X2 = Wpay/(1-ratio_WfW0-0.97*W0^(-0.06));
    C = abs(X1 - X2);
    if C < 0.2 
        disp(W0)
        break
    else
        W0 = W0 + 1;
    end
end
