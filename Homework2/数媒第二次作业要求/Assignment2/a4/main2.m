im = imread('res/res_1.tif');
im = im2single(im);
imshow(im);
threshold = 0.01;
res = im;
res(im > threshold) = 1;
res(im <= threshold) = 0;
imshow(res);
imwrite(double(res), 'res/res_2.tif', 'tif');