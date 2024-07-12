% switch Aircraftsname
%     case 'A'
% Aircrafts A
        Aircrafts.A.Pax = 160;
        Aircrafts.A.Bags = Aircrafts.A.Pax;
        Aircrafts.A.Cargo = 0;
        Aircrafts.A.MaxPyld = 25000;
        Aircrafts.A.Range = 3200;
        Aircrafts.A.CruiseMach = 0.785;
        Aircrafts.A.Engines = 2;
        Aircrafts.A.PaxWeight = 100;
        Aircrafts.A.BagWeight = 0;
        Aircrafts.A.MTOW=50000;
        
        Aircrafts.A.AR = 9.7;
        Aircrafts.A.e = 0.8;
        Aircrafts.A.CD0 = 0.018;
        Aircrafts.A.c_TO = 0.3;
        Aircrafts.A.c_cruise = 0.565;
        Aircrafts.A.c_climb = Aircrafts.A.c_cruise;
        Aircrafts.A.c_approach = Aircrafts.A.c_cruise;
        Aircrafts.A.CL_TO = 2.1;
        Aircrafts.A.CL_Ld = 2.3;
        Aircrafts.A.groundRollFraciton = 0.7;
        Aircrafts.A.OEIPenalty = 0.3;
        Aircrafts.A.ClimbDescentCredit = 200; %200 nautical miles
        Aircrafts.A.We_A = 0.97;
        Aircrafts.A.We_exp = -0.06;
        Aircrafts.A.CruiseAlt = 36000;
        Aircrafts.A.reserveRatio = 1.05;
        Aircrafts.A.TW=0.28;
        Aircrafts.A.WS = 6.8;
        %
        % Enter Constraints Information
        %
        Aircrafts.A.Constraints(1).Type = 'Take-off';
        Aircrafts.A.Constraints(1).Distance = 2000;
        Aircrafts.A.Constraints(1).GroundRollFraction = 60;
        Aircrafts.A.Constraints(1).SegNum = 2;
        %
        Aircrafts.A.Constraints(2).Type = 'Climb';
        Aircrafts.A.Constraints(2).OEIFlag = 1;
        Aircrafts.A.Constraints(2).ClimbGradient = 2.4;
        Aircrafts.A.Constraints(2).SegNum = 3;
        %
        Aircrafts.A.Constraints(3).Type = 'Landing';
        Aircrafts.A.Constraints(3).Distance = 2000;
        Aircrafts.A.Constraints(3).Beta = 0.88;
        %
        Aircrafts.A.Constraints(4).Type = 'Cruise';
        Aircrafts.A.Constraints(4).SegNum = 4;
        Aircrafts.A.Constraints(4).alpha = 0.29;
        Aircrafts.A.Constraints(4).Mach = Aircrafts.A.CruiseMach;
        Aircrafts.A.Constraints(4).Altitude = Aircrafts.A.CruiseAlt;
        Aircrafts.A.Constraints(4).RateofClime = 0;
        %
        Aircrafts.A.Constraints(5).Type = 'Ceiling';
        Aircrafts.A.Constraints(5).SegNum = 5;
        Aircrafts.A.Constraints(5).alpha = 0.29;
        Aircrafts.A.Constraints(5).Mach = Aircrafts.A.CruiseMach;
        Aircrafts.A.Constraints(5).Altitude = 41000;
        Aircrafts.A.Constraints(5).RateofClime = 0;
