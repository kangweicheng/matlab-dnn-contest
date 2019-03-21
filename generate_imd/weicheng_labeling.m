function [imd,label] = youan_labeling(imd, root)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
len_root = length(root);
len = length(imd.Files);
label = zeros(105, len);
str_label_array = {};
for i = 1:len
    str = char(imd.Files(i));
    [dir,name,subname] = fileparts(str);
    label_str = name(2:end);
    label_str = strsplit(label_str,'_IMG');
    label1 = str2num( label_str{1} );
    Labels(i) = string(label_str{1});
    label(label1, i) = 1;
    str_label_array(end+1) ={label_str{1}};
end

imd.Labels = categorical(Labels);
label = categorical(Labels);
