clear
altitude = linspace(1,15000,1000);

%this is in m
for x = 1:length(altitude)
    [VlowTA_ms(x),VhighTA_ms(x)] = get_MaxThrustSpeeds(altitude(x));
    [VNE_ms(x),VME_ms(x),VstallTO_ms(x),VstallLD_ms(x)] = get_VNEspeeds(altitude(x));
end



figure
hold on 

%plot(VlowTA_ms,altitude)

%Vlow = single(VlowTA_ms);|
plot(VhighTA_ms(1,1:820),altitude(1,1:820))
plot(VlowTA_ms(1,1:820),altitude(1:820))
%plot(VNE_ms,altitude)
plot(VME_ms,altitude)
plot(VstallTO_ms,altitude)
plot(VstallLD_ms,altitude)

grid on; 


