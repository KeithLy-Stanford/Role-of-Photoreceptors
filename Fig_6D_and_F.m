% Matlab file for plotting spiking data
% close all
% clc
% clear all
% fontname = ("Times New Roman");
% 
% num_PR = 25;
% runtime = 1500;
% sample_time = 0.01;                  % in ms
% sample_freq = 1000/sample_time;
% 
% t = readmatrix("Healthy Rods/t.csv");
% t = t(2:150001);
% 
% 
% directory = "Healthy Rods/20um spacing/";
% S = dir(fullfile(directory, "*.csv"));
% 
% for k = 1:num_PR
%     F = fullfile(directory, S(k).name);
%     S(k).data = csvread(F);
%     S(k).data = S(k).data(250001:400000);
%     V(k) = S(k).data(101336)-S(k).data(100000);
% end
% 
% x = -500:-20:-980;
% 
% fig = figure;
% hold on;
% plot(x, V, "*b");
% title("Electrical stimulation of PRs")
% xlabel("Distance from centre (µm)")
% ylabel("Membrane potential change (mV)")
% 
% 
% directory = "Healthy Rods/25um spacing/";
% T = dir(fullfile(directory, "*.csv"));
% 
% for k = 1:20
%     F = fullfile(directory, T(k).name);
%     T(k).data = csvread(F);
%     T(k).data = T(k).data(250001:400000);
%     W(k) = T(k).data(101336)-T(k).data(100000);
% end
% 
% x = -500:-25:-975;
% 
% plot(x, W, "*b");
% 
% %% 
% directory = "Rods/20um spacing/";
% S = dir(fullfile(directory, "*.csv"));
% 
% for k = 1:num_PR
%     F = fullfile(directory, S(k).name);
%     S(k).data = csvread(F);
%     S(k).data = S(k).data(250001:400000);
%     V(k) = S(k).data(101336)-S(k).data(100000);
% end
% 
% x = -500:-20:-980;
% 
% hold on;
% plot(x, V, "*r");
% title("Electrical stimulation of PRs")
% xlabel("Distance from centre (µm)")
% ylabel("Membrane potential change (mV)")
% 
% 
% directory = "Rods/25um spacing/";
% T = dir(fullfile(directory, "*.csv"));
% 
% for k = 1:20
%     F = fullfile(directory, T(k).name);
%     T(k).data = csvread(F);
%     T(k).data = T(k).data(250001:400000);
%     W(k) = T(k).data(101336)-T(k).data(100000);
% end
% 
% x = -500:-25:-975;
% 
% plot(x, W, "*r");
% 
% %% 
% directory = "PRIMA Healthy Rods/20um spacing/";
% S = dir(fullfile(directory, "*.csv"));
% 
% for k = 1:num_PR
%     F = fullfile(directory, S(k).name);
%     S(k).data = csvread(F);
%     S(k).data = S(k).data(250001:400000);
%     V(k) = S(k).data(101336)-S(k).data(100000);
% end
% 
% x = -500:-20:-980;
% 
% hold on;
% plot(x, V, "*g");
% title("Electrical stimulation of PRs")
% xlabel("Distance from centre (µm)")
% ylabel("Membrane potential change (mV)")
% 
% 
% directory = "PRIMA Healthy Rods/25um spacing/";
% T = dir(fullfile(directory, "*.csv"));
% 
% for k = 1:20
%     F = fullfile(directory, T(k).name);
%     T(k).data = csvread(F);
%     T(k).data = T(k).data(250001:400000);
%     W(k) = T(k).data(101336)-T(k).data(100000);
% end
% 
% x = -500:-25:-975;
% 
% plot(x, W, "*g");
% 
% legend("Healthy PRs MP20", "", "Degenerate PRs MP20", "", "Healthy PRs PRIMA")
% 
% 
% %% Plot individual cell response
% 
% PR = readmatrix("Healthy Rods/25um spacing/Rod_09.csv");
% PR = PR(250001:400000);
% 
% fig = figure;
% plot(t, PR);
% ylim([-48 -45]);
% % ylabel("Membrane Potential (mV)");
% xlabel("Time (ms)");
% % title("PR at edge of implant");
% box off;
% 
% % [min_amp, min_index] = min(PR);
% % [max_amp, max_index] = max(PR);
% 
% amp = PR(100000);
% disp(amp)
% 
% 
% fig.Position = ([400 200 300 100]);
% 
% PR = readmatrix("Rods/25um spacing/Rod_10.csv");
% PR = PR(250001:400000);
% 
% fig = figure;
% plot(t, PR);
% ylim([-41.5 -40.5]);
% % ylabel("Membrane Potential (mV)");
% xlabel("Time (ms)");
% % title("PR at edge of implant");
% box off;
% 
% % [min_amp, min_index] = min(PR);
% % [max_amp, max_index] = max(PR);
% 
% amp = PR(100000);
% disp(amp)
% 
% 
% fig.Position = ([400 200 300 100]);

