function [ img_med ] = adaptiveMedianFilter( img, S_max)

[h,d] = size(img);
img_med = zeros(h+2*S_max,d+2*S_max);
img = double(img);

img = padarray(img, [S_max S_max], 'replicate');

for x = (1:h) + S_max
    for y = (1:d) +S_max
        stage = 1;
        now_win = 3;
        pxList = getList(img, [x,y], now_win); % pixels value list
        pxList = sort(pxList);
        while(true)
            med_index = ceil(now_win^2 /2);
            
            z_med = pxList(med_index);
            z_max = pxList(now_win^2);
            z_min = pxList(1);
            z_xy  = img(x,y);
            
            if(stage == 1) % stage A
                A1 = z_med - z_min;
                A2 = z_med - z_max;
                if A1>0 && A2<0
                    stage = 0;
                    continue;
                else
                    now_win = now_win + 2;
                end
                
                if now_win <= S_max
                    stage = 1;
                    pxList = getList(img, [x,y], now_win);
                    pxList = sort(pxList);
                    continue;
                else
                    img_med(x,y) = z_med;
                    break;
                end
            else % stage B
                B1 = z_xy - z_min;
                B2 = z_xy - z_max;
                if B1>0 && B2<0
                    img_med(x,y) = z_xy;
                    break;
                else
                    img_med(x,y) = z_med;
                    break;
                end
            end
        end
        
    end
end

img_med = img_med((1:h) + S_max,(1:d) +S_max);

end

