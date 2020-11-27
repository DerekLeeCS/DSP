clc
clear
close all

% Brian Doan, Derek Lee, Steven Lee
% Digital Signals Processing Fall 2020
% Project #5


%% Constants 

load pj2data


%% Part A

y_1 = y(1:32);
c_y_1 = xcorr( y_1, y_1, 'biased' );
conv_y_1 = conv( y_1, fliplr(y_1) );

% Calculate scaling factor (uses 0.9 to see a difference between them)
scalingFac = 0.9*max(conv_y_1) / max(c_y_1);

% Plot
figure();
hold on;
plot( scalingFac*c_y_1, 'DisplayName', 'xcorr' );
plot( conv_y_1, 'DisplayName', 'conv' );
legend();
hold off;

% Problem A.1


% Problem A.2

    % Part A
    
    % Part B
    C_y_1 = fft( c_y_1, 64 );
    plotMagnitude( 1:64, C_y_1, "C_{y_1}" );
    plotPhase( 1:64, C_y_1, "C_{y_1}" );
    
    