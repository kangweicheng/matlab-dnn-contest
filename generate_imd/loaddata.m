path('..',path);
root = folder_name();
%%
imd = imageDatastore([root '\Train_single']);
imd_double = imageDatastore([root '\Train_single']);
len = length(imd.Files);
fprintf('start single labeling ...    ')
[label_single] = labeling(imd, root);
fprintf('done!\n')
