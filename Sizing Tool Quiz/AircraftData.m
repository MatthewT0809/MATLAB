switch aircraftname
    case 'A'
        Aircraft.Pax = 70;
        Aircraft.Bags = Aircraft.Pax;
        Aircraft.Cargo = 0;
        Aircraft.MaxPyld = 8500;
        Aircraft.Range = 1680; %[nautical miles]
        Aircraft.CruiseMach = 0.84;
        Aircraft.Engines = 2;
        Aircraft.PaxWeight = 80;
        Aircraft.BagWeight = 20;
        Aircraft.MTOW=0;
        
        Aircraft.AR = 7.4;
        Aircraft.e = 0.6;
        Aircraft.CD0 = 0.022;
        Aircraft.c_TO = 0.305;
        Aircraft.c_cruise = 0.625;
        Aircraft.c_climb = Aircraft.c_cruise;
        Aircraft.c_approach = 0.6;
        Aircraft.CL_TO = 2.1;
        Aircraft.CL_Ld = 2.3;
        Aircraft.groundRollFraciton = 0.7;
        Aircraft.OEIPenalty = 0.5;
        Aircraft.ClimbDescentCredit = 200; %200 nautical miles
        Aircraft.We_A = 0.97;
        Aircraft.We_exp = -0.06;
        Aircraft.CruiseAlt = 35000;
        Aircraft.reserveRatio = 1.05;
        Aircraft.TW= 0.43;
        Aircraft.WS = 5.2;
        %
        % Enter Constraints Information
        %
        Aircraft.Constraints(1).Type = 'Take-off';
        Aircraft.Constraints(1).Distance = 1200;
        Aircraft.Constraints(1).GroundRollFraction = 60;
        Aircraft.Constraints(1).SegNum = 2;
        %
        Aircraft.Constraints(2).Type = 'Climb';
        Aircraft.Constraints(2).OEIFlag = 1;
        Aircraft.Constraints(2).ClimbGradient = 2.4;
        Aircraft.Constraints(2).SegNum = 3;
        %
        Aircraft.Constraints(3).Type = 'Landing';
        Aircraft.Constraints(3).Distance = 1500;
        Aircraft.Constraints(3).Beta = 0.88;
        %
        Aircraft.Constraints(4).Type = 'Cruise';
        Aircraft.Constraints(4).SegNum = 4;
        Aircraft.Constraints(4).alpha = 0.26;
        Aircraft.Constraints(4).Mach = Aircraft.CruiseMach;
        Aircraft.Constraints(4).Altitude = Aircraft.CruiseAlt;
        Aircraft.Constraints(4).RateofClime = 0;
        %
        Aircraft.Constraints(5).Type = 'Ceiling';
        Aircraft.Constraints(5).SegNum = 5;
        Aircraft.Constraints(5).alpha = 0.29;
        Aircraft.Constraints(5).Mach = Aircraft.CruiseMach;
        Aircraft.Constraints(5).Altitude = 40000;
        Aircraft.Constraints(5).RateofClime = 0;
