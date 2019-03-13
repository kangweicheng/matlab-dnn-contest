path('..',path);
root = folder_name();
path('../generate_imd',path);
process_image_index_single = [1:10];
process_image_index_double = [1:10];
%%
imd = imageDatastore([root '\Train_single']);
imd_double = imageDatastore([root '\Train_double']);
%image_1 = readimage(imd,1);
%img = zeros([size(image_1) len_of_data]);
%%
fprintf('start single labeling ...    ')
[imd,label_single] = youan_labeling(imd, root) ;
fprintf('done!\n')
fprintf('start double labeling ...    ')
[imd_double,label_double] = youan_labeling_double(imd_double,root);
fprintf('done!\n')
%%
youan_substraction_to_new_folder(imd,imd_double,process_image_index_single,process_image_index_double);
%% output
imd = imageDatastore([root '\Post_Train_single']);
imd_double = imageDatastore([root '\Post_Train_double']);
img_percent_single_double = [process_image_index_single/length(imd.Files) process_image_index_double/length(imd_double.Files)]
len_of_data = ( length(process_image_index_single)+length(process_image_index_double) );
subplot(1,2,1);
imshow(readimage(imd,1));
subplot(1,2,2);
imshow(readimage(imd_double,1));
toc