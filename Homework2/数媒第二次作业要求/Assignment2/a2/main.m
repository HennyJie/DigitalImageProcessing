img_Q_2_1 = imread('../img/Q_2_1.tif');
img_Q_2_2 = imread('../img/Q_2_2.tif');
img_Q_2_3 = imread('../img/Q_2_3.tif');

psf = PSF(98, 135);
res_Q_2_1 = deconvwnr(img_Q_2_1, psf, 0.04);
res_Q_2_2 = deconvwnr(img_Q_2_2, psf, 0.015);
res_Q_2_3 = deconvwnr(img_Q_2_3, psf, 0.00003);

figure;

% original
subplot(2,3,1);
imshow(img_Q_2_1);
title('Q\_2\_1');

subplot(2,3,2);
imshow(img_Q_2_2);
title('Q\_2\_2');

subplot(2,3,3);
imshow(img_Q_2_3);
title('Q\_2\_3');

% filtered
subplot(2,3,4);
imshow(res_Q_2_1);
title('Q\_2\_1 with VN filter');
imwrite(res_Q_2_1, 'res/res_Q_2_1.tif', 'tif')

subplot(2,3,5);
imshow(res_Q_2_2);
title('Q\_2\_2 with VN filter');
imwrite(res_Q_2_2, 'res/res_Q_2_2.tif', 'tif')

subplot(2,3,6);
imshow(res_Q_2_3);
title('Q\_2\_3 with VN filter');
imwrite(res_Q_2_3, 'res/res_Q_2_3.tif', 'tif')


