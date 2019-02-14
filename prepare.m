function [imd_dram,imd_dram_valid,imd_double_dram,imd_double_dram_valid] = prepare(process_image_index_single,process_image_index_double,imd,imd_double,label_single,label_double)
%%% root的部分記得改成你們自己的root
path('C:\Users\lin\Desktop\matlab-dnn-contest\background_substraction',path);
path('C:\Users\lin\Desktop\matlab-dnn-contest\image rotation',path);
path('C:\Users\lin\Desktop\matlab-dnn-contest\counter',path);
%% background substraction
fprintf('background substraction begin... \n');
fprintf('(single) \nnow is image#');
tic
for i = process_image_index_single
    counter(i);
    [image] = background_substraction(imd, i);
end
fprintf('\n (double)\nnow is image#');
for i = process_image_index_double
    counter(i);
    [image] = background_substraction(imd_double, i);    
end
fprintf('\n background substraction ends.\n');
toc
%% data save to DRAM-cell and rotate_transform
fprintf('rotation begin... \n');
tic
imageSize = [224 224 3];
fprintf('(single) \n');
[imd, imd_valid] = splitEachLabel(imd,0.7,'randomized');
imd_dram = transform_2(imageSize,imd,label_single,process_image_index_single);
imd_dram_valid = transform_2(imageSize,imd_valid,label_single,process_image_index_single);
fprintf('(double) \n');
[imd_double, imd_double_valid] = splitEachLabel(imd_double,0.7,'randomized');
imd_double_dram = transform_2(imageSize,imd_double,label_double,process_image_index_double);
imd_double_dram_valid = transform_2(imageSize,imd_double_valid,label_double,process_image_index_double);
fprintf('rotation ends.\n');
toc