%% Plot electric field

close all
Field_distal = fscanf(fopen('PRIMA Field 1 Retina Map/slice_5.txt', 'r'), '%f', [376 376]);
Field_distal = Field_distal';
Field_proximal = fscanf(fopen('PRIMA Field 1 Retina Map/slice_57.txt', 'r'), '%f', [376 376]);
Field_proximal = Field_proximal';

Field_amp = (Field_distal - Field_proximal)*(1);

fig = figure;
x = -750:4:750;
y = -750:4:750;
s = surf(x, y, Field_amp);
s.EdgeColor = 'none';
fig.Position = ([400 200 300 300]);
% xlim([-1000 -500]);
% ylim([-200 200]);
xlim([-750 750]);
ylim([-750 750]);
%% Plot voltage across BCs
Field_distal = fscanf(fopen('PRIMA Field 1 Retina Map/slice_5.txt', 'r'), '%f', [376 376]);
Field_distal = Field_distal';
Field_proximal = fscanf(fopen('PRIMA Field 1 Retina Map/slice_57.txt', 'r'), '%f', [376 376]);
Field_proximal = Field_proximal';

Field_distal_centre = Field_distal(188,:);
Field_proximal_centre = Field_proximal(188,:);


fig = figure;
Field_amp = (Field_distal_centre - Field_proximal_centre)*(1);
x = -750:4:750;
plot(x, Field_amp, "k");
xlim([-750 750]);
ylim([-4 12]);
title("Voltage across BCs")
xlabel("Distance from centre (µm)")
ylabel("Voltage drop (mV)")
box off;

Field_amp_pixel = Field_amp(325:360);
Field_amp_pixel(Field_amp_pixel <0) = 0;
Avg_Field_amp_pixel = mean(Field_amp_pixel);

%% Plot vertical electric field between [834 667]

