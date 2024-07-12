 function[CM]=get_PitchingMomentCoffCurry(CL_trim,CL_T,h)
 X0=30;
 MAC=7.26;
 CM_0=-0.016;
 S_T=72.9;
 L_T=28.6;
 S=363.1;
%h0=X0/MAC;
h0 = 0.25;
tailvolumecoeffcient = (S_T*L_T)/(S*MAC);
CM=CM_0+CL_trim*(h-h0)-tailvolumecoeffcient*CL_T;
 end