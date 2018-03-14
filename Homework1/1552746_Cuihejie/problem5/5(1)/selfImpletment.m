img=imread('cui.jpg');
img_gray = rgb2gray(img);
figure;

% add noise
img_noi = imnoise(img_gray,'salt & pepper',0.02);
img_gaus = img_noi;

% Rule of thumb: set filter half-width to about 3¦Ò
sigma = 0.5;
% create a Gauss filter of size 4x4
gausFilter = fspecial('gaussian', [3,3], sigma);

[m ,n] = size(img_noi);
% padding
padding_width = 2;
img_noi = padarray(img_noi,[padding_width padding_width],0);
% rotate the gausFilter
gausFilter = rot90(gausFilter,2);
% convolution
for i = padding_width+1:padding_width+m
    for j = padding_width+1:padding_width+n
        temp = img_noi(i-1:i+1,j-1:j+1);
        img_gaus(i-padding_width,j-padding_width) = sum(sum(double(temp).*gausFilter));
    end
end

subplot(1,3,1);
imshow(img_gray);
title('Original')

subplot(1,3,2);
imshow(img_noi);
title('noise')

subplot(1,3,3);
imshow(img_gaus);
title('GaussFilter')