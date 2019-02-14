%%% root的部分記得改成你們自己的root
root = 'C:\Users\lin\Desktop\matlab-dnn-contest-data';
process_image_index_single = [1];
process_image_index_double = [210];

%%
imd = imageDatastore([root '\Train_single']);
imd_double = imageDatastore([root '\Train_double']);
img_percent_single_double = [process_image_index_single/length(imd.Files) process_image_index_double/length(imd_double.Files)]
len_of_data = ( length(process_image_index_single)+length(process_image_index_double) );
%image_1 = readimage(imd,1);
%img = zeros([size(image_1) len_of_data]);
%%
tic
for i = process_image_index_single
    i
%     [image] = histogram_match(imd,i); 
[image] = background_substraction(imd, i);
end
%%
for i = process_image_index_double
%     [image] = histogram_match(imd_double,i); 
[image] = background_substraction(imd_double, i);
end
%% output
 imshow(readimage(imd,1))
toc