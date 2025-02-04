clc; 
clear;
 close;

// Declaring Constants pi = %pi;

// Taking Input from User
fm = input("Enter Message Signal Frequency(fm): ");
fc = input("Enter Carrier Signal Frequency(fc -> fc>>fm): "); Am = input("Enter Message Signal Amplitude: ");
Ac = input("Enter Carrier Signal Amplitude: ");

// Generating and Displaying Message Signal fs = fm * 100;
t = 0:(1/fs):1; p = length(t);
msg = Am + Am*sin(2*pi*fm*t); figure(1);
subplot(3, 1, 1);
plot(t, msg);
xlabel("Time"); ylabel("Amplitude"); title("Message Signal");

// Generating and Displaying Carrier Signal carrier = Ac + Ac*squarewave(2*pi*fc*t); subplot(3, 1, 2);
plot(t, carrier); h = gca();
h.data_bounds = [0, -1; 1, 3*Ac]; xlabel("Time"); ylabel("Amplitude"); title("Carrier Signal");

// Generating and Displaying Modulated Signal pam_mod = carrier .* msg;
subplot(3, 1, 3); plot(t, pam_mod); xlabel("Time"); ylabel("Amplitude");
title("Pulse Amplitude Modulated Signal");

// Generating and Displaying Demodulated Signal demod = pam_mod .* carrier;
k = abs(fft(demod));
filt = [ones(1, 2*fm), zeros(1, p-2*fm)]; out= k .* filt;
figure(2); subplot(3, 1, 1);
plot(t, ifft(out));
xlabel("Time"); ylabel("Amplitude");

title("Demodulated Signal");

