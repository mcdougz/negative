function main()
	I = imread('plant.jpg');
    
    % from stackoverflow question,
    % "How do I display the red channel of an image in Matlab?"
    red = I(:,:,1);
    green = I(:,:,2);
    blue = I(:,:,3);
    %grey = rgb2gray(I);

    % from mathworks forum thread,
    % "Merge a RGB matrix", post #5
    newimg = invertimage(I);
    %figure, imhist(red); title('red');
    %figure, imhist(green); title('green');
    %figure, imhist(blue); title('blue');
    figure, imshow(newimg); 
end
function y = invertimage(a)
    y=a;
    for i=1:size(a,1)
        for j=1:size(a,2)
            for k=1:size(a,3)
                y(i,j,k) = 255-a(i,j,k);
            end
        end
    end
end