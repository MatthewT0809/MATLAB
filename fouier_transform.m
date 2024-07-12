% Assuming 'voltage', 'current', and 'RPM' are your datasets
% Let's focus on one of them, say 'voltage'
voltage = [12178, 7697, 18596, 25094, 12451, 6081, 22661, 18884, 5441, 12130, 19844, 21781, 22373, 13379, 10642, 8177, 14035, 10258, 8274, 12707, 16804, 9106, 9874, 16708];
current = [10018, 7841, 17492, 22741, 11122, 6321, 20677, 16580, 5297, 11570, 18484, 19988, 20388, 12851, 10322, 8177, 13827, 10146, 8418, 12531, 16083, 8802, 9890, 15795];
RPM = [11362, 7233, 19012, 25110, 11602, 5393, 23109, 18564, 5905, 12419, 20180, 21957, 22085, 13011, 10050, 7905, 13923, 9986, 8113, 12531, 15875, 8594, 9602, 16323];

% Time vector adjustment
t = 0:5:(length(voltage)-1)*5;

% Fourier Transform to identify frequency components
Y = fft(voltage);
f = (0:length(Y)-1) * (1/(5 * length(voltage))); % Frequency vector

% Plot the magnitude of the FFT
figure;
plot(f, abs(Y));
title('Magnitude of FFT of Voltage');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

% Identify any unusual peaks and design a notch filter or a bandstop filter
% Example: if you identify a noise at 10 Hz, you could apply a notch filter at this frequency

% Design a notch filter to remove an identified frequency, e.g., 10 Hz
wo = 10/(0.5/(5)); % Normalized Frequency (10 Hz)
bw = wo/35; % Bandwidth
[b, a] = iirnotch(wo, bw); % Notch filter design

% Apply the filter to the voltage data
filtered_voltage = filter(b, a, voltage);

% Plot the original and filtered signal
figure;
plot(t, voltage, t, filtered_voltage, 'LineWidth', 2);
legend('Original', 'Filtered');
title('Original vs. Filtered Voltage');
xlabel('Time (s)');
ylabel('Voltage');

% Analyzing the result after filtering
