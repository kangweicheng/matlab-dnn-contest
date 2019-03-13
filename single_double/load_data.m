path('..',path);
root = folder_name();
path('../generate_imd',path);
process_image_index_single = [1:100];
process_image_index_double = [1:100];
%%
imd = imageDatastore([root '\Train_single']);
imd_double = imageDatastore([root '\Train_double']);
%%
youan_substraction_to_new_folder(imd,imd_double,process_image_index_single,process_image_index_double);
%% output
imd_shape = imageDatastore([root '\edge'],'IncludeSubfolders',true, 'LabelSource','foldernames');
img_percent_single_double = [process_image_index_single/length(imd.Files) process_image_index_double/length(imd_double.Files)];
len_of_data = ( length(process_image_index_single)+length(process_image_index_double) );


net_Trans = training(imd_shape);
%%
for i = 1:110
    img = readimage(imd_shape,i);
    img = imresize(img,[227 227]);
    YPred = classify(net_Trans,img);
    YTest = imd_shape.Labels(i);
    if YPred == YTest
        fprintf('YES\n')
    else
        fprintf('NO\n')
    end
end
