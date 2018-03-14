img = imread('img/Q_2.tif');
img_medi = adaptiveMedianFilter(img,11);
imshow(img_medi,[]);