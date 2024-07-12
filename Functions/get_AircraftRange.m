function [R] = get_AircraftRange(H,M,CL_trim,ratio_blockfuel,programme)
g = 9.8065;
MTOW = 217000; % Max take off weight, unit is kgf
S = 363.1;
K = 0.0259;
CD_0 = 0.0221;
OEW = 0.545*MTOW; %Empty weight
[~,~,pho,a] = get_AtmosProperties(H);
W_e = OEW; 
W_i = W_e/(1-ratio_blockfuel);

q = 1/2 * pho * (M*a).^2; % dynamic pressure

[~,ctp] = getFuelRate(H,M,0);

if programme == 1 % Variable Lift Coeffcient Program
 
        R = (a*M)/(g*ctp) * (1/(K*CD_0))^(1/2) * (atan(W_i/(q*S)*(K/CD_0)^0.5) - atan(W_e/(q*S) * (K/CD_0)^0.5));
elseif programme == 2  % Variable Mach number Progam
    
        R = 2/(g*ctp) * ((2*W_i)/(pho*S*CL_trim))^0.5 * (CL_trim/(CD_0 + K*CL_trim^2)) * (1-(W_i/W_e)^(-0.5)); % Hint: L/D = CL/(CD_0 + K*CL^2)
elseif programme == 3 % Variable Altitude Progam

        R = (M*a)/(g*ctp) * (CL_trim/(CD_0 + K*CL_trim^2)) * log(W_i/W_e);
else
    disp('error')
end