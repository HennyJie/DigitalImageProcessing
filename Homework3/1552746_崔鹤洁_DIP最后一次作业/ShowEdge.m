function img = ShowEdge(img,labels)
[x,y] = size(labels);
labels = padarray(labels, [1,1], 'replicate');
for i = 2:x+1
    for j = 2:y+1
        if labels(i,j) ~= labels(i-1, j) || labels(i, j) ~= labels(i+1, j)... 
            || labels(i, j) ~= labels(i, j-1) || labels(i, j) ~= labels(i, j+1)...
            || labels(i, j) ~= labels(i-1, j-1) || labels(i, j) ~= labels(i-1, j+1)...
            || labels(i, j) ~= labels(i+1, j-1) || labels(i, j) ~= labels(i+1, j+1)
            img(i-1, j-1, 1) = 255;
        end
    end
end
