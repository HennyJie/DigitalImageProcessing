clear;
img=imread('cui.jpg');
img_gray = rgb2gray(img);

% let the user input the target range of intensities values
targetMax = input('Please input target I_max(0~255)£º');
targetMin = input('Please input target I_min(0~255)£º');
% Change the target range from 0 to 1 to use the adjust function
targetMax = targetMax/256;
targetMin = targetMin/256;

% find the maximum and minimum intensities values of the input image
counts = imhist(img_gray);
minBinValue = find(counts>0, 1, 'first');
minBinValue = minBinValue/256;
maxBinValue = find(counts>0, 1, 'last');
maxBinValue = maxBinValue/256;

% spreading the intensities of the input image
img_adj = imadjust(img_gray,[minBinValue,maxBinValue],[targetMin,targetMax]);

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