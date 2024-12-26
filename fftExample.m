% fftExample

% A compresensive DFT (FFT) Theory related to MATLAB convention is given in
% https://www.youtube.com/watch?v=E2yyDR1sUBM&list=RDCMUCooRZ0pxedi179pBe9aXm5A&index=2
% taught by professor Barry Van Veen.
% No stupid assumptions and no windowing stuffs
% This lecture is a strict digital signal processing
% and it is Mathematically flawless
clear; clc; close all

% FFT is a kind of DFT
% for resampling, it is recommaned to use interp1 instead of the resampling
% https://www.mathworks.com/help/signal/ug/reconstructing-missing-data.html

%% 0. Nomencalture
N=1;                                                % number of samples in FFT
fsample = 6e3;                              % Sampling frequency of the signal

% fsample은 아래 예시에선 60 * 200의 최소공배수의 정수배이면 가장 좋다
% 즉, 관심있는 모든 주파수에서 최소 공배수일 필요가 있다.

signal = 1;                                        % Sampled signal
dt = 1/fsample;                                 % Time interval between data sampling

%% 1. Construct Sampled Signal
t = 0:dt:10-dt;
signal = 2 + 1*sin(2*pi*60*t) + 3*sin(2*pi*200*t);            % sampled signal
N = length(signal);                                                 % Number of sampled data points

%% 2. Perform MATLAB fft

% N is better to be odd. If not, make your signal data points to odd for
% god sake!
N
if(mod(N,2)==0)
    signal = signal(1:N-1);
    N = N-1;
end

% Perform actuall MATLAB fft for DFT coeff.
signalFFT = fft(signal);
signalFFTMag = abs(signalFFT);

%% Scale Matlab fft
complexSinusoidAmplitude = signalFFTMag/N;

sinusoidAmplitude = complexSinusoidAmplitude  * 2;
sinusoidAmplitude(1) = complexSinusoidAmplitude(1);                % DC component is not subject to 2 factor

positiveFrequencyAmplitude = sinusoidAmplitude( 1 : (N+1)/2 );  % Note it is not (N-1)/2
positiveFrequencyRange = (1/N) * (0:(N-1)/2) * fsample;

stem(positiveFrequencyRange, positiveFrequencyAmplitude);

xlabel('Frequency [Hz]')
ylabel('Amplitude [Vpk]')
grid on

figure(2)

semilogx( positiveFrequencyRange, mag2db(positiveFrequencyAmplitude) ,'linewidth', 2);
xlabel('Frequency [Hz]')
ylabel('Amplitude [dBVpk]')
grid on