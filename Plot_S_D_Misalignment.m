
clear all;
close all;
clc;
% change these values ---------------------------------------

N = 13; % Number of experiments
N_Blockers = 5;

X1 = [0.5 1 3 5 10]';               % PULSE WIDTHS
Y1 = [1.250	0.802	0.414	0.304	0.241]';   % INTERPOLATED THRESHOLDS
Y1_Dark = [1.226	0.852	0.405	0.290	0.247]'; % INTERPOLATED THRESHOLDS FOR DARK ADAPTED
Y1_LAP4 = [1.405	0.899	0.464	0.325	0.263]';    % INTERPOLATED THRESHOLDS FOR L-AP4
Y1_Blockers = [4.649	3.208	1.853	1.527	1.534]'; % INTERPOLATED THRESHOLDS FOR BLOCKERS
Y1_Misaligned = [0.863	0.357	0.192	0.152	0.085]'; % INTERPOLATED THRESHOLDS FOR MISALIGNED
Y1_Misaligned_Dark = [0.885	0.750	0.382	0.168	0.139]'; % INTERPOLATED THRESHOLDS FOR DARK ADAPTED MISALIGNMENT

Y1_model_Blockers = [2.3511.*1.913997703 2.3511.*1.403598316 2.3511.*0.723065799 2.3511.*0.4678661052 2.3511.*0.3062396325]'; % Threshold for blockers with model

STDEV = [0.578	0.290	0.138	0.096	0.110];             % STD FOR NO BLOCKERS
STDEV_Dark = [0.003	0.176	0.003	0.054	0.071]';        % STD FOR DARK ADAPTED
STDEV_LAP4 = [0.241	0.103	0.192	0.032	0.029];         % STD FOR L-AP4
STDEV_Blockers = [2.374	1.493	0.972	0.625	0.690];     % STD FOR BLOCKERS
STDEV_Misaligned = [0.302	0.132	0.150	0.119	0.015]; % STD FOR MISALIGNED
STDEV_Misaligned_Dark = [0.268	0.140	0.109	0.096	0.013]; % STD FOR DARK ADAPTED MISALIGNMENT
% -----------------------------------------------------------

fiteq = fittype(@(a, b, x) a.*(1+b./x));

x = linspace(0.1, 20, 200);
BY_eqn = 0.17.*(1+2.3./x);

[fitted_curve,~] = fit(X1,Y1,fiteq);
[fitted_curve_Dark,~] = fit(X1,Y1_Dark,fiteq);
[fitted_curve_LAP4,~] = fit(X1,Y1_LAP4,fiteq, 'StartPoint', [0.2225 2.379]);
[fitted_curve_Blockers,~] = fit(X1,Y1_Blockers,fiteq);
[fitted_curve_model_Blockers,~] = fit(X1,Y1_model_Blockers,fiteq);
[fitted_curve_Misaligned,~] = fit(X1,Y1_Misaligned,fiteq);
[fitted_curve_Misaligned_Dark,~] = fit(X1,Y1_Misaligned_Dark,fiteq);

X0 = [X1(1), Y1(1)];

figure;
hold on;

plot(X1, Y1, 'k*');
% plot(X1, Y1_LAP4, 'g*');
plot(X1, Y1_Dark, 'r*');
% plot(X1, Y1_Blockers, 'm*');
plot(X1, Y1_Misaligned, 'b*');
plot(X1, Y1_Misaligned_Dark, "Color", [107 76 154]./255, "Marker", "*", "LineStyle", "--", "LineWidth", 1.25);

plot(x, fitted_curve(x), 'k');
% plot(x, fitted_curve_LAP4(x), 'g');
plot(x, fitted_curve_Dark(x), 'r');
% plot(x, fitted_curve_Blockers(x), 'm');
plot(x, fitted_curve_Misaligned(x), 'b');
%plot(x, fitted_curve_Misaligned_Dark(x), "Color", [107 76 154]./255);

%plot(X1, Y1_model_Blockers, 'm*');
%plot(x, fitted_curve_model_Blockers(x), "--m");

