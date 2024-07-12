clear
flightData1 = readtable("C:\Users\Matthew\Downloads\SQ24_NOV9 A359.xlsx");
flightData2 = readtable("C:\Users\Matthew\Downloads\FINLAND NEW CSV.xlsx");
flightData3 = readtable("C:\Users\Matthew\Downloads\EK131_NOV9 A388.xlsx");
% Extract groundspeed data from tables
groundspeed1 = table2array(flightData1(:, 6))*0.514444;
groundspeed2 = table2array(flightData2(:, 6))*0.514444;
groundspeed3 = table2array(flightData3(:, 6))*0.514444;


%time
Time1 = table2array(flightData1(:,1)); 
Time2 = table2array(flightData2(:,1)); 
Time3 = table2array(flightData2(:,1)); 
%Altitude
Altitude1 = table2array(flightData1(:,5))*0.3048;
Altitude2 = table2array(flightData2(:,5))*0.3048;
Altitude3 = table2array(flightData3(:,5))*0.3048;
S1 = 442.9; %wing area
S2 = 122.4; %m2 
S3 = 843; 
W_MTOW1 = (268000*9.81); %N 
W_MTOW2 = (89000*9.81); 
W_MTOW3 = (560000*9.81);
gamma = 1.4; 

[SAR1,SAR2,SAR3,W1,W2,W3,m3,m1,m2,weightLoss3,weightLoss1,weightLoss2,Drag3,Drag1,Drag2,CL3,CL1,CL2,CD3,CD1,CD2, dynamicPressure3,dynamicPressure1, dynamicPressure2,p1,rho1,T1,a1,p2,rho2,T2,a2,T3,a3,p3,rho3,timeElapsed2,timeElapsed1,timeElapsed3,M1,M2,M3,distance1,distance2,distance3,deltaAltitude1,deltaAltitude2,deltaAltitude3,gamma_FPA3,gamma_FPA2,gamma_FPA1] = deal(zeros(length(Altitude1),1));

for x = 1:length(Time1)
[p1(x),T1(x),rho1(x),a1(x)] = get_AtmosProperties(Altitude1(x));
[p2(x),T2(x),rho2(x),a2(x)] = get_AtmosProperties(Altitude2(x));   
[p3(x),T3(x),rho3(x),a3(x)] = get_AtmosProperties(Altitude3(x));  
    M1(x) = groundspeed1(x)/ a1(x);
    M2(x) = groundspeed2(x)/ a2(x);
    M3(x) = groundspeed3(x)/ a3(x);
  
    if x == 1   
        timeElapsed1(x) = 0;
        timeElapsed2(x) = 0;
        timeElapsed3(x) = 0;
        deltaAltitude1 = 0;
        deltaAltitude2 = 0;
        deltaAltitude3 = 0;
        lastW1 = W_MTOW1;
        lastW2 = W_MTOW2;
        lastW3 = W_MTOW3;
    else
        timeElapsed1(x) = Time1(x) - Time1(x-1);
        timeElapsed2(x) = Time2(x) - Time2(x-1);
        timeElapsed3(x) = Time3(x) - Time3(x-1);
        lastW1 = W1(x-1);
        lastW2 = W2(x-1);
        lastW3 = W3(x-1);
        lastAlt1 = Altitude1(x-1); 
        lastAlt2 = Altitude2(x-1);  
        lastAlt3 = Altitude3(x-1);
        deltaAltitude1(x) = Altitude1(x)- lastAlt1;
        deltaAltitude2(x) = Altitude2(x)- lastAlt2;
        deltaAltitude3(x) = Altitude3(x)- lastAlt3;
    end 

distance1(x) = groundspeed1(x)*timeElapsed1(x);
distance2(x) = groundspeed2(x)*timeElapsed2(x);
distance3(x) = groundspeed3(x)*timeElapsed3(x);      
gamma_FPA1(x) = asin(deltaAltitude1(x)/distance1(x));            
gamma_FPA2(x) = asin(deltaAltitude2(x)/distance2(x));    
gamma_FPA3(x) = asin(deltaAltitude3(x)/distance3(x)); 
if isnan(gamma_FPA1(x)) == true
    gamma_FPA1(x) = 0;
end
if isnan(gamma_FPA2(x)) == true
    gamma_FPA2(x) = 0;
end
if isnan(gamma_FPA3(x)) == true
    gamma_FPA3(x) = 0;
end
%Get CL CD 
[CL1(x),CD1(x)] = get_TrimCLCDcw(gamma_FPA1(x),W1(x),M1(x),Altitude1(x),1); 
[CL2(x),CD2(x)] = get_TrimCLCDcw(gamma_FPA2(x),W2(x),M2(x),Altitude2(x),2); 
[CL3(x),CD3(x)] = get_TrimCLCDcw(gamma_FPA3(x),W3(x),M3(x),Altitude3(x),3); 
if isnan(CL1(x)) == true
    CL1(x) = 0;
end
if isnan(CD1(x)) == true
    CD1(x) = 0;
end
if isnan(CL2(x)) == true
    CL2(x) = 0;
end
if isnan(CD2(x)) == true
    CD2(x) = 0;
end
if isnan(CL3(x)) == true
    CL3(x) = 0;
end
if isnan(CD3(x)) == true
    CD3(x) = 0;