%% 

        
    case 'B'
        Aircraft.Pax = 245;
        Aircraft.Bags = Aircraft.Pax;
        Aircraft.Cargo = 0;
        Aircraft.MaxPyld = 75000;
        Aircraft.Range = 4400;
        Aircraft.CruiseMach = 0.80;
        Aircraft.Engines = 2;
        Aircraft.PaxWeight = 80;
        Aircraft.BagWeight = 20;
        Aircraft.MTOW=0;

        Aircraft.AR = 9.3;
        Aircraft.e = 0.67;
        Aircraft.CD0 = 0.018;
        Aircraft.c_TO = 0.305;
        Aircraft.c_cruise = 0.625;
        Aircraft.c_climb = Aircraft.c_cruise;
        Aircraft.c_approach = 0.6;
        Aircraft.CL_TO = 2.1;
        Aircraft.CL_Ld = 2.3;
        Aircraft.groundRollFraciton = 0.7;
        Aircraft.OEIPenalty = 0.5;
        Aircraft.ClimbDescentCredit = 200; %200 nautical miles
        Aircraft.We_A = 0.97;
        Aircraft.We_exp = -0.06;
        Aircraft.CruiseAlt = 37000;
        Aircraft.reserveRatio = 1.05;
        Aircraft.TW=0.34;
        Aircraft.WS = 8.7;

        %
        % Enter Constraints Information
        %
        Aircraft.Constraints(1).Type = 'Take-off';
        Aircraft.Constraints(1).Distance = 3600;
        Aircraft.Constraints(1).GroundRollFraction = 60;
        Aircraft.Constraints(1).SegNum = 2;
        %
        Aircraft.Constraints(2).Type = 'Climb';
        Aircraft.Constraints(2).OEIFlag = 1;
        Aircraft.Constraints(2).ClimbGradient = 2.4;
        Aircraft.Constraints(2).SegNum = 3;
        %
        Aircraft.Constraints(3).Type = 'Landing';
        Aircraft.Constraints(3).Distance = 2700;
        Aircraft.Constraints(3).Beta = 0.80;
        %
        Aircraft.Constraints(4).Type = 'Cruise';
        Aircraft.Constraints(4).SegNum = 4;
        Aircraft.Constraints(4).alpha = 0.26;
        Aircraft.Constraints(4).Mach = Aircraft.CruiseMach;
        Aircraft.Constraints(4).Altitude = Aircraft.CruiseAlt;
        Aircraft.Constraints(4).RateofClime = 0;
        %
        Aircraft.Constraints(5).Type = 'Ceiling';
        Aircraft.Constraints(5).SegNum = 5;
        Aircraft.Constraints(5).alpha = 0.21;
        Aircraft.Constraints(5).Mach = Aircraft.CruiseMach;
        Aircraft.Constraints(5).Altitude = 43000;
        Aircraft.Constraints(5).RateofClime = 0;
        %
        Aircraft.Constraints(6).Type = 'Turning-Climb';
        Aircraft.Constraints(6).SegNum = 3;
        Aircraft.Constraints(6).Mach = 0.35;
        Aircraft.Constraints(6).Altitude = 3000;
        Aircraft.Constraints(6).RateofClimb = 2500;
        Aircraft.Constraints(6).BankAngle = 30;

    case 'C'
        Aircraft.Pax = 280;
        Aircraft.Bags = Aircraft.Pax;
        Aircraft.Cargo = 0;
        Aircraft.MaxPyld = 35000;
        Aircraft.Range = 3500;
        Aircraft.CruiseMach = 0.79;
        Aircraft.Engines = 2;
        Aircraft.PaxWeight = 80;
        Aircraft.BagWeight = 20;
        Aircraft.MTOW=0;

        Aircraft.AR = 10;
        Aircraft.e = 0.825;
        Aircraft.CD0 = 0.0145;
        Aircraft.c_TO = 0.3;
        Aircraft.c_cruise = 0.55;
        Aircraft.c_climb = Aircraft.c_cruise;
        Aircraft.c_approach = Aircraft.c_cruise;
        Aircraft.CL_TO = 2;
        Aircraft.CL_Ld = 2.1;
        Aircraft.groundRollFraciton = 0.5;
        Aircraft.OEIPenalty = 0.5;
        Aircraft.ClimbDescentCredit = 200; %200 nautical miles
        Aircraft.We_A = 0.97;
        Aircraft.We_exp = -0.06;
        Aircraft.CruiseAlt = 37500;
        Aircraft.reserveRatio = 1.05;
        Aircraft.TW=0.28;
        Aircraft.WS = 3.4;
        %
        % Enter Constraints Information
        %
        Aircraft.Constraints(1).Type = 'Take-off';
        Aircraft.Constraints(1).Distance = 1200;
        Aircraft.Constraints(1).GroundRollFraction = 60;
        Aircraft.Constraints(1).SegNum = 2;
        %
        Aircraft.Constraints(2).Type = 'Climb';
        Aircraft.Constraints(2).OEIFlag = 1;
        Aircraft.Constraints(2).ClimbGradient = 2.4;
        Aircraft.Constraints(2).SegNum = 3;
        %
        Aircraft.Constraints(3).Type = 'Landing';
        Aircraft.Constraints(3).Distance = 1200;
        Aircraft.Constraints(3).Beta = 0.88;
        %
        Aircraft.Constraints(4).Type = 'Cruise';
        Aircraft.Constraints(4).SegNum = 4;
        Aircraft.Constraints(4).alpha = 0.26;
        Aircraft.Constraints(4).Mach = Aircraft.CruiseMach;
        Aircraft.Constraints(4).Altitude = Aircraft.CruiseAlt;
        Aircraft.Constraints(4).RateofClime = 0;
        %
        Aircraft.Constraints(5).Type = 'Ceiling';
        Aircraft.Constraints(5).SegNum = 5;
        Aircraft.Constraints(5).alpha = 0.26;
        Aircraft.Constraints(5).Mach = Aircraft.CruiseMach;
        Aircraft.Constraints(5).Altitude = 43000;
        Aircraft.Constraints(5).RateofClime = 0;

