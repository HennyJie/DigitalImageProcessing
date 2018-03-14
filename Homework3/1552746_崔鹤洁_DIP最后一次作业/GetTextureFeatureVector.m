% use gabor filter to get the texture feature vector of a label's area 
function textureFeatureVector = GetTextureFeatureVector(img)
[m, ~] = gaborconvolve(img, 4, 6, 3, 1.7, 0.65, 1.3, 0, 1);
[imgx, imgy, ~] = size(img);
featureMatric = cell2mat([m(2,2), m(3,4), m(4,6)]);
featureMatric = reshape(featureMatric, [imgx, imgy, 3]);
featureMatric = abs(featureMatric);
% normalize
[x,y,~] = size(featureMatric);
for k = 1:3
    mi = min(min(featureMatric(:,:,k)));
    ma = max(max(featureMatric(:,:,k)));
    for i = 1:x
        for j = 1:y
            featureMatric(i,j,k) = 255*featureMatric(i,j,k)/(ma-mi);
        end
    end
end

featureMatric = uint8(featureMatric);
textureFeatureVector = GetColorFeatureVector(featureMatric, 10);


