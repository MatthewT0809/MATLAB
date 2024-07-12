function [tau] = get_RelThrustAvailable(H)
thrustLapseRate_350 = 0.229; 
[~,~,rho,~] = get_AtmosProperties(35000*0.3048); 
[~,~,rho0,~] = get_AtmosProperties(0); 
[~,~,rho2,~] = get_AtmosProperties(H); 

m = log(thrustLapseRate_350)/log(rho/rho0);
T0 = 67500*4.44822; %transfered to kgf
tau = (rho2/rho0)^m * T0 * 2; 
    
end