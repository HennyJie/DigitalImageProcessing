im = im2single(imread('../img/Q_3_3.tif'));
[rows, cols] = size(im);

%pad the image to its double size by populating zeros
paddedIm = padarray(im, [rows, cols],'post');
imfft = fft2(paddedIm);
imfftShifted = fftshift(imfft);

%construct a low-pass filter (of a Gaussian shape) in the Fourier domain
D0 = 40;
n = 4;
HPFilterKernel = 1 - ButterworthFilter(D0, 2*rows, 2*cols,n);
modifiedFourierTransform = ifftshift(imfftShifted .* HPFilterKernel);

%go back to the spatial domain
resultInSpatialDomain = real(ifft2(modifiedFourierTransform));

%extract the final processed result 
finalResult = resultInSpatialDomain(1:rows, 1:cols);
figure;
finalResult(finalResult<0) = 0;
finalResult(finalResult>1) = 1;
imwrite(double(finalResult), 'res/res_1.tif', 'tif');
imshow(finalResult,[0,1]);
