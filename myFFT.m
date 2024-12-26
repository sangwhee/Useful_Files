function [positiveFrequencyRange, positiveFrequencyAmplitude] = myFFT(time,inputSignal,fsample)

tResampled = 0:1/fsample:time(end);
reSampledsignal = interp1(time,inputSignal,tResampled,'linear');

% start FFT
signal = reSampledsignal;
N1 = length(signal); % Number of sampled data points

if(mod(N1,2)==0)
    signal = signal(1:N1-1);
    N1 = N1-1;
end

% Perform actuall MATLAB fft for DFT coeff.
signalFFT = fft(signal);
signalFFTMag = abs(signalFFT);

%% Scale Matlab fft
complexSinusoidAmplitude = signalFFTMag/N1;

sinusoidAmplitude = complexSinusoidAmplitude  * 2;
sinusoidAmplitude(1) = complexSinusoidAmplitude(1);                % DC component is not subject to 2 factor

positiveFrequencyAmplitude = sinusoidAmplitude( 1 : (N1+1)/2 );  % Note it is not (N-1)/2
positiveFrequencyRange = (1/N1) * (0:(N1-1)/2) * fsample;

end


