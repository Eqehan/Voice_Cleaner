clear all;close all;clc;                % Onceki calismalari temizleme

[data, Fs] = audioread('sound1.wav');   % Ses dosyası tanımlama
D= fft(data);                           % Ses dosyasının fourier transformu
plot(real(D));                          % Fourier transformun real kısımlarını gösterir