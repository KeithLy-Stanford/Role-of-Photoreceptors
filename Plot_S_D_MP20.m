
clear all;
close all;
clc;

% change these values ---------------------------------------

N1 = 4; % Number of experiments
N2 = 2; % Number of dark adapted experiments
N3 = 3; % Number of L-AP4 experiments
N4 = 2; % Number of Day-0 experiments 
N5 = 4; % Number of blocker experiments

X1 = [0.5 1 3 5 10]';               % PULSE WIDTHS
X2 = [0.5 1 3 5 8]';

Y1 = [0.123	0.053	0.037	0.026	0.024]';    % INTERPOLATED THRESHOLDS
Y2 = [0.354	0.152	0.060	0.037	0.014]';    % Dark adapted
Y3 = [0.439	0.194	0.135	0.125	0.067]';    % L-AP4
Y4 = [0.458	0.246	0.069	0.038	0.016]';    % Day 0 PR stim
Y5 = [0.682	0.446	0.306	0.308	0.294]';    % Full blockers

Y_shunts = [1.085910653	0.4839869281	0.1984	0.1131360947	0.09113636364]';

STDEV1 = [0.061	0.025	0.019	0.017	0.012];
STDEV2 = [0.178	0.125	0.038	0.011	0.002];
STDEV3 = [0.220	0.040	0.059	0.080	0.010];
STDEV4 = [0.129	0.056	0.009	0.001	0.000];
STDEV5 = [0.171	0.085	0.157	0.152	0.098];

% -----------------------------------------------------------

fiteq = fittype(@(a, b, x) a.*(1+b./x));

x = linspace(0.1, 20, 200);
BY_eqn = 0.2.*(1+2.8./x);

[fitted_curve1,~] = fit(X1,Y1,fiteq);
[fitted_curve2,~] = fit(X1,Y2,fiteq);
[fitted_curve3,~] = fit(X1,Y3,fiteq);
[fitted_curve4,~] = fit(X1,Y4,fiteq);
[fitted_curve5,~] = fit(X1,Y5,fiteq);

X0 = [X1(1), Y1(1)];

