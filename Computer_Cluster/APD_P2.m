%trim = 0; 
%CL_MainWing = 1; 
%eta_T = 1;
figure 
CLgraph = 0;
CM = 2; 
CL = zeros(100,1);
angle = zeros(100,1);
cg = zeros(5,1);
cg = [5,4,3,2,1];
CL = linspace(0.2,1.8,5);
CL_Tail = zeros(5,1);
%eta_T = o; % Assume Angle is 0 in trimmed flight

for y = 1:(length(cg))
cga = cg(y);
for x = 1:(length(CL))
CLA = CL(x);
f = @(CLa, CL_T,cg) get_PitchingMomentCoeff(CLA, CL_T,cg);
desireValue = 0;
lowerBound = -100;
upperBound = 100;
CL_Tail(x) = fminbnd(@(CL_T) abs(f(CLa,CL_T,cga) - desireValue), lowerBound, upperBound);
disp(CL_Tail)


CLa = CL(x);
f = @(CLa, eta_T) get_TailCL(CLa,eta_T);
desireValue = CLa; 
lowerBound = 0;
upperBound = 180;

    angle(x) = fminbnd(@(eta_T) abs(f(CLa,eta_T) - desireValue), lowerBound, upperBound);
disp(angle)

end



plot(CL,CL_Tail,"r"); %plots the graph
grid on; 
xlabel('CL');
ylabel('Angle');
title('I hate apd')

CLgraph = CLgraph+1; 
end


%c = b / AR;
