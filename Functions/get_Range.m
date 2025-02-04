function [Range] = get_Range(blockFuelRatio,Programme)
M = 0.8; 
H = 36000;
g = 9.81;
S = 363.10; %wing area
[p,T,density,a] = get_AtmosProperties(H);

[m(x),ctp] = getFuelRate(Altitude(x),M(x),Drag(x));
weightLoss(x) = (m(x)/360 *4);

ctp = get_TSFC(M,T);
if Programme == 1

Range = 1/(g*ctp)*((2*W)/(rho*S)^(1/2))*(CL^(1/2)/CD)*ln(1/(1-blockFuelRatio));

else if Programme == 2

Range - 2/(g*ctp)*(2*W)



need inital weight and ending and CLL and CD and S and ctp

end



