function Y = MaxOrMinFilter( Img, w, isMax )
    [row,col] = size(Img);
    paddedImg = padarray(Img, [w w], 'both');
    Y = zeros(row, col);
    for i = (1:row) + w
        for j = (1:col) + w
            S = paddedImg((i-floor(w/2)):(i+floor(w/2)), (j-floor(w/2)):(j+floor(w/2)));
            S = S(:);
            index = ceil(size(S,1)/2);
            S(index) = [];
            if isMax
                pixMax = max(S);
                if paddedImg(i, j) < pixMax
                    Y(i-w, j-w) = pixMax;
                else
                    Y(i-w, j-w) = paddedImg(i, j);
                end
            else
                pixMin = min(S);
                if paddedImg(i, j) > pixMin
                    Y(i-w, j-w) = pixMin;
                else
                    Y(i-w, j-w) = paddedImg(i, j);
                end
            end
        end
    end
    Y = uint8(Y);
end

