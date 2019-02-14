root = 'C:\Users\lin\Desktop\matlab-dnn-contest-data';
path('C:\Users\lin\Desktop\matlab-dnn-contest\generate_label',path);
%% data
imd = imageDatastore([root '\Train_single']);
imd_double = imageDatastore([root '\Train_double']);

%% labeling
fprintf('start single labeling ...    ')
[label_single] = labeling(imd, root);
fprintf('done!\n')
fprintf('start double labeling ...    ')
[label_double] = labeling_double(imd_double,root);
fprintf('done!\n')
%% train one time
single_index = [2];
double_index = [210];
img_percent_single_double = [single_index/length(imd.Files) double_index/length(imd_double.Files)]
len_of_data = ( length(single_index)+length(double_index) );
google_net_train(single_index,double_index,imd,imd_double,label_single,label_double);