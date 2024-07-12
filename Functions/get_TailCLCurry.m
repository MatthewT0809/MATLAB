function[CL_T]=get_TailCLCurry(CL_trim,eta_T)
a=5.8;
a1=5.1;
Downwashreductionfactor=0.11;
CL_T=CL_trim *(a1/a)*(1-Downwashreductionfactor)+(a1*deg2rad(eta_T));
end