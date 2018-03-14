img=imread('cui.jpg');
img_gray = rgb2gray(img);
figure;

% add noise
img_noi = imnoise(img_gray,'salt & pepper',0.02);

% Rule of thumb: set filter half-width to about 3¦Ò
sigma = 0.5;
% create a Gauss filter of size 4x4
gausFilter = fspecial('gaussian', [3,3], sigma);

img_convo = conv2(double(img_noi),gausFilter,'same');
img_convo = uint8(img_convo);

subplot(1,3,1);
imshow(img_gray);
title('Original')

subplot(1,3,2);
imshow(img_noi);
title('noise')

subplot(1,3,3);
imshow(img_convo);
title('GaussFilter')