function y = findPair(a,b,arr)
%finds a row where a and b are next to each other
%returns 0 if not found, else returns the index
[rows,cols] = size(arr);
y=0;
for i=1:rows
    if arr(i,1)==a
        if arr(i,2)==b
            y=i;
            return;
        end
    end
end