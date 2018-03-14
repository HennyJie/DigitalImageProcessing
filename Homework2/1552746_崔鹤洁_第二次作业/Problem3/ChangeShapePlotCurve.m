clear all;
img = imread('Penta2.png');
img = rgb2gray(img);
ssim_square = [];
ssim_circle = [];
ssim_cross = [];

for i = 0:0.05:1
    
    img_noi = imnoise(img,'salt & pepper',i);

    square = Square(img_noi, 5);
%     subplot(131);imshow(img);title('Original');
%     subplot(132);imshow(img_noi);title('AddNoise');
%     subplot(133);imshow(square);title('Square');
    [ssimval1, ssimmap1] = ssim(square,img);
    ssim_square = [ssim_square, ssimval1];
    fprintf('The SSIM value of square filter at noise %0.2f is %0.4f.\n', i, ssimval1);

    circle = Circle(img_noi, 5);
%     subplot(131);imshow(img);title('Original');
%     subplot(132);imshow(img_noi);title('AddNoise');
%     subplot(133);imshow(circle);title('Circle');
    [ssimval2, ssimmap2] = ssim(circle,img);
    ssim_circle = [ssim_circle, ssimval2];
    fprintf('The SSIM value of circle filter at noise %0.2f is %0.4f.\n', i, ssimval2);

    cross = Cross(img_noi, 5);
%     subplot(131);imshow(img);title('Original');
%     subplot(132);imshow(img_noi);title('AddNoise');
%     subplot(133);imshow(cross);title('Cross');
    [ssimval3, ssimmap3] = ssim(cross,img);
    ssim_cross = [ssim_cross, ssimval3];
    fprintf('The SSIM value of cross filter at noise %0.2f is %0.4f.\n', i, ssimval3);
end

x = 0:0.05:1;
figure
plot(x, ssim_square);
hold on;
plot(x, ssim_circle);
hold on;
plot(x, ssim_cross);
title('SSIM Comparison of different windowShape');
xlabel('Noise Rate');
ylabel('SSIM Value');
legend('Square Filter','Circle Filter','Cross Filter');