%%% root的部分記得改成你們自己的root
root = 'D:\大三上\matlab contest\data';

%%
imd = imageDatastore([root '\Train_single']);
imd_double = imageDatastore([root '\Train_single']);
len = length(imd.Files);
fprintf('start single labeling ...    ')
[label_single] = labeling(imd, root);
fprintf('done!\n')
% fprintf('start double labeling ...    ')
% [label_double] = labeling_double(imd_double,root);
% fprintf('done!\n')