function [mf,ctp] = getFuelRatecw(H,M,TR,aircraft) %massflowrateof fuel = height, mach, Thrust required 
[~,t,~,~] = get_AtmosProperties(H); 
T0 = 288.15;
T = t/T0;
n2A330 = 0.432; 
ct2A330 = 0.611;
a330 = 6.25; 
a359 = 6.5; 
a321 = 3.61;
a388 = 13.6;
if aircraft == 1
n2 = a359/a330*n2A330;
ct2 = a359/a330*ct2A330;
g0 = 9.8065; % Gravitational accelerational at sea-level
ctp = 1/(3600*9.81)*ct2*sqrt(T)*M^n2;
mf = ctp*TR;
elseif aircraft == 2
n2 = a321/a330*n2A330;
ct2 = a321/a330*ct2A330;
g0 = 9.8065; % Gravitational accelerational at sea-level
ctp = 1/(3600*9.81)*ct2*sqrt(T)*M^n2;
mf = ctp*TR;
elseif aircraft == 3
n2 =a388/a330*n2A330;
ct2 = a388/a330*ct2A330;
g0 = 9.8065; % Gravitational accelerational at sea-level
ctp = 1/(3600*9.81)*ct2*sqrt(T)*M^n2;
mf = ctp*TR;
end
