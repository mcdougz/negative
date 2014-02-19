function y = invertimage(a)
    %basic image inversion
    y=255-a;
    %for i=1:size(a,1)
    %    for j=1:size(a,2)
    %        for k=1:size(a,3)
    %            y(i,j,k) = 255-a(i,j,k);
    %        end
    %    end
    %end