case 'D'
        Aircraft.Pax = 250;
        Aircraft.Bags = Aircraft.Pax;
        Aircraft.Cargo = 0;
        Aircraft.MaxPyld = 35000;
        Aircraft.Range = 3100;
        Aircraft.CruiseMach = 0.85;
        Aircraft.Engines = 6;
        Aircraft.PaxWeight = 80;
        Aircraft.BagWeight = 20;
        Aircraft.MTOW=0;

        Aircraft.AR = 7.5;
        Aircraft.e = 0.84;
        Aircraft.CD0 = 0.015;
        Aircraft.c_TO = 0.7;
        Aircraft.c_cruise = 1.2;
        Aircraft.c_climb = Aircraft.c_cruise;
        Aircraft.c_approach = Aircraft.c_cruise;
        Aircraft.CL_TO = 1.5;
        Aircraft.CL_Ld = 1.7;
        Aircraft.groundRollFraciton = 0.5;
        Aircraft.OEIPenalty = 0.5;
        Aircraft.ClimbDescentCredit = 200; %200 nautical miles
        Aircraft.We_A = 0.97;
        Aircraft.We_exp = -0.06;
        Aircraft.CruiseAlt = 28000;
        Aircraft.reserveRatio = 1.05;
        Aircraft.TW= 0.90;
        Aircraft.WS = 1.1;
        %
        % Enter Constraints Information
        %
        Aircraft.Constraints(1).Type = 'Take-off';
        Aircraft.Constraints(1).Distance = 1250;
        Aircraft.Constraints(1).GroundRollFraction = 60;
        Aircraft.Constraints(1).SegNum = 2;
        %
        Aircraft.Constraints(2).Type = 'Climb';
        Aircraft.Constraints(2).OEIFlag = 1;
        Aircraft.Constraints(2).ClimbGradient = 3;
        Aircraft.Constraints(2).SegNum = 3;
        %
        Aircraft.Constraints(3).Type = 'Landing';
        Aircraft.Constraints(3).Distance = 850;
        Aircraft.Constraints(3).Beta = 0.88;
        %
        Aircraft.Constraints(4).Type = 'Cruise';
        Aircraft.Constraints(4).SegNum = 4;
        Aircraft.Constraints(4).alpha = 0.26;
        Aircraft.Constraints(4).Mach = Aircraft.CruiseMach;
        Aircraft.Constraints(4).Altitude = Aircraft.CruiseAlt;
        Aircraft.Constraints(4).RateofClime = 0;
        %
        Aircraft.Constraints(5).Type = 'Ceiling';
        Aircraft.Constraints(5).SegNum = 5;
        Aircraft.Constraints(5).alpha = 0.26;
        Aircraft.Constraints(5).Mach = Aircraft.CruiseMach;
        Aircraft.Constraints(5).Altitude = 43000;
        Aircraft.Constraints(5).RateofClime = 0;

    case 'E'
        Aircraft.Pax = 115; % [Human] Passengers onboard !
        Aircraft.Bags = 115; %[kg] Checked in 
        Aircraft.Cargo = 1150; %[kg] Checked Baggage 
        Aircraft.MaxPyld = 17000; % [kg] Max payload
        Aircraft.Range = 2681; % [nm] 
        Aircraft.CruiseMach = 0.75;
        Aircraft.Engines = 2;
        Aircraft.PaxWeight = 90;
        Aircraft.BagWeight = 10;

        Aircraft.AR = 9.12; % [-] Aspect Ratio
        Aircraft.e = 0.78; % [-] Oswald efficiency number which is relative to AR!!!
        Aircraft.CD0 = 0.0186; 
        Aircraft.c_TO = 0.247; 
        Aircraft.c_cruise = 1.2411;
        Aircraft.c_climb = 0.565;
        Aircraft.c_approach = 0.565;
        Aircraft.CL_TO = 2.1; % ????
        Aircraft.CL_Ld = 2.3;
        Aircraft.groundRollFraciton = 0.2;
        Aircraft.OEIPenalty = 0.3;
        Aircraft.ClimbDescentCredit = 230+169; %[nm]
        Aircraft.We_A = 0.97;
        Aircraft.We_exp = -0.06;    
        Aircraft.CruiseAlt = 35000; %[ft] 
        Aircraft.reserveRatio = 1.05;
         %
        % Enter Constraints Information
        %
        Aircraft.Constraints(1).Type = 'Take-off';
        Aircraft.Constraints(1).Distance = 1236; %[m]TKPN's runway distance 
        Aircraft.Constraints(1).GroundRollFraction = 64; %4 %need to redo this for the detailed jenkinson's approximation
        Aircraft.Constraints(1).alpha = 0.229
        %
        Aircraft.Constraints(2).Type = 'Climb';
        Aircraft.Constraints(2).OEIFlag = 1;
        Aircraft.Constraints(2).ClimbGradient = 2.4;
        %
        Aircraft.Constraints(3).Type = 'Landing';
        Aircraft.Constraints(3).Distance = 2167;
        %
        Aircraft.Constraints(4).Type = 'Cruise';
        Aircraft.Constraints(4).SegNum = 4;
        Aircraft.Constraints(4).alpha = 0.633;
        Aircraft.Constraints(4).Mach = Aircraft.CruiseMach;
        Aircraft.Constraints(4).Altitude = Aircraft.CruiseAlt;
        Aircraft.Constraints(4).RateofClime = 0;
        %
        Aircraft.Constraints(5).Type = 'Ceiling';
        Aircraft.Constraints(5).SegNum = 5;
        Aircraft.Constraints(5).alpha = 0.663;
        Aircraft.Constraints(5).Mach = Aircraft.CruiseMach;
        Aircraft.Constraints(5).Altitude = 41000;
        Aircraft.Constraints(5).RateofClime = 0;
          %
        Aircraft.Constraints(6).Type = 'Turning-Climb';
        Aircraft.Constraints(6).SegNum = 3;
        Aircraft.Constraints(6).Mach = 0.35;
        Aircraft.Constraints(6).Altitude = 3000;
        Aircraft.Constraints(6).RateofClimb = 2500;
        Aircraft.Constraints(6).BankAngle = 0;
        % 
        Aircraft.Constraints(7).Type = 'High Altitude Takeoff';
        Aircraft.Constraints(7).SegNum = 3;
        Aircraft.Constraints(1).Distance = 1236; %[m]TKPN's runway distance 
        Aircraft.Constraints(1).GroundRollFraction = 64; %4 %need to redo this for the detailed jenkinson's approximation
        Aircraft.Constraints(1).alpha = 0.663
        %
        Aircraft.Constraints(7).Mach = 0.35;
        Aircraft.Constraints(7).Altitude = 3000;
        Aircraft.Constraints(7).RateofClimb = 2500;
        Aircraft.Constraints(7).BankAngle = 20;
    otherwise

end