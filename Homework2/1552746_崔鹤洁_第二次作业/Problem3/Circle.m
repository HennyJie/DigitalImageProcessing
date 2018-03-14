function result = Circle(img, d)
    [m,n] = size(img);
    peddedImg = padarray(img,[d d],'both');
    result = zeros(m,n);
    for i = (1:m) + d
        for j = (1:n) + d
%           get a square window first
            temp = peddedImg(i-(d-1)/2:i+(d-1)/2,j-(d-1)/2:j+(d-1)/2);
            circleTemp = [];
            center = (d+1)/2;
            for ii = 1:d
                for jj = 1:d
%                     choose those points in a circle with d from the
%                     square window
                    if (center-ii)*(center-ii)+(center-jj)*(center-jj)<=((d-1)/2)*((d-1)/2)
                        circleTemp = [circleTemp,temp(ii,jj)];
                    end
                end
            end
            result(i-d,j-d) = median(circleTemp);
        end
    end
    result = uint8(result);
end
