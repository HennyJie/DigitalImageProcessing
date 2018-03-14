img = imread('img/luo.png');
img = rgb2gray(img);
img_noise = imnoise(img,'salt & pepper',0.1);
img_medi = adaptiveMedianFilter(img_noise,11);

figure;
subplot(1,3,1);
imshow(img,[]);

subplot(1,3,2);
imshow(img_noise,[]);

subplot(1,3,3);
imshow(img_medi,[]);