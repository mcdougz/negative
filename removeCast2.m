function y = removeCast2(img,r,g,b)
%method shown in http://stackoverflow.com/a/10878180
y=img;
mean = (r + g + b) / 3;
for i=1:size(img,1)
    for j=1:size(img,2)
        
        curRed = img(i,j,1);
        curGreen = img(i,j,2);
        curBlue = img(i,j,3);
        
        red_new = curRed * mean / r;
        green_new = curGreen * mean / g;
        blue_new = curBlue * mean / b;
        
        y(i,j,1) = red_new;
        y(i,j,2) = green_new;
        y(i,j,3) = blue_new;
    end
end