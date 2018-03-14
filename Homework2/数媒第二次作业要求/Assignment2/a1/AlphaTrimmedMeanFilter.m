function Y = AlphaTrimmedMeanFilter( Img, w, d)
    if mod(d,2) ~= 0
        d = d - 1;
    end
    paddedImg = padarray(Img, [w, w], 'both');
    [row, col] = size(Img);
    Y = zeros(row, col);
    for i = (1:row) + w
        for j = (1:col) + w
            S = paddedImg((i-floor(w/2)):(i+floor(w/2)), (j-floor(w/2)):(j+floor(w/2)));
            S = S(:);
            index = ceil(max(size(S))/2);
            S(index) = [];
            S = sort(S);
            len = max(size(S));
            S((len-floor(d/2)+1):len) = [];
            S(1:floor(d/2)) = [];
            Y(i-w, j-w) = sum(S)/(w*w-d);
        end
    end
    Y = uint8(Y);
end

