function Y = PSF( LEN, THETA )
%PSF Summary of this function goes here
%   Detailed explanation goes here
    Y = fspecial('motion', LEN, THETA);

end

