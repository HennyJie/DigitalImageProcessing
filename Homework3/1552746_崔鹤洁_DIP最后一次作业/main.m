close all;
% get the result of slicomex
img = imread('bee.jpg');
[labels, numlabels] = slicomex(img,500);
figure;
imagesc(labels);
[labelsx,labelsy] = size(labels);
% find the area under the same label
mapKey = 1:numlabels;
% the four values in mapValue correspond to the left, right, up, down side of
% a label's area
mapValue = zeros(numlabels, 4);
for i = 1:numlabels
    mapValue(i,:)= [1000, -1, 1000, -1];
end
labels = labels +1;
for i = 1:labelsx
    for j = 1:labelsy
        if i < mapValue(labels(i,j),1)
            mapValue(labels(i,j), 1) = i;
        end
        if i > mapValue(labels(i,j),2)
            mapValue(labels(i,j), 2) = i;
        end
        if j < mapValue(labels(i,j),3)
            mapValue(labels(i,j), 3) = j;
        end
        if j > mapValue(labels(i,j),4)
            mapValue(labels(i,j), 4) = j; 
        end
    end
end
% show the edge of result image
figure;
imshow(ShowEdge(img,labels));

% get the colorFeatureVector and textFeatureVector
colorFeatureVector = zeros(numlabels, 30);
textureFeatureVector = zeros(numlabels, 30);
for t = 1:numlabels
%     imgTemp is an area under a specific label
     imgTemp = img(mapValue(t,1):mapValue(t,2), mapValue(t,3):mapValue(t,4),:);
     temp = GetColorFeatureVector(imgTemp, 10);
     colorFeatureVector(t,:) = temp;
     temp = GetTextureFeatureVector(imgTemp);
     textureFeatureVector(t,:) = temp;
end
% merge the color and texture to get a featureVector for every superpixel
featureVector = [colorFeatureVector,textureFeatureVector];

% Cluster the superpixles using the featureVector
imgSuper = ClusterBasedOnSuperpixel(img,featureVector,labels,5);
figure;
imshow(imgSuper);
% Cluster the single pixles using the color information
imgSinglePixel = ClusterBasedOnSinglePixel(img);
figure;
imshow(imgSinglePixel);
       