Field = zeros(125, 435);
x_size = 1001;
y_size = 1001;
% 
% cd MP20_DG_LE_FF_2Hz_10ms_0.02mW
% Field_1 = fscanf(fopen('slice_1.txt', 'r'), '%f', [x_size y_size]);
% Field_2 = fscanf(fopen('slice_2.txt', 'r'), '%f', [x_size y_size]);
% Field_3 = fscanf(fopen('slice_3.txt', 'r'), '%f', [x_size y_size]);
% Field_4 = fscanf(fopen('slice_4.txt', 'r'), '%f', [x_size y_size]);
% Field_5 = fscanf(fopen('slice_5.txt', 'r'), '%f', [x_size y_size]);
% Field_6 = fscanf(fopen('slice_6.txt', 'r'), '%f', [x_size y_size]);
% Field_7 = fscanf(fopen('slice_7.txt', 'r'), '%f', [x_size y_size]);
% Field_8 = fscanf(fopen('slice_8.txt', 'r'), '%f', [x_size y_size]);
% Field_9 = fscanf(fopen('slice_9.txt', 'r'), '%f', [x_size y_size]);
% Field_10 = fscanf(fopen('slice_10.txt', 'r'), '%f', [x_size y_size]);
% Field_11 = fscanf(fopen('slice_11.txt', 'r'), '%f', [x_size y_size]);
% Field_12 = fscanf(fopen('slice_12.txt', 'r'), '%f', [x_size y_size]);
% Field_13 = fscanf(fopen('slice_13.txt', 'r'), '%f', [x_size y_size]);
% Field_14 = fscanf(fopen('slice_14.txt', 'r'), '%f', [x_size y_size]);
% Field_15 = fscanf(fopen('slice_15.txt', 'r'), '%f', [x_size y_size]);
% Field_16 = fscanf(fopen('slice_16.txt', 'r'), '%f', [x_size y_size]);
% Field_17 = fscanf(fopen('slice_17.txt', 'r'), '%f', [x_size y_size]);
% Field_18 = fscanf(fopen('slice_18.txt', 'r'), '%f', [x_size y_size]);
% Field_19 = fscanf(fopen('slice_19.txt', 'r'), '%f', [x_size y_size]);
% Field_20 = fscanf(fopen('slice_20.txt', 'r'), '%f', [x_size y_size]);
% Field_21 = fscanf(fopen('slice_21.txt', 'r'), '%f', [x_size y_size]);
% Field_22 = fscanf(fopen('slice_22.txt', 'r'), '%f', [x_size y_size]);
% Field_23 = fscanf(fopen('slice_23.txt', 'r'), '%f', [x_size y_size]);
% Field_24 = fscanf(fopen('slice_24.txt', 'r'), '%f', [x_size y_size]);
% Field_25 = fscanf(fopen('slice_25.txt', 'r'), '%f', [x_size y_size]);
% Field_26 = fscanf(fopen('slice_26.txt', 'r'), '%f', [x_size y_size]);
% Field_27 = fscanf(fopen('slice_27.txt', 'r'), '%f', [x_size y_size]);
% Field_28 = fscanf(fopen('slice_28.txt', 'r'), '%f', [x_size y_size]);
% Field_29 = fscanf(fopen('slice_29.txt', 'r'), '%f', [x_size y_size]);
% Field_30 = fscanf(fopen('slice_30.txt', 'r'), '%f', [x_size y_size]);
% Field_31 = fscanf(fopen('slice_31.txt', 'r'), '%f', [x_size y_size]);
% Field_32 = fscanf(fopen('slice_32.txt', 'r'), '%f', [x_size y_size]);
% Field_33 = fscanf(fopen('slice_33.txt', 'r'), '%f', [x_size y_size]);
% Field_34 = fscanf(fopen('slice_34.txt', 'r'), '%f', [x_size y_size]);
% Field_35 = fscanf(fopen('slice_35.txt', 'r'), '%f', [x_size y_size]);
% Field_36 = fscanf(fopen('slice_36.txt', 'r'), '%f', [x_size y_size]);
% Field_37 = fscanf(fopen('slice_37.txt', 'r'), '%f', [x_size y_size]);
% Field_38 = fscanf(fopen('slice_38.txt', 'r'), '%f', [x_size y_size]);
% Field_39 = fscanf(fopen('slice_39.txt', 'r'), '%f', [x_size y_size]);
% Field_40 = fscanf(fopen('slice_40.txt', 'r'), '%f', [x_size y_size]);
% Field_41 = fscanf(fopen('slice_41.txt', 'r'), '%f', [x_size y_size]);
% Field_42 = fscanf(fopen('slice_42.txt', 'r'), '%f', [x_size y_size]);
% Field_43 = fscanf(fopen('slice_43.txt', 'r'), '%f', [x_size y_size]);
% Field_44 = fscanf(fopen('slice_44.txt', 'r'), '%f', [x_size y_size]);
% Field_45 = fscanf(fopen('slice_45.txt', 'r'), '%f', [x_size y_size]);
% Field_46 = fscanf(fopen('slice_46.txt', 'r'), '%f', [x_size y_size]);
% Field_47 = fscanf(fopen('slice_47.txt', 'r'), '%f', [x_size y_size]);
% Field_48 = fscanf(fopen('slice_48.txt', 'r'), '%f', [x_size y_size]);
% Field_49 = fscanf(fopen('slice_49.txt', 'r'), '%f', [x_size y_size]);
% Field_50 = fscanf(fopen('slice_50.txt', 'r'), '%f', [x_size y_size]);
% Field_51 = fscanf(fopen('slice_51.txt', 'r'), '%f', [x_size y_size]);
% Field_52 = fscanf(fopen('slice_52.txt', 'r'), '%f', [x_size y_size]);
% Field_53 = fscanf(fopen('slice_53.txt', 'r'), '%f', [x_size y_size]);
% Field_54 = fscanf(fopen('slice_54.txt', 'r'), '%f', [x_size y_size]);
% Field_55 = fscanf(fopen('slice_55.txt', 'r'), '%f', [x_size y_size]);
% Field_56 = fscanf(fopen('slice_56.txt', 'r'), '%f', [x_size y_size]);
% Field_57 = fscanf(fopen('slice_57.txt', 'r'), '%f', [x_size y_size]);
% Field_58 = fscanf(fopen('slice_58.txt', 'r'), '%f', [x_size y_size]);
% Field_59 = fscanf(fopen('slice_59.txt', 'r'), '%f', [x_size y_size]);
% Field_60 = fscanf(fopen('slice_60.txt', 'r'), '%f', [x_size y_size]);
% Field_61 = fscanf(fopen('slice_61.txt', 'r'), '%f', [x_size y_size]);
% Field_62 = fscanf(fopen('slice_62.txt', 'r'), '%f', [x_size y_size]);
% Field_63 = fscanf(fopen('slice_63.txt', 'r'), '%f', [x_size y_size]);
% Field_64 = fscanf(fopen('slice_64.txt', 'r'), '%f', [x_size y_size]);
% Field_65 = fscanf(fopen('slice_65.txt', 'r'), '%f', [x_size y_size]);
% Field_66 = fscanf(fopen('slice_66.txt', 'r'), '%f', [x_size y_size]);
% Field_67 = fscanf(fopen('slice_67.txt', 'r'), '%f', [x_size y_size]);
% Field_68 = fscanf(fopen('slice_68.txt', 'r'), '%f', [x_size y_size]);
% Field_69 = fscanf(fopen('slice_69.txt', 'r'), '%f', [x_size y_size]);
% Field_70 = fscanf(fopen('slice_70.txt', 'r'), '%f', [x_size y_size]);
% Field_71 = fscanf(fopen('slice_71.txt', 'r'), '%f', [x_size y_size]);
% Field_72 = fscanf(fopen('slice_72.txt', 'r'), '%f', [x_size y_size]);
% Field_73 = fscanf(fopen('slice_73.txt', 'r'), '%f', [x_size y_size]);
% Field_74 = fscanf(fopen('slice_74.txt', 'r'), '%f', [x_size y_size]);
% Field_75 = fscanf(fopen('slice_75.txt', 'r'), '%f', [x_size y_size]);
% Field_76 = fscanf(fopen('slice_76.txt', 'r'), '%f', [x_size y_size]);
% Field_77 = fscanf(fopen('slice_77.txt', 'r'), '%f', [x_size y_size]);
% Field_78 = fscanf(fopen('slice_78.txt', 'r'), '%f', [x_size y_size]);
% Field_79 = fscanf(fopen('slice_79.txt', 'r'), '%f', [x_size y_size]);
% Field_80 = fscanf(fopen('slice_80.txt', 'r'), '%f', [x_size y_size]);
% Field_81 = fscanf(fopen('slice_81.txt', 'r'), '%f', [x_size y_size]);
% Field_82 = fscanf(fopen('slice_82.txt', 'r'), '%f', [x_size y_size]);
% Field_83 = fscanf(fopen('slice_83.txt', 'r'), '%f', [x_size y_size]);
% Field_84 = fscanf(fopen('slice_84.txt', 'r'), '%f', [x_size y_size]);
% Field_85 = fscanf(fopen('slice_85.txt', 'r'), '%f', [x_size y_size]);
% Field_86 = fscanf(fopen('slice_86.txt', 'r'), '%f', [x_size y_size]);
% Field_87 = fscanf(fopen('slice_87.txt', 'r'), '%f', [x_size y_size]);
% Field_88 = fscanf(fopen('slice_88.txt', 'r'), '%f', [x_size y_size]);
% Field_89 = fscanf(fopen('slice_89.txt', 'r'), '%f', [x_size y_size]);
% Field_90 = fscanf(fopen('slice_90.txt', 'r'), '%f', [x_size y_size]);
% Field_91 = fscanf(fopen('slice_91.txt', 'r'), '%f', [x_size y_size]);
% Field_92 = fscanf(fopen('slice_92.txt', 'r'), '%f', [x_size y_size]);
% Field_93 = fscanf(fopen('slice_93.txt', 'r'), '%f', [x_size y_size]);
% Field_94 = fscanf(fopen('slice_94.txt', 'r'), '%f', [x_size y_size]);
% Field_95 = fscanf(fopen('slice_95.txt', 'r'), '%f', [x_size y_size]);
% Field_96 = fscanf(fopen('slice_96.txt', 'r'), '%f', [x_size y_size]);
% Field_97 = fscanf(fopen('slice_97.txt', 'r'), '%f', [x_size y_size]);
% Field_98 = fscanf(fopen('slice_98.txt', 'r'), '%f', [x_size y_size]);
% Field_99 = fscanf(fopen('slice_99.txt', 'r'), '%f', [x_size y_size]);
% Field_100 = fscanf(fopen('slice_100.txt', 'r'), '%f', [x_size y_size]);
% Field_101 = fscanf(fopen('slice_101.txt', 'r'), '%f', [x_size y_size]);
% Field_102 = fscanf(fopen('slice_102.txt', 'r'), '%f', [x_size y_size]);
% Field_103 = fscanf(fopen('slice_103.txt', 'r'), '%f', [x_size y_size]);
% Field_104 = fscanf(fopen('slice_104.txt', 'r'), '%f', [x_size y_size]);
% Field_105 = fscanf(fopen('slice_105.txt', 'r'), '%f', [x_size y_size]);
% Field_106 = fscanf(fopen('slice_106.txt', 'r'), '%f', [x_size y_size]);
% Field_107 = fscanf(fopen('slice_107.txt', 'r'), '%f', [x_size y_size]);
% Field_108 = fscanf(fopen('slice_108.txt', 'r'), '%f', [x_size y_size]);
% Field_109 = fscanf(fopen('slice_109.txt', 'r'), '%f', [x_size y_size]);
% Field_110 = fscanf(fopen('slice_110.txt', 'r'), '%f', [x_size y_size]);
% Field_111 = fscanf(fopen('slice_111.txt', 'r'), '%f', [x_size y_size]);
% Field_112 = fscanf(fopen('slice_112.txt', 'r'), '%f', [x_size y_size]);
% Field_113 = fscanf(fopen('slice_113.txt', 'r'), '%f', [x_size y_size]);
% Field_114 = fscanf(fopen('slice_114.txt', 'r'), '%f', [x_size y_size]);
% Field_115 = fscanf(fopen('slice_115.txt', 'r'), '%f', [x_size y_size]);
% Field_116 = fscanf(fopen('slice_116.txt', 'r'), '%f', [x_size y_size]);
% Field_117 = fscanf(fopen('slice_117.txt', 'r'), '%f', [x_size y_size]);
% Field_118 = fscanf(fopen('slice_118.txt', 'r'), '%f', [x_size y_size]);
% Field_119 = fscanf(fopen('slice_119.txt', 'r'), '%f', [x_size y_size]);
% Field_120 = fscanf(fopen('slice_120.txt', 'r'), '%f', [x_size y_size]);
% Field_121 = fscanf(fopen('slice_121.txt', 'r'), '%f', [x_size y_size]);
% Field_122 = fscanf(fopen('slice_122.txt', 'r'), '%f', [x_size y_size]);
% Field_123 = fscanf(fopen('slice_123.txt', 'r'), '%f', [x_size y_size]);
% Field_124 = fscanf(fopen('slice_124.txt', 'r'), '%f', [x_size y_size]);
% Field_125 = fscanf(fopen('slice_125.txt', 'r'), '%f', [x_size y_size]);
% 
% Field_1_centre = Field_1(250,:);
% Field_50_centre = Field_50(250,:);
% 
% BC_Voltage = Field_1_centre - Field_50_centre;
% 
% x = -999:3:999;
% 
% 
% x_pos = 376:1:501;
% y_pos = 376:1:501;
% indices = sub2ind(size(Field_1), x_pos, y_pos);
% 
% VertField_size = (x_size-1)/4+1;
% Field(1, 1:VertField_size) = Field_1(indices);
% Field(2, 1:VertField_size) = Field_2(indices);
% Field(3, 1:VertField_size) = Field_3(indices);
% Field(4, 1:VertField_size) = Field_4(indices);
% Field(5, 1:VertField_size) = Field_5(indices);
% Field(6, 1:VertField_size) = Field_6(indices);
% Field(7, 1:VertField_size) = Field_7(indices);
% Field(8, 1:VertField_size) = Field_8(indices);
% Field(9, 1:VertField_size) = Field_9(indices);
% Field(10, 1:VertField_size) = Field_10(indices);
% Field(11, 1:VertField_size) = Field_11(indices);
% Field(12, 1:VertField_size) = Field_12(indices);
% Field(13, 1:VertField_size) = Field_13(indices);
% Field(14, 1:VertField_size) = Field_14(indices);
% Field(15, 1:VertField_size) = Field_15(indices);
% Field(16, 1:VertField_size) = Field_16(indices);
% Field(17, 1:VertField_size) = Field_17(indices);
% Field(18, 1:VertField_size) = Field_18(indices);
% Field(19, 1:VertField_size) = Field_19(indices);
% Field(20, 1:VertField_size) = Field_20(indices);
% Field(21, 1:VertField_size) = Field_21(indices);
% Field(22, 1:VertField_size) = Field_22(indices);
% Field(23, 1:VertField_size) = Field_23(indices);
% Field(24, 1:VertField_size) = Field_24(indices);
% Field(25, 1:VertField_size) = Field_25(indices);
% Field(26, 1:VertField_size) = Field_26(indices);
% Field(27, 1:VertField_size) = Field_27(indices);
% Field(28, 1:VertField_size) = Field_28(indices);
% Field(29, 1:VertField_size) = Field_29(indices);
% Field(30, 1:VertField_size) = Field_30(indices);
% Field(31, 1:VertField_size) = Field_31(indices);
% Field(32, 1:VertField_size) = Field_32(indices);
% Field(33, 1:VertField_size) = Field_33(indices);
% Field(34, 1:VertField_size) = Field_34(indices);
% Field(35, 1:VertField_size) = Field_35(indices);
% Field(36, 1:VertField_size) = Field_36(indices);
% Field(37, 1:VertField_size) = Field_37(indices);
% Field(38, 1:VertField_size) = Field_38(indices);
% Field(39, 1:VertField_size) = Field_39(indices);
% Field(40, 1:VertField_size) = Field_40(indices);
% Field(41, 1:VertField_size) = Field_41(indices);
% Field(42, 1:VertField_size) = Field_42(indices);
% Field(43, 1:VertField_size) = Field_43(indices);
% Field(44, 1:VertField_size) = Field_44(indices);
% Field(45, 1:VertField_size) = Field_45(indices);
% Field(46, 1:VertField_size) = Field_46(indices);
% Field(47, 1:VertField_size) = Field_47(indices);
% Field(48, 1:VertField_size) = Field_48(indices);
% Field(49, 1:VertField_size) = Field_49(indices);
% Field(50, 1:VertField_size) = Field_50(indices);
% Field(51, 1:VertField_size) = Field_51(indices);
% Field(52, 1:VertField_size) = Field_52(indices);
% Field(53, 1:VertField_size) = Field_53(indices);
% Field(54, 1:VertField_size) = Field_54(indices);
% Field(55, 1:VertField_size) = Field_55(indices);
% Field(56, 1:VertField_size) = Field_56(indices);
% Field(57, 1:VertField_size) = Field_57(indices);
% Field(58, 1:VertField_size) = Field_58(indices);
% Field(59, 1:VertField_size) = Field_59(indices);
% Field(60, 1:VertField_size) = Field_60(indices);
% Field(61, 1:VertField_size) = Field_61(indices);
% Field(62, 1:VertField_size) = Field_62(indices);
% Field(63, 1:VertField_size) = Field_63(indices);
% Field(64, 1:VertField_size) = Field_64(indices);
% Field(65, 1:VertField_size) = Field_65(indices);
% Field(66, 1:VertField_size) = Field_66(indices);
% Field(67, 1:VertField_size) = Field_67(indices);
% Field(68, 1:VertField_size) = Field_68(indices);
% Field(69, 1:VertField_size) = Field_69(indices);
% Field(70, 1:VertField_size) = Field_70(indices);
% Field(71, 1:VertField_size) = Field_71(indices);
% Field(72, 1:VertField_size) = Field_72(indices);
% Field(73, 1:VertField_size) = Field_73(indices);
% Field(74, 1:VertField_size) = Field_74(indices);
% Field(75, 1:VertField_size) = Field_75(indices);
% Field(76, 1:VertField_size) = Field_76(indices);
% Field(77, 1:VertField_size) = Field_77(indices);
% Field(78, 1:VertField_size) = Field_78(indices);
% Field(79, 1:VertField_size) = Field_79(indices);
% Field(80, 1:VertField_size) = Field_80(indices);
% Field(81, 1:VertField_size) = Field_81(indices);
% Field(82, 1:VertField_size) = Field_82(indices);
% Field(83, 1:VertField_size) = Field_83(indices);
% Field(84, 1:VertField_size) = Field_84(indices);
% Field(85, 1:VertField_size) = Field_85(indices);
% Field(86, 1:VertField_size) = Field_86(indices);
% Field(87, 1:VertField_size) = Field_87(indices);
% Field(88, 1:VertField_size) = Field_88(indices);
% Field(89, 1:VertField_size) = Field_89(indices);
% Field(90, 1:VertField_size) = Field_90(indices);
% Field(91, 1:VertField_size) = Field_91(indices);
% Field(92, 1:VertField_size) = Field_92(indices);
% Field(93, 1:VertField_size) = Field_93(indices);
% Field(94, 1:VertField_size) = Field_94(indices);
% Field(95, 1:VertField_size) = Field_95(indices);
% Field(96, 1:VertField_size) = Field_96(indices);
% Field(97, 1:VertField_size) = Field_97(indices);
% Field(98, 1:VertField_size) = Field_98(indices);
% Field(99, 1:VertField_size) = Field_99(indices);
% Field(100, 1:VertField_size) = Field_100(indices);
% Field(101, 1:VertField_size) = Field_101(indices);
% Field(102, 1:VertField_size) = Field_102(indices);
% Field(103, 1:VertField_size) = Field_103(indices);
% Field(104, 1:VertField_size) = Field_104(indices);
% Field(105, 1:VertField_size) = Field_105(indices);
% Field(106, 1:VertField_size) = Field_106(indices);
% Field(107, 1:VertField_size) = Field_107(indices);
% Field(108, 1:VertField_size) = Field_108(indices);
% Field(109, 1:VertField_size) = Field_109(indices);
% Field(110, 1:VertField_size) = Field_110(indices);
% Field(111, 1:VertField_size) = Field_111(indices);
% Field(112, 1:VertField_size) = Field_112(indices);
% Field(113, 1:VertField_size) = Field_113(indices);
% Field(114, 1:VertField_size) = Field_114(indices);
% Field(115, 1:VertField_size) = Field_115(indices);
% Field(116, 1:VertField_size) = Field_116(indices);
% Field(117, 1:VertField_size) = Field_117(indices);
% Field(118, 1:VertField_size) = Field_118(indices);
% Field(119, 1:VertField_size) = Field_119(indices);
% Field(120, 1:VertField_size) = Field_120(indices);
% Field(121, 1:VertField_size) = Field_121(indices);
% Field(122, 1:VertField_size) = Field_122(indices);
% Field(123, 1:VertField_size) = Field_123(indices);
% Field(124, 1:VertField_size) = Field_124(indices);
% Field(125, 1:VertField_size) = Field_125(indices);
% 
% 
% fig = figure;
% x = -1002:3:300;
% z = 0:-1:-124;
% s = surf(x, z, Field);
% s.EdgeColor = 'none';
% fig.Position = ([400 200 300 300]);
% axis off;