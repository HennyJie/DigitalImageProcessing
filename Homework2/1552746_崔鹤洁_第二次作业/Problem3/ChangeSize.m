img = imread('Penta2.png');
img = rgb2gray(img);
subplot(321);imshow(img);title('Original');
img_noi = imnoise(img,'salt & pepper',0.5);
subplot(322);imshow(img_noi);title('Salt&Pepper');

r1 = medfilt2(img_noi,[3,3]);
subplot(323);imshow(r1);title('Filter 3*3');
[ssimval1, ssimmap1] = ssim(r1,img);
fprintf('The SSIM value is %0.4f.\n',ssimval1);

r2 = medfilt2(img_noi,[5,5]);
subplot(324);imshow(r2);title('Filter 5*5');
[ssimval2, ssimmap2] = ssim(r2,img);
fprintf('The SSIM value is %0.4f.\n',ssimval2);

r3 = medfilt2(img_noi,[7,7]);
subplot(325);imshow(r3);title('Filter 7*7');
[ssimval3, ssimmap3] = ssim(r3,img);
fprintf('The SSIM value is %0.4f.\n',ssimval3);

r4 = medfilt2(img_noi,[9,9]);
subplot(326);imshow(r4);title('Filter 9*9');
[ssimval4, ssimmap4] = ssim(r4,img);
fprintf('The SSIM value is %0.4f.\n',ssimval4);