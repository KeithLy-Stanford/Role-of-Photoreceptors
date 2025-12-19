
clear all;
close all;
clc;

% change these values ---------------------------------------

% X = pulse width
% Y = Irradiance
% Z = VEP Amplitude

Noise_amp = 1;

X_thresh = [0.5 1 3 5 10]';                         % PULSE WIDTHS
Y_thresh = [0.07921323529 0.04585831063 0.024 0.009252873563 0.01778894472]';             % INTERPOLATED THRESHOLDS
Z_thresh = [Noise_amp Noise_amp Noise_amp Noise_amp Noise_amp]';   % NOISE LEVEL

% for 10 ms
X_10 = [10 10 10]';
Y_10 = [0.01985294118 0.02977941176 0.03970588235]';
Z_10 = [1.0829 1.4713 1.8721]';

% for 5 ms
X_5 = [5 5 5]';
Y_5 = [0.01569375 0.020925 0.0313875]';
Z_5 = [1.1162 1.1967 1.3868]';

% for 3 ms
X_3 = [3 3 3]';
Y_3 = [0.022 0.033 0.044]';
Z_3 = [0.966 1.1792 1.4057]';

% for 1 ms
X_1 = [1 1]';
Y_1 = [0.05113636364 0.05294117647]';
Z_1 = [1.1917 1.2621]';

% for 0.5 ms
X_05 = [0.5 0.5]';
Y_05 = [0.088 0.1173333333]';
Z_05 = [1.1164 1.5143]';

% -----------------------------------------------------------

fiteq = fittype(@(a, b, x) a*(1+b./x));

x = linspace(0.1, 20, 200);
noise(1,1:200) = Noise_amp;
BY_eqn = 0.17*(1+2.3./x);

[fitted_curve,gof] = fit(X_thresh,Y_thresh,fiteq);

X0 = [X_thresh(1), Y_thresh(1)];

% Plot interpolated thresholds and fitted eqns
plot3(X_thresh, Y_thresh, Z_thresh, "ok");
hold on;
plot3(x, fitted_curve(x), noise, 'b');
plot3(x, BY_eqn, noise, 'm');

% Create patch of noise level
X_noise = [0 0 20 20];
Y_noise = [0 2 2 0];
Z_noise = [Noise_amp Noise_amp Noise_amp Noise_amp];
fill3(X_noise, Y_noise, Z_noise, 1, 'FaceColor','k','FaceAlpha',0.1, 'EdgeColor', 'none');

% Plot individual pulse with recordings
plot3(X_10, Y_10, Z_10, '--*');
plot3(X_5, Y_5, Z_5, '--*');
plot3(X_3, Y_3, Z_3, '--*');
plot3(X_1, Y_1, Z_1, '--*');
plot3(X_05, Y_05, Z_05, '--*');

ylim([0, 2]);
xlabel("pulse width (ms)");
ylabel("Irradiance (mW/mm^2)");
zlabel("SNR (a.u.)");

legend('raw data' ,'MP20','PRIMA100')
%% interpolate thresholds
% 
% figure
% hold on;
% plot(Y_05, Z_05,  '*');
% yline(1, "--r");
% plot(Y_thresh(1), Z_thresh(1), "o");
% 
% ylim([0.8 2]);
