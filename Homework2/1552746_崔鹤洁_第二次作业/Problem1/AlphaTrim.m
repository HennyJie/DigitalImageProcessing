function f = AlphaTrim(img, m, n, d)
   if (d <= 0) || (d/2 ~= round(d/2))
      error('d must be a positive, even integer.')
   end
img = im2double(img);
f = imfilter(img, ones(m, n), 'symmetric');
for k = 1:d/2
   f = imsubtract(f, ordfilt2(img, k, ones(m, n), 'symmetric'));
end
for k = (m*n-(d/2)+1) : m*n
   f = imsubtract(f, ordfilt2(img, k, ones(m, n), 'symmetric'));
end
f = f/(m*n-d);