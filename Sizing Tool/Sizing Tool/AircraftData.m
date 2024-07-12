switch aircraftname
    case 'A'
        Aircraft.Pax = 160;
        Aircraft.Bags = Aircraft.Pax;
        Aircraft.Cargo = 0;
        Aircraft.MaxPyld = 25000;
        Aircraft.Range = 3200; %[nautical miles]
        Aircraft.CruiseMach = 0.785;
        Aircraft.Engines = 2;
        Aircraft.PaxWeight = 100;
        Aircraft.BagWeight = 0;
        Aircraft.MTOW=0;
        
        Aircraft.AR = 9.7;
        Aircraft.e = 0.8;
        Aircraft.CD0 = 0.018;
        Aircraft.c_TO = 0.3;
        Aircraft.c_cruise = 0.565;
        Aircraft.c_climb = Aircraft.c_cruise;
        Aircraft.c_approach = Aircraft.c_cruise;
        Aircraft.CL_TO = 2.1;
        Aircraft.CL_Ld = 2.3;
        Aircraft.groundRollFraciton = 0.7;
        Aircraft.OEIPenalty = 0.3;
        Aircraft.ClimbDescentCredit = 200; %200 nautical miles
        Aircraft.We_A = 0.97;
        Aircraft.We_exp = -0.06;
        Aircraft.CruiseAlt = 36000;
        Aircraft.reserveRatio = 1.05;
        Aircraft.TW=0.28;
        Aircraft.WS = 6.8;
        %
        % Enter Constraints Information
        %
        Aircraft.Constraints(1).Type = 'Take-off';
        Aircraft.Constraints(1).Distance = 2000;
        Aircraft.Constraints(1).GroundRollFraction = 60;
        Aircraft.Constraints(1).SegNum = 2;
        %
        Aircraft.Constraints(2).Type = 'Climb';
        Aircraft.Constraints(2).OEIFlag = 1;
        Aircraft.Constraints(2).ClimbGradient = 2.4;
        Aircraft.Constraints(2).SegNum = 3;
        %
        Aircraft.Constraints(3).Type = 'Landing';
        Aircraft.Constraints(3).Distance = 2000;
        Aircraft.Constraints(3).Beta = 0.88;
        %
        Aircraft.Constraints(4).Type = 'Cruise';
        Aircraft.Constraints(4).SegNum = 4;
        Aircraft.Constraints(4).alpha = 0.29;
        Aircraft.Constraints(4).Mach = Aircraft.CruiseMach;
        Aircraft.Constraints(4).Altitude = Aircraft.CruiseAlt;
        Aircraft.Constraints(4).RateofClime = 0;
        %
        Aircraft.Constraints(5).Type = 'Ceiling';
        Aircraft.Constraints(5).SegNum = 5;
        Aircraft.Constraints(5).alpha = 0.29;
        Aircraft.Constraints(5).Mach = Aircraft.CruiseMach;
        Aircraft.Constraints(5).Altitude = 41000;
        Aircraft.Constraints(5).RateofClime = 0;
