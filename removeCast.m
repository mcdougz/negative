function y = removeCast(img,r,g,b)
%removes a colour cast from an image, given the RGB of a white.
% r = red
% g = green
% b = blue

y=img;
for i=1:size(img,1)
    for j=1:size(img,2)
        %"Scaling monitor RGB"
        P1 = zeros(3,3);
        P1(1,1) = 255/img(i,j,1);
        P1(2,2) = 255/img(i,j,2);
        P1(3,3) = 255/img(i,j,3);
        P2 = [r;g;b];
        P3 = double(P1)*double(P2);
        
        y(i,j,1) = P3(1);
        y(i,j,2) = P3(2);
        y(i,j,3) = P3(3);
    end
end