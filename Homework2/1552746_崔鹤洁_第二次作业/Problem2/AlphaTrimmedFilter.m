function AlphaTrim = AlphaTrimmedFilter(img, w, d)
    imgPadded = padarray(img, [w, w], 'both');
    [m, n] = size(img);
    AlphaTrim = zeros(m, n);
    for i = (1:m) + w
        for j = (1:n) + w
            tmp = imgPadded(i-(w-1)/2:i+(w-1)/2,j-(w-1)/2:j+(w-1)/2);
            tmp = tmp(:);
            tmp = sort(tmp);
            len = max(size(tmp));
            tmp((len-floor(d/2)+1):len) = [];
            tmp(1:floor(d/2)) = [];
            AlphaTrim(i-w, j-w) = sum(tmp)/(w*w-d);
        end
    end
    AlphaTrim = uint8(AlphaTrim);
end

