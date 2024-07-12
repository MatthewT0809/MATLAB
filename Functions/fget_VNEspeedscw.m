function [VNE_ms,VME_ms,VstallTO_ms,VstallLD_ms] = fget_VNEspeedscw(H) %THIS IS IN KNOTS NOT IN M/S
W = (89000*9.81); %W_MTOW
    
CL_maxTO = 3.10; 
CL_maxLD = 3.23;
[p0,~,~,a0] = get_AtmosProperties(0);
V_NE = 381*0.5144; %!!!!!!!!!!!!!!!!!!!!!!!REMOVE THIS IF IT IS in KNOTS, THIS IS IN  m/s!!!!!!!!!!!!!!!! 
M_NE = 0.89;
[p,~,rho,a] = get_AtmosProperties(H); 
gamma = 1.4; 
S = 122.4; %wing area m


VstallTO_ms = sqrt((2/rho)*(W/S)*(1/CL_maxTO)); 
VstallLD_ms = sqrt((2/rho)*(W/S)*(1/CL_maxLD)); 

%Found the sea level impact pressure with CAS
IP = p0*((1+(gamma-1)/2*(V_NE/a0)^2)^(gamma/(gamma-1))-1);


%Refind TAS with impact pressure 

options = optimset('TolX', 1e-6);  % Set tolerance for fzero
func = @(V) IP - (p*((1+(gamma-1)/2*(V/a)^2)^(gamma/(gamma-1))-1));
VNE_ms = fzero(func, V_NE, options);

VME_ms = M_NE*a;
end