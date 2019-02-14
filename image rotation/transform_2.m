function augimds = transform_2(imd,label_array, im_index)
%TRANSFORM Summary of this function goes here
%   Detailed explanation goes here
image = readimage(imd, 1);
imd_dram =[image];
for j = 2:im_index
    image = readimage(imd, j);    
    imd_dram = cat(4,imd_dram,image);
end
imageAugmenter = imageDataAugmenter( ...
    'RandRotation',[-20,20], ...
    'RandXTranslation',[-3 3], ...
    'RandYTranslation',[-3 3]);
imageSize = [28 28 1];
augimds = augmentedImageDatastore(imageSize,imd_dram,label_array,'DataAugmentation',imageAugmenter);


