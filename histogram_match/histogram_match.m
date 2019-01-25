function [rgb] = histogram_match(imd, i)
%HISTOGRAM_MATCH Summary of this function goes here
%   Detailed explanation goes here
img = readimage(imd,i);
ycbcr = rgb2ycbcr(img);
y = ycbcr(:,:,1);
%%
ref_img = zeros(1080,1440);
ref_img(1:400,:) = repmat(round(((400:-1:1).^2/400^2)*230)',1,1440);
ref_img = uint8(ref_img);
%%
y2 = imhistmatch(y, ref_img);
ycbcr(:,:,1) = y2;
rgb = ycbcr2rgb(ycbcr);
montage({img,rgb})

end

