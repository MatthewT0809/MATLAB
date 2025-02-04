clear

S = 122.4;
MTOW = 89000;
Altitude = 36000 * 0.3048;
M_crit = 0.82;
CD0 = 0.033;
gamma = 1.4;
OEW = 48534;
MFC = 24024;
MSP= ;
K = 0.0344;
FR = 0.1;
T0=288.15;

[p,T,rho,a] = get_AtmosProperties(Altitude);

V = a*M_crit; 
CL = (2/rho) * ((MTOW*9.8065)/S) * (1/(V^2));
CD = CD0 + (K*(CL^2));
theta = T/T0;
[~,ctp] = getFuelRate(Altitude,M_crit,0);

WArray = linspace(0,MTOW,1000);
OEWArray = ones(1,1000)*OEW;
MTOWarray = ones(1,1000) * MTOW;
MSParray = ones(1,1000)*MSP;
PAY_maxarray = MTOWarray - OEWArray - MSParray; 

BFR_EconomicR = MFC/MTOW;
BFC_FerryR = MFC/(OEW+MFC);
BFC_PayloadR = (MTOW -(OEW+MSP))/MTOW;

bosh = BFC_PayloadR*MTOW;
W_i = bosh + OEW;
ye = MTOW - MFC;

MaxPayloadRange = (V/(9.8065 * ctp)) * (CL/CD) * log(1/(1-BFC_PayloadR)) / 1000;
MaxEconomicRange = (V/(9.8065 * ctp)) * (CL/CD) * log(1/(1-BFR_EconomicR)) / 1000;
MaxFerryRange = (V/(9.8065 * ctp)) * (CL/CD) * log(1/(1-BFC_FerryR)) / 1000;


tripRange=linspace(0,MaxFerryRange,1000);
WeightArrayFerry = linspace(0,OEW+MFC,1000);

R_PR = ones(1,1000) * MaxPayloadRange;
R_ER = ones(1,1000) * MaxEconomicRange;
R_FR = ones(1,1000) * MaxFerryRange;
blockFuelRatio = linspace(0,MFC/MTOW,1000);
index=length(blockFuelRatio);


TOW(1)=OEW;
range = (V/(9.8065*ctp))*(CL/CD)*log(1./(1-blockFuelRatio))/1000;

for i=1:3
    if i==1
        RangeArray1=linspace(0,MaxPayloadRange,1000);
        TOW1 = linspace(W_i,MTOW,1000);
        OEWPAY1=linspace(W_i,W_i,1000);
        OEWPAYFUELR1 = linspace(W_i,W_i+(FR*MFC),1000);
    elseif i== 2 
        RangeArray2=linspace(MaxPayloadRange,MaxEconomicRange,1000);
        TOW2=ones(1,1000)*MTOW;
        OEWPAY2=linspace(W_i,ye,1000);
        OEWPAYFUELR2=linspace(W_i+(FR*MFC),ye+(FR*MFC),1000);
    elseif i==3
        RangeArray3=linspace(MaxEconomicRange,MaxFerryRange,1000);
        TOW3=linspace(MTOW,OEW+MFC,1000);
        OEWPAY3=linspace(ye,OEW,1000);
        OEWPAYFUELR3=linspace(ye+(FR*MFC),OEW+(FR*MFC),1000);
    end
end
RangeArray=[RangeArray1,RangeArray2,RangeArray3];
TOWArray=[TOW1,TOW2,TOW3];
OEWPAY=[OEWPAY1,OEWPAY2,OEWPAY3];
OEWPAYFUELR=[OEWPAYFUELR1,OEWPAYFUELR2,OEWPAYFUELR3];






figure
hold on 
plot(RangeArray,TOWArray);
plot(RangeArray,OEWPAYFUELR)
plot(tripRange,OEWArray)
plot(tripRange,MTOWarray)
plot(R_PR,WArray)
plot(R_ER,WArray)
plot(R_FR,WeightArrayFerry)


