%%% root的部分記得改成你們自己的root
function youan_substraction_to_new_folder(imd,imd_double,process_image_index_single,process_image_index_double)
root = folder_name();
postprocessing_folder = '\Post_Train_single';
mkdir(strcat(root,postprocessing_folder));
tic
fprintf('(single) \nnow is image#');
for i = process_image_index_single
    counter(i);
    [img] = background_substraction(imd, i);
    [dir,name,subname] = fileparts(imd.Files{i});
    img_name = strcat(root,postprocessing_folder,'/',name,subname);
    imwrite(img,img_name);
end
%%
postprocessing_folder = '\Post_Train_double';
mkdir(strcat(root,postprocessing_folder));
fprintf('\n (double)\nnow is image#');
for i = process_image_index_double
    counter(i);
    [img] = background_substraction(imd_double, i);
    [dir,name,subname] = fileparts(imd_double.Files{i});
    img_name = strcat(root,postprocessing_folder,'/',name,subname);
    imwrite(img,img_name);
end

toc
end