fig = figure('Position',[100,100,1200,600]);

t1=0.05;
t=0.05;

for i=1:100
   p = 200;
    [x,y] = meshgrid(-p:4:p,-p:4:p) ;
    sigma = i;
    gaussianPlot(x,y,sigma);
    
    frame= getframe(fig);
    im=frame2im(frame);
    [I,map]=rgb2ind(im,256);
    k=i-0;
    filename = 'a2.gif';
    if k==1
        imwrite(I,map,filename,'gif','Loopcount',inf,...
            'DelayTime',t1);
    else
        imwrite(I,map,filename,'gif','WriteMode','append',...
            'DelayTime',t);
    end
end

