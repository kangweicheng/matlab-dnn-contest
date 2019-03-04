function [label] = weicheng_labeling(imd, root, index)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
len_root = length(root);
len = length(imd.Files);
label = zeros(105, len);
Labels = [];
for i = 1:len
    str = char(imd.Files(i));
    label_str = str(len_root+index:end-13);
    label1 = str2num(label_str);
    Labels(i) = string(label_str);
    label(label1, i) = 1;
end
imd.Labels = Labels';
imd.Labels = categorical(imd.Labels);