%% 

        
    % case 'B'
        Aircrafts.B.Pax = 325;
        Aircrafts.B.Bags = Aircrafts.B.Pax;
        Aircrafts.B.Cargo = 0;
        Aircrafts.B.MaxPyld = 75000;
        Aircrafts.B.Range = 7800;
        Aircrafts.B.CruiseMach = 0.85;
        Aircrafts.B.Engines = 2;
        Aircrafts.B.PaxWeight = 100;
        Aircrafts.B.BagWeight = 0;
        
        Aircrafts.B.AR = 11;
        Aircrafts.B.e = 0.825;
        Aircrafts.B.CD0 = 0.015;
        Aircrafts.B.c_TO = 0.3;
        Aircrafts.B.c_cruise = 0.515;
        Aircrafts.B.c_climb = Aircrafts.B.c_cruise;
        Aircrafts.B.c_approach = Aircrafts.B.c_cruise;
        Aircrafts.B.CL_TO = 2.0;
        Aircrafts.B.CL_Ld = 2.4;
        Aircrafts.B.groundRollFraciton = 0.7;
        Aircrafts.B.OEIPenalty = 0.3;
        Aircrafts.B.ClimbDescentCredit = 200; %200 nautical miles
        Aircrafts.B.We_A = 0.97;
        Aircrafts.B.We_exp = -0.06;
        Aircrafts.B.CruiseAlt = 36000;
        Aircrafts.B.reserveRatio = 1.05;
        Aircrafts.B.TW=0.25;
        Aircrafts.B.WS = 9.2;

        %
        % Enter Constraints Information
        %
        Aircrafts.B.Constraints(1).Type = 'Take-off';
        Aircrafts.B.Constraints(1).Distance = 3100;
        Aircrafts.B.Constraints(1).GroundRollFraction = 60;
        Aircrafts.B.Constraints(1).SegNum = 2;
        %
        Aircrafts.B.Constraints(2).Type = 'Climb';
        Aircrafts.B.Constraints(2).OEIFlag = 1;
        Aircrafts.B.Constraints(2).ClimbGradient = 2.4;
        Aircrafts.B.Constraints(2).SegNum = 3;
        %
        Aircrafts.B.Constraints(3).Type = 'Landing';
        Aircrafts.B.Constraints(3).Distance = 2800;
        Aircrafts.B.Constraints(3).Beta = 0.80;
        %
        Aircrafts.B.Constraints(4).Type = 'Cruise';
        Aircrafts.B.Constraints(4).SegNum = 4;
        Aircrafts.B.Constraints(4).alpha = 0.21;
        Aircrafts.B.Constraints(4).Mach = Aircrafts.B.CruiseMach;
        Aircrafts.B.Constraints(4).Altitude = Aircrafts.B.CruiseAlt;
        Aircrafts.B.Constraints(4).RateofClime = 0;
        %
        Aircrafts.B.Constraints(5).Type = 'Ceiling';
        Aircrafts.B.Constraints(5).SegNum = 5;
        Aircrafts.B.Constraints(5).alpha = 0.21;
        Aircrafts.B.Constraints(5).Mach = Aircrafts.B.CruiseMach;
        Aircrafts.B.Constraints(5).Altitude = 41000;
        Aircrafts.B.Constraints(5).RateofClime = 0;
        %
        Aircrafts.B.Constraints(6).Type = 'Turning-Climb';
        Aircrafts.B.Constraints(6).SegNum = 3;
        Aircrafts.B.Constraints(6).Mach = 0.35;
        Aircrafts.B.Constraints(6).Altitude = 3000;
        Aircrafts.B.Constraints(6).RateofClimb = 2500;
        Aircrafts.B.Constraints(6).BankAngle = 30;  
