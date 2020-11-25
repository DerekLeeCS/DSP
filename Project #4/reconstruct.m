function signal = reconstruct( STFT, n )

    % Given constants
    window = 256;
    n_overlap = 128;

    numCols = size( STFT, 2 );
    signal = zeros( n, numCols );
    curSample = 1;
    for i = 1:numCols
        
        signal_time = real( ifft( STFT(:,i) ) );
        signal( curSample:curSample+window-1, i ) = signal_time(1:window);
        curSample = curSample + n_overlap;
        
    end
    
    % Get the average of the overlapping IFFTs
    signal = sum( signal, 2 );
    signal( n_overlap+1:end-n_overlap+1 ) = signal( n_overlap+1:end-n_overlap+1 )/2;

end