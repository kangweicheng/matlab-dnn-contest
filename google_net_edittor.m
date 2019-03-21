net = load('gnet_105_cen_ver2.mat');
net = net.lgraph_2;
%% open Deep Network Designer for lgraph_2
lgraph_2 = lgraph_1;
save('gnet_105_cen_ver3.mat','lgraph_2');
