function [imd,label] = labeling_double(imd, root)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
len_root = length(root);
len = length(imd.Files);
label = zeros(105, len);
str_label_array = {};
for i = 1:len
    str = char(imd.Files(i));
    
    label_str = str(len_root+16:end-6);
    label_str = strsplit(label_str,'_B');
    
    label1 = str2num(label_str{1});
    label(label1, i) = 1;
    
    label2 = str2num(label_str{2});
    label(label2, i) = 1;
    str_label_array(end+1) = { strcat(label_str{1},label_str{2}) };
end
imd.Labels = str_label_array;
label = transpose(label);

