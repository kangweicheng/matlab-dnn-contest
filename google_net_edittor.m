net = load('gnet_105_v2.mat');
net = net.lgraph_2;
%%
% RCNN need output num of column +1 for the background
%% open Deep Network Designer for lgraph_2
lgraph_2 = lgraph_3;
save('gnet_105_categorical.mat','lgraph_2');
