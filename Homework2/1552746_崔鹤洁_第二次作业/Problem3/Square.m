function result = Square(img, w)
    [m,n] = size(img);
    peddedImg = padarray(img,[w w],'both');
    result = zeros(m,n);
    for i = (1:m) + w
        for j = (1:n) + w
            temp = peddedImg(i-(w-1)/2:i+(w-1)/2,j-(w-1)/2:j+(w-1)/2);
            temp = temp(:);
            result(i-w,j-w) = median(temp);
        end
    end
    result = uint8(result);
end

