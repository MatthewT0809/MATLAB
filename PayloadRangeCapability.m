clear;
clc;


M_crit=0.83;
S=122.4;
C_D0 = 0.033;
K = 0.0344;
MTOW=89000;
OEW = 48534;
MSP = 73800;
MFC = 24024;
T0=288.15;
NOperatingEmptyW=OEW/MTOW; % OEW/MTOW
NMaxStructuralPayload=MSP/MTOW; % MSP/MTOW
NMaxFuelCap=MFC/MTOW; % MFC/MTOW
F_res=0.1;
R=287.05287;


load("GammaFPVariables.mat","gamma_FP","delta_weight","fuel_weight");
load("plotPropsVariables.mat","MachNum","Altitude")

constAlt = 36000 * 0.3048;
blockFuelRatioArray = linspace(0,0.,1000);

[~,T_cruise,rho_cruise,a_cruise] = get_AtmosProperties(constAlt);
V_cruise = a_cruise * M_crit;
CL_cruise = (2/rho_cruise) * ((MTOW*9.8065)/S) * (1/(V_cruise^2));
CD_cruise = C_D0 + (K*(CL_cruise^2));
theta_cruise = T_cruise / T0;
[ctp] = get_TSFC(M_crit,theta_cruise);
OEW=MTOW*0.545;
tripRange = linspace(0,17500,1000);
tripRange_test=linspace(0,17500,10000);

WeightArray = linspace(0,MTOW,1000);
OEWArray = ones(1,1000) * OEW;
MTOWArray = ones(1,1000) * MTOW;

PAY_max = MTOW - OEW - MSP;

BFR_EconomicR = MFC/MTOW;
BFC_FerryR = MFC/(OEW + MFC);
BFC_PayloadR = (MTOW-(OEW + MSP))/MTOW; 

bosh=BFC_PayloadR*MTOW;
InitialWeight=bosh+OEW;
ye=MTOW-MFC;

MaxPayloadRange = (V_cruise/(9.8065 * ctp)) * (CL_cruise/CD_cruise) * log(1/(1-BFC_PayloadR)) / 1000;
MaxEconomicRange = (V_cruise/(9.8065 * ctp)) * (CL_cruise/CD_cruise) * log(1/(1-BFR_EconomicR)) / 1000;
MaxFerryRange = (V_cruise/(9.8065 * ctp)) * (CL_cruise/CD_cruise) * log(1/(1-BFC_FerryR)) / 1000;

tripRange=linspace(0,MaxFerryRange,1000);
WeightArrayFerry=linspace(0,OEW+MFC,1000);

R_PR = ones(1,1000) * MaxPayloadRange;
R_ER = ones(1,1000) * MaxEconomicRange;
R_FR = ones(1,1000) * MaxFerryRange;

index=length(blockFuelRatioArray);
IncreasefuelPayload=linspace(OEW,MTOW,1000);
DecreasePayload=linspace(MTOW,(MTOW-MSP),1000);
DeltaIncFPL=IncreasefuelPayload(2)-IncreasefuelPayload(1);
DeltaDecPay=DecreasePayload(2)-DecreasePayload(1);

TOW(1)=OEW;
range=(V_cruise/(9.8065*ctp))*(CL_cruise/CD_cruise)*log(1./(1-blockFuelRatioArray))/1000;

for i=1:3
    if i==1
        RangeArray1=linspace(0,MaxPayloadRange,1000);
        TOW1=linspace(InitialWeight,MTOW,1000);
        OEWPAY1=linspace(InitialWeight,InitialWeight,1000);
        OEWPAYFUELR1=linspace(InitialWeight,InitialWeight+(F_res*MFC),1000);
    elseif i==2
        RangeArray2=linspace(MaxPayloadRange,MaxEconomicRange,1000);
        TOW2=ones(1,1000)*MTOW;
        OEWPAY2=linspace(InitialWeight,ye,1000);
        OEWPAYFUELR2=linspace(InitialWeight+(F_res*MFC),ye+(F_res*MFC),1000);
    elseif i==3
        RangeArray3=linspace(MaxEconomicRange,MaxFerryRange,1000);
        TOW3=linspace(MTOW,OEW+MFC,1000);
        OEWPAY3=linspace(ye,OEW,1000);
        OEWPAYFUELR3=linspace(ye+(F_res*MFC),OEW+(F_res*MFC),1000);
    end
end
RangeArray=[RangeArray1,RangeArray2,RangeArray3];

TOWArray=[TOW1,TOW2,TOW3];
OEWPAY=[OEWPAY1,OEWPAY2,OEWPAY3];
OEWPAYFUELR=[OEWPAYFUELR1,OEWPAYFUELR2,OEWPAYFUELR3];

figure(1)
plot(RangeArray,TOWArray,"r:")
hold on
plot(RangeArray,OEWPAY,"b--")
plot(RangeArray,OEWPAYFUELR,"b")
plot(tripRange,OEWArray,"k")
plot(tripRange,MTOWArray,"k--")
plot(R_PR,WeightArray,"r--")
plot(R_ER,WeightArray,"k:.")
plot(R_FR,WeightArrayFerry,"b--.")
set(gca,"Ytick",0:50000:250000)
set(gca,"XTick",0:2500:17500)
title("Payload Range Chart")
xlabel("Trip Range, R [km]")
ylabel("Weight, W [kgf]")
legend("OEW + PAY + FUEL (TOW)","OEW + PAY","OEW + PAY + 10% RES","OEW","MTOW","Max. Payload Range","Max. Economic Range","Max. Ferry Range")