function [rgb, shape] = background_substraction2(imd, i)
%THRESHOLD_AND_HISTEQUAL Summary of this function goes here
%   Detailed explanation goes here
rgb = 0;

img = readimage(imd,i);
ycbcr = rgb2ycbcr(img);
y = ycbcr(:,:,1);
y = double(y);

lp = fspecial('average',50);
ground = filter2(lp,double(y),'same');
shape = uint8(y - ground + 128);

lp = fspecial('average',5);
shape = filter2(lp,double(shape),'same');
shape = uint8(shape);

shape = edge(shape);
shape(shape~= 0) = 255;
shape = medfilt2(shape);

lp = fspecial('average',5);
shape = filter2(lp,double(shape),'same');
shape(shape>0.02) = 255;
shape = uint8(shape);
end

