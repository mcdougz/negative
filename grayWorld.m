function out = grayWorld( img )
% "Gray World" Algorithm
% Assumes the average of the image is a neutral grey.

avgR = mean(mean(img(:,:,1)));
avgG = mean(mean(img(:,:,2)));
avgB = mean(mean(img(:,:,3)));
rgb = [avgR avgG avgB];
grey = mean(rgb);
scale = grey./rgb;

img(:,:,1) = scale(1)*img(:,:,1);
img(:,:,2) = scale(2)*img(:,:,2);
img(:,:,3) = scale(3)*img(:,:,3);

out=img;
