clear all;close all;clc;                % Onceki calismalari temizleme

[data, Fs] = audioread('sound1.wav');   % Ses dosyasi tanimlama
D= fft(data);                           % Ses dosyasinin fourier transformu
plot(real(D));                          % Fourier transformun real kisimlarini gösterir