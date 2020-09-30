function out = srconvert( in )

    out = filterUp(in,5);

    out = filterUp(out,2);
    out = 7*downsample(out,7);
    out = filterUp(out,2);
    out = filterUp(out,2);

    out = filterUp(out,2);
    out = 7*downsample(out,7);
    out = filterUp(out,2);
    out = filterUp(out,2);

    out = 3*downsample(out,3);
    out = out./max(abs(out));
    
end