%%% root�������O�o�令�A�̦ۤv��root
root = 'D:\�j�T�W\matlab contest\data';
process_image_index_single = [1:10];
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