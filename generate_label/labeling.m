function [imd,label] = labeling(imd, root)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
len_root = length(root);
len = length(imd.Files);
label = zeros(105, len);
str_label_array = {};
for i = 1:len
    str = char(imd.Files(i));
    label_str = str(len_root+16:end-13);
    label1 = str2num(label_str);
    label(label1, i) = 1;
    str_label_array(end+1) ={label_str};
end
imd.Labels = str_label_array;
label = transpose(label);
