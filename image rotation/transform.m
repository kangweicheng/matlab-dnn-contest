function imgs = transform(imd, im_index, images_num)
%TRANSFORM Summary of this function goes here
%   Detailed explanation goes here
imgs = [];
image_ori = readimage(imd, im_index);
for i = 1:images_num
    angle = randi( [ 0, 360 ], 1, 1);
    position = randi([-100, 100], 1, 2);
    image = imratate(image_ori, angle);
    image = imtranslate(image, position);
    imgs = [imgs cell(image)];
end

