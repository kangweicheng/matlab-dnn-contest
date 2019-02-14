%% 1
accuracy(label_single,label_single)
%% 0.5 -1
label_size = size(label_single);
label_length = label_size(1);
shuffle_label = label_single ( randperm(label_length) , :);
shuffle_label = shuffle_label(1:floor(end/2),:);
shuffle_label = cat(1,shuffle_label,label_single( floor(end/2)+1 :end,:));
accuracy(label_single/2,shuffle_label)
%% 1 double
accuracy_double(label_double,label_double)
%% 0.5-1 double
label_size = size(label_double);
label_length = label_size(1);
shuffle_label = label_double ( randperm(label_length) , :);
shuffle_label = shuffle_label(1:floor(end/2),:);
shuffle_label = cat(1,shuffle_label,label_double( floor(end/2)+1:end,:));
accuracy_double(label_double/2,shuffle_label)


