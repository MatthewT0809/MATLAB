function [CL_TailWing] = get_TailCL(CL_TRIM,eta_T)
CL_A = 5.8;
a1 =  5.1 ;
da = 0.11;


CL_TailWing = CL_TRIM*(a1/CL_A)*(1-da)+(a1*deg2rad(eta_T));


end

