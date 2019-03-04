%%% root的部分記得改成你們自己的root
root =folder_name();
imd_category = 'single';
im_index = [1];
images_num = 5;
%%
imd = imageDatastore([root '\Train_single']);
imd_double = imageDatastore([root '\Train_double']);
if isequal(imd_category, 'single')
    [image_ori, imgs] = transform(imd, im_index, images_num);
elseif isequal(imd_category, 'double')
    [image_ori, imgs] = transform(imd_double, im_index, images_num);
end

image = imgs{1}{1};
imshow(image)
