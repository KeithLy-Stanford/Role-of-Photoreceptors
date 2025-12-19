%input parameters: working directory with measurement folders and laser intensity
close all;
working_directory = 'Tests';
signal_power = 3;

pulse_width = 0.5;


% run vep detection
[output, signal_noise_peak_to_peak, signal_peak_to_peak]= live_vep_detection_only_tests(working_directory, signal_power, pulse_width);
disp(output);
disp(signal_noise_peak_to_peak);
disp(signal_peak_to_peak);

SNR = signal_peak_to_peak/signal_noise_peak_to_peak;

msg = sprintf('SNR is: %0.4f\n', SNR);
format bank;
disp(msg);

