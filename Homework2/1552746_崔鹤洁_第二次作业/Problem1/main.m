%perform max filtering and adaptive median filtering to image Q_1_1
imgPepper = imread('Q_1_1.tif');
figure;
subplot(1,3,1);
imshow(imgPepper,[ ]);
title('image Q\_1\_1');
maxFilteredPepperImg = ordfilt2(imgPepper, 9, ones(3,3));
subplot(1,3,2)
imshow(maxFilteredPepperImg,[ ]);
title('max filter');
ADMFilteredPepperImg1 = AdaptiveMedianFilter(imgPepper);
subplot(1,3,3)
imshow(ADMFilteredPepperImg1,[ ]);
title('adaptive median filter');

%perform min filtering and adaptive median filtering to image Q_1_2
imgSalt = imread('Q_1_2.tif');
figure;
subplot(1,3,1);
imshow(imgSalt,[ ]);
title('image Q\_1\_2');
minFilteredSaltImg = ordfilt2(imgSalt, 1, ones(3,3));
subplot(1,3,2);
imshow(minFilteredSaltImg,[ ]);
title('min filter');
ADMFilteredPepperImg2 = AdaptiveMedianFilter(imgSalt);
subplot(1,3,3)
imshow(ADMFilteredPepperImg2,[ ]);
title('adaptive median filter');

%perform adaptive median filtering to image Q_1_3
imgNoise = imread('Q_1_3.tif');
figure;
subplot(1,2,1);
imshow(imgNoise,[ ]);
title('image Q\_1\_3');
imgAdaptive3 = AdaptiveMedianFilter(imgNoise);
subplot(1,2,2);
imshow(imgAdaptive3,[ ]);
title('filtered by adaptive median filter');

%perform adaptive median filtering and alphatrimmed mean filtering to image Q_1_4
imgPepperAndSalt = imread('Q_1_4.tif');
figure;
subplot(2,2,1);
imshow(imgPepperAndSalt,[ ]);
title('image Q\_1\_4');

imgAdaptive4 = AdaptiveMedianFilter(imgPepperAndSalt);
subplot(2,2,2);
imshow(imgAdaptive4,[ ]);
title('adaptive median filter');

imgAlphaTrim1 = AlphaTrim(imgPepperAndSalt, 5, 5, 10);
subplot(2,2,3);
imshow(imgAlphaTrim1,[ ]);
title('alpha-trimmed mean filter1');

imgAlphaTrim2 = AlphaTrimmedMeanFilter(imgPepperAndSalt, 5, 10);
subplot(2,2,4);
imshow(imgAlphaTrim2,[ ]);
title('alpha-trimmed mean filter2');





