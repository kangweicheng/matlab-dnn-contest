%%% root的部分記得改成你們自己的root
function youan_substraction_to_new_folder(imd,imd_double,process_image_index_single,process_image_index_double)
root = folder_name();
path('../counter',path);
postprocessing_folder = '\Post_Train_single';
shape_folder = '\shape_single';
mkdir(strcat(root,postprocessing_folder));
mkdir(strcat(root,shape_folder));
tic
fprintf('(single) \nnow is image#');
for i = process_image_index_single
    counter(i);
    [img, shape] = background_substraction2(imd, i);
    [dir,name,subname] = fileparts(imd.Files{i});
    img_name = strcat(root,postprocessing_folder,'/',name,subname);
    imwrite(img,img_name);
    %%%
    img_name = strcat(root,shape_folder,'/',name,subname);
    imwrite(shape,img_name);
end
%%
postprocessing_folder = '\Post_Train_double';
shape_folder = '\shape_double';
mkdir(strcat(root,postprocessing_folder));
mkdir(strcat(root,shape_folder));
fprintf('\n (double)\nnow is image#');
for i = process_image_index_double
    counter(i);
    [img,shape] = background_substraction2(imd_double, i);
    [dir,name,subname] = fileparts(imd_double.Files{i});
    img_name = strcat(root,postprocessing_folder,'/',name,subname);
    imwrite(img,img_name);
    img_name = strcat(root,shape_folder,'/',name,subname);
    imwrite(shape,img_name);
end

toc
end