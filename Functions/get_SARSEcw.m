function [SAR,SE] = get_SARSEcw(W,H,M,gamma_FPA,aircraft) %no gravity for some reason 

T0 = 288.15;
[~,T,~,a] = get_AtmosProperties(H);
[CL,CD] = get_TrimCLCDcw(gamma_FPA,W,M,H,aircraft);
[~,ctp] = getFuelRatecw(M,T/T0,0,aircraft);
V = M*a;
SAR = (V/ctp) *(CL/CD)*(1/W);
SE = (1/ctp) * (1/W) * (CL/CD);
end