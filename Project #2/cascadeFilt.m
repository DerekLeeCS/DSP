function Hd = cascadeFilt( H, N )

    n = 5000;
    Hd = dfilt.cascade( repmat( H, N, 1 ) );

    % Plots
    impz( Hd, n );
    freqz( Hd, n );
    grpdelay( Hd, n );
    zplane( Hd );
    
end