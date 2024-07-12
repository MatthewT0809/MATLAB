clear
flightData = readtable("C:\Users\Matthew\Downloads\DAIKO_trajectory_v2.csv"); 
Time(:,1) = table2array(flightData(:,1));
Altitude(:,1) = table2array(flightData(:,4)); 
[m,weightLoss,dynamicPressure,lastAlt,WinGallon,SARinMile,SAR,distance,W,M,TAS,p,T,rho,a,gamma_FPA,deltaAltitude,CL,CD,Drag] = deal(zeros(length(Altitude),1));
IP(:,1) = table2array(flightData(:,5));
gamma = 1.4;
S = 363.10; %wing area
W_MTOW = (217000*9.81);

for x = 1:length(Altitude)
%Amosphere properties
[p(x),T(x),rho(x),a(x)] = get_AtmosProperties(Altitude(x));  

%M and TAS and distance
M(x) = sqrt((2/(gamma-1))*((IP(x)/p(x) +1)^((gamma-1)/gamma)-1));
TAS(x)= M(x)*a(x);
distance(x) = TAS(x)*4;


if x == 1
deltaAltitude = 0; 
lastW = W_MTOW;
W(x) = W_MTOW;
else
lastW = W(x-1);
lastAlt = Altitude(x-1);
deltaAltitude(x) = Altitude(x)- lastAlt;
end   

%gamma flight plan
gamma_FPA(x) = asin(deltaAltitude(x)/distance(x));

%Get CL CD 
[CL(x),CD(x)] = get_TrimCLCD(gamma_FPA(x),W(x),M(x),Altitude(x)); 
dynamicPressure(x) = 0.5*rho(x)*TAS(x)^2;

%Drag force (N)x
Drag(x) = CD(x)*S*dynamicPressure(x);

%Weight Loss
[m(x),ctp(x)]  = getFuelRate(Altitude(x),M(x),Drag(x));
weightLoss(x) = (m(x)/3600 *4);
W(x) = lastW-weightLoss(x);
lastW = W(x); 
   
%SAR 
[SAR(x),SE] = get_SARSE(W(x)/9.81,Altitude(x),M(x),gamma_FPA(x));

end

figure
hold on 
plot(Time,SAR)
%plot(plotTime,Altitude)

