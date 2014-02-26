function mask = fuzzySelect(img,x,y,threshold)
%similar to the fuzzy select/magic wand
%todo: play with regionprops
%s  = regionprops(img, 'centroid');

%composite selection
%TODO: maybe select by channel
v = img(:,:,1)+img(:,:,2)+img(:,:,3);
mask = zeros('like',v);

lowerLimit = v(x,y)-threshold;
upperLimit = v(x,y)+threshold;

listToWork = [x,y];
listComplete = [];
%TODO: there might be a few ways to speed this up
while (~isempty(listToWork)),
    mask(listToWork(1,1),listToWork(1,2)) = 1;
    neighbours = getFourNeighbor(listToWork(1,1),listToWork(1,2));
    for i=1:4,
        if ~ismember(neighbours(i),listComplete)
            if v(neighbours(i))>lowerLimit && v(neighbours(i))<upperLimit
                listToWork = [listToWork;neighbours(i)];
            end
        end
    end
    disp(listToWork);
    %append to complete, remove from towork
    listComplete = [listComplete;listToWork(1)];
    listToWork(1,:) = [];
end

function y = getFourNeighbor(x,y)
y = [x,y-1; x-1,y; x+1,y; x,y+1];

function y = getEightNeighbor(x,y)
y = [x-1,y-1; x,y-1; x+1,y-1; x-1,y; x+1,y; x-1,y+1; x,y+1; x+1,y+1];
