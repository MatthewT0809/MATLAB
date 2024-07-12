clear
altitude = linspace(1,15000,1000);
%this is in m
for x = 1:length(altitude)
    [VlowTA_ms(x),VhighTA_ms(x)] = get_MaxThrustSpeedscw(altitude(x));
    [VNE_ms(x),VME_ms(x),VstallTO_ms(x),VstallLD_ms(x)] = fget_VNEspeedscw(altitude(x));
end


%% Plot Aircraft Weight and Thrust Required Graph

% Plot relative propoerties as a function of flight time in mins
figure
hold on 
a = 880;
plot(VhighTA_ms(1,1:a),altitude(1,1:a))
plot(VlowTA_ms(1,1:a),altitude(1:a))
plot(VNE_ms,altitude)
plot(VME_ms,altitude)
plot(VstallTO_ms,altitude)
plot(VstallLD_ms,altitude)

% Specify figure title and axis labels
Title = 'Flight Envelope for A321'; % Title
PlotXLabel = 'True airspeed $\frac{m}{s}$'; % SET X-AXIS LABEL
PlotYLabel = 'Altitude $m$'; % SET Y-AXIS LABEL

% Specify axis limits and ticks
xLimit(1) = 0;
xLimit(2) = 500;
yLimit(1) = 0;
yLimit(2) = 18000;
xTicks = [0 0.2 0.4 0.6 0.8 1.0].*xLimit(2);
yTicks = [0 0.2 0.4 0.6 0.8 1.0].*yLimit(2);

% Specify legend names and position
legendnames = [{'Highest Velocity given avaliable thrust'};...
    {'Lowest Veloicty given avliable thrust'};...
    {'Never exceed Velocity'};...
    {'Never exceed Mach Number'};...
    {'Takeoff stall speed'};...
    {'Landing stall speed'}]; 
legloc = 'NorthEast';

% Set fonts, line widths, colours
FONTS = 'Times New Roman';
LABSIZE = 20;
AXSIZE = 18;
LEGSIZE = 10;
LINSIZE = 2;
PAPSIZE = [25 25];
STYLES = {'-','--',':','-.','-','--',':','-.'};
COLORS = [0 0 0; 0 0 0.8; 1 0 0; 0 0.4 0; 0 0.5 1; 1 0.4 0.4; 0.5 1 0];

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
box(gca,'on')
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







