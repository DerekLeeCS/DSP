function plotMagnitude( f, signal, titleVar )
    
    plot( f, abs( fftshift( signal ) ) );
    title( titleVar );
    xlabel( 'Frequency (Hz)' );
    ylabel( 'Magnitude' );
    
end