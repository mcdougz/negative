function imgs = splitSameImg(img,threshold);
%splits one large file with multiple images into a cell of multiple images.
%works only on negatives that are dark on the outside
%threshold is probably around 0.1-0.2
mask = imclose(im2bw(a,threshold),strel('disk',50));
r = regionprops(mask);
a = cell(1,size(r));
for i=0:size(r)
    a{i} = imcrop(img,r(i).BoundingBox);
end
imgs = a;