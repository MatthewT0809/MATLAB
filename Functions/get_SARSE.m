function [SAR,SE] = get_SARSE(W,H,M,gamma_FPA) %no gravity for some reason 

T0 = 288.15;
[~,T,~,a] = get_AtmosProperties(H);
[CL,CD] = get_TrimCLCD(gamma_FPA,W,M,H);
[~,ctp] = getFuelRate(M,T/T0,0);
V = M*a;
SAR = (V/ctp) *(CL/CD)*(1/W);
SE = (1/ctp) * (1/W) * (CL/CD);
end