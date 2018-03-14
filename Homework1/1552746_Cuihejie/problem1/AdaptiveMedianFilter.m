clear
img = imread('cui.jpg');
img_gray = rgb2gray(img);
img_noi = imnoise(img_gray,'salt & pepper',0.02);
img_adaptive = adaptiveMedianFilter(img_noi,11);

figure;
% original image
subplot(1,3,1);
imshow(img_gray);
title('original')

% noised image
subplot(1,3,2);
imshow(img_noi);
title('noise')

% adaptive median filter image
subplot(1,3,3);
imshow(img_adaptive);
title('adaptiveMed')

function[img_result] = adaptiveMedianFilter(img_noi,max_window)

padding_width = (max_window-1)/2;
[m ,n] = size(img_noi);
% Initialize a image equal size with img_noi to receive pixels after Adaptive Median Filter
img_result = img_noi;
% Fill pixels at the edge of the original image
img_noi = padarray(img_noi,[padding_width padding_width],0);

for i = padding_width+1:padding_width+m
    for j = padding_width+1:padding_width+n
        Zxy = img_noi(i,j);       
        window = 3;      
        while(window <= max_window)      
            %Take the window of the filter plate         
            tmp = img_noi(i-(window-1)/2:i+(window-1)/2,...
            j-(window-1)/2:j+(window-1)/2);
            Zmin = min(min(tmp));
            Zmax = max(max(tmp));
            Zmed = median(tmp(:));
            if((Zmed > Zmin) && (Zmed < Zmax))             
                if((Zxy > Zmin) && (Zxy < Zmax))
                    img_result(i-padding_width,j-padding_width) = Zxy;
                else
                    img_result(i-padding_width,j-padding_width) = Zmed;
                end     
                break;
            end
            window = window+2; 
        end
        img_result(i-padding_width,j-padding_width) = Zmed;
    end
end
end


