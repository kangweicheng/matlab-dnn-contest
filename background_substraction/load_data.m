%%% root的部分記得改成你們自己的root
root = 'D:\大三上\matlab contest\data';
process_image_index_single = [1:100];
process_image_index_double = [210];

%%
imd = imageDatastore([root '\Train_single']);
imd_double = imageDatastore([root '\Train_double']);
%%
tic
for i = process_image_index_single
    i
%     [image] = histogram_match(imd,i); 
    [img] = background_substraction(imd, i);
end
%%
for i = process_image_index_double
%     [image] = histogram_match(imd_double,i); 
    [img] = background_substraction(imd_double, i);
end
toc