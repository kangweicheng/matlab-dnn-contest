function [label] = labeling(imd, root)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
len_root = length(root);
len = length(imd.Files);
label = zeros(105, len);
for i = 1:len
    str = char(imd.Files(i));
    label_str = str(len_root+16:end-13);
    label1 = str2num(label_str);
    label(label1, i) = 1;
end

