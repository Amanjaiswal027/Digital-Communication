clc;
clear;
close;
// Declaring Constants
fs = 100;
t = 0:(1/fs):1;
p = length(t);
pi = %pi;
// Generating and Displaying Message Signals
msg1 = 2*sin(2*pi*3*t);
msg2 = 3*cos(2*pi*3*t);
msg3 = 1*squarewave(2*pi*3*t);
figure(1);
subplot(3, 1, 1);
plot(t, msg1);
xlabel('Time');
ylabel('Amplitude');
title('Message Signal 1 -> Sine Wave');
subplot(3, 1, 2);
plot(t, msg2);
xlabel('Time');
ylabel('Amplitude');
title('Message Signal 2 -> Cosine Wave');
subplot(3, 1, 3);
h = gca();
h.data_bounds = [0, -1.5; 1, 1.5]
plot(t, msg3);
xlabel('Time');
ylabel('Amplitude');
title('Message Signal 3 -> Square Wave');
// Time Division Multiplexing
tdm = 0;
j = 1;
for i = 1:3:3*p
 tdm(i) = msg1(j);
 tdm(i+1) = msg2(j);
 tdm(i+2) = msg3(j);
 j = j+1;
end;
figure(2);
subplot(2, 1, 1);
plot2d3(tdm);
xlabel('Time');
ylabel('Amplitude');
title('Time Division Multiplexed Signal - Line Graph');
subplot(2, 1, 2);
plot(tdm);
xlabel('Time');
ylabel('Amplitude');
title('Time Division Multiplexed Signal');
// De-Multiplexing
n = 1;
for k = 1:1:p
 m1(k) = tdm(n);
 m2(k) = tdm(n+1);
 m3(k) = tdm(n+2);
 n = n+3;
end;
figure(3);
subplot(3, 1, 1);
plot(t, m1);
xlabel('Time');
ylabel('Amplitude');
title('Demodulated Message Signal 1 -> Sine Wave');
subplot(3, 1, 2);
plot(t, m2);
xlabel('Time');
ylabel('Amplitude');
title('Demodulated Message Signal 2 -> Cosine Wave');
subplot(3, 1, 3);
h = gca();
h.data_bounds = [0, -1.5; 1, 1.5];
plot(t, m3);
xlabel('Time');
ylabel('Amplitude');
title('Demodulated Message Signal 3 -> Square Wave');