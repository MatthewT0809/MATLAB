function [VNE_ms,VME_ms,VstallTO_ms,VstallLD_ms] = get_VNEspeeds(H) %THIS IS IN KNOTS NOT IN M/S
weight = 217000;
W = (weight*9.81); %W_MTOW
CL_maxTO = 2.51; 
CL_maxLD = 2.73;
[p0,~,~,a0] = get_AtmosProperties(0);
V_NE = 330*0.51444; %!!!!!!!!!!!!!!!!!!!!!!!REMOVE THIS IF IT IS in KNOTS, THIS IS IN  m/s!!!!!!!!!!!!!!!! 
M_NE = 0.93;
[p,~,rho,a] = get_AtmosProperties(H); 
gamma = 1.4; 
S = 363.10; %wing area
%CL_maxTO = 2*W/(rho*VNE^2*S);


VstallTO_ms = sqrt((2/rho)*(W/S)*(1/CL_maxTO)); 
VstallLD_ms = sqrt((2/rho)*(W/S)*(1/CL_maxLD)); 

%Found the sea level impact pressure with CAS
IP = p0*((1+(gamma-1)/2*(V_NE/a0)^2)^(gamma/(gamma-1))-1);


%Refind TAS with impact pressure 

options = optimset('TolX', 1e-6);  % Set tolerance for fzero
func = @(V) IP - (p*((1+(gamma-1)/2*(V/a)^2)^(gamma/(gamma-1))-1));
VNE_ms = fzero(func, V_NE, options);
disp(['VNE_ms = ', num2str(VNE_ms)])

VME_ms = M_NE*a;
end