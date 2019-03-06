<<<<<<< HEAD
function [net]=google_net_train(imd_dram,imd_dram_valid,imd_double_dram,imd_double_dram_valid,labels,labels_double,labels_valid,labels_double_valid)
path('.\accuracy',path);
=======
function [net]=google_net_train(imd_dram,imd_dram_valid,imd_double_dram,imd_double_dram_valid,labels,labels_double)
path('/Users/kuipasta1121/Desktop/matlab-dnn-contest/accuracy',path);
>>>>>>> a48babedb83b5db032b33678b9b619a7518a3cde
save google_net_train
%% this batch training
fprintf('google_net loading... \n');

net = load('result-20190305T013634.mat');
network = net.net;
net = layerGraph(net.net);
%net = load('gnet_105_v1.mat');
%net = net.lgraph_2;

fprintf('net loaded.\n');
fprintf('google_net training begin... \n');
%% single
fprintf('(single) \n');

options = trainingOptions('sgdm', ...
'MiniBatchSize',10, ...
<<<<<<< HEAD
'MaxEpochs',5, ...
=======
'MaxEpochs',2, ...
>>>>>>> a48babedb83b5db032b33678b9b619a7518a3cde
'InitialLearnRate',1e-4, ...
'ValidationData',imd_dram_valid, ...
'ValidationFrequency',3, ...
'ValidationPatience',Inf, ...
'Verbose',true, ...
'Plots','training-progress');

net = trainNetwork(imd_dram,net,options);
network = net;

save(strcat('result-',datestr(now,30),'.mat'),'net');
%% singel validation
<<<<<<< HEAD
YPred = predict(network,imd_dram_valid);
fprintf("accuracy: %d percents. \n",100*accuracy(YPred,labels_valid));
=======
YPred = predict(net,imd_dram_valid);
fprintf("accuracy: %d percents. \n",100*accuracy(YPred,labels));
>>>>>>> a48babedb83b5db032b33678b9b619a7518a3cde

%% double
fprintf('(double) \n');

options = trainingOptions('sgdm', ...
'MiniBatchSize',10, ...
'MaxEpochs',5, ...
'InitialLearnRate',1e-4, ...
'ValidationData',imd_double_dram_valid, ...
'ValidationFrequency',3, ...
'ValidationPatience',Inf, ...
'Verbose',true, ...
'Plots','training-progress');

net_double = trainNetwork(imd_double_dram,net,options);
network = net_double;

save(strcat('result-',datestr(now,30),'.mat'),'net_double');
%% double validation
YPred = predict(network,imd_double_dram_valid);
fprintf("accuracy: %d %",100*accuracy(YPred,labels_double_valid))

fprintf('training ends.\n');