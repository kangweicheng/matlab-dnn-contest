function augimds = transform_youan(imageSize,imd,label_array, im_index)
%TRANSFORM Summary of this function goes here
%   Detailed explanation goes here
imd_dram =[];
for j = im_index
    image = readimage(imd, j);    
    image = imresize( image, imageSize(1:2) );
    imd_dram = cat(4,imd_dram,image);
end
imageAugmenter = imageDataAugmenter( ...
    'RandRotation',[-30,30], ...
    'RandXTranslation',[-30 30], ...
    'RandYTranslation',[-30 30]);

augimds = augmentedImageDatastore(imageSize,imd_dram,label_array(im_index,:),'DataAugmentation',imageAugmenter);
%shuffle(augimds);


