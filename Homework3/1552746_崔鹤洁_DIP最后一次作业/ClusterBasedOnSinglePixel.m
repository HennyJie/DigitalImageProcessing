% cluster the single pixels using their color information
function img = ClusterBasedOnSinglePixel(img)
[x, y] = size(img);
y = y/3;
colorVector = zeros(x*y,3);
id = 1;
for i = 1:x
    for j = 1:y
        colorVector(id,1) = img(i,j,1);
        colorVector(id,2) = img(i,j,2);
        colorVector(id,3) = img(i,j,3);
        id = id+1;
    end
end
T = kmeans(colorVector, 7);
clusterLabelsBasedOnSinglePixel = zeros(x, y);
for i = 0:x-1
    for j = 1:y
        clusterLabelsBasedOnSinglePixel(i+1,j) = T(i*y+j);
    end
end
img = ShowEdge(img,clusterLabelsBasedOnSinglePixel);
figure;
imagesc(clusterLabelsBasedOnSinglePixel);
