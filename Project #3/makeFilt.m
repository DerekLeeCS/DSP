function filt = makeFilt( filtType, lowpassType, fs )

    F_p = 2500;
    F_s = 4000;
    A_p = 3;
    A_s = 55;

    filt = designfilt( lowpassType, 'PassbandFrequency', F_p, ...
                    'StopbandFrequency', F_s, 'PassbandRipple', A_p, ...
                    'StopbandAttenuation', A_s, 'SampleRate', fs, ...
                    'DesignMethod', filtType );

end