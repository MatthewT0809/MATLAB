% Data for voltage, current, and RPM
voltage = [12178, 7697, 18596, 25094, 12451, 6081, 22661, 18884, 5441, 12130, 19844, 21781, 22373, 13379, 10642, 8177, 14035, 10258, 8274, 12707, 16804, 9106, 9874, 16708];
current = [10018, 7841, 17492, 22741, 11122, 6321, 20677, 16580, 5297, 11570, 18484, 19988, 20388, 12851, 10322, 8177, 13827, 10146, 8418, 12531, 16083, 8802, 9890, 15795];
RPM = [11362, 7233, 19012, 25110, 11602, 5393, 23109, 18564, 5905, 12419, 20180, 21957, 22085, 13011, 10050, 7905, 13923, 9986, 8113, 12531, 15875, 8594, 9602, 16323];

% Time vector for plotting (assuming each sample is taken at equal intervals)
t = 1:length(voltage);

% Filter parameter
tau = 20;  % time constant, adjust this as needed
deltaT = 1;  % Sampling period
alpha = deltaT / (tau + deltaT);

% Initializing filtered arrays
filtered_voltage = zeros(1, length(voltage));
filtered_current = zeros(1, length(current));
filtered_RPM = zeros(1, length(RPM));

% Applying the first-order filter
for k = 2:length(voltage)
    filtered_voltage(k) = alpha * voltage(k) + (1 - alpha) * filtered_voltage(k - 1);
    filtered_current(k) = alpha * current(k) + (1 - alpha) * filtered_current(k - 1);
    filtered_RPM(k) = alpha * RPM(k) + (1 - alpha) * filtered_RPM(k - 1);
end

% Plotting the results
figure;
subplot(3,1,1);
plot(t, voltage, 'b', t, filtered_voltage, 'r');
title('Voltage and Filtered Voltage');
legend('Original', 'Filtered');
xlabel('Sample');
ylabel('Voltage');

subplot(3,1,2);
plot(t, current, 'b', t, filtered_current, 'r');
title('Current and Filtered Current');
legend('Original', 'Filtered');
xlabel('Sample');
ylabel('Current');

subplot(3,1,3);
plot(t, RPM, 'b', t, filtered_RPM, 'r');
title('RPM and Filtered RPM');
legend('Original', 'Filtered');
xlabel('Sample');
ylabel('RPM');
