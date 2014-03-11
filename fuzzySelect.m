function mask = fuzzySelect(img,x,y,threshold)
%similar to the fuzzy select/magic wand tool in image packages
%todo: play with regionprops
%s  = regionprops(img, 'centroid');

%composite selection
%TODO: only selects by similar intensities at the moment,
%      maybe select by colour?
I = imcrop(img,[y-300,x-300,600,600]);
I = imsharpen(I,'Radius',2,'Amount',1);
I = rgbStretchlim(I);

mask = edge(rgb2gray(I));
%mask = imerode(imdilate(mask,strel('disk',4)),strel('disk',3));
mask = imclose(mask,strel('disk',6));
mask = bwareaopen(mask,50);


function y = getFourNeighbor(x,y)
y = [x,y-1; x-1,y; x+1,y; x,y+1];

function y = getEightNeighbor(x,y)
y = [x-1,y-1; x,y-1; x+1,y-1; x-1,y; x+1,y; x-1,y+1; x,y+1; x+1,y+1];

function y = algorithm1()
v = rgb2gray(img);
mask = zeros('like',v);
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
                    listToWork = [listToWork;neighbours(1,:)];
                end
            end
        end
    end
    %disp(listToWork);
    %append to complete, remove from towork
    listComplete = [listComplete;listToWork(1,1),listToWork(1,2)];
    listToWork(1,:) = [];
end