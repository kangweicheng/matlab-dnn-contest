function [shape] = background_substraction2(imd, i)
%THRESHOLD_AND_HISTEQUAL Summary of this function goes here
%   Detailed explanation goes here
img = readimage(imd,i);
ycbcr = rgb2ycbcr(img);
y = ycbcr(:,:,1);

shape(:,:,1) = edge(y);
shape(:,:,2) = edge(y);
shape(:,:,3) = edge(y);
end

