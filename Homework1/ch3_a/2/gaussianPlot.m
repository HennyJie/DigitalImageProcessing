function [ ] = gaussianPlot(x,y,sigma )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
p = 200;
z = 1/(2*pi*sigma^2) * exp(-(x.^2+y.^2)/(2*sigma^2));
mesh(x,y,z)
axis([-p p -p p 0 0.0001]);
title(['sigma=' num2str(sigma)]);

end

