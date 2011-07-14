close all;
clear;
L=512;
n=0:(L-1);
Window=ones(1,L);
W1=pi*mod(10*max(8,5)/(11*(8+5)),1);
W2=mod(W1+pi/4,pi);
A1=1;
A2=0.75;
X=(A1*cos(W1*n)+A2*cos(W2*n)).*Window;
Xcorrelation = xcorr(X,'unbiased');

%1.1 corelation
figure1=figure('Name','Autosusxetish','NumberTitle','off');
plot((-100:99)*2*pi/200,fftshift(Xcorrelation(1:200)));
title('Autosusxetish'); 
pause
print -djpeg '01-Autosusxetish.jpg'
close all

%1.2 DTFT 256 samples
figure2=figure('Name','DTFT 256 Samples','NumberTitle','off');
plot((-128:127)*2*pi/256,fftshift(abs(fft(X,256))));
title('DTFT 256 Samples'); 
pause
print -djpeg '02-DTFT_256_Samples.jpg'
close all

%1.3 moving frequencies
MO=(W1+W2)/2;
DW=(W2-W1)/20;
FREQSW1=W1+((1:10)*DW);
FREQSW2=W2-((1:10)*DW);
figure3=figure('Name','Moving Frequencies','NumberTitle','off');
for k = 1:10    
    subplot(5,2,k);
    XI=(A1*cos(FREQSW1(k)*n)+A2*cos(FREQSW2(k)*n)).*Window;
    plot((-128:127)*2*pi/256,fftshift(abs(fft(XI,256))));
    T=strcat('DTFT 256 Samples DW=',num2str(FREQSW2(k)-FREQSW1(k)));
    title(T);
end
pause
print ('-djpeg', '03-DTFT_256_Samples.jpg');
close all

%1.4a moving frequencies 512 samples

figure4=figure('Name','Moving Frequencies','NumberTitle','off');
for k = 1:10 
    subplot(5,2,k);
    XI=(A1*cos(FREQSW1(k)*n)+A2*cos(FREQSW2(k)*n)).*Window;
    plot((-256:255)*2*pi/512,fftshift(abs(fft(XI,512))));
    T=strcat('DTFT 512 Samples DW=',num2str(FREQSW2(k)-FREQSW1(k)));
    title(T);
end
pause
print ('-djpeg', '04-DTFT_512_Samples.jpg');
close all


%1.4b moving frequencies 1024 samples

figure5=figure('Name','Moving Frequencies','NumberTitle','off');
for k = 1:10
    subplot(5,2,k);
    XI=(A1*cos(FREQSW1(k)*n)+A2*cos(FREQSW2(k)*n)).*Window;
    XII=[XI zeros(1,512)];
    plot((-512:511)*2*pi/1024,fftshift(abs(fft(XII,1024))));
    T=strcat('DTFT 1024 Samples DW=',num2str(FREQSW2(k)-FREQSW1(k)));
    title(T);
end
pause
print ('-djpeg', '05-DTFT_1024_Samples.jpg');
close all

HammingWindow=hamming(512)';

X=(A1*cos(W1*n)+A2*cos(W2*n)).*HammingWindow;
Xcorrelation = xcorr(X,'unbiased');

%1.1 corelation Hamming
figure6=figure('Name','Autosusxetish-Hamming','NumberTitle','off');
plot((-511:511)*2*pi/1023,fftshift(Xcorrelation));
title('Autosusxetish-Hamming'); 
pause
print -djpeg '11-Autosusxetish-Hamming.jpg'

close all

%1.2 DTFT 256 samples Hamming
figure7=figure('Name','DTFT 256 Samples-Hamming','NumberTitle','off');
plot((-128:127)*2*pi/256,fftshift(abs(fft(X,256))));
title('DTFT 256 Samples-Hamming'); 
pause
print -djpeg '12-DTFT_256_Samples-Hamming.jpg'

close all

%1.3 moving frequencies Hamming
FREQSW1=W1+((0:9)*DW);
FREQSW2=W2-((0:9)*DW);
figure8=figure('Name','Moving Frequencies-Hamming','NumberTitle','off');
for k = 1:10
    subplot(5,2,k);
    XI=(A1*cos(FREQSW1(k)*n)+A2*cos(FREQSW2(k)*n)).*HammingWindow;
    plot((-128:127)*2*pi/256,fftshift(abs(fft(XI,256))));
    T=strcat('DTFT 256 Samples-Hamming DW=',num2str(FREQSW2(k)-FREQSW1(k)));
    title(T);
end
pause
print -djpeg '13-DTFT_256_Samples-Hamming.jpg'

close all

%1.4a moving frequencies 512 samples Hamming

figure9=figure('Name','Moving Frequencies-Hamming','NumberTitle','off');
for k = 1:10
    subplot(5,2,k);
    XI=(A1*cos(FREQSW1(k)*n)+A2*cos(FREQSW2(k)*n)).*HammingWindow;
    plot((-256:255)*2*pi/512,fftshift(abs(fft(XI,512))));
    T=strcat('DTFT 512 Samples-Hamming DW=',num2str(FREQSW2(k)-FREQSW1(k)));
    title(T);
end
pause
print -djpeg '14-DTFT_512_Samples-Hamming.jpg'

close all


%1.4b moving frequencies 1024 samples Hamming

figure10=figure('Name','Moving Frequencies-Hamming','NumberTitle','off');
for k = 1:10
    subplot(5,2,k);
    XI=(A1*cos(FREQSW1(k)*n)+A2*cos(FREQSW2(k)*n)).*HammingWindow;
    XII=[XI zeros(1,512)];
    plot((-512:511)*2*pi/1024,fftshift(abs(fft(XII,1024))));
    T=strcat('DTFT 1024 Samples-Hamming DW=',num2str(FREQSW2(k)-FREQSW1(k)));
    title(T);
end
pause
print -djpeg '15-DTFT_1024_Samples-Hamming.jpg'

close all