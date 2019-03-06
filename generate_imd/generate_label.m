%%% root的部分記得改成你們自己的root
root = folder_name();

%%
imd = imageDatastore([root '\Post_Train_single']);
imd_double = imageDatastore([root '\Post_Train_double']);
fprintf('start single labeling ...    ')
[imd,label_single] = youan_labeling(imd, root) ;
fprintf('done!\n')
fprintf('start double labeling ...    ')
[imd_double,label_double] = youan_labeling_double(imd_double,root);
fprintf('done!\n')