img = imread('img/Q_1_1.tif');
img_in = intenTrans(img,0,255);

figure;
subplot(1,2,1);
imshow(img);
title('Original');

subplot(1,2,2);
imshow(img_in);
title('I\_new = [0, 255]');