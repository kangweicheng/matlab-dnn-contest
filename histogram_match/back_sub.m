function [rgb] = back_sub(imd, i)
%THRESHOLD_AND_HISTEQUAL Summary of this function goes here
%   Detailed explanation goes here
img = readimage(imd,i);
ycbcr = rgb2ycbcr(img);
y = ycbcr(:,:,1);
%%
lp = fspecial('average',5);
y = filter2(lp,double(y),'same');
%%
BW = edge(y);
%%
lp = fspecial('average',30);
region = filter2(lp,double(BW),'same');
%%
region(region < 0.05) = 0;
region(region > 0) = 255;
%%
lp = fspecial('average',300);
im2 = filter2(lp,region,'same');
%%
im2(im2 < 5) = 0;
im2(im2 > 0) = 255;
%%
y2 = zeros(size(y));
y2(im2 == 0) = 0;
y2(im2 ~= 0) = y(im2 ~= 0);
ycbcr(:,:,1) = y2;

rgb = ycbcr2rgb(ycbcr);
end

