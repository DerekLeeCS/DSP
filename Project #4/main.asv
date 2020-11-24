clc
clear
close all

% Brian Doan, Derek Lee, Steven Lee
% Digital Signals Processing Fall 2020
% Project #4


%% Constants 

n = 256;        % Number of samples
mu_1 = 4 * 1e9;   
f_s = 5 * 1e6;  % 5 MHz
T = 200 * 1e-6; % Duration of chirp
t = linspace( 0, T, f_s*T );


%% Question 1

n_overlap = 255;
window = triang(n).';
x = cos( 2*pi*mu_1*t.^2 );

% X_n(w)
figure();
spectrogram( x, window, n_overlap, n, 'yaxis' );
title( "X_1(w)" );


%% Question 2 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%THIS IS WRONG

% The slope of f_1 corresponds with the slope of the ridge in the spectrogram.

f_1 = mu_1*t;
stepSize = t(2) - t(1);
f_2 = 1/(2*pi) * diff( 2*pi*mu_1*t.^2 ) / stepSize;

%%%%%%%%%%%%%%%% NEED TO NORMALIZE FREQUENCY TO COMPARE
% f_1 = f_1 / f_s;
% f_2 = f_2 / f_s;

figure();
hold on;
plot( t, f_1, 'DisplayName', 'f_1' );
plot( t(1:end-1), f_2, 'DisplayName', 'f_2' );
xlabel( "Time (s)" );
ylabel( "Frequency (Hz)" );
legend();


%% Question 3

% The slope of the ridge for X_2(w) is much steeper than the slope of the 
% ridge for X_1(w). The slope (by inspection) is approximately 2.5x
% steeper, which corresponds with the change in mu. mu_2 = 2.5 * mu_1.


mu_2 = 1 * 1e10;
x_2 = cos( 2*pi*mu_2*t.^2 );

% X_2(w)
figure();
spectrogram( x_2, window, n_overlap, n, 'yaxis' );
title( "X_2(w)" );


%% Question 4


