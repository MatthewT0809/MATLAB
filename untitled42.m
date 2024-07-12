missionSegment(8)

RF = 0.69108;


Wpay = 16000;
WFW0 = 1-RF;
W0 = linspace(1000,100000,100);
for i = 1:length(W0) 
WEW0 = 0.97*W0(i).^-0.006; 
W0(i) = Wpay/1-WFW0-WEW0;

end