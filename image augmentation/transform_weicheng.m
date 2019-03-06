function [image_ori, imgs] = transform_weicheng(imd, im_index, images_num)
%TRANSFORM Summary of this function goes here
%   Detailed explanation goes here
imgs = [];
image_ori = readimage(imd, im_index);
for i = 1:images_num
    tform = affine2d([0,1,0;1,0,0;1,0,1;]);
    angle = randi( [ 0, 360 ], 1, 1);
    position = randi([-100, 100], 1, 2);
    image = imrotate(image_ori, angle, 'bilinear', 'loose');
    image = imtranslate(image, position);
    imgs = [imgs {image}];
end


