root = folder_name();
%%
folder = '\Train_single';
index = 16;
load_imd
%%
%substraction_to_new_folder
%%
folder = '\post_Train_single';
index = 21;
load_imd
%%
[imdsTrain,imdsValidation] = splitEachLabel(imd,0.9,'randomized');
augmenter = imageDataAugmenter('RandRotation',[-30 30],'RandXTranslation',[-30 30], 'RandYTranslation',[-30 30]);
augimdsTrain = augmentedImageDatastore([227 227 3],imdsTrain, 'DataAugmentation', augmenter);
augimdsValid = augmentedImageDatastore([227 227 3],imdsValidation, 'DataAugmentation', augmenter);
minibatch = preview(augimdsTrain);
imshow(imtile(minibatch.input));
options = trainingOptions('sgdm', ...
    'MiniBatchSize',10, ...
    'MaxEpochs',6, ...
    'InitialLearnRate',1e-4, ...
    'Shuffle','every-epoch', ...
    'ValidationData',augimdsValid,'Plots','training-progress');
%%
net = alexnet();
layersTransfer = net.Layers(1:end-3);

numClasses = numel(categories(imdsTrain.Labels));
layers = [
    layersTransfer
    fullyConnectedLayer(8,'WeightLearnRateFactor',20,'BiasLearnRateFactor',20)
    softmaxLayer
    classificationLayer];
netTransfer = trainNetwork(augimdsTrain,layers,options);
