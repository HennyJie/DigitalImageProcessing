img=imread('cui.jpg');
img_gray = rgb2gray(img);
figure;

% add noise
img_noi = imnoise(img_gray,'salt & pepper',0.02);

% Rule of thumb: set filter half-width to about 3¦Ò
sigma = 0.5;
% create a Gauss filter of size 4x4
gausFilter = fspecial('gaussian', [3,3], sigma);

% Gauss filtering
gaus= imfilter(img_noi, gausFilter, 'replicate');

subplot(1,3,1);
imshow(img_gray);
title('Original')

subplot(1,3,2);
imshow(img_noi);
title('noise')

subplot(1,3,3);
imshow(gaus);
title('GaussFilter')