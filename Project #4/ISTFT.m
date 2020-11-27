function signal = ISTFT( signal_windowed, n )

    % Given constants
    window = 256;
    n_overlap = 128;

    % Only need points up to the window size
    signal_windowed = real( ifft( signal_windowed ) );
    signal_windowed = signal_windowed( 1:window, : );
    
    numCols = size( signal_windowed, 2 );
    signal = zeros( n, numCols );
    curSample = 1;
    for i = 1:numCols
        
        signal_temp = signal_windowed(:,i);
        signal( curSample:curSample+window-1, i ) = signal_temp;
        curSample = curSample + n_overlap;
        
    end
    
    % Get the average of the overlapping IFFTs
    signal = sum( signal, 2 );
    signal( n_overlap+1:end-n_overlap+1 ) = signal( n_overlap+1:end-n_overlap+1 )/2;

end