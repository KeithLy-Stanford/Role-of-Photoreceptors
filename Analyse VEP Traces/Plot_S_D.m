
clear all;
close all;
clc;

% change these values ---------------------------------------

X1 = [0.5 1 3 5 10]';               % PULSE WIDTHS
Y1 = [0.66	0.239	0.113	0.091585586	0.060]';   % INTERPOLATED THRESHOLDS L-AP4
Y2 = [0.144	0.050	0.035	0.021	0.022]';% INTERPOLATED THRESHOLDS
Y3 = [0.48	0.24	0.087	0.045330739	0.015433071]'; % INTERPOLATED THRESHOLDS Dark adapted

% -----------------------------------------------------------

fiteq = fittype(@(a, b, x) a*(1+b./x));
fiteq1 = fittype(@(a, b, x) a*x+b);
x = linspace(0.1, 20, 200);
% BY_eqn = 0.17*(1+2.3./x);

[fitted_curve1,gof1] = fit(X1(2:5),Y1(2:5),fiteq);
[fitted_curve2,gof2] = fit(X1,Y2,fiteq);
[fitted_curve3,gof3] = fit(X1,Y3,fiteq);

X0 = [X1(1), Y1(1)];

figure;
hold on;

semilogy(X1, Y1, "*b");
semilogy(x, fitted_curve1(x), 'b');
semilogy(X1, Y2, "*r");
semilogy(x, fitted_curve2(x), 'r');
semilogy(X1(3:5),Y3(3:5), "*m");
semilogy(x, fitted_curve3(x), 'm');

% plot(x, BY_eqn, 'm');
% line([3.533 3.533], [0 0.019748], 'Color', "k");
% line([0 20], [0.009874 0.009874], 'Color', "k");
ylim([0, 0.6]);
xlim([0 20]);
xlabel("pulse width (ms)");
ylabel("Irradiance (mW/mm^2)");
%set(gca, 'YScale', 'log')

legend('raw data L-AP4' ,'MP20 L-AP4','raw data', 'MP20', 'raw data dark adapted', 'MP20 dark adapted')
