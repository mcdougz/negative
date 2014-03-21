function y = getRegionAtPixel(img,x,y)
%gets regionprops that include a specified pixel
%y=0;

%todo: maybe need more properties from this?
regions = regionprops(img,'PixelList','BoundingBox');
[numregions,~] = size(regions);
for i=1:numregions
    if (findPair(x,y,regions(i).PixelList)>0)
        %todo: test to see if its possible to match multiple regions
        %todo: do we need to use pixelList again?
        y = regions(i);
        return;
    end
end
y=0;
%todo: more appropriate fail result?