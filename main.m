%% please change root name in folder_name()
root = folder_name();
path('.\generate_imd',path);
%% data
imd = imageDatastore([root '\Train_single']);
imd_double = imageDatastore([root '\Train_double']);
%% labeling
s
fprintf('start single labeling ...    ')
[imd,label_single] = youan_labeling(imd, root);
fprintf('done!\n')
fprintf('start double labeling ...    ')
[imd_double,label_double] = youan_labeling_double(imd_double,root);
fprintf('done!\n')
%% pre-augmenting one time
single_index = [1:129];
double_index = [1:129];
[imd_dram,imd_dram_valid,imd_double_dram,imd_double_dram_valid,part_label_single,part_label_single_valid, ...
    part_label_double,part_label_double_valid] = prepare(single_index,double_index,imd,imd_double,label_single,label_double);
%% train one time
net = google_net_train(imd_dram,imd_dram_valid,imd_double_dram,imd_double_dram_valid,part_label_single,part_label_double,part_label_single_valid,part_label_double_valid);

img_percent_single_double = [single_index/length(imd.Files) double_index/length(imd_double.Files)]
len_of_data = ( length(single_index)+length(double_index) );