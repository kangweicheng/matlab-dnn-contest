function [imd,label] = youan_labeling_double(imd, root)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
len_root = length(root);
len = length(imd.Files);
label = zeros(105, len);
str_label_array = {};
for i = 1:len
    str = char(imd.Files(i));
    
    [dir,name,subname] = fileparts(str);    
    label_str = strsplit(name,'_');    
    
    label1 = label_str{1};
    label1 = label1(2:end);
    label1 = str2num(label1);
    label(label1, i) = 1;
    
    label2 = label_str{2};
    label2 = label2(2:end);
    label2 = str2num(label2);
    label(label2, i) = 1;
    str_label_array(end+1) = { strcat(label_str{1},label_str{2}) };
end
imd.Labels = str_label_array;
label = transpose(label);

