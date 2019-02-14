function google_net_train(process_image_index_single,process_image_index_double,imd,imd_double,label_single,label_double)
%%% root的部分記得改成你們自己的root
path('C:\Users\lin\Desktop\matlab-dnn-contest\generate_label',path);
path('C:\Users\lin\Desktop\matlab-dnn-contest\background_substraction',path);
path('C:\Users\lin\Desktop\matlab-dnn-contest\image rotation',path);
%% background substraction
fprintf('background substraction begin... \n');
fprintf('(single) \n');
tic
for i = process_image_index_single
    i
    [image] = background_substraction(imd, i);
end
fprintf('(double)');
for i = process_image_index_double
    i
    [image] = background_substraction(imd_double, i);
end
toc
fprintf('background substraction ends.\n');
%% data save to DRAM-cell and rotate_transform
fprintf('rotation begin... \n');
rotate_images_num = 5;

fprintf('(single) \n');
imd_dram = transform(imd,label_single,rotate_images_num);
fprintf('(double)');
imd_double_dram = transform(imd_double, label_double,rotate_images_num);
fprintf('rotation ends.\n');
%% this batch training
fprintf('google_net loading... \n');
net = googlenet
fprintf('net loaded... \n');
fprintf('google_net training begin... \n');
options = trainingOptions('sgdm',...
    'MiniBatchSize',10,...
    'MaxEpochs',10,...
    'InitialLearnRate',0.0001,...    
    'ExecutionEnvironment','auto');
