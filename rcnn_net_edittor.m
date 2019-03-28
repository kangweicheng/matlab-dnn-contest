% Load pretrained ResNet-50.
net = alexnet;
lgraph = layerGraph(net.Layers);

% Remove the the last 3 layers from ResNet-50. 
layersToRemove = {
    'fc1000'
    'fc1000_softmax'
    'ClassificationLayer_fc1000'
    };

layersToRemove_alexnet = {
    'fc8'
    'prob'
    'output'
    };

lgraph = removeLayers(lgraph, layersToRemove_alexnet);

% Specify the number of classes the network should classify.
numClasses = 5;
numClassesPlusBackground = numClasses + 1;

% Define new classification layers.
newLayers = [
    fullyConnectedLayer(numClassesPlusBackground, 'Name', 'rcnnFC')
    softmaxLayer('Name', 'rcnnSoftmax')
    classificationLayer('Name', 'rcnnClassification')
    ];

% Add new layers.
lgraph = addLayers(lgraph, newLayers);

% Connect the new layers to the network.

%lgraph = connectLayers(lgraph, 'avg_pool', 'rcnnFC');
lgraph = connectLayers(lgraph, 'drop7', 'rcnnFC');
save('alexnet_105_categorical.mat','lgraph');