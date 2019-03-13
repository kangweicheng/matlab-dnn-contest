function [netTransfer] = training(imd)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%% preprocess imd
[imdsTrain,imdsValidation] = splitEachLabel(imd,0.9,'randomized');
augmenter = imageDataAugmenter('RandRotation',[-30 30],'RandXTranslation',[-30 30], 'RandYTranslation',[-30 30]);
augimdsTrain = augmentedImageDatastore([227 227 3],imdsTrain, 'DataAugmentation', augmenter);
augimdsValid = augmentedImageDatastore([227 227 3],imdsValidation, 'DataAugmentation', augmenter);
numClasses = numel(categories(imdsTrain.Labels));
options = trainingOptions('sgdm', ...
    'MiniBatchSize',10, ...
    'MaxEpochs',6, ...
    'InitialLearnRate',1e-4, ...
    'Shuffle','every-epoch', ...
    'ValidationData',augimdsValid,'Plots','training-progress');

%% Transfer
net = alexnet();
layersTransfer = net.Layers(1:end-3);
layers = [
    layersTransfer
    fullyConnectedLayer(2,'WeightLearnRateFactor',20,'BiasLearnRateFactor',20)
    softmaxLayer
    classificationLayer];
netTransfer = trainNetwork(augimdsTrain,layers,options);
end

