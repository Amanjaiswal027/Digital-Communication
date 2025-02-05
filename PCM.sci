clc;
close;
clear;
f=2;
fs=20*f; // sampling frequency
t =0:1/2;
a=2;

msg = a*sin(2*%pi*f*t);
subplot(3,1,1);
plot(t,msg);
xlabel('TIME');
ylabel('AMPLITUDE');
title('Message Signal');

xl = msg + a; //Level shifting to one sided sin=gnal
disp(xl,'Discrete sampled value of message signal');

quant = round (xl); // Quantizzation
disp(quant, 'Quantized Sampled Values');
enco = dec2bin(quant); // encoding into binary data
disp(enco, 'PCM Coded values'); // Recovering analog message signal
recover = deco - a;
subplot(3,1,2);
plot(t,recover)
xlabel('TIME');
ylabel('AMPLITUDE');
title("Recovered Signal");
h = gca();
h.data_bounds = [0,-3;2,3]
subplot(3,1,3);
plot(t,msg,'b', t,recover, 'r');
xlabel('TIME');
ylabel('AMPLITUDE');
title('Recovered vs original signal');
h = gca();
h.data_bounds = [0,3;2,3]  
