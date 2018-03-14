img_1 = imread('Q_2_1.tif');
img_2 = imread('Q_2_2.tif');
img_3 = imread('Q_2_3.tif');

psf = PSF(98, 135);

resultATM_1 = AlphaTrimmedFilter(img_1, 5, 10);
result_1 = deconvwnr(resultATM_1, psf, 0.008);
resultATM_2 = AlphaTrimmedFilter(img_2, 5, 10);
result_2 = deconvwnr(resultATM_2, psf, 0.003);
result_3 = deconvwnr(img_3, psf, 0.0003);

figure;
% original 1
subplot(2,3,1);
imshow(img_1);
title('Q\_2\_1');
% filtered 1
subplot(2,3,4);
imshow(result_1);
title('Filtered Q\_2\_1');
imwrite(result_1, 'result/result_Q_2_1.tif', 'tif')

% original 2
subplot(2,3,2);
imshow(img_2);
title('Q\_2\_2');
% filtered 2
subplot(2,3,5);
imshow(result_2);
title('Filtered Q\_2\_2');
imwrite(result_2, 'result/result_Q_2_2.tif', 'tif')

% original 3
subplot(2,3,3);
imshow(img_3);
title('Q\_2\_3');
% filtered 3
subplot(2,3,6);
imshow(result_3);
title('Filtered Q\_2\_3');
imwrite(result_3, 'result/result_Q_2_3.tif', 'tif')