%% 

    % case 'C'
        Aircrafts.C.Pax = 200;
        Aircrafts.C.Bags = Aircrafts.C.Pax;
        Aircrafts.C.Cargo = 0;
        Aircrafts.C.MaxPyld = 35000;
        Aircrafts.C.Range = 4500;
        Aircrafts.C.CruiseMach = 0.84;
        Aircrafts.C.Engines = 2;
        Aircrafts.C.PaxWeight = 100;
        Aircrafts.C.BagWeight = 0;
        
        Aircrafts.C.AR = 10.2;
        Aircrafts.C.e = 0.825;
        Aircrafts.C.CD0 = 0.017;
        Aircrafts.C.c_TO = 0.3;
        Aircrafts.C.c_cruise = 0.515;
        Aircrafts.C.c_climb = Aircrafts.C.c_cruise;
        Aircrafts.C.c_approach = Aircrafts.C.c_cruise;
        Aircrafts.C.CL_TO = 1.8;
        Aircrafts.C.CL_Ld = 2.2;
        Aircrafts.C.groundRollFraciton = 0.6;
        Aircrafts.C.OEIPenalty = 0.5;
        Aircrafts.C.ClimbDescentCredit = 200; %200 nautical miles
        Aircrafts.C.We_A = 0.97;
        Aircrafts.C.We_exp = -0.06;
        Aircrafts.C.CruiseAlt = 36000;
        Aircrafts.C.reserveRatio = 1.05;
        Aircrafts.C.TW=0.25;
        Aircrafts.C.WS = 3.7;
        %
        % Enter Constraints Information
        %
        Aircrafts.C.Constraints(1).Type = 'Take-off';
        Aircrafts.C.Constraints(1).Distance = 2100;
        Aircrafts.C.Constraints(1).GroundRollFraction = 60;
        Aircrafts.C.Constraints(1).SegNum = 2;
        %
        Aircrafts.C.Constraints(2).Type = 'Climb';
        Aircrafts.C.Constraints(2).OEIFlag = 1;
        Aircrafts.C.Constraints(2).ClimbGradient = 2.4;
        Aircrafts.C.Constraints(2).SegNum = 3;
        %
        Aircrafts.C.Constraints(3).Type = 'Landing';
        Aircrafts.C.Constraints(3).Distance = 1500;
        Aircrafts.C.Constraints(3).Beta = 0.88;
        %
        Aircrafts.C.Constraints(4).Type = 'Cruise';
        Aircrafts.C.Constraints(4).SegNum = 4;
        Aircrafts.C.Constraints(4).alpha = 0.26;
        Aircrafts.C.Constraints(4).Mach = Aircrafts.C.CruiseMach;
        Aircrafts.C.Constraints(4).Altitude = Aircrafts.C.CruiseAlt;
        Aircrafts.C.Constraints(4).RateofClime = 0;
        %
        Aircrafts.C.Constraints(5).Type = 'Ceiling';
        Aircrafts.C.Constraints(5).SegNum = 5;
        Aircrafts.C.Constraints(5).alpha = 0.26;
        Aircrafts.C.Constraints(5).Mach = Aircrafts.C.CruiseMach;
        Aircrafts.C.Constraints(5).Altitude = 41000;
        Aircrafts.C.Constraints(5).RateofClime = 0;
        %% 

        %
        % case 'Evil23'
        %
        Aircrafts.Evil23.Pax = 10;
        Aircrafts.Evil23.Bags = Aircrafts.Evil23.Pax;
        Aircrafts.Evil23.Cargo = 0;
        Aircrafts.Evil23.MaxPyld = 2000;
        Aircrafts.Evil23.Range = 10500;
        Aircrafts.Evil23.CruiseMach = 0.92;
        Aircrafts.Evil23.Engines = 2;
        Aircrafts.Evil23.PaxWeight = 100;
        Aircrafts.Evil23.BagWeight = 0;
        
        Aircrafts.Evil23.AR = 15;
        Aircrafts.Evil23.e = 0.9;
        Aircrafts.Evil23.CD0 = 0.023;
        Aircrafts.Evil23.c_TO = 0.30;
        Aircrafts.Evil23.c_cruise = 0.55;
        Aircrafts.Evil23.c_climb = Aircrafts.Evil23.c_cruise;
        Aircrafts.Evil23.c_desc = Aircrafts.Evil23.c_cruise;
        Aircrafts.Evil23.c_approach = Aircrafts.Evil23.c_cruise;
        Aircrafts.Evil23.CL_TO = 1.6;
        Aircrafts.Evil23.CL_Ld = 1.8;
        Aircrafts.Evil23.groundRollFraciton = 0.5;
        Aircrafts.Evil23.OEIPenalty = 0.5;
        Aircrafts.Evil23.ClimbDescentCredit = 200; %200 nautical miles
        Aircrafts.Evil23.We_A = 0.97;
        Aircrafts.Evil23.We_exp = -0.06;
        Aircrafts.Evil23.CruiseAlt = 45000;
        Aircrafts.Evil23.reserveRatio = 1.05;
        Aircrafts.Evil23.TW=0.30;
        Aircrafts.Evil23.WS = 2.8;
        %
        % Enter Constraints Information
        %
        Aircrafts.Evil23.Constraints(1).Type = 'Take-off';
        Aircrafts.Evil23.Constraints(1).Distance = 2500;
        Aircrafts.Evil23.Constraints(1).GroundRollFraction = 50;
        Aircrafts.Evil23.Constraints(1).SegNum = 2;
        Aircrafts.Evil23.Constraints(1).Altitude=12000;
        Aircrafts.Evil23.Constraints(1).TempOffset=25;
        %
        Aircrafts.Evil23.Constraints(2).Type = 'Climb';
        Aircrafts.Evil23.Constraints(2).OEIFlag = 1;
        Aircrafts.Evil23.Constraints(2).ClimbGradient = 2.4;
        Aircrafts.Evil23.Constraints(2).SegNum = 3;
        %
        Aircrafts.Evil23.Constraints(3).Type = 'Landing';
        Aircrafts.Evil23.Constraints(3).Distance = 2500;
        Aircrafts.Evil23.Constraints(3).Beta = 0.8061;
        Aircrafts.Evil23.Constraints(3).Altitude=12000;
        Aircrafts.Evil23.Constraints(3).TempOffset=25;

        %
        Aircrafts.Evil23.Constraints(4).Type = 'Cruise';
        Aircrafts.Evil23.Constraints(4).SegNum = 4;
        Aircrafts.Evil23.Constraints(4).alpha = 0.26;
        Aircrafts.Evil23.Constraints(4).Mach = Aircrafts.Evil23.CruiseMach;
        Aircrafts.Evil23.Constraints(4).Altitude = Aircrafts.Evil23.CruiseAlt;
        Aircrafts.Evil23.Constraints(4).RateofClime = 0;
        %
        Aircrafts.Evil23.Constraints(5).Type = 'Ceiling';
        Aircrafts.Evil23.Constraints(5).SegNum = 5;
        Aircrafts.Evil23.Constraints(5).alpha = 0.26;
        Aircrafts.Evil23.Constraints(5).Mach = Aircrafts.Evil23.CruiseMach;
        Aircrafts.Evil23.Constraints(5).Altitude = 51000;
        Aircrafts.Evil23.Constraints(5).RateofClime = 0;
        
%     otherwise
% 
% end