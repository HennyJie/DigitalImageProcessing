clear all;
img = imread('Penta2.png');
img = rgb2gray(img);
img_noi = imnoise(img,'salt & pepper',0.5);

figure;
square = Square(img_noi, 5);
subplot(221);imshow(img);title('Original');
% subplot(132);imshow(img_noi);title('AddNoise');
subplot(222);imshow(square);title('Square');
[ssimval1, ssimmap1] = ssim(square,img);
fprintf('The SSIM value is %0.4f.\n',ssimval1);

% figure;
circle = Circle(img_noi, 5);
% subplot(131);imshow(img);title('Original');
% subplot(132);imshow(img_noi);title('AddNoise');
subplot(223);imshow(circle);title('Circle');
[ssimval2, ssimmap2] = ssim(circle,img);
fprintf('The SSIM value is %0.4f.\n',ssimval2);

% figure;
cross = Cross(img_noi, 5);
% subplot(131);imshow(img);title('Original');
% subplot(132);imshow(img_noi);title('AddNoise');
subplot(224);imshow(cross);title('Cross');
[ssimval3, ssimmap3] = ssim(cross,img);
fprintf('The SSIM value is %0.4f.\n',ssimval3);