%missionDef{11,:}=0;
missionDef{1,1}='WARM';
missionDef{2,1}='TKOF';
missionDef{3,1}='CLMB';
missionDef{4,1}='CRUS';
missionDef{5,1}='DSCT';
missionDef{6,1}='LNDG';
missionDef{7,1}='HOLD';
missionDef{8,1}='TAXI';
missionDef{9,1}='ALCL';
missionDef{10,1}='ALCR';
missionDef{11,1}='ALLD';

%For cruise MissionDef is [Type, Range, Speed]
missionDef{4,2}= Aircraft.Range; % Set to the design range for the aircraft
missionDef{4,3}= Aircraft.CruiseMach;
missionDef{4,4} = Aircraft.CruiseAlt;

%For Diversion Cruise to alternate airport
missionDef{10,2} = 100;
missionDef{10,3} = missionDef{4,3};
missionDef{10,4} = missionDef{4,4};

%For Hold/Loiter
missionDef{7,2} = 30; % 30 min hold before diversion