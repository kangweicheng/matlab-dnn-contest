%% background substraction
fprintf('background substraction begin... \n');
path('..',path);
root = folder_name();
path('..\background_substraction',path);
path('..\image augmentation',path);
path('..\counter',path);
%% background substraction :  first process
%youan_substraction_to_new_folder(imd,imd_double,process_image_index_single,process_image_index_double);
fprintf('\n background substraction ends.\n');
%% import image
%imd = imageDatastore([root '\Post_Train_single']);
imd_double = imageDatastore([root '\Post_Train_double']);
%imd = partition(imd,8,1);
%imd_double = partition(imd_double,1,1);
save prepare_for_rcnn