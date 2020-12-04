clc
clear
close all

% Brian Doan, Derek Lee, Steven Lee
% Digital Signals Processing Fall 2020
% Project #5


%% Constants 

load pj2data
n = 0:size(y,2)-1;
k = n;
w_k = 2*pi./k;


%% Test loaded data

figure();
tiledlayout(2,1);

% Plot y[n]
nexttile();
plot( n, y );
title( "y[n]" );
xlabel( "n" );
xlim( [ min(n) max(n) ] );

% Plot H(e^jw)^2
nexttile();
plot( k, Hejw2 );
title( "|H(e^{jw})|^2" );
xlabel( "k" );
ylabel( "Magnitude" );
xlim( [ min(k) max(k) ] );


%% Question A

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
hold off;
title( "Autocorrelation of y_1" )
legend();


%% Problem A.1


%% Problem A.2

n = 64;

% Part A

% Part B
C_y_1 = fft( c_y_1, n );
figure();
tiledlayout( 2,1 );
nexttile();
plotMagnitude( 0:n-1, C_y_1, "C_{y_1}" );
xlim( [ 0 n-1 ] );
nexttile();
plotPhase( 0:n-1, C_y_1, "C_{y_1}" );
xlim( [ 0 n-1 ] );
    

%% Problem A.3
    
figure();
hold on;

% Part A

% Part B
Y_1 = fft( y_1, n );
Y_1ejw2 = abs(Y_1).^2;
plot( 0:n-1, Y_1ejw2, 'DisplayName', '|Y_1(e^{jw})|^2' );

% Part C
y_2 = y(1:64);
Y_2 = fft( y_2, 64 );
Y_2ejw2 = abs(Y_2).^2;
plot( 0:n-1, Y_2ejw2, 'DisplayName', '|Y_2(e^{jw})|^2' );

hold off;
legend();
xlim( [ 0 n-1 ] );


%% Question B


%% Problem B.1

figure();
hold on;
plot( 0:n-1, Hejw2(1:n), 'DisplayName', '|H(e^{jw})|^2' );
plot( 0:n-1, Y_1ejw2, 'DisplayName', '|Y_1(e^{jw})|^2' );
hold off;
title( "PDS of y[n] with 64 points" );
xlabel( "n" );
ylabel( "Magnitude" );
legend();

err = sqrt( sum( abs( Hejw2(1:n) - Y_1ejw2 ), 'all' ) ) / n;
disp( "The estimation error is: " + err );


%% Problem B.2

Y = fft(y);
Yejw2 = abs(Y).^2;

figure();
hold on;
plot( Hejw2, 'DisplayName', '|H(e^{jw})|^2' );
plot( Yejw2, 'DisplayName', '|Y(e^{jw})|^2' );
hold off;
title( "PDS of y[n] with all points" );
xlabel( "n" );
ylabel( "Magnitude" );
legend();

figure();
periodogram( y(1:64), rectwin(64), 512 );

