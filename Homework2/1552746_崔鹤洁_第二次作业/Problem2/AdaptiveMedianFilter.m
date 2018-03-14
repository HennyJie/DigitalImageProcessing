% This function is used for adaptive median filter
function[img_adaptive] = AdaptiveMedianFilter(img_noi)
    [m ,n] = size(img_noi);
    img_noi=padarray(img_noi,[11 11],0);
    img_adaptive=img_noi;
    for i = 12:m+12
        for j = 12:n+12
            Zxy = img_noi(i,j);       
            window = 3;
            while(window <= 11)        
                tmp = img_noi(i-(window-1)/2:i+(window-1)/2,j-(window-1)/2:j+(window-1)/2);
                Zmin = min(min(tmp));
                Zmax = max(max(tmp));
                Zmed = median(tmp(:));
                if((Zmed > Zmin) && (Zmed < Zmax))             
                    if((Zxy > Zmin) && (Zxy < Zmax))
                        img_adaptive(i,j) = Zxy;
                    else
                        img_adaptive(i,j) = Zmed;
                    end     
                    break;
                end
                window = window+2; 
            end
            img_adaptive(i,j)=Zmed;
        end
    end
    img_adaptive=img_adaptive(12:12+m,12:12+n);
end
