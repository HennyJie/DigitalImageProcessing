clear;
img=imread('cui.jpg');
img_gray = rgb2gray(img);
img_adj = img_gray;

% let the user input the target range of intensities values
targetMax = input('Please input target I_max(0~255)£º');
targetMin = input('Please input target I_min(0~255)£º');

new_range = targetMax-targetMin;

% Linear projection imadjust
[m,n] = size(img_gray);
for i = 1:m
    for j = 1:n
        img_adj(i,j) = targetMin+img_gray(i,j)*(new_range/256);
    end
end

figure;

subplot(2,2,1);
imshow(img_gray);
title('original')

subplot(2,2,2);
imhist(img_gray,64);
title('imhist1')

subplot(2,2,3);
imshow(img_adj);
title('adjust')

subplot(2,2,4);
imhist(img_adj,64);
title('imhist2')