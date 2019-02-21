%%% root的部分記得改成你們自己的root


%%
imd = imageDatastore([root folder]);
len = length(imd.Files);
fprintf('start single labeling ...    ')
[label_single] = labeling(imd, root, index);
fprintf('done!\n')