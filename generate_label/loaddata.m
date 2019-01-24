root = 'D:\¤j¤T¤W\matlab contest\data';
imd = imageDatastore('Train_single');
imd_double = imageDatastore('Train_double');
len = length(imd.Files);
[label_single] = labeling(imd, root);
[label_double] = labeling_double(imd_double,root);