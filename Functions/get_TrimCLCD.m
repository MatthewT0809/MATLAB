function [CL_trim,CD_trim] = get_TrimCLCD(gamma_FP,W,M,H)  %gamma flight plan deg, Weight, Mach, Height (IN NEWTON NOT KGF)

[p,~,~,~] = get_AtmosProperties(H); 
CD0 = 0.0221;
gamma = 1.4;
K = 0.0259;
S = 363.10; %wing area
%calibrating

q = (1/2)*p*gamma*M^2;

L = W*cos(gamma_FP/(180/pi));
CL_trim = L/(q*S); 
CD_trim = CD0 + K*CL_trim^2;


end