%% 

        
    case 'B'
        Aircraft.Pax = 325;
        Aircraft.Bags = Aircraft.Pax;
        Aircraft.Cargo = 0;
        Aircraft.MaxPyld = 75000;
        Aircraft.Range = 7800;
        Aircraft.CruiseMach = 0.85;
        Aircraft.Engines = 2;
        Aircraft.PaxWeight = 100;
        Aircraft.BagWeight = 0;
        
        Aircraft.AR = 11;
        Aircraft.e = 0.825;
        Aircraft.CD0 = 0.015;
        Aircraft.c_TO = 0.3;
        Aircraft.c_cruise = 0.515;
        Aircraft.c_climb = Aircraft.c_cruise;
        Aircraft.c_approach = Aircraft.c_cruise;
        Aircraft.CL_TO = 2.0;
        Aircraft.CL_Ld = 2.4;
        Aircraft.groundRollFraciton = 0.7;
        Aircraft.OEIPenalty = 0.3;
        Aircraft.ClimbDescentCredit = 200; %200 nautical miles
        Aircraft.We_A = 0.97;
        Aircraft.We_exp = -0.06;
        Aircraft.CruiseAlt = 36000;
        Aircraft.reserveRatio = 1.05;
        Aircraft.TW=0.25;
        Aircraft.WS = 9.2;

        %
        % Enter Constraints Information
        %
        Aircraft.Constraints(1).Type = 'Take-off';
        Aircraft.Constraints(1).Distance = 3100;
        Aircraft.Constraints(1).GroundRollFraction = 60;
        Aircraft.Constraints(1).SegNum = 2;
        %
        Aircraft.Constraints(2).Type = 'Climb';
        Aircraft.Constraints(2).OEIFlag = 1;
        Aircraft.Constraints(2).ClimbGradient = 2.4;
        Aircraft.Constraints(2).SegNum = 3;
        %
        Aircraft.Constraints(3).Type = 'Landing';
        Aircraft.Constraints(3).Distance = 2800;
        Aircraft.Constraints(3).Beta = 0.80;
        %
        Aircraft.Constraints(4).Type = 'Cruise';
        Aircraft.Constraints(4).SegNum = 4;
        Aircraft.Constraints(4).alpha = 0.21;
        Aircraft.Constraints(4).Mach = Aircraft.CruiseMach;
        Aircraft.Constraints(4).Altitude = Aircraft.CruiseAlt;
        Aircraft.Constraints(4).RateofClime = 0;
        %
        Aircraft.Constraints(5).Type = 'Ceiling';
        Aircraft.Constraints(5).SegNum = 5;
        Aircraft.Constraints(5).alpha = 0.21;
        Aircraft.Constraints(5).Mach = Aircraft.CruiseMach;
        Aircraft.Constraints(5).Altitude = 41000;
        Aircraft.Constraints(5).RateofClime = 0;
        %
        Aircraft.Constraints(6).Type = 'Turning-Climb';
        Aircraft.Constraints(6).SegNum = 3;
        Aircraft.Constraints(6).Mach = 0.35;
        Aircraft.Constraints(6).Altitude = 3000;
        Aircraft.Constraints(6).RateofClimb = 2500;
        Aircraft.Constraints(6).BankAngle = 30;

    case 'C'
        Aircraft.Pax = 200;
        Aircraft.Bags = Aircraft.Pax;
        Aircraft.Cargo = 0;
        Aircraft.MaxPyld = 35000;
        Aircraft.Range = 4500;
        Aircraft.CruiseMach = 0.84;
        Aircraft.Engines = 2;
        Aircraft.PaxWeight = 100;
        Aircraft.BagWeight = 0;
        
        Aircraft.AR = 10.2;
        Aircraft.e = 0.825;
        Aircraft.CD0 = 0.017;
        Aircraft.c_TO = 0.3;
        Aircraft.c_cruise = 0.515;
        Aircraft.c_climb = Aircraft.c_cruise;
        Aircraft.c_approach = Aircraft.c_cruise;
        Aircraft.CL_TO = 1.8;
        Aircraft.CL_Ld = 2.2;
        Aircraft.groundRollFraciton = 0.6;
        Aircraft.OEIPenalty = 0.5;
        Aircraft.ClimbDescentCredit = 200; %200 nautical miles
        Aircraft.We_A = 0.97;
        Aircraft.We_exp = -0.06;
        Aircraft.CruiseAlt = 36000;
        Aircraft.reserveRatio = 1.05;
        Aircraft.TW=0.25;
        Aircraft.WS = 3.7;
        %
        % Enter Constraints Information
        %
        Aircraft.Constraints(1).Type = 'Take-off';
        Aircraft.Constraints(1).Distance = 2100;
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
        Aircraft.Constraints(5).alpha = 0.26;
        Aircraft.Constraints(5).Mach = Aircraft.CruiseMach;
        Aircraft.Constraints(5).Altitude = 41000;
        Aircraft.Constraints(5).RateofClime = 0;
        
    otherwise

end