p=[0.8+0.3i;0.8-0.3i;-0.6+0.4i;-0.6-0.4i;0.3+0.7i;0.3-0.7i];
z=[0.6+1.4i;0.6-1.4i]; %orismos thesis polwn kai midenikwn
k=1;
[b,a]=zp2tf(z,p,k);
figure0=figure('Name','Z-PLANE','NumberTitle','off');

zplane(z,p)
pause
print -djpeg 21-Z-PLANE.jpg
close all;
figure1=figure('Name','kroustikh','NumberTitle','off');

%kroustikh
[h1,t1]=impz(b,a);
stem(t1,h1)

print -djpeg 21-kroustikh_apokrish.jpg
pause
close all;
figure2=figure('Name','bhmatikh apokrish','NumberTitle','off');
%bhmatikh apokrish
[h2,t2]=stepz(b,a);
stem(t2,h2)

print -djpeg 22-bhmatikh_apokrish.jpg
pause
close all;


figure3=figure('Name','apokrish platous','NumberTitle','off');
%apokrish platous

[h3,w]=freqz(b,a,1000);

plot(w,abs(h3))
print -djpeg 23-apokrish_platous.jpg
pause
close all;

figure4=figure('Name','diegersh me tuxaio','NumberTitle','off');
r=rand(1000,1);
plot(conv(r,h1),'color','red')

print -djpeg 24-diegersh_me_tuxaio_shma.jpg
pause
close all;
figure5=figure('Name','diegersh me palmoseira','NumberTitle','off');
pulse=gensig('square',50,1000,1);
answer=conv(pulse,h1);
stem(answer(1:220),'color','red') %den plottaroume ola ta shmeia para mono treis periodous sthn eksodo

print -djpeg 25-diegersh_me_palmoseira.jpg
pause
close all;
p1=[0.8+0.3i;0.8-0.3i;-0.6+0.4i;-0.6-0.4i];
p2=[0.3+0.7i;0.3-0.7i];
z2=z;

figure6=figure('Name','metakinhsh polwn','NumberTitle','off');
while(abs(p2(1))<abs(z2(2)))
%    for i = 1:12
%    subplot(3,4,i);
    a=real(p2(1));
    b=imag(p2(1));
    p2(1)=complex((a+0.01),(b*(a+0.01)/a));
    p2(2)=complex((a+0.01),-(b*(a+0.01)/a));
    c=real(z2(1));
    d=imag(z2(1));
    z2(1)=complex((c-0.01),(d*(c-0.01)/c));
    z2(2)=complex((c-0.01),-(d*(c-0.01)/c));
    [beta,alpha]=zp2tf(z2,[p1;p2],k);
    [h4,w4]=freqz(beta,alpha,1000);
    plot(w4,abs(h4))
    zerostring=[' ';' '];
    title([num2str(p2),zerostring,num2str(z2)])

    pause
%   end
end
print -djpeg 26-metakinoumenoi_poloi_last_frame.jpg

close all;


p1=[0.8+0.3i;0.8-0.3i;-0.6+0.4i;-0.6-0.4i];
p2=[0.3+0.7i;0.3-0.7i];
z2=z;

figure7=figure('Name','metakinhsh polwn2','NumberTitle','off');
while(abs(p2(1))<1) %abs(z2(2)))	%bima 0,01 gia to a kai  
    for i = 1:12					%(b/a)*(a+0,01) gia to b
    subplot(3,4,i);  				%gia na parameinoun stin idia eu8eia
    a=real(p2(1));
    b=imag(p2(1));
    p2(1)=complex((a+0.01),(b*(a+0.01)/a));
    p2(2)=complex((a+0.01),-(b*(a+0.01)/a));
    c=real(z2(1));
    d=imag(z2(1));
    z2(1)=complex((c-0.01),(d*(c-0.01)/c));
    z2(2)=complex((c-0.01),-(d*(c-0.01)/c));
    [beta,alpha]=zp2tf(z2,[p1;p2],k);
    [h4,w4]=freqz(beta,alpha,1000);
    plot(w,abs(h4))
    zerostring=[' ';' '];
    title([num2str(p2,3),zerostring,num2str(z2,3)])
    
   end
end
print -djpeg 26-metakinoumenoi_poloi.jpg

pause
close all;
