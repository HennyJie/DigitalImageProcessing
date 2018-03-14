img_Q11 = imread('img/Q_1_1.tif');
img_Q12 = imread('img/Q_1_2.tif');

img_he_Q11 = histeq(img_Q11);
img_he_Q12 = histeq(img_Q12);

figure;

subplot(2,2,1);
imshow(img_Q11);
title('Q\_1\_1');

subplot(2,2,2);
imshow(img_Q12);
title('Q\_1\_2');

subplot(2,2,3);
imshow(img_he_Q11);
title('Q\_1\_1\_histeq');

subplot(2,2,4);
imshow(img_he_Q12);
title('Q\_1\_2\_histeq');