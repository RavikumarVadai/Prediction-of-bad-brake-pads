 % Here the brake liner is tapped at all over the material.
 %Note that peak frequency occurs at almost the same place all the time.


%% reading wav files:
 clc;
 clear all;
 close all;


 [x1, fs] = wavread(’C6b_check.wav’);


 %% Beat Detection:


 threshold = 0.02;


 comp_x1 = abs(x1)>threshold;


 count = 1;
 i = 10000;
 while i < length(x1)
 if comp_x1(i) == 1
 beat_start_x1(count) = i;
 i = i+10000;
 count = count+1;
 end
 i = i+1;
 end


 total_beats = count-1;


%% Creating window
 %window_size = 2ˆnextpow2(fs);
 a = 699;
 b= 7492;
 for t = 1 : total_beats;
 for segment = t:t
 %% Window at each beat
 Y = x1(beat_start_x1(segment)-a:beat_start_x1(segment)+b);


%% fft for every window

 length = b-a+1;
 freq = (fs/2)*linspace(0,1,length/2);
 fourier_abs = abs(fft(Y));
 figure(t)
 plot(freq , fourier_abs(1:length/2));
 axis([0 22050 0 100])




 end
end