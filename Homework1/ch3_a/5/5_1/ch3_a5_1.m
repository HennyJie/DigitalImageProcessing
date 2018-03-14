img = imread('img/g_test.png');
img = rgb2gray(img);
img = double(img);
g = fspecial('gaussian',3,3);
img_conv = conv2(img,g,'same');

figure;
subplot(1,2,1);
imshow(img,[]);
title('Original');

subplot(1,2,2);
imshow(img_conv,[]);
title('3*3 Gaussian Filter');