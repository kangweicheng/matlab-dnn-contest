%%% root�������O�o�令�A�̦ۤv��root
root = 'D:\�j�T�W\matlab contest\data';
imd_category = 'single';
im_index = 1;
images_num = 5;
%%
imd = imageDatastore([root '\Train_single']);
imd_double = imageDatastore([root '\Train_single']);
if isequal(imd_category, 'single')
    imgs = transform(imd, im_index, images_num);
elseif isequal(imd_category, 'double')
    imgs = transform(imd_double, im_index, images_num);
end
image = cell2mat(imgs(0));
imshow(image)