line([X1(1) X1(1)], [Y1(1)-(STDEV(1)/2) Y1(1)+(STDEV(1)/2)],'Color','k');
line([X1(2) X1(2)], [Y1(2)-(STDEV(2)/2) Y1(2)+(STDEV(2)/2)],'Color','k');
line([X1(3) X1(3)], [Y1(3)-(STDEV(3)/2) Y1(3)+(STDEV(3)/2)],'Color','k');
line([X1(4) X1(4)], [Y1(4)-(STDEV(4)/2) Y1(4)+(STDEV(4)/2)],'Color','k');
line([X1(5) X1(5)], [Y1(5)-(STDEV(5)/2) Y1(5)+(STDEV(5)/2)],'Color','k');
% 
% line([X1(1) X1(1)], [Y1_LAP4(1)-(STDEV_LAP4(1)/2) Y1_LAP4(1)+(STDEV_LAP4(1)/2)],'Color','g');
% line([X1(2) X1(2)], [Y1_LAP4(2)-(STDEV_LAP4(2)/2) Y1_LAP4(2)+(STDEV_LAP4(2)/2)],'Color','g');
% line([X1(3) X1(3)], [Y1_LAP4(3)-(STDEV_LAP4(3)/2) Y1_LAP4(3)+(STDEV_LAP4(3)/2)],'Color','g');
% line([X1(4) X1(4)], [Y1_LAP4(4)-(STDEV_LAP4(4)/2) Y1_LAP4(4)+(STDEV_LAP4(4)/2)],'Color','g');
% line([X1(5) X1(5)], [Y1_LAP4(5)-(STDEV_LAP4(5)/2) Y1_LAP4(5)+(STDEV_LAP4(5)/2)],'Color','g');
% 
line([X1(1) X1(1)], [Y1_Dark(1)-(STDEV_Dark(1)/2) Y1_Dark(1)+(STDEV_Dark(1)/2)],'Color','r');
line([X1(2) X1(2)], [Y1_Dark(2)-(STDEV_Dark(2)/2) Y1_Dark(2)+(STDEV_Dark(2)/2)],'Color','r');
line([X1(3) X1(3)], [Y1_Dark(3)-(STDEV_Dark(3)/2) Y1_Dark(3)+(STDEV_Dark(3)/2)],'Color','r');
line([X1(4) X1(4)], [Y1_Dark(4)-(STDEV_Dark(4)/2) Y1_Dark(4)+(STDEV_Dark(4)/2)],'Color','r');
line([X1(5) X1(5)], [Y1_Dark(5)-(STDEV_Dark(5)/2) Y1_Dark(5)+(STDEV_Dark(5)/2)],'Color','r');
% 
% line([X1(1) X1(1)], [Y1_Blockers(1)-(STDEV_Blockers(1)/2) Y1_Blockers(1)+(STDEV_Blockers(1)/2)],'Color','m');
% line([X1(2) X1(2)], [Y1_Blockers(2)-(STDEV_Blockers(2)/2) Y1_Blockers(2)+(STDEV_Blockers(2)/2)],'Color','m');
% line([X1(3) X1(3)], [Y1_Blockers(3)-(STDEV_Blockers(3)/2) Y1_Blockers(3)+(STDEV_Blockers(3)/2)],'Color','m');
% line([X1(4) X1(4)], [Y1_Blockers(4)-(STDEV_Blockers(4)/2) Y1_Blockers(4)+(STDEV_Blockers(4)/2)],'Color','m');
% line([X1(5) X1(5)], [Y1_Blockers(5)-(STDEV_Blockers(5)/2) Y1_Blockers(5)+(STDEV_Blockers(5)/2)],'Color','m');

line([X1(1) X1(1)], [Y1_Misaligned(1)-(STDEV_Misaligned(1)/2) Y1_Misaligned(1)+(STDEV_Misaligned(1)/2)],'Color','b');
line([X1(2) X1(2)], [Y1_Misaligned(2)-(STDEV_Misaligned(2)/2) Y1_Misaligned(2)+(STDEV_Misaligned(2)/2)],'Color','b');
line([X1(3) X1(3)], [Y1_Misaligned(3)-(STDEV_Misaligned(3)/2) Y1_Misaligned(3)+(STDEV_Misaligned(3)/2)],'Color','b');
line([X1(4) X1(4)], [Y1_Misaligned(4)-(STDEV_Misaligned(4)/2) Y1_Misaligned(4)+(STDEV_Misaligned(4)/2)],'Color','b');
line([X1(5) X1(5)], [Y1_Misaligned(5)-(STDEV_Misaligned(5)/2) Y1_Misaligned(5)+(STDEV_Misaligned(5)/2)],'Color','b');

line([X1(1) X1(1)], [Y1_Misaligned_Dark(1)-(STDEV_Misaligned_Dark(1)/2) Y1_Misaligned_Dark(1)+(STDEV_Misaligned_Dark(1)/2)],'Color', [107 76 154]./255);
line([X1(2) X1(2)], [Y1_Misaligned_Dark(2)-(STDEV_Misaligned_Dark(2)/2) Y1_Misaligned_Dark(2)+(STDEV_Misaligned_Dark(2)/2)],'Color', [107 76 154]./255);
line([X1(3) X1(3)], [Y1_Misaligned_Dark(3)-(STDEV_Misaligned_Dark(3)/2) Y1_Misaligned_Dark(3)+(STDEV_Misaligned_Dark(3)/2)],'Color', [107 76 154]./255);
line([X1(4) X1(4)], [Y1_Misaligned_Dark(4)-(STDEV_Misaligned_Dark(4)/2) Y1_Misaligned_Dark(4)+(STDEV_Misaligned_Dark(4)/2)],'Color', [107 76 154]./255);
line([X1(5) X1(5)], [Y1_Misaligned_Dark(5)-(STDEV_Misaligned_Dark(5)/2) Y1_Misaligned_Dark(5)+(STDEV_Misaligned_Dark(5)/2)],'Color', [107 76 154]./255);

xlim([0, 10]);
ylim([0, 10]);
yticks([0.1 1 10]);
yticklabels({'0.1','1', '10'})
xlabel("pulse width (ms)");
ylabel("Irradiance (mW/mm^2)");
set(gca, 'YScale', 'log')

%legend('BC Stim', 'BC Stim (n = 13)', 'RGC Stim', 'RGC Stim (n = 4)')
legend('Light adapted', 'Dark adapted', "Misaligned", "Dark misaligned")

fontsize(16, "points")
fontname("Times New Roman")


