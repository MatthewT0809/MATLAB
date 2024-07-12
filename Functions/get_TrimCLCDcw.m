function [CL_trim,CD_trim] = get_TrimCLCDcw(gamma_FP,W,M,H,aircraft)  %gamma flight plan deg, Weight, Mach, Height (IN NEWTON NOT KGF)
S1 = 442.9; %wing area
S2 = 122.4; %m2 

if aircraft == 1
[p,~,~,~] = get_AtmosProperties(H); 
CD0 = 0.027;
gamma = 1.4;
K = 0.0364;
%calibrating


q = (1/2)*p*gamma*M^2;

L = W*cos(gamma_FP/(180/pi));
CL_trim = L/(q*S1); 
CD_trim = CD0 + K*CL_trim^2;

elseif aircraft == 2 
[p,~,~,~] = get_AtmosProperties(H); 
CD0 = 0.033;
gamma = 1.4;
K = 0.0344;
%calibrating

q = (1/2)*p*gamma*M^2;

L = W*cos(gamma_FP/(180/pi));
CL_trim = L/(q*S2); 
CD_trim = CD0 + K*CL_trim^2;

elseif aircraft == 3
[p,~,~,~] = get_AtmosProperties(H); 
CD0 = 0.012;
gamma = 1.4;
K = 0.0456;
%calibrating

q = (1/2)*p*gamma*M^2;

L = W*cos(gamma_FP/(180/pi));
CL_trim = L/(q*S2); 
CD_trim = CD0 + K*CL_trim^2;

end