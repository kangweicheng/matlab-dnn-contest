%%% root的部分記得改成你們自己的root
root = 'C:\Users\lin\Desktop\matlab-dnn-contest-data';

%%
imd = imageDatastore([root '\Train_single']);
imd_double = imageDatastore([root '\Train_double']);
len = length(imd.Files)+length(imd_double.Files);
fprintf('start single labeling ...    ')
[label_single] = transpose( labeling(imd, root) );
fprintf('done!\n')
fprintf('start double labeling ...    ')
[label_double] = transpose( labeling_double(imd_double,root) );
fprintf('done!\n')