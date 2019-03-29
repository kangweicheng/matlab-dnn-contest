path('.',path);
root = folder_name();
data = load('rcnn_data_all_2.mat');
data = data.gTruth;
oldPathDataSource = "C:\\Users\\lin\\Desktop\\matlab-dnn-contest-data";
newPathDataSource = root;
alterPaths = {[oldPathDataSource newPathDataSource]};
changeFilePaths(data,alterPaths);
save('data_chialun_local.mat','data');