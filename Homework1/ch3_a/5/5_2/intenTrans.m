function [ img_in ] = intenTrans( img, I_min, I_max )

img = double(img);
pxlist = img(:);
f_max = max(pxlist);
f_min = min(pxlist);
img_in = (img - f_min)./(f_max - f_min);
img_in = img_in .* (I_max - I_min);
img_in = img_in + I_min;
img_in = uint8(img_in);

end

