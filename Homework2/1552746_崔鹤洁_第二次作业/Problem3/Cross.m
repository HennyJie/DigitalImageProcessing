function result = Cross(img, w)
    [m,n] = size(img);
    peddedImg = padarray(img,[w w],'both');
    result = zeros(m,n);
    for i = (1:m) + w
        for j = (1:n) + w
            temp = [];
            for ii = (i-(w-1)/2):(i+(w-1)/2)
                temp = [temp, peddedImg(ii,j)];
            end
            for jj = (j-(w-1)/2):(j+(w-1)/2)
                if jj == j
                    continue;
                end
                temp = [temp, peddedImg(i,jj)];
            end
            result(i-w,j-w) = median(temp);
        end
    end
    result = uint8(result);
end
