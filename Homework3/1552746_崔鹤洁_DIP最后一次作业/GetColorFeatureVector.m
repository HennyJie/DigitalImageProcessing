% get the color feature vector of a label's area 
function colorFeatureVector = GetColorFeatureVector(im,intervalNum)
[m,n,k] = size(im);
intervalLength = 256/intervalNum;
colorFeatureVector = zeros(k, intervalNum);

for i = 1:m
    for j = 1:n
        for q = 1:k
            temp= ceil(im(i,j,q)/intervalLength);
            if temp==0
                temp=1;
            end
            colorFeatureVector(q, temp) = colorFeatureVector(q, temp)+1;
        end
    end
end

s = sum(colorFeatureVector,2)';
for j = 1:k
    for i =1:intervalNum
        colorFeatureVector(j,i) = double(colorFeatureVector(j,i))/double(s(j));
    end
end
colorFeatureVector = reshape(colorFeatureVector', 1, k*intervalNum);
