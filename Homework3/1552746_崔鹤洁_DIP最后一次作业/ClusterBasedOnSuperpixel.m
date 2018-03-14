function img = ClusterBasedOnSuperpixel(img,featureVector,labels, num)
% cluster the superpixel using their feature vectors
Z = linkage(featureVector,'average', 'euclidean');
T = cluster(Z,'maxclust', num);
% Z = linkage(featureVector,'average', 'correlation');
% T = cluster(Z,'maxclust', num);
% T = kmeans(featureVector, 4);
[x,y] = size(labels);
clusterLabels = zeros(x, y);
for i = 1:x
    for j = 1:y
        clusterLabels(i,j) = T(labels(i,j));
    end
end
img = ShowEdge(img,clusterLabels);
figure;
imagesc(clusterLabels);
