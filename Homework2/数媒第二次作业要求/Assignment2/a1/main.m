img_Q_1_1 = imread('../img/Q_1_1.tif');
img_Q_1_2 = imread('../img/Q_1_2.tif');

figure;

subplot(3,2,1);
imshow(img_Q_1_1);
title('img\_Q\_1\_1')

subplot(3,2,2);
imshow(img_Q_1_2);
title('img\_Q\_1\_2')

subplot(3,2,3);
res_max = MaxOrMinFilter(img_Q_1_1, 3, true);
imshow(res_max);
title('img\_Q\_1\_1 with max filter')

subplot(3,2,4);
res_min = MaxOrMinFilter(img_Q_1_2, 3, false);
imshow(res_min);
title('img\_Q\_1\_2 with min filter')

subplot(3,2,5);
res_AM_1 = AdaptiveMedianFilter(img_Q_1_1, 5);
imshow(res_AM_1);
title('img\_Q\_1\_1 with AM filter')

subplot(3,2,6);
res_AM_2 = AdaptiveMedianFilter(img_Q_1_2, 5);
imshow(res_AM_2);
title('img\_Q\_1\_2 with AM filter')


img_Q_1_3 = imread('../img/Q_1_3.tif');
img_Q_1_4 = imread('../img/Q_1_4.tif');
figure;

subplot(3,2,1);
imshow(img_Q_1_3);
title('img\_Q\_1\_3')

subplot(3,2,2);
imshow(img_Q_1_4);
title('img\_Q\_1\_4')

subplot(3,2,3);
res_AM_3 = AdaptiveMedianFilter(img_Q_1_3, 10);
imshow(res_AM_3);
title('img\_Q\_1\_3 with AM filter')

subplot(3,2,4);
res_AM_4 = AdaptiveMedianFilter(img_Q_1_4, 10);
imshow(res_AM_4);
title('img\_Q\_1\_4 with AM filter')

subplot(3,2,6);
res_ATM_4 = AlphaTrimmedMeanFilter(img_Q_1_4, 5, 10);
imshow(res_ATM_4);
title('img\_Q\_1\_4 with ATM filter')