% % Calculate 95% CI
% ySEM1 = STDEV1/sqrt(N1); 
% CI951 = tinv([0.025 0.975], N1-1);
% yCI951 = bsxfun(@times, ySEM1, CI951(:));
% 
% ySEM2 = STDEV2/sqrt(N2); 
% CI952 = tinv([0.025 0.975], N2-1);
% yCI952 = bsxfun(@times, ySEM2, CI952(:));
% 
% ySEM3 = STDEV3/sqrt(N3); 
% CI953 = tinv([0.025 0.975], N3-1);
% yCI953 = bsxfun(@times, ySEM3, CI953(:));
% 
% % fit 95% CI with Weiss's equation
% [fitted_curve_upper1,~] = fit(X1,Y1 + yCI951(1,:)',fiteq);
% [fitted_curve_lower1,~] = fit(X1,Y1 - yCI951(1,:)',fiteq);
% 
% [fitted_curve_upper2,~] = fit(X1,Y2 + yCI952(1,:)',fiteq);
% [fitted_curve_lower2,~] = fit(X1,Y2 - yCI952(1,:)',fiteq);
% 
% [fitted_curve_upper3,~] = fit(X1,Y3 + yCI953(1,:)',fiteq);
% [fitted_curve_lower3,~] = fit(X1,Y3 - yCI953(1,:)',fiteq);

figure;
hold on;

% semilogy(X1, Y1, "*k")
semilogy(X1, Y3, "*g")
% semilogy(X1, Y5, "*m")
% plot(X1, Y2, "r*");
% plot(X1, Y4, "b*");
% plot(10, 0.06, "Color", "m", "Marker", "^")
semilogy(X2, Y_shunts, "*k")

% semilogy(x, fitted_curve1(x), "k")
semilogy(x, fitted_curve3(x), "g")
% semilogy(x, fitted_curve5(x), "m")
% plot(X1, Y2, "r");
% plot(X1, Y4, "b");

% line([X1(1) X1(1)], [Y1(1)-(STDEV1(1)/2) Y1(1)+(STDEV1(1)/2)],'Color','k');
% line([X1(2) X1(2)], [Y1(2)-(STDEV1(2)/2) Y1(2)+(STDEV1(2)/2)],'Color','k');
% line([X1(3) X1(3)], [Y1(3)-(STDEV1(3)/2) Y1(3)+(STDEV1(3)/2)],'Color','k');
% line([X1(4) X1(4)], [Y1(4)-(STDEV1(4)/2) Y1(4)+(STDEV1(4)/2)],'Color','k');
% line([X1(5) X1(5)], [Y1(5)-(STDEV1(5)/2) Y1(5)+(STDEV1(5)/2)],'Color','k');

line([X1(1) X1(1)], [Y3(1)-(STDEV3(1)/2) Y3(1)+(STDEV3(1)/2)],'Color','g');
line([X1(2) X1(2)], [Y3(2)-(STDEV3(2)/2) Y3(2)+(STDEV3(2)/2)],'Color','g');
line([X1(3) X1(3)], [Y3(3)-(STDEV3(3)/2) Y3(3)+(STDEV3(3)/2)],'Color','g');
line([X1(4) X1(4)], [Y3(4)-(STDEV3(4)/2) Y3(4)+(STDEV3(4)/2)],'Color','g');
line([X1(5) X1(5)], [Y3(5)-(STDEV3(5)/2) Y3(5)+(STDEV3(5)/2)],'Color','g');

% line([X1(1) X1(1)], [Y5(1)-(STDEV5(1)/2) Y5(1)+(STDEV5(1)/2)],'Color','m');
% line([X1(2) X1(2)], [Y5(2)-(STDEV5(2)/2) Y5(2)+(STDEV5(2)/2)],'Color','m');
% line([X1(3) X1(3)], [Y5(3)-(STDEV5(3)/2) Y5(3)+(STDEV5(3)/2)],'Color','m');
% line([X1(4) X1(4)], [Y5(4)-(STDEV5(4)/2) Y5(4)+(STDEV5(4)/2)],'Color','m');
% line([X1(5) X1(5)], [Y5(5)-(STDEV5(5)/2) Y5(5)+(STDEV5(5)/2)],'Color','m');

% line([X1(1) X1(1)], [Y2(1)-(STDEV2(1)/2) Y2(1)+(STDEV2(1)/2)],'Color','r');
% line([X1(2) X1(2)], [Y2(2)-(STDEV2(2)/2) Y2(2)+(STDEV2(2)/2)],'Color','r');
% line([X1(3) X1(3)], [Y2(3)-(STDEV2(3)/2) Y2(3)+(STDEV2(3)/2)],'Color','r');
% line([X1(4) X1(4)], [Y2(4)-(STDEV2(4)/2) Y2(4)+(STDEV2(4)/2)],'Color','r');
% line([X1(5) X1(5)], [Y2(5)-(STDEV2(5)/2) Y2(5)+(STDEV2(5)/2)],'Color','r');
% % 
% line([X1(1) X1(1)], [Y4(1)-(STDEV4(1)/2) Y4(1)+(STDEV4(1)/2)],'Color','b');
% line([X1(2) X1(2)], [Y4(2)-(STDEV4(2)/2) Y4(2)+(STDEV4(2)/2)],'Color','b');
% line([X1(3) X1(3)], [Y4(3)-(STDEV4(3)/2) Y4(3)+(STDEV4(3)/2)],'Color','b');
% line([X1(4) X1(4)], [Y4(4)-(STDEV4(4)/2) Y4(4)+(STDEV4(4)/2)],'Color','b');
% line([X1(5) X1(5)], [Y4(5)-(STDEV4(5)/2) Y4(5)+(STDEV4(5)/2)],'Color','b');

% patch([x'; flip(x')], [fitted_curve_lower1(x); flip(fitted_curve_upper1(x))], 'k', 'FaceAlpha', 0.1, 'EdgeAlpha', 0);
% patch([x'; flip(x')], [fitted_curve_lower2(x); flip(fitted_curve_upper2(x))], 'k', 'FaceAlpha', 0.1, 'EdgeAlpha', 0);
% patch([x'; flip(x')], [fitted_curve_lower3(x); flip(fitted_curve_upper3(x))], 'k', 'FaceAlpha', 0.1, 'EdgeAlpha', 0);

xlim([0, 10]);
ylim([0.01, 3]);
yticks([0.1 1]);
yticklabels({'0.1','1'})
xlabel("pulse width (ms)");
ylabel("Irradiance (mW/mm^2)");
set(gca, 'YScale', 'log')

% legend('16+ weeks', '16+ weeks dark-adapted', 'Day-0 dark-adapted')
% legend('16+ weeks dark-adapted', 'Day-0 dark-adapted', 'L-AP4', 'Cocktail')
% legend('BC Stim', 'BC Stim (n = 3)', 'RGC Stim', 'RGC Stim (n = 4)')
% legend('16+ weeks in light', '16+ weeks Dark Adapted', 'Day 0 + Dark Adapted')
% legend('16+ weeks in light', '16+ weeks L-AP4', '16+ weeks full blocker')
legend("MP20 L-AP4", "MP20 shunts")
% , 'Day-0 dark-adapted'

% fig = figure;
% plot(X1(3:5), Y2(3:5), "r-");

fontsize(16, "points")
fontname("Times New Roman")