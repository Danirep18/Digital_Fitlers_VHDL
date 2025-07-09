%This script helped me with the obtention of the coeffs of any filter
%Also filterdesign tool is available
Fs = 48000;       %Sample rfeq (Hz)
Nyq = Fs/2;       %Nyquist freq
Rp = 1;         % Bandpass ripple (dB)
Rs = 30;          %Stop´band attenuation (dB)

% normalizes freqs
fp = [200 20000] / Nyq;  % bandpass
fs = [190 21000] / Nyq;  % bandstop

% design
[n, Wn] = ellipord(fp, fs, Rp, Rs) 
[b, a] = ellip(n, Rp, Rs, Wn, 'bandpass');
G = tf(b,a)
% Visualization
freqz(b, a, 1024, Fs);
title('Elliptic bandpass filter (200 Hz - 20 kHz)');
a'
b'