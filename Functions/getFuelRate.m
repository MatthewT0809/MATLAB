function [mf,ctp] = getFuelRate(H,M,TR) %massflowrateof fuel = height, mach, Thrust required 
[~,t,~,~] = get_AtmosProperties(H); 
T0 = 288.15;
T = t/T0;
n2 = 0.432; 
ct2 = 0.611;
g0 = 9.8065; % Gravitational accelerational at sea-level
ctp = 1/(3600*9.81)*ct2*sqrt(T)*M^n2;
mf = ctp*TR;
end