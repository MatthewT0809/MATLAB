
function [CM] = get_PitchingMomentCoeff(CL_TRIM,CL_T,h)
flightData = readtable("C:\Users\Matthew\Downloads\Airbus_Aircraft_Data_Jenkinson_2005.xls","Sheet",'Table 1B');
lt = table2array(flightData(37,8)); %offset by 2 
%AR = table2array(flightData(34,8)); 
%wingSpan = table2array(flightData(33,8)); %wing span is b
MAC = table2array(flightData(11,8));
mainWingArea = table2array(flightData(9,8)); %mainWingArea is S 
tailWingArea = table2array(flightData(32,8)); %tailWingArea is S_T
h0 = 0.25;

V_T = (tailWingArea*lt)/(mainWingArea*MAC);

CM0 = -CL_TRIM*(h-h0) + V_T*CL_T; %Assume CM is 0 

CM =  CM0 + CL_TRIM*(h-h0)- CL_T*V_T;
end
