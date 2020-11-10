clc
clear
close all

% Derek Lee, Brian Doan, Steven Lee
% Digital Signals Processing Fall 2020
% Project #2


%% Load

load projIA.mat


%% Part A

n = 100;    % Number of samples
plotResponses( b, a, n );


%% Part B

figure();
zplane( b, a );
title( "Z-Plane" );


%% Part C

% There is some slight distortion compared to the original signal
% It appears to be slightly delayed when played at the same time as the
%   original signal
y = filter( b, a, speech );
soundsc( y, fs );


%% Part D

N = 50;
count = 1;
[sos, g] = tf2sos(b,a);

% Direct Form 1
H = dfilt.df1( b, a );
Hd = cascadeFilt( H, N );
df1 = filter( Hd, speech );

% Direct Form 1 SOS
H = dfilt.df1sos( sos, g );
Hd = cascadeFilt( H, N );
df1s = filter( Hd, speech );

% Direct Form 2 SOS
H = dfilt.df2sos( sos, g );
Hd = cascadeFilt( H, N );
df2s = filter( Hd, speech );

% Direct Form 2 Transposed SOS 
H = dfilt.df2tsos( sos, g );
Hd = cascadeFilt( H, N );
df2ts = filter( Hd, speech );

% Original Part D
% Credit to Hadassah for the syms portion of the code
syms A B;

A = poly2sym(a);
A = A^50;
aNew = double( coeffs(A) );

B = poly2sym(b);
B = B^50;
bNew = double( coeffs(B) );

signal = filter( bNew, aNew, speech );
plotResponses( bNew, aNew, 5000 );
zplane( bNew, aNew );
title( "Z-Plane" );


%% Part E

% The distortion is very significant and noticeable.
% This is probably due to the filter's large group delay. 
soundsc( df1, fs );
soundsc( df1s, fs );
soundsc( df2s, fs );
soundsc( df2ts, fs );

