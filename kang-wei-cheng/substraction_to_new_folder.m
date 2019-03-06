%%% root的部分記得改成你們自己的root
root = folder_name();
postprocessing_folder = '\Post_Train_single';
process_image_index_single = [1:103];

%%
tic
for i = process_image_index_single
    [img] = background_substraction(imd, i);
    label = uint8(imd.Labels(i));
    index = sprintf('%08d', i);
    imwrite(img,[root postprocessing_folder '/B' num2str(label) '_' index '.jpg'], 'jpg');
end

%%
toc