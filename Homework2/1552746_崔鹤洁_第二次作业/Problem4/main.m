im = im2single(imread('Q3_3.tif'));
[rows, cols] = size(im);
figure;
subplot(1,3,1);
imshow(im);
title('Input image');

%pad the image to its double size by populating zeros
paddedIm = padarray(im, [rows, cols],'post');
imfft = fft2(paddedIm);
imfftShifted = fftshift(imfft);

%construct a low-pass filter of a Gaussian shape in the Fourier domain
D0 = 50;
n = 4;
HPFilterKernel = 1 - ButterworthFilter(D0, 2*rows, 2*cols,n);
modifiedFourierTransform = ifftshift(imfftShifted .* HPFilterKernel);

%go back to the spatial domain
resultInSpatialDomain = real(ifft2(modifiedFourierTransform));

%extract the final processed result 
finalResult = resultInSpatialDomain(1:rows, 1:cols);
% do the normalize
maxValue = max(max(finalResult));
minValue = min(min(finalResult));
range = maxValue - minValue;
normalize = finalResult;
for i = 1:rows
    for j = 1:cols
        normalize(i,j) = ((finalResult(i,j)-minValue))/range;
    end
end

subplot(1,3,2);
imshow(normalize, [0, 1]);
hold on;
imwrite(normalize, 'result/ResultOfHighpassFilteringA.bmp')
title('Result of highpass filtering A');
for i = 1:rows
    for j = 1:cols
        if finalResult(i,j) > 0.035
            finalResult(i,j) = 1;
        else
            finalResult(i,j) = 0;
        end
    end
end
subplot(1,3,3);
imshow(finalResult,[0,1]);
imwrite(finalResult, 'result/ResultOfThresholdingB.bmp')
title('Result of thresholding B');


