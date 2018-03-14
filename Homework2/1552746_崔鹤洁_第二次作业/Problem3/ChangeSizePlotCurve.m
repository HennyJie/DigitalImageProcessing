img = imread('Penta2.png');
img = rgb2gray(img);
% subplot(321);imshow(img);title('Original');
ssim_window3 = [];
ssim_window5 = [];
ssim_window7 = [];
ssim_window9 = [];
for i = 0:0.05:1    
    img_noi = imnoise(img,'salt & pepper',i);
%     subplot(322);imshow(img_noi);title('Salt&Pepper');

    r1 = medfilt2(img_noi,[3,3]);
%     subplot(323);imshow(r1);title('Filter 3*3');
    [ssimval1, ssimmap1] = ssim(r1,img);
    ssim_window3 = [ssim_window3, ssimval1];
    fprintf('The SSIM value of 3*3 at noise %0.2f is %0.4f.\n', i, ssimval1);

    r2 = medfilt2(img_noi,[5,5]);
%     subplot(324);imshow(r2);title('Filter 5*5');
    [ssimval2, ssimmap2] = ssim(r2,img);
    ssim_window5 = [ ssim_window5, ssimval2];
    fprintf('The SSIM value of 5*5 at noise %0.2f is %0.4f.\n', i, ssimval2);

    r3 = medfilt2(img_noi,[7,7]);
%     subplot(325);imshow(r3);title('Filter 7*7');
    [ssimval3, ssimmap3] = ssim(r3,img);
    ssim_window7 = [ ssim_window7, ssimval3];
    fprintf('The SSIM value of 7*7 at noise %0.2f is %0.4f.\n', i, ssimval3);

    r4 = medfilt2(img_noi,[9,9]);
%     subplot(326);imshow(r4);title('Filter 9*9');
    [ssimval4, ssimmap4] = ssim(r4,img);
    ssim_window9 = [ ssim_window9, ssimval4];
    fprintf('The SSIM value of 9*9 at noise %0.2f is %0.4f.\n', i, ssimval4);
end

x = 0:0.05:1;
figure
plot(x, ssim_window3);
hold on;
plot(x, ssim_window5);
hold on;
plot(x, ssim_window7);
hold on;
plot(x, ssim_window9);
title('SSIM Comparison of different windowSizes');
xlabel('Noise Rate');
ylabel('SSIM Value');
legend('windowSize=3','windowSize=5','windowSize=7','windowSize=9');