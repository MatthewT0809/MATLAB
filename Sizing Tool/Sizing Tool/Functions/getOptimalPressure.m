function [opmPressure] = getOptimalPressure(M_crit,WingLoading,k)
opmPressure = 2/(M_crit^2*1.4)*(sqrt(3*k/0.018)*WingLoading); 
end