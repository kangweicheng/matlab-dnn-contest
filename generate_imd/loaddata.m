%%% root�������O�o�令�A�̦ۤv��root
root = 'D:\�j�T�W\matlab contest\data';

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