end
dynamicPressure1(x) = 0.5*rho1(x)*groundspeed1(x)^2;
dynamicPressure2(x) = 0.5*rho2(x)*groundspeed2(x)^2;
dynamicPressure3(x) = 0.5*rho3(x)*groundspeed3(x)^2;
if isnan(dynamicPressure1(x)) == true
    dynamicPressure1(x) = 0;
end
if isnan(dynamicPressure2(x)) == true
    dynamicPressure2(x) = 0;
end
if isnan(dynamicPressure3(x)) == true
    dynamicPressure3(x) = 0;
end

%Drag force (N)x
Drag1(x) = CD1(x)*S1*dynamicPressure1(x);
Drag2(x) = CD2(x)*S2*dynamicPressure2(x);
Drag3(x) = CD3(x)*S3*dynamicPressure3(x);
if isnan(Drag1(x)) == true
    Drag1(x) = 0;
end
if isnan(Drag2(x)) == true
    Drag2(x) = 0;
end
if isnan(Drag3(x)) == true
    Drag3(x) = 0;
end
%Weight Loss
[m1(x),ctp1(x)]  = getFuelRatecw(Altitude1(x),M1(x),Drag1(x),1); %assuming drag = thrust
[m2(x),ctp2(x)]  = getFuelRatecw(Altitude2(x),M2(x),Drag2(x),2);
[m3(x),ctp3(x)]  = getFuelRatecw(Altitude3(x),M3(x),Drag3(x),3);
weightLoss1(x) = (m1(x)/3600 *timeElapsed1(x));
weightLoss2(x) = (m2(x)/3600 *timeElapsed2(x));
weightLoss3(x) = (m3(x)/3600 *timeElapsed3(x));
if isnan(weightLoss1(x)) == true
    weightLoss1(x) = 0;
end
if isnan(weightLoss2(x)) == true
    weightLoss2(x) = 0;
end
if isnan(weightLoss3(x)) == true
    weightLoss3(x) = 0;
end
W1(x) = lastW1-weightLoss1(x);
W2(x) = lastW2-weightLoss2(x);
W3(x) = lastW3-weightLoss3(x);
lastW1 = W1(x); 
lastW2 = W2(x); 
lastW3 = W3(x); 
[SAR1(x),~] = get_SARSEcw(W1(x)/9.81,Altitude1(x),M1(x),gamma_FPA1(x),1);
[SAR2(x),~] = get_SARSEcw(W2(x)/9.81,Altitude2(x),M2(x),gamma_FPA2(x),2);
[SAR3(x),~] = get_SARSEcw(W3(x)/9.81,Altitude3(x),M3(x),gamma_FPA3(x),3);
%     if x > 1
%         if SAR1(x) - SAR1(x-1)  < -300
%         SAR1(x) = SAR1(x-1);
%         end  
%         if SAR2(x) - SAR2(x-1) < -300
%         SAR2(x) = SAR2(x-1);
%         end
%         if SAR3(x) - SAR3(x-1) < -300
%         SAR3(x) = SAR3(x-1);
%         end
%     end


end  

flighttime = linspace(1,Time1(1489)-Time1(1),1489)/60;
    
figure
hold on
% title('altitude')
% plot(flighttime,Altitude1,'g')
% plot(flighttime,Altitude2,'r')
% plot(flighttime,Altitude3,'b')
% hold off
% figure
% hold on
% title('velocity')
% plot(flighttime,groundspeed1,'g')
% plot(flighttime,groundspeed2,'r')
% plot(flighttime,groundspeed3,'b')
% hold off
% figure
% hold on 
% title('ctp')
% plot(flighttime,ctp1,'g')
% plot(flighttime,ctp2,'r')
% plot(flighttime,ctp3,'b')
% hold off
% figure  
% hold on
% title('Drag')
% plot(flighttime,Drag1,"g"); %plots the graph
% plot(flighttime,Drag2,"r"); %plots the graph
% plot(flighttime,Drag3,"b"); %plots the graph
% hold off
% figure  
% hold on
title('sar')
plot(flighttime,SAR1,"g"); %plots the graph
plot(flighttime,SAR2,"r"); %plots the graph
plot(flighttime,SAR3,"b"); %plots the graph


% Specify figure title and axis labels
Title = {'Specfic Air Range VS Time Elasped'};
PlotXLabel = ('Time Elasped (Minutes)');
PlotYLabel = ('Specfic Air Range (m/kg)');
xLimit(1) = 0;
xLimit(2) = 1080;
yLimit(1) = 0;
yLimit(2) = 1000;
xTicks = [0 0.2 0.4 0.6 0.8 1.0].*xLimit(2);
yTicks = [0 0.2 0.4 0.6 0.8 1.0].*yLimit(2);

% Specify legend names and position
legendnames = [{'SQ24 - SAR'};...
    {'AY1362 - SAR'};...
    {'EK131 - SAR'}]; 
legloc = 'NorthEast';

% Set fonts, line widths, colours
FONTS = 'Times New Roman';
LABSIZE = 20;
AXSIZE = 18;

LEGSIZE = 15;
LINSIZE = 0.2;
PAPSIZE = [18 10]; 
STYLES = {'-','-','-','-.','-','--',':','-.'};
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


