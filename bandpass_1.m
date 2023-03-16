clear all;close all;clc;                % Onceki calismalari temizleme

[data, Fs] = audioread('sound1.wav');   % Ses dosyası tanımlama
N=128;                                  % Filtrenin Derecesi
Fn = Fs/2;                              % Nyquist Frekansi
fc1 = 1500/Fn;                          % Cut_Off Frekansı 1
fc2 = 7500/Fn;                          % Cut_Off Frekansı 1
B = fir1(N, [fc1 fc2], 'bandpass');     % Bant geciren filtre
ses_filtered = filtfilt(B, 1, data);
sound(ses_filtered,Fs);                 % Filtrelenmis sesi oynat
%% audiowrite('sound1.wav',ses_filtered,Fs);