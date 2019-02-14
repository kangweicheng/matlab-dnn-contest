function imd_rotate = transform(imd, im_index, images_num)
%TRANSFORM Summary of this function goes here
%   Detailed explanation goes here
imd_rotate ={};
for j = 1:im_index
    imgs = {};
    image_ori = readimage(imd, j);
    for i = 1:images_num
        angle = randi( [ 0, 360 ], 1, 1);
        position = randi([-100, 100], 1, 2);
        image = imrotate(image_ori, angle);
        image = imtranslate(image, position);
        imgs(end+1) = { image };
    end
    imd_rotate(end+1) = { imgs };
end


