function test()
	I = 255-imread('photo/2.jpg');
    I = imcrop(I,[400 1600 300 300]);
    
    %enhance image
    %I = imsharpen(I,'Radius',1,'Amount',2);
    for i=1:3
        %I(:,:,i) = histeq(I(:,:,i));
        I(:,:,i) = imadjust(I(:,:,i));
    end
    
    %threshold
    I2 = bwareaopen(im2bw(I,0.8),100);
    R = regionprops(I2);
    biggest = 1;
    
    imshow(I2);
    
    %plot centroids
    hold on
    for i=1:size(R)
        if R(i).Area > R(biggest).Area
            biggest = i;
        end
%         if R(i).Area > 400
%             plot(R(i).Centroid(:,1), R(i).Centroid(:,2), 'b*')
%         end
    end
    
    plot(R(biggest).Centroid(:,1), R(biggest).Centroid(:,2),'*');
    %imshow(edge(rgb2gray(I)));
    hold off
end