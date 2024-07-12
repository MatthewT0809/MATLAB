function [E] = getloiterSegment(x) %To calculate loitersegment
aircraftname = x;
AircraftData
MTOW = 50000 ;
Aircraft.MaxPyld = 27500 ;
Pyldmax = Aircraft.MaxPyld; %27500
fuelLoad = MTOW - Pyldmax ;
TSFC = 0.565;
fuelEff = 1/(TSFC/3600) ; %0.565/hr transfer to    /s 
fuelTakeoff = fuelLoad ;
fuelLanding = fuelTakeoff*0.05 ; % 5% unusable fuel
E = (fuelEff/fuelLoad)*log(fuelTakeoff/fuelLanding); %fuelTakeoff/fuelLanding can be replaced by 1/0.05

end
