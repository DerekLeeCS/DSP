function[order, noisein, coeff] = graphplot(in, fs,noisy, name)
    order = filtord(in);
    noisein = filter(in, noisy);

    [H,f] = freqz(in, fs);
    h_db = 20*log10(abs(H));
    [g_delay,w_delay] = grpdelay(in, fs);
    [hz, hp, ht] = zplane(in);
    [z,p,k] = zpk(in);
    coeff = length(z) + length(p) + 2; %+2 because xth order polynimal has x+1 coefficients.
    [h_imp, w_imp] = impz(in, 100);

    figure
    sgtitle ( name )
    subplot(3,1,1)
    plot(f,h_db)
    title("magnitude response in DB")
    xlabel('w')

    subplot(3,1,2)
    plot(f,abs(H))
    xlim([0, 0.5])
    title('magnitude response in linear scale') 


    subplot(3,1,3)
    plot(w_delay,g_delay)
    title('Group Delay') 
    xlabel('w')
    
    figure;
    sgtitle ( name )
    
    subplot(2,1,1)
    zplane(hz,hp)
    title('pole-zero plot')

    subplot(2,1,2)
    stem([1:100],h_imp);
    title('impulse of 100 samples');
    
end