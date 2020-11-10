function plotResponses( b, a, n )
    
    % Impulse Response
    figure();
    impz( b, a, n );

    % Frequency Response
    figure();
    freqz( b, a, n );
    title( "Frequency Response" );

    % Group Delay
    figure();
    grpdelay( b, a, n );
    title( "Group Delay" );

end
