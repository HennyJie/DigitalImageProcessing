img = imread('Q_2_3.tif');
subplot(1,3,1);
imshow(img);
title('Original image');
[m,n] = size(img);
r = 2;
d = 20;
img_e = zeros(m+2*r,n+2*r);   %expanded image
img_e(r+1:r+m,r+1:r+n) = img;
for i=r+1:r+m
    for j=r+1:r+n
        window = img_e(i-r:i+r,j-r:j+r);
        res = window(:);
        res = sort(res);
        img(i-r,j-r) = sum(res(d/2+1:(2*r+1)^2-d/2))/((2*r+1)^2-d);
    end
end
subplot(1,3,2);
imshow(img);
title('Alpha-Trimmed Mean Filter');
LEN = 100;
THETA = 135;
PSF = fspecial('motion', LEN, THETA);
wnr1 = deconvwnr(img, PSF, 0.0005);
subplot(1,3,3);
imshow(wnr1);
title('Wiener Filtering');
