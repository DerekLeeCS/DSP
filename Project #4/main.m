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
window = triang(n);
x = cos( 2*pi*mu_1*t.^2 );

% X_1(w)
figure();
spectrogram( x, window, n_overlap, n, 'yaxis' );
title( "X_1(w)" );


%% Question 2 

% The slope of f_2 corresponds with the slope of the ridge in the
% spectrogram. It is off by a factor of 2.

f_1 = mu_1*t;
stepSize = t(2) - t(1);
f_2 = 1/(2*pi) * diff( 2*pi*mu_1*t.^2 ) / stepSize;

f_2 = f_2 * 2;  % Need to add a factor of 2 to match.

% Normalize the frequency
f_1 = f_1 / f_s;
f_2 = f_2 / f_s;

% Plot on top of the spectrogram to compare
hold on;
plot( f_1, 'DisplayName', 'f_1' );
plot( f_2, 'DisplayName', 'f_2' );
hold off;
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

load s1.mat
load s5.mat
f_s = 8 * 1e3;  % 8 kHz

n_narrow = 512;
n_narrow_overlap = n_narrow-1;
window_narrow = triang(n_narrow).';

% S_1(w)
figure();
spectrogram( s1, window_narrow, n_narrow_overlap, n_narrow, 'yaxis' );
title( "S_1(w)" );

% S_5(w)
figure();
spectrogram( s5, window_narrow, n_narrow_overlap, n_narrow, 'yaxis' );
title( "S_5(w)" );


%% Question 5

n_wide = 64;
n_wide_overlap = n_wide-1;
window_wide = triang(n_wide).';

% S_1(w)
figure();
spectrogram( s1, window_wide, n_wide_overlap, n_wide, 'yaxis' );
title( "S_1(w)" );

% S_5(w)
figure();
spectrogram( s5, window_wide, n_wide_overlap, n_wide, 'yaxis' );
title( "S_5(w)" );


%% Question 6

load vowels.mat

n_mod = 1024;
n_mod_overlap = 128;
window_mod = rectwin(256);
s = spectrogram( vowels, window_mod, n_mod_overlap, n_mod, 'yaxis' );
s = [s;flipud(s)];
vowels_reconstructed = ISTFT( s, n_mod );

% Plot the difference
figure();
difference = vowels( 1:size(vowels_reconstructed,1) ) - vowels_reconstructed;
plot( difference );
title( "Difference between Original and Reconstructed Signal" );
xlabel( "Samples" );


%% Listen to the signals

% It sounds almost exactly the same as the original
%soundsc( vowels, f_s );
soundsc( vowels_reconstructed, f_s );


%% Question 7

s = spectrogram( vowels, window_mod, n_mod_overlap, n_mod, 'yaxis' );

% Throw out every other column
s = s( :, (1:2:end) );
s = [s;flipud(s)];

vowels_fast = ISTFT( s, n_mod );


%% Listen to the signal

% It sounds twice as fast as the original. There is no distortion that
% would be present from doubling the sampling frequency.
soundsc( vowels_fast, f_s );

