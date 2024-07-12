clear

flightData = readtable("C:\Users\Matthew\Downloads\DAIKO_trajectory_v2.csv");
IP = table2array(flightData(:,5));
Time(:,1) = table2array(flightData(:,1));
Altitude(:,1) = table2array(flightData(:,4));
%IP(:,1)= table2array(flightData(:,5));
measuredTemp(:,1)= table2array(flightData(:,6));
darrenIsABitch = length(Altitude);
[M, p,T,rho,a] = deal(zeros(darrenIsABitch,1));
gamma = 1.4;

for x = 1:darrenIsABitch
[p(x),T(x),rho(x),a(x)] = get_AtmosProperties(Altitude(x,1));

IP1 = IP(x); 

M(x) = sqrt((2/(gamma-1))*((IP1/p(x) +1)^((gamma-1)/gamma)-1));

end




p0 =101325;
p = p/p0;
figure 
hold on
%step 3

plot(Time,T,"y"); %plots the graph
plot(Time,measuredTemp/288.15,"b");
plot(Time,p,"r");
plot(Time,rho,"g");
plot(Time,M,"r");  
grid on; 
xlabel('Time eclapsed (s)');
ylabel('Local pressure');
title('I hate apd')

%arg(1,:) = flightData(2,:);%reading a row