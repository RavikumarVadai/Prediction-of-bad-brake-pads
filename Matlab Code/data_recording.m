
%% Sampling rate
 Fs = 44100;


 %% No Of bits
 N=16;


 %% Create audio recorder object
recObj = audiorecorder(Fs, 16, 1);
 get(recObj);
 
 input(’press enter when ready’);


 %% Record blocking
 recordblocking(recObj, 12);
 disp(’End of Recording.’);
 Y = 0.1*getaudiodata(recObj);
 wavwrite(Y,Fs,N,’Sound.wav’);


 %% Plotting FFT
 fftval= abs(fft(Y));
 plot(fftval);
