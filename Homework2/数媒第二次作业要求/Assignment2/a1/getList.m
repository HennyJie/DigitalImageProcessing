function [ res ] = getList( img, coo, win_size )

res = [];
[h,d] = size(img);
min = coo - floor(win_size/2);
max = coo + floor(win_size/2);

res = img(min(1) : max(1) , min(2) : max(2));
res = res(:);
res = res';

end

