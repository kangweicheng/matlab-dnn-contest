%%% root�������O�o�令�A�̦ۤv��root


%%
imd = imageDatastore([root folder]);
len = length(imd.Files);
fprintf('start single labeling ...    ')
[label_single] = labeling(imd, root, index);
fprintf('done!\n')