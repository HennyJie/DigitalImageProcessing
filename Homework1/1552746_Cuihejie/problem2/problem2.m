clear all
clc
X = 0 : 1 : 20;
Y = 0 : 1 : 20;
figure
filename = 'GaussianFunction.gif';

for sigma = 1:9
    % calculate the value of Z
    Z = zeros(21, 21);
    for row = 1 : 1 : 21
        for col = 1 : 1 : 21
            Z(row, col) = (X(row) - 10) .* (X(row)-10) + (Y(col) - 10) .* (Y(col) - 10);          
        end
    end
    Z = -Z/(2*sigma*sigma);
    Z = exp(Z) / (sqrt(2*pi) * sqrt(sigma*sigma));

    % show the gaussian surface       
    surf(X, Y, Z);  
    title(sprintf(' center = ( 10 , 10 ), sigma = %d ',sigma));    
    axis([0 21 0 21 0 0.1]);

    drawnow     
    % get the frame
    frame = getframe(gcf);

    %%To make GIF files, images must be index images 
    im = frame2im(frame);
    [A,map] = rgb2ind(im,256);

    %create it at the first time
    if sigma == 1
        imwrite(A,map,filename,'gif','LoopCount',Inf,'DelayTime',0.2);
    else
        %DelayTime is used to set up GIF files to play fast or slow
        imwrite(A,map,filename,'gif','WriteMode','append','DelayTime',0.2);
    end
end