% Specify figure title and axis labels
Title = {'Specfic Air Range VS Time Elasped'};
PlotXLabel = ('Trip Range km');
PlotYLabel = ('Weight W kgf');
xLimit(1) = 0;
xLimit(2) = 12800;
yLimit(1) = 0;
yLimit(2) = 98000;
xTicks = [0 0.2 0.4 0.6 0.8 1.0].*xLimit(2);
yTicks = [0 0.2 0.4 0.6 0.8 1.0].*yLimit(2);

% Specify legend names and position
legendnames = [{'TOW'};...
    {'OEW+PAY'};...
    {'OEW'};...
    {'MTOW'};...
    {'MaxPayloadRange'};...
    {'MaxEconomicRange'};...
    {'MaxFerryRange'}]; 
legloc = 'SouthWest';

% Set fonts, line widths, colours
FONTS = 'Times New Roman';
LABSIZE = 20;
AXSIZE = 18;

LEGSIZE = 15;
LINSIZE = 0.5;
PAPSIZE = [18 10]; 
STYLES = {'-','-','-','-','-','--',':','-.'};
COLORS = [0 0 0; 0 0 0.8; 1 0 0; 0 0.4 0; 0 0.5 1; 1 0.4 0.4; 1 0 0.4];

% Set Legend Properties
legend(gca,legendnames,'Interpreter','latex')
set(legend,'Location',legloc)
set(legend,'fontsize',LEGSIZE,'FontName',FONTS)
set(legend,'Box','on')

% Set figure properties
set(gcf,'Visible','on','PaperSize',PAPSIZE,'PaperUnits',...
    'centimeters','PaperPosition',[0.1 0.1 0.9 0.9]);
set(gcf,'Color',[1,1,1])
set(gcf,'PaperPositionMode','manual','PaperUnits','centimeters',...
    'PaperSize',PAPSIZE,'PaperPosition',[0 0 PAPSIZE(1) PAPSIZE(2)]);
set(gcf, 'Position',  [200, 200, 800, 800])

% Set axis properties
set(gca,'XMinorTick','on')
set(gca,'YMinorTick','on')
set(gca,'TickLength',[0.01 0.01])
set(gca,'LineWidth',1.5)
grid(gca,'off')  
box(gca,'off')
axis(gca,'square')

% Set axis labels
xlabel(PlotXLabel,'fontsize',LABSIZE,'fontname',FONTS,'Interpreter','latex')
ylabel(PlotYLabel,'fontsize',LABSIZE,'fontname',FONTS,'Interpreter','latex')
title(Title,'fontsize',LABSIZE,'fontname',FONTS,'Interpreter','latex')

% Set axis numbers
set(gca,'xlim',xLimit,'XTick',xTicks,'fontsize',AXSIZE,'fontname',FONTS)
set(gca,'ylim',yLimit,'YTick',yTicks,'fontsize',AXSIZE,'fontname',FONTS)

% Set line properties
lines = get(gca,'children');
N =  length(lines);
for b = 1:N    
    set(lines(b),'Color',COLORS(N+1-b,:),'LineWidth',LINSIZE,'LineStyle',STYLES{N+1-b});
end

% figure
% hold on 
% plot(ratio_blockfuel,R1,'b')
% plot(ratio_blockfuel,R2,'r')
% plot(ratio_blockfuel,R3,'g')


%%CL_MAX = sqrt(CD_0/3*K); %CL_MAX
% % W_e(x) = OEW(x)+MSP(x); 
% % W_i(x) = W_e(x)/(1-ratio_blockfuel(x));
% % 
% % PAY(x) =  MTOW(x) - OEW(x) - MSP(x);
% % BFC_PayloadR = (MTOW(x)-(OEW(x) + MSP(x)))/MTOW(x); 
% % bosh=BFC_PayloadR*MTOW;
% % InitialWeight=bosh+OEW;
% % ye=MTOW-MFC;







