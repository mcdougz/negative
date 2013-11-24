function y = removeCast(img,r,g,b)
%using a simple method, removes rgb color cast from a given image.
% r = red
% g = green
% b = blue
%todo: might need some compensation if everything's getting darker
%(maybe +value?)

y=img;
for i=1:size(a,1)
    for j=1:size(a,2)
        y(i,j,1) = img(i,j,1)-r;
        y(i,j,2) = img(i,j,2)-g;
        y(i,j,3) = img(i,j,3)-b;
    end
end