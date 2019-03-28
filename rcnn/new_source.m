path('.',path);
root = folder_name();
data = load('FinishedLabel.mat');
data = data.gTruth;
oldPathDataSource = "/Users/kuipasta1121/Desktop/trainImagev2/";
newPathDataSource = root;
alterPaths = {[oldPathDataSource newPathDataSource]};
changeFilePaths(data,alterPaths);
save('data_chialun_local.mat','data');