function  [VlowTA_ms,VhighTA_ms] = Fget_MaxThrustSpeeds(H)
[~,~,rho,~] = get_AtmosProperties(H); 
C_D0 = 0.0221;
K = 0.0259;  
T_Amax = get_RelThrustAvailable(H);

W = (217000*9.81);
S = 363.10; %wing area

VhighTA_ms = ((1/(rho*C_D0))*((T_Amax/W)*(W/S)+(W/S)*sqrt((T_Amax/W)^2-4*C_D0*K)))^0.5;
VlowTA_ms = ((1/(rho*C_D0))*((T_Amax/W)*(W/S)-(W/S)*sqrt((T_Amax/W)^2-4*C_D0*K)))^0.5;
end

