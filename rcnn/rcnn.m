data = load('rcnn_data.mat');
data = data.gTruth;
data = objectDetectorTrainingData(data);
%% this batch training
path('.\accuracy',path);
fprintf('google_net loading... \n');

net = load('alexnet_105_categorical.mat');
net = net.lgraph;

%network = net.net;
%net = layerGraph(net.net);

%net = load('result-single-20190319T115902');
%net = net.lgraph_2;


fprintf('net loaded.\n');
fprintf('google_net training begin... \n');
%% double
fprintf('(double) \n');

% options = trainingOptions('sgdm', ...
% 'MiniBatchSize',16, ...
% 'MaxEpochs',1, ...
% 'InitialLearnRate',2e-2, ...
% 'ValidationData',imd_dram_valid, ...
% 'ValidationFrequency',3, ...
% 'ValidationPatience',Inf, ...
% 'Verbose',true, ...
% 'Plots','training-progress');

options = trainingOptions('adam', ...
    'InitialLearnRate',1e-6 , ...
    'Shuffle', 'never', ...
    'SquaredGradientDecayFactor',0.9, ...
    'MaxEpochs',1, ...
    'MiniBatchSize',16, ...    
    'Verbose',true);

detector = trainRCNNObjectDetector(data,net,options);
save(strcat('result-double-',datestr(now,30),'.mat'),'detector');
%% double validation
img = readimage(imd_double,3);
%imshow(img);
[boxes,scores,labels] = detect(detector,img);
labels
%fprintf("accuracy: %d %",100*accuracy_double(YPred,labels_double_valid))
%fprintf('training ends.\n');