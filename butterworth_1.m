fc=13000;
[b,a]=butter(6,fc/(fs/2));
freqz(b,a);
filteredsignal=filter(b,a,data);
sound(filteredsignal,fs);
plot(filteredsignal);
subplot(2,1,1); plot(data); subplot(2,1,2);plot(filteredsignal);
