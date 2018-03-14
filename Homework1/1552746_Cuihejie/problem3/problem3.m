img1=imread('Q_1_1.tif');
img2=imread('Q_1_2.tif');

%Implement the histogram equalization
im_histeq1=histeq(img1);
im_histeq2=histeq(img2);

%show figure1 before equalized
figure(1);
subplot(2,2,1);
imshow(img1);
title('original1')

%show figure1's Hist before equalized
subplot(2,2,2);
imhist(img1,64);
title('orignal1Hist')

%show figure1 after equalized
subplot(2,2,3);
imshow(im_histeq1);
title('equalized1')

%show figure1's Hist after equalized
subplot(2,2,4);
imhist(im_histeq1,64);
title('equalized1Hist')

%show figure2 before equalized
figure(2);
subplot(2,2,1);
imshow(img2);
title('original2')

%show figure2's Hist before equalized
subplot(2,2,2);
imhist(img2,64);
title('orignal2Hist')

%show figure2 after equalized
subplot(2,2,3);
imshow(im_histeq2);
title('equalized2')

%show figure2's Hist after equalized
subplot(2,2,4);
imhist(im_histeq2,64);
title('equalized2Hist')
