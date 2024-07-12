function  [VlowTA_ms,VhighTA_ms] = get_MaxThrustSpeedscw(H)
[~,~,rho,~] = get_AtmosProperties(H); 
C_D0 = 0.033;
K = 0.0344;  
T_Amax = get_RelThrustAvailablecw(H);

W = (89000*9.81);
S = 122.4; %wing area

VhighTA_ms = ((1/(rho*C_D0))*((T_Amax/W)*(W/S)+(W/S)*sqrt((T_Amax/W)^2-4*C_D0*K)))^0.5;
VlowTA_ms = ((1/(rho*C_D0))*((T_Amax/W)*(W/S)-(W/S)*sqrt((T_Amax/W)^2-4*C_D0*K)))^0.5;
end

