% File for plotting bleach vs not bleach

close all;
clear variables;

SNR_before = [2.6536; 1.7801; 2.8589; 3.0601];
SNR_after = [0.8789; 1.4896; 1.501; 1.3693];

SNR = [SNR_before SNR_after];

fig = figure;
boxplot(SNR, 'Labels',{'Before bleaching','After bleaching'});
ylabel("SNR");

[h, p, ci, stats] = ttest2(SNR_before, SNR_after);