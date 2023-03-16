clear all; close all; clc;
[data,Fs] = audioread('sound1.wav');
Fn = Fs/2;                                                      % Nyquist Frequency
L = size(data,1);                                                  % Signal Length
fcuts = [680 690 710 720  1190 1205  1210 1220  6000  6100];    % Frequency Vector
mags =   [1 0 1 0 1 0];                                         % Magnitude (Defines Passbands & Stopbands)
devs = [0.05  0.01  0.05  0.01 0.05  0.01];                     % Allowable Deviations
[n,Wn,beta,ftype] = kaiserord(fcuts,mags,devs,Fs);
n = n + rem(n,2);
hh = fir1(n,Wn,ftype,kaiser(n+1,beta),'scale');
figure(2)
freqz(hh,1, 4096, Fs)                                           % Filter Bode Plot
filt_sig = filtfilt(hh, 1, data);                                  % Filter Signal
FTS = fft(data)/L;                                                 % FFT Of Original Signal
FTFS = fft(filt_sig)/L;                                         % FFT Of Filtered Signal
Fv = linspace(0, 1, fix(L/2)+1)*Fn;                             % FFT Frequency Vector
Iv = 1:length(Fv);                                              % Index Vector
[pks,Frs] = findpeaks(abs(FTS(Iv))*2, Fv, 'MinPeakHeight',0.1); % Find Pure Tone Frequencies
figure(3)
semilogy(Fv, (abs(FTS(Iv)))*2)
hold on
plot(Fv, (abs(FTFS(Iv)))*2)
hold off
grid
axis([0  2500    ylim])
sound(filt_sig,Fs)