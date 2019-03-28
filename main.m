%% please change root name in folder_name()
root = folder_name();
path('.\generate_imd',path);
%% data
imd = imageDatastore([root '\Train_single']);
imd_double = imageDatastore([root '\Train_double']);
%% pre-augmenting one time
single_index = [];%useless
double_index = [1:3611];% useless
[imd,imd_double,imd_dram,imd_dram_valid,imd_double_dram,imd_double_dram_valid,part_label_single,part_label_single_valid, ...
    part_label_double,part_label_double_valid] = prepare(single_index,double_index,imd,imd_double);
%% train one time
net = google_net_train(imd_dram,imd_dram_valid,imd_double_dram,imd_double_dram_valid,part_label_single,part_label_double,part_label_single_valid,part_label_double_valid);

%img_percent_single_double = [single_index/length(imd.Files) double_index/length(imd_double.Files)]
%len_of_data = ( length(single_index)+length(double_index) );
