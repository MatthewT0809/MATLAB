clear
flightData = readtable("C:\Users\Matthew\Downloads\DAIKO_trajectory_v2.csv"); 
IP(:,1) = table2array(flightData(:,5));
Altitude(:,1) = table2array(flightData(:,4)); 
Time(:,1) = table2array(flightData(:,1));
W_MTOW = 217000*9.81;

S = 363.10; %wing area
gamma = 1.4;

flightProperties = zeros(length(Altitude));
[ctp,W,CL,CD,TAS,M,p,T,rho,a,deltaTheta,distance,deltaAltitude] = deal(zeros(length(Altitude),1));

%lastTime = 0;
%lastTas = 0;

for x = 1:length(Altitude)
%for every altitude 
[p(x),T(x),rho(x),a(x)] = get_AtmosProperties(Altitude(x)); 
%Get pressure, Temperature, density, and local speed of sound
M(x) = sqrt((2/(gamma-1))*((IP(x)/p(x) +1)^((gamma-1)/gamma)-1));
%Finding Mach Number
TAS(x) = M(x)*a(x);
%Finding True Air Speed

distance(x) = TAS(x)*4;

if x == 1
deltaAltitude = 0; 
lastW = W_MTOW;
else
lastW = W(x-1);
lastAlt = Altitude(x-1);
deltaAltitude(x) = Altitude(x)- lastAlt;
end     

deltaTheta(x) = asin(deltaAltitude(x)/distance(x));
[CL(x),CD(x)] = get_TrimCLCD(deltaTheta(x),W(x),M(x),Altitude(x)); 
dynamicPressure = 0.5*rho(x)*TAS(x)^2;
Drag(x) = CD(x)*S*dynamicPressure; %As delta theta is small, smlal angle approimation is used (thrust required == drag required)


[mf(x),ctp(x)] = getFuelRate(Altitude(x),M(x),Drag(x));
weightLoss = mf(x)/360 *4;
W(x) = lastW-weightLoss;
lastW = W(x);


end
disp(deltaTheta(133))



figure
hold on 
plot(Time/3600,W)
plot(plotTime,Altitude)
