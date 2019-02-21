root = 'C:\Users\lin\Desktop\matlab-dnn-contest-data';
path('C:\Users\lin\Desktop\matlab-dnn-contest\generate_label',path);
%% data
imd = imageDatastore([root '\Train_single']);
imd_double = imageDatastore([root '\Train_double']);
%% labeling
s
fprintf('start single labeling ...    ')
[imd,label_single] = labeling(imd, root);
fprintf('done!\n')
fprintf('start double labeling ...    ')
[imd_double,label_double] = labeling_double(imd_double,root);
fprintf('done!\n')
%% pre-augmenting one time
single_index = [1:129];
double_index = [1:129];
[imd_dram,imd_dram_valid,imd_double_dram,imd_double_dram_valid] = prepare(single_index,double_index,imd,imd_double,label_single,label_double);
%% train one time
img_percent_single_double = [single_index/length(imd.Files) double_index/length(imd_double.Files)]
len_of_data = ( length(single_index)+length(double_index) );
net = google_net_train(imd_dram,imd_dram_valid,imd_double_dram,imd_double_dram_valid,label_single(single_index,:),label_double(double_index,:));