function Y = PSF( LEN, THETA )
    Y = fspecial('motion', LEN, THETA);
end

