function out = srconvert( in )

    totalMult = 0;
    totalAdd = 0;
    [out, totalMult, totalAdd] = filterUp( in, 5, totalMult, totalAdd );
    [out, totalMult, totalAdd] = filterUp( out, 2, totalMult, totalAdd ); 
    out = 7*downsample(out,7);
    [out, totalMult, totalAdd] = filterUp( out, 2, totalMult, totalAdd );
    [out, totalMult, totalAdd] = filterUp( out, 2, totalMult, totalAdd );

    [out, totalMult, totalAdd] = filterUp( out, 2,totalMult,totalAdd );
    out = 7*downsample(out,7);
    [ out, totalMult, totalAdd ] = filterUp( out, 2, totalMult, totalAdd );
    [ out, totalMult, totalAdd ] = filterUp( out, 2, totalMult, totalAdd );
   
    out = 3*downsample(out,3);
    out = out./max( abs(out) );
    disp( totalMult )
    disp( totalAdd )
    disp( "Hand calculation:  3977 multiplication and 3970 additions." )
    
end