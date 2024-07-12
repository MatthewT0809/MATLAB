function [p,T,density,a] = get_AtmosPropertiesFeet(h) %This is in feet
H =  h*3.28084;
%T11 = 216.65; 
p0 =101325;
p11 = 22632.559;
p20 = 5.4794e+03 ; 
R = 287; 
gamma = 1.4; 


if H >= (20000*3.28084)
Hi = 20000*3.28084;
L = 0.001;
Ti = 228.65;
p = p20*(1-2.2558 * 10^(-5)*H).^(5.25588);
elseif H >= 11000*3.28084
Hi = 11000*3.28084;
L = 0;
Ti = 216.65;
p = p11* exp(1)^(-1.576*10^(-4)*(H-11000));
else
Hi = 0; 
L = -0.0065;
Ti = 288.15;
p = p0*(1-2.2558 * 10^(-5)*H).^(5.25588);
end
T = Ti + L*(H-Hi);
density = p/(R*T);
a = sqrt(gamma*R*T); 

%remove if this is p1, this turns into ratio 
%T = T/T0; %remove this comment if it is apd_p1 
%a = a/a0;
%density = density/density0;



end
%p = p0*(1-2.2558 * 10^(-5)*H)^(5.25588);
%p = p11* exp(1)^(-1.576*10^(-4)*(H-11000));
%end
%middle stat = tropepshere with stat variable 