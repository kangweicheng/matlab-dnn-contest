%%% root的部分記得改成你們自己的root
root = folder_name();
%path = path('.\generate_label',path);
imd_category = 'single';
%im_index must more than 128
im_index = [1:129];
images_num = 5;
%%
imd = imageDatastore([root '\Train_single']);
imd_double = imageDatastore([root '\Train_double']);
fprintf('start single labeling ...    ')
[imd,label_single] = labeling(imd, root);
fprintf('done!\n')
fprintf('start double labeling ...    ')
[imd_double,label_double] = labeling_double(imd_double,root);
fprintf('done!\n')
%%
imageSize = [10 10 3];
if isequal(imd_category, 'single')
    imgs = transform_2(imageSize,imd, label_single, im_index);
elseif isequal(imd_category, 'double')
    imgs = transform_2(imageSize,imd_double, label_double, im_index);
end
preview(imgs)
