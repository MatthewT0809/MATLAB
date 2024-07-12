clear
%findi breguet range equation

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


