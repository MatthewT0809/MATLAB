clear
aircraftname = 'D';
AircraftData
[p,~,rho,a] = get_AtmosProperties(Aircraft.Constraints(5).Altitude * 0.3048);

beta = 0.6230;

TW = 0.9; 
WS = 1100;


k = 1/(pi*Aircraft.e*Aircraft.AR);
Ccruise = Aircraft.Constraints(4).alpha;
qc = 0.5 * rho * (Aircraft.CruiseMach * a)^2;
n = (qc/(WS*beta))*sqrt((Ccruise/qc*TW*WS-Aircraft.CD0)/k)

bankAngle = asecd(n)

turnRate = (9.81*sqrt(n^2-1))/(Aircraft.CruiseMach * a)