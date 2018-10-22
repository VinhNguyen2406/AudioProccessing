 %Ho va ten: Nguyen Dang Vinh
 %MSSV: 20154369
 %Lop: Dien tu 09
 %Khoa: 60
 
 %file ghi am orig_input san, tao giai dieu melody
 fs = 44100;
 t = 1 : 1/fs : 1.5;
 f = 440;
 A = 0.3;
 t1 = A*sin(2*pi*f*((2^(0)).^(1/12))*t);
 t2 = A*sin(2*pi*f*((2^(1)).^(1/12))*t);
 t3 = A*sin(2*pi*f*((2^(2)).^(1/12))*t);
 t4 = A*sin(2*pi*f*((2^(3)).^(1/12))*t);
 t5 = A*sin(2*pi*f*((2^(4)).^(1/12))*t);
 t6 = A*sin(2*pi*f*((2^(5)).^(1/12))*t);
 t7 = A*sin(2*pi*f*((2^(6)).^(1/12))*t);
 t8 = A*sin(2*pi*f*((2^(7)).^(1/12))*t);
 t9 = A*sin(2*pi*f*((2^(8)).^(1/12))*t);
 t10 = A*sin(2*pi*f*((2^(9)).^(1/12))*t);
 t11 = A*sin(2*pi*f*((2^(10)).^(1/12))*t);
 t12 = A*sin(2*pi*f*((2^(11)).^(1/12))*t);
 s = [ t1 t1 t2 t2 t3 t3 t1 t3 t4 t5 t7 t1 t4 t7 t8 t9 t11 t4 t8 t5 t7 t12 t11 t4 t8 t10 t5 t4 t6 t3 t1 t7];
 sound(s,fs);
 [g,fs] = audioread('orig_input.wav');
 a1=g;
 a2=a1(1:length(s));
 m = s + a2;
 sound(m,fs);
 audiowrite('melody.wav', m, fs);
 
 %fft 
 N=fs;
 transform = fft(m,N)/N;
 magTransform=abs(transform);
 f_axis= linspace(-fs/2,fs/2,N);
 plot(f_axis,fftshift(magTransform));
 xlabel('Frequency (Hz)');
 title(' Fast Fourier Transform of Melody');
 
 %Spectrogram
 win = 128;
 hop = win/2;  
 nfft = win;
 spectrogram(m,win,hop,nfft,fs,'yaxis');
 title('Spectogram of melody');
 
