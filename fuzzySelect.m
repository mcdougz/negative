function mask = fuzzySelect(img,x,y,threshold)
%similar to the fuzzy select/magic wand tool in image packages
%todo: play with regionprops
%s  = regionprops(img, 'centroid');

%composite selection
%TODO: only selects by similar intensities at the moment,
%      maybe select by colour?


%mask = algorithm3(img,x,y,threshold);
mask=doEdges(img);
if (mask(x,y)==0)
    r = getRegionAtPixel(1-mask,x,y);
else
    r = getRegionAtPixel(mask,x,y);
end
disp(r);
mask = pixelListToMask(img,r.PixelList);

function y = pixelListToMask(img,pList)
mask=zeros(size(img));
[rows,~] = size(pList);
for i=1:rows
    mask(pList(i,1),pList(i,2))=img(pList(i,2),pList(i,1));
end
y=mask;

function y = getFourNeighbor(x,y)
y = [x,y-1; x-1,y; x+1,y; x,y+1];

function y = getEightNeighbor(x,y)
y = [x-1,y-1; x,y-1; x+1,y-1; x-1,y; x+1,y; x-1,y+1; x,y+1; x+1,y+1];

function mask = doEdges(img)
%I = imcrop(img,[y-300,x-300,600,600]);
I = img;
I = imsharpen(I,'Radius',2,'Amount',1);
I = rgbStretchlim(I);

mask = edge(rgb2gray(I));
%mask = imerode(imdilate(mask,strel('disk',4)),strel('disk',3));
mask = imclose(mask,strel('disk',6));
mask = bwareaopen(mask,50);

function out = algorithm2(img,x,y,threshold)
%based on intensity values and algorithm similar to dijkstra
v = rgb2gray(img);
mask = zeros(size(v));
mask(1,1) = 1;

lowerLimit = v(x,y)-threshold;
upperLimit = v(x,y)+threshold;


%TODO: there might be a few ways to speed this up
listToWork = [x,y];
listComplete = [];
while (~isempty(listToWork)),
    mask(listToWork(1,1),listToWork(1,2)) = 1;
    neighbours = getFourNeighbor(listToWork(1,1),listToWork(1,2));
    for i=1:4,
        if v(neighbours(i,1),neighbours(i,2))>lowerLimit
            if v(neighbours(i,1),neighbours(i,2))<upperLimit
                if findPair(neighbours(i,1),neighbours(i,2),listComplete)==0
                    listToWork = [listToWork,neighbours(1,:)];
                    disp(neighbours(1,:));
                end
            end
        end
    end
    %disp(listToWork);
    %append to complete, remove from towork
    listComplete = [listComplete;listToWork(1,1),listToWork(1,2)];
    listToWork(1,:) = [];
end

out = mask;

function out = algorithm3(img,x,y,threshold)
% input a 3d image
% removes dissimilar pixels
% then removes ones that arent connected
[sizeY,sizeX,sizeZ] = size(img);
out=zeros(sizeY,sizeX,sizeZ);

lowerLimit = img(x,y,:)-threshold;
upperLimit = img(x,y,:)+threshold;

for i=1:sizeX
    for j=1:sizeY
        if sum(img(i,j,:)>lowerLimit)==sizeZ
            if sum(img(i,j,:)<upperLimit)==sizeZ
                out(i,j,:) = img(i,j,:);
                %out(i,j,1) = img(i,j,1);
            end
        end
    end
end
%todo: use getRegionAtPixel and remove ones outside the region?