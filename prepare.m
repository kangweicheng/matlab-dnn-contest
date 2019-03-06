<<<<<<< HEAD
function [imd_dram,imd_dram_valid,imd_double_dram,imd_double_dram_valid,part_label_single,part_label_single_valid, ...
    part_label_double,part_label_double_valid] = prepare(process_image_index_single,process_image_index_double,imd,imd_double,label_single,label_double)
root = folder_name();
path('.\background_substraction',path);
path('.\image augmentation',path);
path('.\counter',path);
=======
function [imd_dram,imd_dram_valid,imd_double_dram,imd_double_dram_valid] = prepare(process_image_index_single,process_image_index_double,imd,imd_double,label_single,label_double)
%%% root的部分記得改成你們自己的root
path('/Users/kuipasta1121/Desktop/matlab-dnn-contest/background_substraction',path);
path('/Users/kuipasta1121/Desktop/matlab-dnn-contest/image rotation',path);
path('/Users/kuipasta1121/Desktop/matlab-dnn-contest/counter',path);
>>>>>>> a48babedb83b5db032b33678b9b619a7518a3cde
%% background substraction
fprintf('background substraction begin... \n');
%% background substraction :  first process
%youan_substraction_to_new_folder(imd,imd_double,process_image_index_single,process_image_index_double);
%% background substraction : load previous result
imd = imageDatastore([root '\Post_Train_single']);
imd_double = imageDatastore([root '\Post_Train_double']);

% re-labeling
fprintf('start single labeling ...    ')
[imd,part_label_single] = youan_labeling(imd, root);
fprintf('done!\n')
fprintf('start double labeling ...    ')
[imd_double,part_label_double] = youan_labeling_double(imd_double,root);
fprintf('done!\n')
%
fprintf('\n background substraction ends.\n');

save prepare
%% data save to DRAM-cell and rotate_transform
fprintf('rotation begin... \n');
tic
imageSize = [224 224 3];
fprintf('(single) \n');
[imd, imd_valid] = splitEachLabel(imd,0.7,'randomized');
%re-label
fprintf('start single labeling ...    ')
[imd,part_label_single] = youan_labeling(imd, root);
fprintf('done!\n')
fprintf('start single-valid labeling ...    ')
[imd_valid,part_label_single_valid] = youan_labeling(imd_valid,root);
fprintf('done!\n')
%
imd_dram = transform_youan(imageSize,imd,part_label_single,[1:length(imd.Files)]);
imd_dram_valid = transform_youan(imageSize,imd_valid,part_label_single_valid,[1:length(imd_valid.Files)]);

fprintf('(double) \n');
[imd_double, imd_double_valid] = splitEachLabel(imd_double,0.7,'randomized');
%re-label
fprintf('start double labeling ...    ')
[imd_double,part_label_double] = youan_labeling_double(imd_double, root);
fprintf('done!\n')
fprintf('start double-valid labeling ...    ')
[imd_double_valid,part_label_double_valid] = youan_labeling_double(imd_double_valid,root);
fprintf('done!\n')
%
imd_double_dram = transform_youan(imageSize,imd_double,part_label_double,[1:length(imd_double.Files)]);
imd_double_dram_valid = transform_youan(imageSize,imd_double_valid,part_label_double_valid,[1:length(imd_double_valid.Files)]);
fprintf('rotation ends.\n');
toc
save prepare