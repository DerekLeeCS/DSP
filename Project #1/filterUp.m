function out = filterUp( in, L )

    % Chebyshev Arguments
    Wp = 1/L;
    Ws = 1.2 * Wp;
    Rp = 0.1;
    Rs = 85;
    
    % Generate filter 
    [n,Wn] = cheb2ord( Wp, Ws, Rp, Rs );
    [b,a] = cheby2( n, Rs, Wn );
    [h,~] = impz(b,a);
    E = poly1(h',L);
    
    % Filter
    lenConv = length(E(1,:))+length(in(:))-1;
    filtered = zeros( L, lenConv );
    for n = 1:L
        filtered(n,:) = conv(E(n,:),in(:));
    end
    
    % Upsample and circshift 
    out = zeros( L, L*( length( filtered(1,:) ) ) );
    for n = 1:L
         out(n,:) = upsample( filtered(n,:)', L )';
         out(n,:) = circshift( out(n,:), n-1 );
    end
    
    out = L * sum(out);
    
end